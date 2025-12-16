<%@ page language="java" import="com.dto.UserDTO" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("userdata");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>
</head>
<body>

<div class="navbar">
    <div class="title">Online Quiz</div>

    <div>
        <!-- FIXED LINK -->
        <a href="UserQuizListController">Quiz</a>
    </div>

    <div class="right-buttons">
        <a href="UserLogoutController">Logout</a>
    </div>
     <div class="right-buttons">
        <a href="LeaderboardController">Leaderboard</a>
    </div>
</div>

<h2>Welcome, <%= user.getFullName() %></h2>

</body>
</html>
