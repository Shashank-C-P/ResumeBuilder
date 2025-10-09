package com.resume.builder.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.LineSeparator;
import com.itextpdf.layout.element.List;
import com.itextpdf.layout.element.ListItem;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;
import com.resume.builder.model.Education;
import com.resume.builder.model.Experience;
import com.resume.builder.model.Project;
import com.resume.builder.model.Resume;
import com.resume.builder.model.Skill;

@Service
public class PdfGenerationService {

    public ByteArrayInputStream generatePdf(Resume resume) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        PdfWriter writer = new PdfWriter(out);
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);
        
        // Set margins
        document.setMargins(40, 50, 40, 50);

        PdfFont boldFont = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);
        PdfFont regularFont = PdfFontFactory.createFont(StandardFonts.HELVETICA);

        // --- Header Section ---
        document.add(new Paragraph(resume.getFullName())
            .setFont(boldFont)
            .setFontSize(18)
            .setTextAlignment(TextAlignment.CENTER)
            .setMarginBottom(3));

        // Contact info line
        String contactInfo = resume.getPhoneNumber() + " | " + resume.getEmail();
        document.add(new Paragraph(contactInfo)
            .setFont(regularFont)
            .setFontSize(9)
            .setTextAlignment(TextAlignment.CENTER)
            .setMarginBottom(2));
        
        // Optional address or links
        if (resume.getAddress() != null && !resume.getAddress().isEmpty()) {
            document.add(new Paragraph(resume.getAddress())
                .setFont(regularFont)
                .setFontSize(9)
                .setTextAlignment(TextAlignment.CENTER)
                .setMarginBottom(10));
        } else {
            document.add(new Paragraph().setMarginBottom(10));
        }
        
        // --- Career Objective Section ---
        if (resume.getSummary() != null && !resume.getSummary().isEmpty()) {
            addSectionHeader(document, "CAREER OBJECTIVE", boldFont);
            document.add(new Paragraph(resume.getSummary())
                .setFont(regularFont)
                .setFontSize(9)
                .setTextAlignment(TextAlignment.JUSTIFIED)
                .setMarginBottom(10));
        }

        // --- Education Section ---
        if (resume.getEducationList() != null && !resume.getEducationList().isEmpty()) {
            addSectionHeader(document, "EDUCATION", boldFont);
            
            for (Education edu : resume.getEducationList()) {
                // Education entry with bullet point
                Table eduTable = new Table(UnitValue.createPercentArray(new float[]{3, 77, 20}))
                    .useAllAvailableWidth()
                    .setMarginBottom(1);
                
                // Bullet
                eduTable.addCell(createCell("•", regularFont, 9, TextAlignment.LEFT));
                
                // School name (bold)
                eduTable.addCell(createCell(edu.getSchoolName(), boldFont, 9, TextAlignment.LEFT));
                
                // Date (right-aligned)
                eduTable.addCell(createCell(edu.getGraduationDate() != null ? edu.getGraduationDate() : "", 
                    regularFont, 9, TextAlignment.RIGHT));
                
                document.add(eduTable);
                
                // Degree details (indented)
                if (edu.getDegree() != null && !edu.getDegree().isEmpty()) {
                    document.add(new Paragraph(edu.getDegree())
                        .setFont(regularFont)
                        .setFontSize(9)
                        .setMarginLeft(15)
                        .setMarginBottom(6));
                }
            }
        }
        
        // --- Work Experience Section ---
        if (resume.getExperienceList() != null && !resume.getExperienceList().isEmpty()) {
            addSectionHeader(document, "WORK EXPERIENCE", boldFont);
            
            for (Experience exp : resume.getExperienceList()) {
                // Experience header with bullet
                Table expTable = new Table(UnitValue.createPercentArray(new float[]{3, 77, 20}))
                    .useAllAvailableWidth()
                    .setMarginBottom(1);
                
                // Bullet
                expTable.addCell(createCell("•", regularFont, 9, TextAlignment.LEFT));
                
                // Job title and company (bold)
                String jobInfo = exp.getJobTitle() + " – " + exp.getCompanyName();
                expTable.addCell(createCell(jobInfo, boldFont, 9, TextAlignment.LEFT));
                
                // Date range (right-aligned)
                String dateRange = "";
                if (exp.getStartDate() != null && exp.getEndDate() != null) {
                    dateRange = exp.getStartDate() + " – " + exp.getEndDate();
                }
                expTable.addCell(createCell(dateRange, regularFont, 9, TextAlignment.RIGHT));
                
                document.add(expTable);
                
                // Description with sub-bullet points (indented further)
                if (exp.getDescription() != null && !exp.getDescription().isEmpty()) {
                    String[] points = exp.getDescription().split("\\n|\\r\\n|\\r");
                    for (String point : points) {
                        if (point.trim().isEmpty()) continue;
                        document.add(new Paragraph("◦ " + point.trim())
                            .setFont(regularFont)
                            .setFontSize(9)
                            .setMarginLeft(15)
                            .setMarginBottom(1));
                    }
                }
                document.add(new Paragraph().setMarginBottom(6));
            }
        }

        // --- Projects Section ---
        if (resume.getProjectList() != null && !resume.getProjectList().isEmpty()) {
            addSectionHeader(document, "PROJECTS", boldFont);
            
            for (Project project : resume.getProjectList()) {
                // Project name with bullet
                Table projTable = new Table(UnitValue.createPercentArray(new float[]{3, 77, 20}))
                    .useAllAvailableWidth()
                    .setMarginBottom(1);
                
                projTable.addCell(createCell("•", regularFont, 9, TextAlignment.LEFT));
                
                // Project name (bold) and optional date
                projTable.addCell(createCell(project.getProjectName(), boldFont, 9, TextAlignment.LEFT));
                projTable.addCell(createCell("", regularFont, 9, TextAlignment.RIGHT));
                
                document.add(projTable);
                
                // Project description with sub-bullet points (indented)
                if (project.getDescription() != null && !project.getDescription().isEmpty()) {
                    String[] points = project.getDescription().split("\\n|\\r\\n|\\r");
                    for (String point : points) {
                        if (point.trim().isEmpty()) continue;
                        document.add(new Paragraph("◦ " + point.trim())
                            .setFont(regularFont)
                            .setFontSize(9)
                            .setMarginLeft(15)
                            .setMarginBottom(1));
                    }
                }
                document.add(new Paragraph().setMarginBottom(6));
            }
        }

        // --- Skills Section ---
        if (resume.getSkillList() != null && !resume.getSkillList().isEmpty()) {
            addSectionHeader(document, "SKILLS", boldFont);
            
            // Display each skill on a new line with bullet and proper indentation
            for (Skill skill : resume.getSkillList()) {
                if (skill.getName() != null && !skill.getName().trim().isEmpty()) {
                    Table skillTable = new Table(UnitValue.createPercentArray(new float[]{3, 97}))
                        .useAllAvailableWidth()
                        .setMarginBottom(1);
                    
                    skillTable.addCell(createCell("•", regularFont, 9, TextAlignment.LEFT));
                    skillTable.addCell(createCell(skill.getName().trim(), regularFont, 9, TextAlignment.LEFT));
                    
                    document.add(skillTable);
                }
            }
        }
        
        document.close();
        return new ByteArrayInputStream(out.toByteArray());
    }

    // Helper method to create section headers
    private void addSectionHeader(Document document, String title, PdfFont font) {
        document.add(new Paragraph(title)
            .setFont(font)
            .setFontSize(10)
            .setMarginTop(8)
            .setMarginBottom(3)
            .setBold());
        
        // Add underline
        SolidLine line = new SolidLine(0.5f);
        line.setColor(ColorConstants.BLACK);
        document.add(new LineSeparator(line).setMarginBottom(4));
    }

    // Helper method to create table cells without borders
    private Cell createCell(String text, PdfFont font, int fontSize, TextAlignment alignment) {
        Cell cell = new Cell().add(new Paragraph(text).setFont(font).setFontSize(fontSize));
        cell.setBorder(Border.NO_BORDER);
        cell.setTextAlignment(alignment);
        cell.setPadding(0);
        cell.setMargin(0);
        return cell;
    }
}