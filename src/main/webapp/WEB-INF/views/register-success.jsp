<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Successful - ResumeCraft</title>

<!-- Favicon -->
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo.png">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo.ico">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .success-container {
        background: rgba(255, 255, 255, 0.93);
        text-align: center;
        padding: 50px 60px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
        max-width: 480px;
    }

    h2 {
        color: #2c2c54;
        font-size: 32px;
        margin-bottom: 10px;
    }

    p {
        color: #444;
        font-size: 16px;
        margin-bottom: 25px;
    }

    a {
        display: inline-block;
        text-decoration: none;
        background: linear-gradient(90deg, #2575fc, #6a11cb);
        color: #fff;
        font-weight: 600;
        padding: 12px 25px;
        border-radius: 10px;
        transition: all 0.3s ease;
    }

    a:hover {
        transform: scale(1.05);
        background: linear-gradient(90deg, #6a11cb, #2575fc);
    }

    @media (max-width: 480px) {
        .success-container {
            padding: 35px 25px;
        }
    }
</style>
</head>

<body>
    <div class="success-container">
        <h2>🎉 Registration Successful!</h2>
        <p>Your account has been created successfully.</p>
        <a href="/login">Go to Login</a>
    </div>
</body>
</html>
