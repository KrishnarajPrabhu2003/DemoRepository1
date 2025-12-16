<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.QuestionDTO" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    QuestionDTO q = (QuestionDTO) request.getAttribute("question");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Question</title>
</head>
<body>

<h2>Edit Question</h2>

<form action="UpdateQuestionController" method="post">
    <input type="hidden" name="questionid" value="<%=q.getQuestionId()%>">

    <label>Question:</label><br>
    <textarea name="questionText" required><%=q.getQuestionText()%></textarea><br><br>

    <label>Option A:</label><br>
    <input type="text" name="optionA" value="<%=q.getOptionA()%>" required><br><br>

    <label>Option B:</label><br>
    <input type="text" name="optionB" value="<%=q.getOptionB()%>" required><br><br>

    <label>Option C:</label><br>
    <input type="text" name="optionC" value="<%=q.getOptionC()%>" required><br><br>

    <label>Option D:</label><br>
    <input type="text" name="optionD" value="<%=q.getOptionD()%>" required><br><br>

    <label>Correct Option (a/b/c/d):</label><br>
    <input type="text" name="correctOption" maxlength="1" value="<%=q.getCorrectOption()%>" required><br><br>

    <input type="submit" value="Update Question">
</form>

<a href="QuestionListController">Back to Question List</a>

</body>
</html>
