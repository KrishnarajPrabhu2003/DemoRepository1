<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<script>
// Simple toggle function for submenu
function toggleMenu(id) {
    var element = document.getElementById(id);
    if (element.style.display === "none") {
        element.style.display = "block";
    } else {
        element.style.display = "none";
    }
}
</script>

</head>
<body>

<h1>Quiz App - Admin Dashboard</h1>

<h3>Welcome, 
<%= session.getAttribute("adminName") != null 
? session.getAttribute("adminName") 
: "Admin" %>
</h3>

<hr>

<!-- QUIZ MANAGER -->
<h2 onclick="toggleMenu('quizMenu')" style="cursor:pointer;">
    Quiz Manager ▼
</h2>

<div id="quizMenu" style="display:none;">
    <form action="createQuiz.jsp" method="get">
        <input type="submit" value="Create New Quiz">
    </form>

    <form action="quizList.jsp" method="get">
        <input type="submit" value="Quiz List">
    </form>
</div>

<br>

<!-- QUESTION MANAGER -->
<h2 onclick="toggleMenu('questionMenu')" style="cursor:pointer;">
    Question Manager ▼
</h2>

<div id="questionMenu" style="display:none;">
    <form action="addQuestion.jsp" method="get">
        <input type="submit" value="Add New Question">
    </form>

    <form action="questionList.jsp" method="get">
        <input type="submit" value="Question List">
    </form>
</div>

</body>
</html>
