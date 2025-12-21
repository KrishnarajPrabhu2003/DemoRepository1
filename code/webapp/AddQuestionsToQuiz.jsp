<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.dto.QuestionDTO" %>
<%@ page import="com.dto.QuizDTO" %>
 <jsp:include page="adminmenu.jsp"/>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
 
    QuizDTO quiz = (QuizDTO) request.getAttribute("quiz");
    List<QuestionDTO> questionList = (List<QuestionDTO>) request.getAttribute("questionList");
    if (questionList == null) questionList = new ArrayList<>();
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Questions to Quiz</title>
<style>
   table {
    width: 60%;
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
 input[type="submit"] {
        background: #1f3c88;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background: #16306b;
    }
</style>
</head>
<body>
<div class="content">
<h2>Add Questions to Quiz: <%= quiz.getQuizTitle() %></h2>
 
<form action="AddQuestionsToQuizController" method="post">
    <input type="hidden" name="quizid" value="<%= quiz.getQuizId() %>"/>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Select</th>
            <th>Sr No</th>
            <th>Question</th>
        </tr>
        <%
            int srNo = 1;
            for (QuestionDTO q : questionList) {
        %>
        <tr>
            <td>
                <input type="checkbox" name="questionIds" value="<%= q.getQuestionId() %>"/>
            </td>
            <td><%= srNo++ %></td>
            <td><%= q.getQuestionText() %></td>
        </tr>
        <% } %>
    </table>
    <br>
    <input type="submit" value="Add Selected Questions"/>
</form>
 </div>
</body>
</html>