<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Question</title>
</head>
<body>

<h2>Add New Question</h2>

<form action="AddQuestionController" method="post">
    <label>Question:</label><br>
    <textarea name="questionText" required></textarea><br><br>

    <label>Option A:</label><br>
    <input type="text" name="optionA" required><br><br>

    <label>Option B:</label><br>
    <input type="text" name="optionB" required><br><br>

    <label>Option C:</label><br>
    <input type="text" name="optionC" required><br><br>

    <label>Option D:</label><br>
    <input type="text" name="optionD" required><br><br>

    <label>Correct Option (a/b/c/d):</label><br>
    <input type="text" name="correctOption" maxlength="1" required><br><br>

    <input type="submit" value="Add Question">
</form>

<a href="admindashboard.jsp">Back to Dashboard</a>

</body>
</html>
