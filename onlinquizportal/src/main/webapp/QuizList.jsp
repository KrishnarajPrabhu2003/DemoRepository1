<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.dto.QuizDTO, com.dto.QuestionDTO" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }

    List<QuizDTO> quizzes = (List<QuizDTO>) request.getAttribute("quizList");
    QuizDTO selectedQuiz = (QuizDTO) request.getAttribute("selectedQuiz");
    List<QuestionDTO> questionList = (List<QuestionDTO>) request.getAttribute("quizQuestions");
%>

<!DOCTYPE html>
<html>
<head>
<title>Quiz List</title>
</head>

<body>

<h2>Quiz List</h2>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Sr No</th>
        <th>Quiz Title</th>
        <th>Category</th>
        <th>Action</th>
        <th>List Questions</th>
    </tr>

    <%
        int sr = 1;
        for (QuizDTO q : quizzes) {
    %>
    <tr>
        <td><%= sr++ %></td>
        <td><%= q.getQuizTitle() %></td>
        <td><%= q.getCategory() %></td>
        <td>
            <a href="AddQuestionsToQuizController?quizid=<%= q.getQuizId() %>">Add Questions</a>
        </td>
        <td>
            <a href="QuizQuestionsController?quizid=<%= q.getQuizId() %>">List</a>
        </td>
    </tr>
    <% } %>
</table>

<br><br>

<% if (selectedQuiz != null) { %>

<h3>Quiz Title: <%= selectedQuiz.getQuizTitle() %></h3>
<h4>Category: <%= selectedQuiz.getCategory() %></h4>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Sr No</th>
        <th>Question</th>
        <th>Option A</th>
        <th>Option B</th>
        <th>Option C</th>
        <th>Option D</th>
        <th>Correct Answer</th>
    </tr>

    <%
        int i = 1;
        for (QuestionDTO q : questionList) {
    %>
    <tr>
        <td><%= i++ %></td>
        <td><%= q.getQuestionText() %></td>
        <td><%= q.getOptionA() %></td>
        <td><%= q.getOptionB() %></td>
        <td><%= q.getOptionC() %></td>
        <td><%= q.getOptionD() %></td>
        <td><%= q.getCorrectOption() %></td>
    </tr>
    <% } %>
</table>

<% } %>

</body>
</html>
