<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Resume - ResumeCraft</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo.ico">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Global */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            min-height: 100vh;
            padding: 20px 0;
        }

        /* Container */
        .resume-form-container {
            background: #ffffff;
            width: 85%;
            max-width: 900px;
            margin: 0 auto;
            border-radius: 20px;
            padding: 0;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Header Section */
        .header-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
            padding: 35px 30px;
            position: relative;
            overflow: hidden;
        }

        .header-section::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .header-section h2 {
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .header-section p {
            font-size: 16px;
            font-weight: 300;
            max-width: 700px;
            margin: 0 auto;
            line-height: 1.6;
            position: relative;
            z-index: 1;
            opacity: 0.95;
        }

        .header-icon {
            font-size: 48px;
            margin-bottom: 15px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        /* Form Content */
        .form-content {
            padding: 40px 60px 60px;
        }

        /* Section Headers with Icons */
        h3 {
            font-size: 24px;
            color: #667eea;
            margin-top: 30px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            padding-bottom: 10px;
            border-bottom: 3px solid #667eea;
        }

        h3 i {
            font-size: 28px;
        }

        .form-section {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

        .form-section:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
            transform: translateY(-2px);
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            margin-top: 15px;
            color: #444;
            font-size: 14px;
        }

        label:first-of-type {
            margin-top: 0;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 14px 18px;
            font-size: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            background: #fff;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
        }

        input:focus,
        textarea:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            outline: none;
            transform: scale(1.01);
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        fieldset {
            border: 2px solid #d1d5db;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 25px;
            border-radius: 12px;
            background: #ffffff;
            position: relative;
            transition: all 0.3s ease;
        }

        fieldset:hover {
            border-color: #667eea;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.1);
        }

        legend {
            font-weight: 600;
            color: #667eea;
            padding: 0 12px;
            font-size: 16px;
        }

        /* Button Styles */
        button[type="submit"] {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #fff;
            border: none;
            font-size: 18px;
            font-weight: 600;
            border-radius: 12px;
            padding: 16px 40px;
            cursor: pointer;
            margin-top: 30px;
            transition: all 0.3s ease;
            width: 100%;
            max-width: 350px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }

        button[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.5);
        }

        button[type="submit"]:active {
            transform: translateY(-1px);
        }

        .add-btn {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: #fff;
            border: none;
            font-size: 14px;
            font-weight: 600;
            border-radius: 10px;
            padding: 12px 24px;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(17, 153, 142, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .add-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(17, 153, 142, 0.4);
        }

        .remove-btn {
            background: linear-gradient(135deg, #eb3349 0%, #f45c43 100%);
            color: #fff;
            border: none;
            font-size: 12px;
            font-weight: 600;
            border-radius: 8px;
            padding: 8px 16px;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(235, 51, 73, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .remove-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(235, 51, 73, 0.4);
        }

        .dynamic-section {
            position: relative;
            animation: slideIn 0.4s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Tooltips */
        .tooltip {
            position: relative;
            display: inline-block;
            cursor: help;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .resume-form-container {
                width: 95%;
                border-radius: 16px;
            }

            .form-content {
                padding: 30px 25px;
            }

            .header-section {
                padding: 40px 25px;
            }

            .header-section h2 {
                font-size: 32px;
            }

            h3 {
                font-size: 20px;
            }

            button[type="submit"] {
                width: 100%;
                max-width: 100%;
            }
        }

        /* Smooth Scroll */
        html {
            scroll-behavior: smooth;
        }

        /* Loading Animation */
        .loading {
            pointer-events: none;
            opacity: 0.6;
        }
    </style>
</head>

<body>
    <div class="resume-form-container">
        <div class="header-section">
            <div class="header-icon">
                <i class="fas fa-file-alt"></i>
            </div>
            <h2>Create Your Resume</h2>
            <p>
                Fill out your personal and professional details below to generate a clean, modern resume.
                ResumeCraft helps you organize your career information and produce a polished document effortlessly.
            </p>
        </div>

        <div class="form-content">
            <form:form modelAttribute="resume" action="/resume/create" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <form:hidden path="id"/>

                <!-- Resume Title -->
                <div class="form-section">
                    <label><i class="fas fa-pen"></i> Resume Title</label>
                    <form:input path="title" required="true" placeholder="e.g. Software Engineer Resume" />
                </div>

                <!-- Personal Details -->
                <div class="form-section">
                    <h3><i class="fas fa-user"></i> Personal Details</h3>
                    
                    <label><i class="fas fa-user-circle"></i> Full Name</label>
                    <form:input path="fullName" required="true" placeholder="Enter your full name" />

                    <label><i class="fas fa-envelope"></i> Email</label>
                    <form:input path="email" type="email" required="true" placeholder="you@example.com" />

                    <label><i class="fas fa-phone"></i> Phone Number</label>
                    <form:input path="phoneNumber" placeholder="+91 98765 43210" />

                    <label><i class="fas fa-map-marker-alt"></i> Address</label>
                    <form:input path="address" placeholder="City, State, Country" />
                </div>

                <!-- Professional Summary -->
                <div class="form-section">
                    <h3><i class="fas fa-lightbulb"></i> Professional Summary</h3>
                    <label>Summary</label>
                    <form:textarea path="summary" rows="5" placeholder="Write a brief summary about your experience, achievements, and goals..." />
                </div>

                <!-- Education -->
                <div class="form-section">
                    <h3><i class="fas fa-graduation-cap"></i> Education</h3>
                    <div id="education-container">
                        <c:forEach items="${resume.educationList}" var="edu" varStatus="status">
                            <fieldset class="dynamic-section">
                                <legend><i class="fas fa-school"></i> Academic Details ${status.index + 1}</legend>
                                <c:if test="${status.index > 0}">
                                    <button type="button" class="remove-btn" onclick="removeEducation(this)">
                                        <i class="fas fa-trash"></i> Remove
                                    </button>
                                </c:if>
                                <label>School / College</label>
                                <form:input path="educationList[${status.index}].schoolName" placeholder="Institution Name" />

                                <label>Degree</label>
                                <form:input path="educationList[${status.index}].degree" placeholder="e.g. B.Tech in Computer Science" />

                                <label>Graduation Date</label>
                                <form:input path="educationList[${status.index}].graduationDate" placeholder="e.g. June 2025" />
                            </fieldset>
                        </c:forEach>
                    </div>
                    <button type="button" class="add-btn" onclick="addEducation()">
                        <i class="fas fa-plus-circle"></i> Add Another Education
                    </button>
                </div>

                <!-- Work Experience -->
                <div class="form-section">
                    <h3><i class="fas fa-briefcase"></i> Work Experience</h3>
                    <div id="experience-container">
                        <c:forEach items="${resume.experienceList}" var="exp" varStatus="status">
                            <fieldset class="dynamic-section">
                                <legend><i class="fas fa-building"></i> Job ${status.index + 1}</legend>
                                <c:if test="${status.index > 0}">
                                    <button type="button" class="remove-btn" onclick="removeExperience(this)">
                                        <i class="fas fa-trash"></i> Remove
                                    </button>
                                </c:if>
                                <label>Job Title</label>
                                <form:input path="experienceList[${status.index}].jobTitle" placeholder="e.g. Software Intern" />

                                <label>Company Name</label>
                                <form:input path="experienceList[${status.index}].companyName" placeholder="Company Name" />

                                <label>Start Date</label>
                                <form:input path="experienceList[${status.index}].startDate" placeholder="e.g. Jan 2024" />

                                <label>End Date</label>
                                <form:input path="experienceList[${status.index}].endDate" placeholder="e.g. Jun 2024 or Present" />

                                <label>Description (Separate points with new lines)</label>
                                <form:textarea path="experienceList[${status.index}].description" rows="4" placeholder="Describe your role and contributions..." />
                            </fieldset>
                        </c:forEach>
                    </div>
                    <button type="button" class="add-btn" onclick="addExperience()">
                        <i class="fas fa-plus-circle"></i> Add Another Experience
                    </button>
                </div>
                
                <!-- Projects -->
                <div class="form-section">
                    <h3><i class="fas fa-project-diagram"></i> Projects</h3>
                    <div id="project-container">
                        <c:forEach items="${resume.projectList}" var="project" varStatus="status">
                            <fieldset class="dynamic-section">
                                <legend><i class="fas fa-code"></i> Project ${status.index + 1}</legend>
                                <c:if test="${status.index > 0}">
                                    <button type="button" class="remove-btn" onclick="removeProject(this)">
                                        <i class="fas fa-trash"></i> Remove
                                    </button>
                                </c:if>
                                <label>Project Name</label>
                                <form:input path="projectList[${status.index}].projectName" placeholder="e.g. AI Resume Builder" />

                                <label>Description (Separate points with new lines)</label>
                                <form:textarea path="projectList[${status.index}].description" rows="4" 
                                    placeholder="Describe your project, technologies used, and outcomes..." />
                            </fieldset>
                        </c:forEach>
                    </div>
                    <button type="button" class="add-btn" onclick="addProject()">
                        <i class="fas fa-plus-circle"></i> Add Another Project
                    </button>
                </div>
                
                <!-- Skills -->
                <div class="form-section">
                    <h3><i class="fas fa-cogs"></i> Skills</h3>
                    <fieldset>
                        <legend><i class="fas fa-star"></i> Top Skills</legend>
                        <c:forEach items="${resume.skillList}" var="skill" varStatus="status">
                            <label>Skill ${status.index + 1}</label>
                            <form:input path="skillList[${status.index}].name" placeholder="e.g. Java" />
                        </c:forEach>
                    </fieldset>
                </div>

                <button type="submit">
                    <i class="fas fa-save"></i> Save and Continue
                </button>
            </form:form>
        </div>
    </div>

    <script>
        let educationCount = ${resume.educationList.size()};
        let experienceCount = ${resume.experienceList.size()};
        let projectCount = ${resume.projectList.size()};

        // Smooth animations for inputs
        document.querySelectorAll('input, textarea').forEach(element => {
            element.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.01)';
            });
            element.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });

        function addEducation() {
            const container = document.getElementById('education-container');
            const fieldset = document.createElement('fieldset');
            fieldset.className = 'dynamic-section';
            fieldset.innerHTML = `
                <legend><i class="fas fa-school"></i> Academic Details ` + (educationCount + 1) + `</legend>
                <button type="button" class="remove-btn" onclick="removeEducation(this)">
                    <i class="fas fa-trash"></i> Remove
                </button>
                <label>School / College</label>
                <input type="text" name="educationList[` + educationCount + `].schoolName" placeholder="Institution Name" />
                
                <label>Degree</label>
                <input type="text" name="educationList[` + educationCount + `].degree" placeholder="e.g. B.Tech in Computer Science" />
                
                <label>Graduation Date</label>
                <input type="text" name="educationList[` + educationCount + `].graduationDate" placeholder="e.g. June 2025" />
            `;
            container.appendChild(fieldset);
            educationCount++;
            fieldset.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function removeEducation(btn) {
            btn.parentElement.remove();
            reindexEducation();
        }

        function reindexEducation() {
            const fieldsets = document.querySelectorAll('#education-container fieldset');
            educationCount = 0;
            fieldsets.forEach((fieldset, index) => {
                fieldset.querySelector('legend').innerHTML = '<i class="fas fa-school"></i> Academic Details ' + (index + 1);
                fieldset.querySelectorAll('input').forEach(input => {
                    const name = input.getAttribute('name');
                    if (name) {
                        input.setAttribute('name', name.replace(/\[\d+\]/, '[' + index + ']'));
                    }
                });
                educationCount++;
            });
        }

        function addExperience() {
            const container = document.getElementById('experience-container');
            const fieldset = document.createElement('fieldset');
            fieldset.className = 'dynamic-section';
            fieldset.innerHTML = `
                <legend><i class="fas fa-building"></i> Job ` + (experienceCount + 1) + `</legend>
                <button type="button" class="remove-btn" onclick="removeExperience(this)">
                    <i class="fas fa-trash"></i> Remove
                </button>
                <label>Job Title</label>
                <input type="text" name="experienceList[` + experienceCount + `].jobTitle" placeholder="e.g. Software Intern" />
                
                <label>Company Name</label>
                <input type="text" name="experienceList[` + experienceCount + `].companyName" placeholder="Company Name" />
                
                <label>Start Date</label>
                <input type="text" name="experienceList[` + experienceCount + `].startDate" placeholder="e.g. Jan 2024" />
                
                <label>End Date</label>
                <input type="text" name="experienceList[` + experienceCount + `].endDate" placeholder="e.g. Jun 2024 or Present" />
                
                <label>Description (Separate points with new lines)</label>
                <textarea name="experienceList[` + experienceCount + `].description" rows="4" placeholder="Describe your role and contributions..."></textarea>
            `;
            container.appendChild(fieldset);
            experienceCount++;
            fieldset.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function removeExperience(btn) {
            btn.parentElement.remove();
            reindexExperience();
        }

        function reindexExperience() {
            const fieldsets = document.querySelectorAll('#experience-container fieldset');
            experienceCount = 0;
            fieldsets.forEach((fieldset, index) => {
                fieldset.querySelector('legend').innerHTML = '<i class="fas fa-building"></i> Job ' + (index + 1);
                fieldset.querySelectorAll('input, textarea').forEach(input => {
                    const name = input.getAttribute('name');
                    if (name) {
                        input.setAttribute('name', name.replace(/\[\d+\]/, '[' + index + ']'));
                    }
                });
                experienceCount++;
            });
        }

        function addProject() {
            const container = document.getElementById('project-container');
            const fieldset = document.createElement('fieldset');
            fieldset.className = 'dynamic-section';
            fieldset.innerHTML = `
                <legend><i class="fas fa-code"></i> Project ` + (projectCount + 1) + `</legend>
                <button type="button" class="remove-btn" onclick="removeProject(this)">
                    <i class="fas fa-trash"></i> Remove
                </button>
                <label>Project Name</label>
                <input type="text" name="projectList[` + projectCount + `].projectName" placeholder="e.g. AI Resume Builder" />
                
                <label>Description (Separate points with new lines)</label>
                <textarea name="projectList[` + projectCount + `].description" rows="4" placeholder="Describe your project, technologies used, and outcomes..."></textarea>
            `;
            container.appendChild(fieldset);
            projectCount++;
            fieldset.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        function removeProject(btn) {
            btn.parentElement.remove();
            reindexProject();
        }

        function reindexProject() {
            const fieldsets = document.querySelectorAll('#project-container fieldset');
            projectCount = 0;
            fieldsets.forEach((fieldset, index) => {
                fieldset.querySelector('legend').innerHTML = '<i class="fas fa-code"></i> Project ' + (index + 1);
                fieldset.querySelectorAll('input, textarea').forEach(input => {
                    const name = input.getAttribute('name');
                    if (name) {
                        input.setAttribute('name', name.replace(/\[\d+\]/, '[' + index + ']'));
                    }
                });
                projectCount++;
            });
        }
    </script>
</body>
</html>