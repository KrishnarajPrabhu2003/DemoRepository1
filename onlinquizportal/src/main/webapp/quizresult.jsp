<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Quiz Result</title>
</head>
<body>

<h2>Quiz Completed!</h2>

<p>Your Score: <b><%= request.getAttribute("score") %></b> /
<%= request.getAttribute("total") %></p>

<a href="LeaderboardController?quizid=<%= request.getAttribute("quizid") %>">
View Leaderboard
</a>

</body>
</html>
