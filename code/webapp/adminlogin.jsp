<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #e8eef7; /* Light bluish-gray */
    }

    h2 {
        text-align: center;
        margin-top: 40px;
        color: #1f3c88; /* Deep blue */
    }

    /* Centered login box */
    form {
        width: 350px;
        margin: 30px auto;
        background: white;
        padding: 25px;
        border-radius: 6px;
        box-shadow: 0px 0px 10px rgba(31, 60, 136, 0.3); /* Blue shadow */
        border-top: 4px solid #1f3c88; /* Blue accent */
    }

    form div {
        margin-bottom: 15px;
        font-size: 16px;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #a7b4d3; /* Soft blue border */
        border-radius: 4px;
        font-size: 15px;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #1f3c88;
        outline: none;
        box-shadow: 0 0 5px rgba(31, 60, 136, 0.4);
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background: #1f3c88; /* Deep blue */
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background: #2a4fa3; /* Slightly lighter blue */
    }

    p {
        text-align: center;
        color: #d9534f; /* Soft red for error messages */
        font-weight: bold;
    }
</style>


</head>
<body>
 
<h2>Admin Login</h2>
 
<%
    String m = (String) request.getAttribute("msg");
    if (m != null) {
%>
    <p><%= m %></p>
<%
    }
%>
 
<form action="AdminLoginController" method="post">
    <div>Username:
        <input type="text" name="a1">
    </div>

    <div>Password:
        <input type="password" name="a2">
    </div>

    <div>
        <input type="submit" value="Login">
    </div>
</form>
 
</body>
</html>