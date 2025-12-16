<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dto.QuestionDTO" %>

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
</head>
<body>

<h2>Question List</h2>
<a href="admindashboard.jsp">Back to Dashboard</a> |
<a href="AddQuestion.jsp">Add New Question</a><br><br>

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
            <a href="EditQuestionController?id=<%= q.getQuestionId() %>">
                <img src="edit-icon.png" alt="Edit" width="16" height="16"/>
            </a>
            &nbsp;
            <a href="DeleteQuestionController?id=<%= q.getQuestionId() %>"
               onclick="return confirm('Are you sure you want to delete this question?');">
                <img src="delete-icon.png" alt="Delete" width="16" height="16"/>
            </a>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
