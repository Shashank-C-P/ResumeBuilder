package com.resume.builder.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.resume.builder.model.Education;
import com.resume.builder.model.Experience;
import com.resume.builder.model.Project;
import com.resume.builder.model.Resume;
import com.resume.builder.model.Skill;
import com.resume.builder.model.User;
import com.resume.builder.service.PdfGenerationService;
import com.resume.builder.service.ResumeService;
import com.resume.builder.service.UserService;

@Controller
public class AppController {

    @Autowired private UserService userService;
    @Autowired private ResumeService resumeService;
    @Autowired private PdfGenerationService pdfGenerationService;

    @GetMapping({"/", "/login"})
    public String showLoginForm() { return "login"; }

    @GetMapping("/register")
    public String showRegistrationForm() { return "register"; }

    @PostMapping("/register")
    public String processRegistration(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/register-success";
    }
    
    @GetMapping("/register-success")
    public String showRegistrationSuccess() { return "register-success"; }

    @GetMapping("/dashboard")
    public String showDashboard(Model model, Authentication authentication) {
        List<Resume> resumes = resumeService.findResumesByUserEmail(authentication.getName());
        model.addAttribute("resumes", new ArrayList<>(new HashSet<>(resumes)));
        return "dashboard";
    }

    @GetMapping("/resume/create")
    public String showCreateResumeForm(Model model) {
        Resume resume = new Resume();
        resume.getEducationList().add(new Education());
        resume.getExperienceList().add(new Experience());
        resume.getProjectList().add(new Project());
        for (int i = 0; i < 4; i++) { 
            resume.getSkillList().add(new Skill()); 
        }
        model.addAttribute("resume", resume);
        return "resume-form";
    }

    @GetMapping("/resume/edit/{id}")
    public String showEditResumeForm(@PathVariable Long id, Model model) {
        Resume resume = resumeService.findResumeByIdWithDetails(id);

        // Ensure at least one entry exists for dynamic sections
        if (resume.getEducationList().isEmpty()) { 
            resume.getEducationList().add(new Education()); 
        }
        if (resume.getExperienceList().isEmpty()) { 
            resume.getExperienceList().add(new Experience()); 
        }
        if (resume.getProjectList().isEmpty()) { 
            resume.getProjectList().add(new Project()); 
        }
        while (resume.getSkillList().size() < 4) { 
            resume.getSkillList().add(new Skill()); 
        }

        model.addAttribute("resume", resume);
        return "resume-form";
    }
    
    @GetMapping("/resume/download/{id}")
    public ResponseEntity<InputStreamResource> downloadResume(@PathVariable Long id) throws IOException {
        Resume resume = resumeService.findResumeByIdWithDetails(id);
        
        ByteArrayInputStream pdf = pdfGenerationService.generatePdf(resume);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=" + resume.getTitle() + ".pdf");
        return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_PDF).body(new InputStreamResource(pdf));
    }

    @PostMapping("/resume/create")
    public String saveOrUpdateResume(@ModelAttribute Resume resume, Authentication authentication) {
        resumeService.saveResume(resume, authentication.getName());
        return "redirect:/dashboard";
    }
    
    @PostMapping("/resume/delete/{id}")
    public String deleteResume(@PathVariable Long id, Authentication authentication) {
        Resume resume = resumeService.findResumeByIdWithDetails(id);
        if (resume != null && resume.getUser().getEmail().equals(authentication.getName())) {
            resumeService.deleteResumeById(id);
        }
        return "redirect:/dashboard";
    }
}