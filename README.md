\# 📄 ResumeCraft - Resume Builder



> \*\*Live Demo:\*\* \  https://resume-builder--shashank-cp.replit.app



A modern, template-based web application for creating professional resumes with ease. Built with Spring Boot and deployed on Replit, ResumeCraft provides an intuitive interface for users to build, manage, and download their resumes in PDF format.



---



\## 🌟 Features



\### 🔐 \*\*User Authentication \& Security\*\*

\- Secure user registration and login system

\- Password encryption using Spring Security

\- Session management and CSRF protection

\- Protected routes and role-based access control



\### 📝 \*\*Resume Management\*\*

\- \*\*Create Multiple Resumes\*\*: Build and save unlimited resumes

\- \*\*Edit Anytime\*\*: Modify existing resumes with ease

\- \*\*Delete Resumes\*\*: Remove unwanted resumes from your dashboard

\- \*\*Organized Dashboard\*\*: View all your resumes in one place with quick actions



\### 🎨 \*\*Comprehensive Resume Builder\*\*

\- \*\*Personal Details\*\*: Name, email, phone, and address

\- \*\*Professional Summary\*\*: Highlight your career objectives and achievements

\- \*\*Education\*\*: Add multiple academic qualifications

\- \*\*Work Experience\*\*: Document your professional journey with detailed descriptions

\- \*\*Projects\*\*: Showcase your technical and creative projects

\- \*\*Skills\*\*: List your top skills and competencies



\### 📥 \*\*PDF Export\*\*

\- \*\*One-Click Download\*\*: Generate professional PDF resumes instantly

\- \*\*Clean Template\*\*: Modern, ATS-friendly resume design

\- \*\*iText Integration\*\*: High-quality PDF rendering



\### 📊 \*\*Interactive Dashboard\*\*

\- \*\*Resume Statistics\*\*: Track the number of resumes created

\- \*\*Quick Actions\*\*: Edit, download, or delete resumes with single clicks

\- \*\*Responsive Design\*\*: Beautiful UI that works on all devices

\- \*\*Animated Interface\*\*: Smooth transitions and modern design elements



---



\## 🛠️ Technology Stack



\### \*\*Backend\*\*

\- \*\*Java 17\*\*: Core programming language

\- \*\*Spring Boot 3.3.4\*\*: Application framework

&nbsp; - Spring Data JPA: Database abstraction layer

&nbsp; - Spring Security: Authentication and authorization

&nbsp; - Spring Web: RESTful web services

\- \*\*Hibernate\*\*: ORM for database operations

\- \*\*Maven\*\*: Dependency management and build automation



\### \*\*Frontend\*\*

\- \*\*JSP (JavaServer Pages)\*\*: Dynamic web pages

\- \*\*JSTL\*\*: Tag library for JSP

\- \*\*HTML5 \& CSS3\*\*: Modern, responsive UI

\- \*\*JavaScript\*\*: Interactive functionality

\- \*\*Font Awesome\*\*: Icon library

\- \*\*Google Fonts\*\*: Typography (Poppins)



\### \*\*Database\*\*

\- \*\*MySQL\*\*: Relational database management

\- \*\*HikariCP\*\*: Connection pooling for optimal performance



\### \*\*PDF Generation\*\*

\- \*\*iText 8.0.4\*\*: PDF creation and manipulation

&nbsp; - Kernel module: Core PDF functionality

&nbsp; - Layout module: Document structure and styling



\### \*\*Deployment\*\*

\- \*\*Replit\*\*: Cloud platform for deployment

\- \*\*Apache Tomcat\*\*: Embedded servlet container

\- \*\*Maven Wrapper\*\*: Consistent build environment



---



\## 📁 Project Structure



```

ResumeBuilder/

├── src/

│   ├── main/

│   │   ├── java/com/resume/

│   │   │   ├── config/          # Security \& configuration

│   │   │   ├── controller/      # Web controllers

│   │   │   ├── entity/          # JPA entities

│   │   │   ├── repository/      # Data repositories

│   │   │   └── service/         # Business logic

│   │   ├── resources/

│   │   │   ├── static/

│   │   │   │   └── css/         # Stylesheets

│   │   │   ├── application.properties           # Local config

│   │   │   └── application-prod.properties      # Production config

│   │   └── webapp/

│   │       └── WEB-INF/

│   │           └── views/       # JSP templates

│   └── test/                    # Unit tests

├── .mvn/                        # Maven wrapper

├── pom.xml                      # Maven dependencies

└── README.md

```



---



\## 🚀 Getting Started



\### \*\*Prerequisites\*\*

\- Java 17 or higher

\- MySQL 8.0 or higher

\- Maven 3.9+ (or use included Maven wrapper)



\### \*\*Local Development Setup\*\*



1\. \*\*Clone the repository\*\*

