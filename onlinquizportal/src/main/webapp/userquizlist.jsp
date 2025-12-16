<%@ page language="java" import="java.util.*, com.dto.*, com.dao.*" %>

<%
    UserDTO u = (UserDTO) session.getAttribute("userdata");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>User Quiz List</title>
</head>
<body>

<h2>Quiz List</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>Sl.No</th>
        <th>Quiz Title</th>
        <th>Category</th>
        <th>Action</th>
    </tr>

    <%
        List<QuizDTO> quizzes = (List<QuizDTO>) request.getAttribute("quizList");
        int i = 1;

        if (quizzes != null && quizzes.size() > 0) {
            for (QuizDTO q : quizzes) {
    %>
        <tr>
            <td><%= i++ %></td>
            <td><%= q.getQuizTitle() %></td>
            <td><%= q.getCategory() %></td>
            <td>
<a href="StartQuizController?quizid=<%= q.getQuizId() %>">Start Quiz</a>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="4">No quizzes available</td>
        </tr>
    <%
        }
    %>

</table>

<br>
<a href="UserLogoutController">Logout</a>

</body>
</html>
