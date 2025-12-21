<%@ page language="java" import="java.util.*, com.dto.*, com.dao.*" %>
 <jsp:include page="userhome.jsp"/>

<%
    UserDTO u = (UserDTO) session.getAttribute("userdata");
    if (u == null) {
        response.sendRedirect("userlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>User Quiz List</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #f4f4f4;
    }

    .content {
        padding: 20px 40px;
        text-align: left;
    }

    h2 {
        margin-top: 20px;
        color: #333;
    }

    /* Table */
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0px 0px 8px #aaa;
    }

    th {
        background: #333;
        color: white;
        padding: 12px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    tr:hover {
        background: #f1f1f1;
    }

    a.button, table a {
        background: #333;
        color: white;
        padding: 8px 12px;
        text-decoration: none;
        border-radius: 4px;
    }

    a.button:hover, table a:hover {
        background: #555;
    }

</style>

</head>
<body>



<h2 style="text-align:center;">Quiz List</h2>

<table>
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
                <a href="StartQuizController?quizid=<%= q.getQuizId() %>" class="button">Start Quiz</a>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="4" style="text-align:center;">No quizzes available</td>
        </tr>
    <%
        }
    %>
</table>


</body>
</html>