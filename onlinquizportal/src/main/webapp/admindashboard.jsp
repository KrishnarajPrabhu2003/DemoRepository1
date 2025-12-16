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
<title>Admin Dashboard</title>
</head>
<body>

<h1>Quiz App - Admin Dashboard</h1>

<h3>Welcome, <%= adminName %></h3>
<a href="LogoutController">Logout</a>

<hr>

<!-- DASHBOARD MENU -->
<h2>Dashboard Menu</h2>

<!-- QUIZ MANAGER -->
<div>
    <button onclick="toggleQuizMenu()">Quiz Manager ▼</button>
    <div id="quizMenu" style="display:none; margin-left:20px;">
        <a href="createnewquiz.jsp">Create New Quiz</a><br>
        <a href="QuizListController">Quiz List</a>
    </div>
</div>

<br>

<!-- QUESTION MANAGER -->
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

</body>
</html>
