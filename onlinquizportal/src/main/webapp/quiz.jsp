<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz - Home</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #f4f4f4;
    }

    /* Navbar */
    .navbar {
        background: #333;
        padding: 15px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .navbar .title {
        font-size: 24px;
        font-weight: bold;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        margin: 0 15px;
        font-size: 18px;
    }

    .navbar a:hover {
        text-decoration: underline;
    }

    .right-buttons {
        display: flex;
        align-items: center;
    }

    .btn {
        padding: 8px 15px;
        margin-left: 15px;
        background: white;
        color: #333;
        border-radius: 4px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        border: none;
        text-decoration: none;
    }

    .btn:hover {
        background: #ddd;
    }

    /* Page content */
    .content {
        padding: 40px;
        text-align: center;
    }

    h1 {
        font-size: 40px;
        margin-bottom: 20px;
    }

    p {
        font-size: 20px;
    }
</style>

</head>
<body>

    <!-- TOP NAV BAR -->
    <div class="navbar">
        <div class="title">Online Quiz</div>
        <div>
            <a href="quiz.jsp">Home</a>
            <a href="userquizlist">Quiz</a>
        </div>

        <div class="right-buttons">
            <a href="login.jsp" class="btn">Login</a>
            <a href="signup.jsp" class="btn">Signup</a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="content">
        <h1>Welcome to Online Quiz Platform</h1>
        <p>Test your knowledge. Improve your skills. Enjoy learning!</p>
    </div>

</body>
</html>