&nbsp;  ```bash

&nbsp;  git clone <repository-url>

&nbsp;  cd ResumeBuilder

&nbsp;  ```



2\. \*\*Configure MySQL Database\*\*

&nbsp;  

&nbsp;  Create a database:

&nbsp;  ```sql

&nbsp;  CREATE DATABASE resume\_builder\_db;

&nbsp;  ```



&nbsp;  Update `src/main/resources/application.properties`:

&nbsp;  ```properties

&nbsp;  spring.datasource.url=jdbc:mysql://localhost:3306/resume\_builder\_db

&nbsp;  spring.datasource.username=your\_username

&nbsp;  spring.datasource.password=your\_password

&nbsp;  ```



3\. \*\*Build the project\*\*

&nbsp;  ```bash

&nbsp;  ./mvnw clean install

&nbsp;  ```



4\. \*\*Run the application\*\*

&nbsp;  ```bash

&nbsp;  ./mvnw spring-boot:run

&nbsp;  ```



5\. \*\*Access the application\*\*

&nbsp;  

&nbsp;  Open your browser and navigate to: `http://localhost:8080`



---



\## 🌐 Deployment on Replit



The application is configured for seamless deployment on Railway with the following setup:



\### \*\*Environment Variables\*\*

Set these variables in your Railway project:



```env

MYSQLDATABASE=your\_database\_name

MYSQLUSER=your\_database\_user

MYSQLPASSWORD=your\_database\_password

PORT=8080

SPRING\_PROFILES\_ACTIVE=prod

```



\### \*\*Database Configuration\*\*

Railway MySQL proxy connection is automatically configured in `application-prod.properties`:



```properties

spring.datasource.url=jdbc:mysql://crossover.proxy.rlwy.net:49237/${MYSQLDATABASE}

spring.datasource.username=${MYSQLUSER}

spring.datasource.password=${MYSQLPASSWORD}

```



\### \*\*Deployment Steps\*\*

1\. Connect your GitHub repository to Railway

2\. Add MySQL plugin to your Railway project

3\. Configure environment variables

4\. Deploy automatically on push to main branch



---



\## 🔑 Key Features Breakdown



\### \*\*Dynamic Form Fields\*\*

\- Add/remove multiple education entries

\- Add/remove multiple work experiences

\- Add/remove multiple projects

\- Fixed skill slots for consistency



\### \*\*Data Persistence\*\*

\- All resume data stored securely in MySQL

\- User-specific resume management

\- Automatic data binding with Spring Data JPA



\### \*\*Security Features\*\*

\- Password encryption using BCrypt

\- CSRF token protection

\- Secure session management

\- XSS protection



\### \*\*Responsive Design\*\*

\- Desktop-enhanced experience

\- Smooth animations and transitions



---



\## 🎯 Future Enhancements



\- \[ ] Multiple resume templates

\- \[ ] AI-powered content suggestions

\- \[ ] Resume analytics and tracking

\- \[ ] Export to DOCX format

\- \[ ] Resume sharing via unique links

\- \[ ] Integration with job portals

\- \[ ] Cover letter builder

\- \[ ] Resume score calculator



---



\## 📝 Database Schema



\### \*\*Users Table\*\*

\- `id` (Primary Key)

\- `name`

\- `email` (Unique)

\- `password` (Encrypted)



\### \*\*Resume Table\*\*

\- `id` (Primary Key)

\- `user\_id` (Foreign Key)

\- `title`

\- `full\_name`

\- `email`

\- `phone\_number`

\- `address`

\- `summary`



\### \*\*Education Table\*\*

\- `id` (Primary Key)

\- `resume\_id` (Foreign Key)

\- `school\_name`

\- `degree`

\- `graduation\_date`



\### \*\*Experience Table\*\*

\- `id` (Primary Key)

\- `resume\_id` (Foreign Key)

\- `job\_title`

\- `company\_name`

\- `start\_date`

\- `end\_date`

\- `description`



\### \*\*Project Table\*\*

\- `id` (Primary Key)

\- `resume\_id` (Foreign Key)

\- `project\_name`

\- `description`



\### \*\*Skill Table\*\*

\- `id` (Primary Key)

\- `resume\_id` (Foreign Key)

\- `name`





---



\## 👨‍💻 Developer



Created by \[Shashank Moudgalya C P]



\- \*\*LinkedIn\*\*: \[https://www.linkedin.com/in/shashank-cp/]

\- \*\*GitHub\*\*: \[https://github.com/Shashank-C-P]



---



\## 🙏 Acknowledgments



\- Spring Boot team for the excellent framework

\- Railway for reliable hosting

\- iText for PDF generation capabilities

\- Font Awesome for beautiful icons

\- The open-source community



---



\*\*⭐ If you found this project helpful, please consider giving it a star!\*\*

