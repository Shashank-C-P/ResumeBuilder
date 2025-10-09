<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - ResumeCraft</title>

    <!-- ✅ Favicon links (inside head only) -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo.png">


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
</head>

<body>
    

    <div class="container">
        <div class="intro-section">
            <h1>Welcome to <span>ResumeCraft</span></h1>
            <p class="description">
                Build your professional resume with ease.  
                Create, customize, and download in just minutes using modern templates.
            </p>
            <div class="features">
                <div class="feature-card">
                    <img src="https://cdn-icons-png.flaticon.com/512/190/190411.png" alt="Builder Icon">
                    <p>Easy Resume Builder</p>
                </div>
                <div class="feature-card">
                    <img src="https://cdn-icons-png.flaticon.com/512/633/633652.png" alt="Template Icon">
                    <p>Single Modern Template</p>
                </div>
                <div class="feature-card">
                    <img src="https://cdn-icons-png.flaticon.com/512/906/906175.png" alt="PDF Icon">
                    <p>Instant PDF Export</p>
                </div>
            </div>
        </div>

        <div class="login-card">
            <h2>Sign In</h2>
            <p class="tagline">Access your saved resumes instantly.</p>

            <form method="post" action="/login">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <label for="username">Email Address</label>
                    <input type="text" id="username" name="username" required placeholder="you@example.com">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required placeholder="********">
                </div>

                <button type="submit">Sign In</button>
            </form>

            <p class="signup-link">
                Don't have an account? <a href="/register">Create one</a>
            </p>
        </div>
    </div>
</body>
</html>
