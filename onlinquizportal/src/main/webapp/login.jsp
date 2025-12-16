<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
</head>
<body>

<h2>User Login</h2>

<p style="color:red;">
    <%= request.getAttribute("msg") == null ? "" : request.getAttribute("msg") %>
</p>

<form action="UserLoginController" method="post">
    Username: <input type="text" name="username" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>

</body>
</html>
