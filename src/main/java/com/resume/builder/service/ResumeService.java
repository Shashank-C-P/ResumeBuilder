package com.resume.builder.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.resume.builder.model.Education;
import com.resume.builder.model.Experience;
import com.resume.builder.model.Resume;
import com.resume.builder.model.Skill;
import com.resume.builder.model.User;
import com.resume.builder.repository.ResumeRepository;
import com.resume.builder.repository.UserRepository;

@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private UserRepository userRepository;

    public void deleteResumeById(Long id) {
        resumeRepository.deleteById(id);
    }

    public void saveResume(Resume resume, String currentUserEmail) {
        User user = userRepository.findByEmail(currentUserEmail);
        resume.setUser(user);

        if (resume.getEducationList() != null) {
            resume.getEducationList().forEach(edu -> edu.setResume(resume));
        }
        if (resume.getExperienceList() != null) {
            resume.getExperienceList().forEach(exp -> exp.setResume(resume));
        }
        if (resume.getProjectList() != null) {
            resume.getProjectList().removeIf(project ->
                project.getProjectName() == null || project.getProjectName().trim().isEmpty());
            resume.getProjectList().forEach(project -> project.setResume(resume));
        }
        if (resume.getSkillList() != null) {
            resume.getSkillList().removeIf(skill ->
                skill.getName() == null || skill.getName().trim().isEmpty());
            resume.getSkillList().forEach(skill -> skill.setResume(resume));
        }

        resumeRepository.save(resume);
    }

    public List<Resume> findResumesByUserEmail(String email) {
        User user = userRepository.findByEmail(email);
        return resumeRepository.findByUser(user);
    }

    @Transactional(readOnly = true)
    public Resume findResumeByIdWithDetails(Long id) {
        Resume resume = resumeRepository.findById(id).orElse(null);
        if (resume != null) {
            // Force Hibernate to load all lazy-loaded collections while transaction is active
            resume.getEducationList().size();
            resume.getExperienceList().size();
            resume.getSkillList().size();
            resume.getProjectList().size();  // ADD THIS LINE
        }
        return resume;
    }
}