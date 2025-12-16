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
<title>Create New Quiz</title>
</head>
<body>

<h1>Quiz App - Admin Dashboard</h1>

<h3>Welcome, <%= adminName %></h3>
<a href="LogoutController">Logout</a>

<hr>

<!-- DASHBOARD MENU -->
<h2>Dashboard Menu</h2>

<div>
    <button onclick="toggleQuizMenu()">Quiz Manager ▼</button>
    <div id="quizMenu" style="display:none; margin-left:20px;">
        <a href="createnewquiz.jsp">Create New Quiz</a><br>
        <a href="QuizListController">Quiz List</a>
    </div>
</div>

<br>

<div>
    <button onclick="toggleQuestionMenu()">Question Manager ▼</button>
    <div id="questionMenu" style="display:none; margin-left:20px;">
        <a href="addquestion.jsp">Add New Question</a><br>
        <a href="QuestionListController">Question List</a>
    </div>
</div>

<script>
function toggleQuizMenu() {
    let x = document.getElementById("quizMenu");
    x.style.display = x.style.display === "none" ? "block" : "none";
}

function toggleQuestionMenu() {
    let x = document.getElementById("questionMenu");
    x.style.display = x.style.display === "none" ? "block" : "none";
}
</script>

<hr>

<h2>Create New Quiz</h2>

<form action="CreateQuizController" method="post">

    <label>Quiz Title:</label><br>
    <input type="text" name="title" required><br><br>

    <div>
      <label> Category:</label> 
        <select name="category" required>
            <option value="">-- Select Category --</option>
            <option value="General Knowledge">General Knowledge</option>
            <option value="Science">Science</option>
            <option value="Computers">Computers</option>
            <option value="Sports">Sports</option>
        </select>
    </div>

    <input type="submit" value="Create Quiz">
</form>

</body>
</html>
