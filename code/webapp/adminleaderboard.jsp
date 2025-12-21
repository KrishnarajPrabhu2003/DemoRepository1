<%@ page language="java" import="java.util.*, com.dto.LeaderboardDTO" %>

<%
    if (session.getAttribute("adminName") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    List<LeaderboardDTO> list =
        (List<LeaderboardDTO>) request.getAttribute("leaderboard");

    if (list == null) {
        list = new ArrayList<>();  
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Leaderboard</title>
</head>
<body>

<h2>Admin Leaderboard</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>Rank</th>
        <th>User Name</th>
        <th>Quiz Title</th>
        <th>Category</th>
        <th>Marks</th>
    </tr>

<%
    int rank = 1;
    if (list.isEmpty()) {
%>
    <tr>
        <td colspan="5">No attempts yet</td>
    </tr>
<%
    } else {
        for (LeaderboardDTO l : list) {
%>
    <tr>
        <td><%= rank++ %></td>
        <td><%= l.getFullName() %></td>
        <td><%= l.getQuizTitle() %></td>
        <td><%= l.getCategory() %></td>
        <td><%= l.getScore() %></td>
    </tr>
<%
        }
    }
%>

</table>

<br>
<a href="AdminDashboardController">Back to Dashboard</a>

</body>
</html>
