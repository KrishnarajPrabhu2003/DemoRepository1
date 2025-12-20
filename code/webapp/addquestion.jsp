<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <jsp:include page="adminmenu.jsp"/>
 
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
<style>
 .form-container {
        max-width: 500px;
        margin: 100px auto;
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
        width: 100%;
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
        width: 100%;
    }

    input[type="submit"]:hover {
        background: #16306b;
    }
</style>
</head>
<body>
 

<div class="form-container">
<h2>Add New Question</h2>

<form action="AddQuestionController" method="post">
    <label>Question:</label><br>
    <input type="text" name="questionText" required><br><br>
 
    <label>Option A:</label><br>
    <input type="text" name="optionA" required><br><br>
 
    <label>Option B:</label><br>
    <input type="text" name="optionB" required><br><br>
 
    <label>Option C:</label><br>
    <input type="text" name="optionC" required><br><br>
 
    <label>Option D:</label><br>
    <input type="text" name="optionD" required><br><br>
 
     <label>Correct Option:</label><br>
      <select name="correctOption" required>
            <option value="">-- Select Category --</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
        </select>
 
    <input type="submit" value="Add Question">
</form>
 
</div>
</body>
</html>