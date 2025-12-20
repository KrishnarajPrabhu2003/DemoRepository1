<%@ page language="java" import="com.dto.UserDTO" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("userdata");
    if (user == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>
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

    .content h2{
        padding-left: 20px;
        text-align: left;
    }
</style>
</head>
<body>

    <div class="navbar">
	<div class="title">Online Quiz</div>
	<div class="right-button">
		  <a href="UserQuizListController">Quiz</a>
        <a href="UserLogoutController">Logout</a>
	</div>
	</div>
	<div class="content">
		<h2>Welcome, <%= user.getFullname() %></h2>
	</div>


</body>
</html>