<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
    
    Integer totalQuiz = (Integer) request.getAttribute("totalQuiz");
    Integer totalQuestions = (Integer) request.getAttribute("totalQuestions");
    Integer totalUsers = (Integer) request.getAttribute("totalUsers");

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #eef2fa; /* Light bluish background */
    }

    /* TOP BAR */
    .topbar {
        background: #1f3c88; /* Deep admin blue */
        color: white;
        padding: 15px 25px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
    }

    .topbar h1 {
        margin: 0;
        font-size: 24px;
    }

    .user-menu {
        position: relative;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
    }

    .user-dropdown {
        display: none;
        position: absolute;
        right: 0;
        top: 30px;
        background: white;
        border-radius: 4px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        min-width: 150px;
    }

    .user-dropdown a {
        display: block;
        padding: 10px;
        text-decoration: none;
        color: #1f3c88;
        font-weight: bold;
    }

    .user-dropdown a:hover {
        background: #e6ecfa;
    }

    /* SIDEBAR */
    .sidebar {
        width: 220px;
        background: #2a4fa3; /* Slightly lighter blue */
        color: white;
        position: fixed;
        top: 50px;
        bottom: 0;
        left: 0;
        padding: 20px;
        overflow-y: auto;
    }

    .sidebar h2 {
        font-size: 20px;
        margin-bottom: 20px;
        border-bottom: 2px solid #fff;
        padding-bottom: 10px;
    }

    .sidebar button {
        width: 100%;
        background: #1f3c88;
        color: white;
        padding: 10px;
        border: none;
        text-align: left;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
        border-radius: 4px;
    }

    .sidebar button:hover {
        background: #16306b;
    }

    .sidebar a {
        display: block;
        padding: 8px 12px;
        margin-left: 10px;
        text-decoration: none;
        color: #eef2fa;
        font-size: 15px;
    }

    .sidebar a:hover {
        background: #1f3c88;
        border-radius: 4px;
    }

    /* MAIN CONTENT */
    .content {
        margin-left: 240px;
        margin-top: 50px;
        padding: 40px;
    }

    .content h2 {
        color: #1f3c88;
        font-size: 26px;
    }

    .content p {
        font-size: 18px;
        color: #333;
    }
</style>

</head>
<body>

<!-- TOP BAR -->
<div class="topbar">
    <h1>Admin Dashboard</h1>

    <div class="user-menu" onclick="toggleUserMenu()">
        <span>Welcome, <%= adminName %> </span>
        
        <div class="user-dropdown" id="userDropdown">
            <a href="LogoutController">Logout</a>
        </div>
    </div>
</div>

<!-- LEFT SIDEBAR -->
<div class="sidebar">
    <h2>Dashboard Menu</h2>

    <button onclick="toggleQuizMenu()">Quiz Manager</button>
    <div id="quizMenu" style="display:none;">
        <a href="createnewquiz.jsp">Create New Quiz</a>
        <a href="QuizListController">Quiz List</a>
    </div>

    <button onclick="toggleQuestionMenu()">Question Manager</button>
    <div id="questionMenu" style="display:none;">
        <a href="addquestion.jsp">Add New Question</a>
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

function toggleUserMenu() {
    let menu = document.getElementById("userDropdown");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}

function toggleLeaderboardMenu() {
    let menu = document.getElementById("userDropdown");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}

</script>

</body>

</html>
 