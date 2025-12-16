<%@ page language="java" %>

<%
    String quizid = request.getParameter("quizid");
%>

<!DOCTYPE html>
<html>
<head>
<title>Start Quiz</title>
</head>
<body>

<h2>Quiz Started (Quiz ID: <%= quizid %>)</h2>

<p>This page will show quiz questions.</p>

</body>
</html>
