<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dto.QuestionDTO, com.dto.QuizDTO" %>

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
</head>
<body>

<h2>Add Questions to Quiz: <%= quiz.getQuizTitle() %></h2>
<a href="QuizListController">Back to Quiz List</a><br><br>

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

</body>
</html>
