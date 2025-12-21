<%@ page import="com.dto.AdminDTO" %>

<%
    AdminDTO admin = (AdminDTO) session.getAttribute("admindata");
    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Profile</title>
</head>
<body>

<h2>Update Profile</h2>

<form action="AdminProfileController" method="post">

<input type="hidden" name="adminid" value="<%= admin.getAdminId() %>"/>

<label>Username:</label><br>
<input type="text" value="<%= admin.getUsername() %>" readonly><br><br>

<label>Full Name:</label><br>
<input type="text" name="fullname" value="<%= admin.getFullname() %>" required><br><br>

<label>New Password:</label><br>
<input type="password" name="password" placeholder="Leave empty to keep same"><br><br>

<input type="submit" value="Update Profile">

</form>

<br>
<a href="AdminDashboardController">Back to Dashboard</a>

</body>
</html>
