<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.QuestionDTO" %>
 <jsp:include page="adminmenu.jsp"/>

 
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
<title>Update Question</title>
<style>
   
    .form-container {
        max-width: 500px;
        margin: 90px auto;
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 8px;
        color: #1f3c88;
    }

    input[type="text"], select {
        width: 60%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 20px;
        font-size: 16px;
    }

    input[type="text"]:focus, select:focus {
        border-color: #1f3c88;
        outline: none;
        box-shadow: 0 0 5px rgba(31,60,136,0.3);
    }

    input[type="submit"] {
        background: #1f3c88;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background: #16306b;
    }
</style>
</head>
<body>
<div class="content">
<h2>Update Question</h2>
 
<form action="UpdateQuestionController" method="post">
    <input type="hidden" name="questionid" value="<%=q.getQuestionId()%>">
 
    <label>Question:</label><br>
    <textarea name="questionText" required><%=q.getQuestionText()%></textarea>
 
    <label>Option A:</label><br>
    <input type="text" name="optionA" value="<%=q.getOptionA()%>" required>
 
    <label>Option B:</label><br>
    <input type="text" name="optionB" value="<%=q.getOptionB()%>" required>
 
    <label>Option C:</label><br>
    <input type="text" name="optionC" value="<%=q.getOptionC()%>" required>
 
    <label>Option D:</label><br>
    <input type="text" name="optionD" value="<%=q.getOptionD()%>" required>
 
    <label>Correct Option (a/b/c/d):</label><br>
    <input type="text" name="correctOption" maxlength="1" value="<%=q.getCorrectOption()%>" required><br><br>
 
    <input type="submit" value="Update Question">
</form>
</div>
 
</body>
</html>