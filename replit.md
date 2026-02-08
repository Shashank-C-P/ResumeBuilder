# ResumeCraft - Resume Builder Web Application

## Overview
A Spring Boot web application for building professional resumes. Users can register, log in, create/edit resumes, and download them as PDFs.

## Tech Stack
- **Language**: Java 17+ (GraalVM 22.3)
- **Framework**: Spring Boot 3.3.4
- **Database**: PostgreSQL (Replit built-in, originally MySQL)
- **ORM**: Hibernate / Spring Data JPA
- **View Engine**: JSP with JSTL
- **Security**: Spring Security with BCrypt password hashing
- **PDF Generation**: iTextPDF 8.0.4
- **Build Tool**: Maven (via Maven Wrapper `./mvnw`)

## Project Structure
```
src/main/java/com/resume/builder/
  ├── ResumeBuilderApplication.java   # Main entry point
  ├── config/SecurityConfig.java      # Spring Security configuration
  ├── controller/AppController.java   # Web controller (all routes)
  ├── model/                          # JPA entities (User, Resume, Education, Experience, Project, Skill)
  ├── repository/                     # Spring Data JPA repositories
  └── service/                        # Business logic services
src/main/resources/
  ├── application.properties          # App config (DB, server port 5000)
  └── static/                         # CSS, images
src/main/webapp/WEB-INF/views/        # JSP templates
```

## Configuration
- Server runs on port 5000, bound to 0.0.0.0
- PostgreSQL connection via PGHOST, PGPORT, PGDATABASE, PGUSER, PGPASSWORD env vars
- Forward headers strategy set to `native` for proxy support
- Hibernate auto-creates/updates tables (`ddl-auto=update`)

## Running
```
./mvnw spring-boot:run -DskipTests
```

## Recent Changes
- 2026-02-08: Imported from GitHub, adapted for Replit environment
  - Switched from MySQL to PostgreSQL
  - Configured server port to 5000 with 0.0.0.0 binding
  - Added proxy/forward headers support
