package com.resume.builder.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.resume.builder.model.Resume;
import com.resume.builder.model.User;

public interface ResumeRepository extends JpaRepository<Resume, Long> {

    List<Resume> findByUser(User user);

    // Fetch education, experience, and skills together for edit/download
    @Query("SELECT DISTINCT r FROM Resume r " +
           "LEFT JOIN FETCH r.educationList " +
           "LEFT JOIN FETCH r.experienceList " +
           "LEFT JOIN FETCH r.skillList " +
           "WHERE r.id = :id")
    Resume findByIdWithDetails(@Param("id") Long id);
}
