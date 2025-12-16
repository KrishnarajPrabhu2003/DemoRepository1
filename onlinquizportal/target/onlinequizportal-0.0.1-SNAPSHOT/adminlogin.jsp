<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
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
    <div>Username: <input type="text" name="a1"></div>
    <div>Password: <input type="password" name="a2"></div>
    <div><input type="submit" value="Login"></div>
</form>

</body>
</html>
