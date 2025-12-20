<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="adminmenu.jsp"/>
 
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
</head>
<body>



<!-- MAIN CONTENT AREA -->
<div class="content">
    <h2>Welcome to the Admin Panel</h2>
    <div>
    	<h3>Total Quiz: <%=totalQuiz %>  </h3>
      	<h3>Total Questions: <%=totalQuestions %>  </h3>
      	<h3>Total Users: <%=totalUsers %>  </h3>
    </div>
 
    <p>Select an option from the left menu.</p>
    
    
</div>

</body>

</html>
 