<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - ResumeCraft</title>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo.ico">

    <!-- Fonts -->
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
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 25%, #7e22ce 50%, #c026d3 75%, #e879f9 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            color: #333;
            min-height: 100vh;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle at 20% 50%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 80% 80%, rgba(124, 58, 237, 0.15) 0%, transparent 50%),
                        radial-gradient(circle at 40% 20%, rgba(192, 38, 211, 0.1) 0%, transparent 50%);
            animation: float 20s ease-in-out infinite;
            pointer-events: none;
            will-change: transform;
        }

        body::after {
            content: '';
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100%;
            background: 
                repeating-linear-gradient(90deg, rgba(255, 255, 255, 0.03) 0px, transparent 1px, transparent 40px, rgba(255, 255, 255, 0.03) 41px),
                repeating-linear-gradient(0deg, rgba(255, 255, 255, 0.03) 0px, transparent 1px, transparent 40px, rgba(255, 255, 255, 0.03) 41px);
            pointer-events: none;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(30px, -30px) rotate(120deg); }
            66% { transform: translate(-20px, 20px) rotate(240deg); }
        }

        /* Container */
        .dashboard-container {
            background: #ffffff;
            width: 100%;
            max-width: 1100px;
            margin: 0 auto;
            border-radius: 20px;
            padding: 0;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: fadeIn 0.6s ease-in-out;
            max-height: 92vh;
            overflow-y: auto;
            position: relative;
            z-index: 1;
            -webkit-overflow-scrolling: touch;
            scroll-behavior: smooth;
            will-change: scroll-position;
        }

        /* Custom Scrollbar */
        .dashboard-container::-webkit-scrollbar {
            width: 8px;
        }

        .dashboard-container::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .dashboard-container::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 10px;
        }

        .dashboard-container::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, #764ba2, #667eea);
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
            padding: 25px 20px;
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

        .header-icon {
            font-size: 38px;
            margin-bottom: 10px;
            animation: bounce 2s infinite;
            position: relative;
            z-index: 1;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .header-section h2 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .header-section p {
            font-size: 14px;
            font-weight: 300;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.5;
            position: relative;
            z-index: 1;
            opacity: 0.95;
        }

        /* Stats Section */
        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 12px;
            padding: 18px 25px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .stat-card {
            background: white;
            padding: 14px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            animation: slideIn 0.5s ease-out;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.2);
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

        .stat-card i {
            font-size: 22px;
            color: #667eea;
            margin-bottom: 4px;
        }

        .stat-card h3 {
            font-size: 20px;
            color: #667eea;
            margin: 4px 0 2px;
            font-weight: 700;
        }

        .stat-card p {
            font-size: 11px;
            color: #666;
            font-weight: 500;
        }

        /* Content Section */
        .content-section {
            padding: 20px;
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 15px;
            padding-bottom: 8px;
            border-bottom: 3px solid #667eea;
        }

        .section-header i {
            font-size: 22px;
            color: #667eea;
        }

        .section-header h3 {
            font-size: 19px;
            color: #667eea;
            font-weight: 700;
            margin: 0;
        }

        /* Resume Cards */
        .resume-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }

        .resume-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 12px;
            padding: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: cardFadeIn 0.5s ease-out;
        }

        @keyframes cardFadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .resume-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2);
        }

        .resume-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.2);
        }

        .resume-number {
            position: absolute;
            top: 10px;
            right: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
            box-shadow: 0 3px 8px rgba(102, 126, 234, 0.3);
        }

        .resume-icon {
            font-size: 30px;
            color: #667eea;
            margin-bottom: 8px;
            opacity: 0.9;
        }

        .resume-title {
            font-size: 16px;
            font-weight: 600;
            color: #2c2c54;
            margin-bottom: 12px;
            padding-right: 40px;
        }

        .resume-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .action-btn {
            border: none;
            padding: 9px 16px;
            border-radius: 9px;
            color: white;
            font-size: 12px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .edit-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            flex: 1;
        }

        .edit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(102, 126, 234, 0.4);
        }

        .delete-btn {
            background: linear-gradient(135deg, #eb3349, #f45c43);
        }

        .delete-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(235, 51, 73, 0.4);
        }

        .download-btn {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            flex: 1;
        }

        .download-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(17, 153, 142, 0.4);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 30px 20px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 12px;
            margin-bottom: 20px;
        }

        .empty-state i {
            font-size: 50px;
            color: #667eea;
            margin-bottom: 10px;
            opacity: 0.6;
        }

        .empty-state h4 {
            font-size: 18px;
            color: #2c2c54;
            margin-bottom: 6px;
        }

        .empty-state p {
            font-size: 13px;
            color: #666;
            margin-bottom: 16px;
        }

        /* Create Resume Button */
        .create-resume-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .create-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            color: white;
            font-weight: 600;
            font-size: 14px;
            border-radius: 10px;
            padding: 12px 28px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 6px 16px rgba(102, 126, 234, 0.4);
        }

        .create-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.5);
        }

        .create-btn i {
            font-size: 16px;
        }

        /* Logout Section */
        .logout-section {
            text-align: center;
            padding: 16px 20px 20px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .logout-btn {
            background: linear-gradient(135deg, #eb3349, #f45c43);
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 4px 12px rgba(235, 51, 73, 0.3);
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(235, 51, 73, 0.4);
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .dashboard-container {
                width: 100%;
                max-height: 95vh;
            }

            .content-section {
                padding: 20px;
            }

            .stats-section {
                padding: 20px;
                gap: 12px;
                grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
            }

            .stat-card {
                padding: 15px;
            }

            .stat-card i {
                font-size: 24px;
            }

            .stat-card h3 {
                font-size: 24px;
            }

            .resume-grid {
                grid-template-columns: 1fr;
            }

            .header-section {
                padding: 25px 20px;
            }

            .header-section h2 {
                font-size: 28px;
            }

            .header-icon {
                font-size: 36px;
            }

            .section-header h3 {
                font-size: 20px;
            }
        }

        /* Smooth Scroll */
        html {
            scroll-behavior: smooth;
        }
    </style>
</head>

<body>
    <div class="dashboard-container">
        <!-- Header -->
        <div class="header-section">
            <div class="header-icon">
                <i class="fas fa-chart-line"></i>
            </div>
            <h2>Welcome to Your Dashboard!</h2>
            <p>
                Manage your professional resumes effortlessly. Create, edit, and download your resumes 
                to showcase your skills and experience to potential employers.
            </p>
        </div>

        <!-- Stats Section -->
        <div class="stats-section">
            <div class="stat-card">
                <i class="fas fa-file-alt"></i>
                <h3>${not empty resumes ? resumes.size() : 0}</h3>
                <p>Total Resumes</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-download"></i>
                <h3>Ready</h3>
                <p>Download Anytime</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-star"></i>
                <h3>Premium</h3>
                <p>Quality Templates</p>
            </div>
        </div>

        <!-- Content Section -->
        <div class="content-section">
            <div class="section-header">
                <i class="fas fa-folder-open"></i>
                <h3>Your Resumes</h3>
            </div>

            <c:choose>
                <c:when test="${not empty resumes}">
                    <div class="resume-grid">
                        <c:forEach items="${resumes}" var="resume" varStatus="status">
                            <div class="resume-card">
                                <div class="resume-number">${status.index + 1}</div>
                                <div class="resume-icon">
                                    <i class="fas fa-file-alt"></i>
                                </div>
                                <div class="resume-title">${resume.title}</div>
                                <div class="resume-actions">
                                    <a href="/resume/edit/${resume.id}" style="flex: 1;">
                                        <button class="action-btn edit-btn">
                                            <i class="fas fa-edit"></i> Edit
                                        </button>
                                    </a>
                                    <form action="/resume/delete/${resume.id}" method="post" style="display:inline; flex: 0;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="action-btn delete-btn"
                                            onclick="return confirm('Are you sure you want to delete this resume?')">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                    <a href="/resume/download/${resume.id}" target="_blank" style="flex: 1;">
                                        <button class="action-btn download-btn">
                                            <i class="fas fa-download"></i> Download
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fas fa-inbox"></i>
                        <h4>No Resumes Yet</h4>
                        <p>Start building your professional resume now and take the next step in your career!</p>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="create-resume-section">
                <a href="/resume/create" class="create-btn">
                    <i class="fas fa-plus-circle"></i>
                    Create a New Resume
                </a>
            </div>
        </div>

        <!-- Logout Section -->
        <div class="logout-section">
            <form action="/logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button type="submit" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    Logout
                </button>
            </form>
        </div>
    </div>

    <script>
        // Add smooth animations on page load
        document.addEventListener('DOMContentLoaded', function() {
            // Animate resume cards with stagger effect
            const cards = document.querySelectorAll('.resume-card');
            cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
            });

            // Add pulse animation to stats
            const statCards = document.querySelectorAll('.stat-card');
            statCards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.15}s`;
            });
        });

        // Add interactive hover effects
        document.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px) scale(1.05)';
            });
            btn.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });
    </script>
</body>
</html>