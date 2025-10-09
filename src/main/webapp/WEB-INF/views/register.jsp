<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - ResumeCraft</title>

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
        color: #333;
    }

    .register-container {
        background: rgba(255, 255, 255, 0.93);
        width: 90%;
        max-width: 420px;
        padding: 40px 45px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
        text-align: center;
    }

    h2 {
        font-size: 30px;
        color: #2c2c54;
        margin-bottom: 10px;
    }

    p.subtitle {
        color: #555;
        margin-bottom: 25px;
        font-size: 14px;
    }

    label {
        display: block;
        text-align: left;
        font-weight: 600;
        margin-bottom: 6px;
        color: #333;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px 14px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        font-size: 15px;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    input:focus {
        border-color: #6a11cb;
        box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.2);
        outline: none;
    }

    button {
        width: 100%;
        background: linear-gradient(90deg, #2575fc, #6a11cb);
        color: #fff;
        border: none;
        font-size: 16px;
        font-weight: 600;
        border-radius: 10px;
        padding: 12px 0;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    button:hover {
        transform: scale(1.05);
        background: linear-gradient(90deg, #6a11cb, #2575fc);
    }

    .login-link {
        margin-top: 20px;
        font-size: 14px;
    }

    .login-link a {
        color: #6a11cb;
        text-decoration: none;
        font-weight: 600;
    }

    .login-link a:hover {
        text-decoration: underline;
    }

    @media (max-width: 480px) {
        .register-container {
            padding: 30px 25px;
        }
    }
</style>
</head>

<body>
    <div class="register-container">
        <h2>Create Account</h2>
        <p class="subtitle">Join ResumeCraft and start building your perfect resume</p>

        <form action="/register" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div>
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required placeholder="Enter your name">
            </div>

            <div>
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
            </div>

            <div>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter a strong password">
            </div>

            <button type="submit">Register</button>

            <div class="login-link">
                Already have an account? <a href="/login">Login here</a>
            </div>
        </form>
    </div>
</body>
</html>
