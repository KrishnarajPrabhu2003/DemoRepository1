<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dto.QuestionDTO" %>
 <jsp:include page="adminmenu.jsp"/>
 
<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
 
    List<QuestionDTO> list = (List<QuestionDTO>) request.getAttribute("questionList");
    if (list == null) list = new ArrayList<>();
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question List</title>
<style>
   table {
    width: 90%;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    border-radius: 6px;
    overflow: hidden;
}

th {
    background: #1f3c88;
    color: white;
    padding: 12px;
    text-align: center;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
    background: #f9f9f9;
}

tr:hover {
    background: #eef2fa;
}

a {
    color: #1f3c88;
    font-weight: bold;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

.content{
	margin-left: 300px;
	margin-top:70px;
	padding: 20px;

}
</style>
</head>
<body>

<div class="content">
<h2>Question List</h2>
<a href="addquestion.jsp">Add New Question</a><br><br>
 
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Sr. No</th>
        <th>Question</th>
        <th>Option A</th>
        <th>Option B</th>
        <th>Option C</th>
        <th>Option D</th>
        <th>Correct Answer</th>
        <th>Action</th>
    </tr>
 
    <%
        int srNo = 1;
        for (QuestionDTO q : list) {
    %>
    <tr>
        <td><%= srNo++ %></td>
        <td><%= q.getQuestionText() %></td>
        <td><%= q.getOptionA() %></td>
        <td><%= q.getOptionB() %></td>
        <td><%= q.getOptionC() %></td>
        <td><%= q.getOptionD() %></td>
        <td><%= q.getCorrectOption() %></td>
        <td>
            <a href="UpdateQuestionController?id=<%= q.getQuestionid() %>">
                <img src="https://cdn-icons-png.flaticon.com/512/84/84380.png" alt="Edit" width="16" height="16"/>
            </a>
            &nbsp;
            <a href="DeleteQuestionController?id=<%= q.getQuestionid() %>"
               onclick="return confirm('Are you sure you want to delete this question?');">
                <img src="https://tse1.mm.bing.net/th/id/OIP.4jQGwm3yrNFkDHVKFvvkZQHaHa?cb=ucfimg2&ucfimg=1&w=512&h=512&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Delete" width="16" height="16"/>
            </a>
        </td>
    </tr>
    <% } %>
</table>
 </div>
</body>
</html>

 