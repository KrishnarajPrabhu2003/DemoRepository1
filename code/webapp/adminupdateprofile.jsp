<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Integer adminId = (Integer) session.getAttribute("adminId");
    String adminName = (String) session.getAttribute("adminName");

    if (adminId == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #eef2fa;
    }

    /* TOP BAR */
    .topbar {
        background: #1f3c88;
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
        background: #2a4fa3;
        color: white;
        position: fixed;
        top: 50px;
        bottom: 0;
        left: 0;
        padding: 20px;
    }

    .sidebar h2 {
        font-size: 20px;
        margin-bottom: 20px;
        border-bottom: 2px solid #fff;
        padding-bottom: 10px;
    }

    .sidebar a {
        display: block;
        padding: 10px;
        text-decoration: none;
        color: #eef2fa;
        font-size: 16px;
    }

    .sidebar a:hover {
        background: #1f3c88;
        border-radius: 4px;
    }

    /* MAIN CONTENT */
    .content {
        margin-left: 240px;
        margin-top: 80px;
        padding: 40px;
    }

    .card {
        background: white;
        padding: 30px;
        width: 400px;
        border-radius: 6px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.15);
    }

    .card h2 {
        margin-top: 0;
        color: #1f3c88;
    }

    label {
        font-weight: bold;
        display: block;
        margin-top: 15px;
    }

    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    input[type=submit] {
        margin-top: 20px;
        background: #1f3c88;
        color: white;
        padding: 10px;
        width: 100%;
        border: none;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background: #16306b;
    }
</style>
</head>

<body>

<!-- TOP BAR -->
<div class="topbar">
    <h1>Admin Dashboard</h1>

    <div class="user-menu" onclick="toggleUserMenu()">
        Welcome, <%= adminName %>
        <div class="user-dropdown" id="userDropdown">
            <a href="adminupdateprofile.jsp">Update Profile</a>
            <a href="LogoutController">Logout</a>
        </div>
    </div>
</div>

<!-- SIDEBAR -->
<div class="sidebar">
    <h2>Dashboard Menu</h2>
    <a href="AdminDashboardController">Dashboard</a>
    <a href="QuizListController">Quiz List</a>
    <a href="QuestionListController">Question List</a>
    <a href="AdminLeaderboardController">Leaderboard</a>
</div>

<!-- MAIN CONTENT -->
<div class="content">
    <div class="card">
        <h2>Update Profile</h2>

        <form action="AdminUpdateProfileController" method="post">

            <label>Full Name</label>
            <input type="text" name="fullname"
                   value="<%= adminName %>" required>

            <label>New Password</label>
            <input type="password" name="password" required>

            <input type="submit" value="Update Profile">

        </form>
    </div>
</div>

<script>
function toggleUserMenu() {
    let menu = document.getElementById("userDropdown");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
}
</script>

</body>
</html>
