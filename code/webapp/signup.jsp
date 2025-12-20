<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Signup</title>
 
<style>
   body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #f4f4f4;
    }
    .box {
        width: 350px; margin: 70px auto; background: white;
        padding: 30px; border-radius: 5px; box-shadow: 0px 0px 8px #aaa;
    }
    h2 { text-align: center; }
    input {
        width: 100%; padding: 10px; margin-top: 10px;
        border: 1px solid #ccc; border-radius: 4px;
    }
    button {
        width: 100%; padding: 12px; margin-top: 20px;
        background: #333; color: white; border: none;
        border-radius: 4px; cursor: pointer;
    }
    button:hover { background: #555; }
    .msg { color: red; text-align: center; }
    
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
 
</style>
 
</head>
<body>
 <div class="navbar">
	<div class="title">Online Quiz</div>
	<div class="right-button">
		<a href="home.jsp">Home</a>	
		<a href="userlogin.jsp" >Login</a>	
	</div>
	</div>
 
<div class="box">
    <h2>User Signup</h2>
 
    <form method="post" action="UserRegisterController">
        <input type="text" name="fullname" placeholder="Full Name" required>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
 
        <button type="submit">Register</button>
 
        <p class="msg"><%
		String m = (String) request.getAttribute("msg");
		if (m != null) {
		%>
		    <p><%= m %></p>
		<%
		    }
		%>
</p>
    </form>
</div>
 
</body>