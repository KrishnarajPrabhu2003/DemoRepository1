<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz App</title>
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
	<div class="navbar">
	<div class="title">Online Quiz</div>
	<div class="right-button">
		<a href="home.jsp">Home</a>	
		<a href="userlogin.jsp" >Login</a>	
		<a href="signup.jsp">Signup</a>
	</div>
	</div>
	<div class="content">
	<h1>Welcome to Online Quiz Platform</h1>
	</div>
</body>
</html>