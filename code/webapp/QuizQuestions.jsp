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
    List<QuestionDTO> questions = (List<QuestionDTO>) request.getAttribute("questions");
    if (questions == null) questions = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Questions for Quiz</title>
</head>
<body>

<h2>Quiz: <%= quiz.getQuizTitle() %> | Category: <%= quiz.getCategory() %></h2>
<a href="QuizListController">Back to Quiz List</a><br><br>

<% if (questions.size() == 0) { %>
    <p>No questions added to this quiz yet.</p>
<% } else { %>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Sr. No</th>
        <th>Question</th>
        <th>Option A</th>
        <th>Option B</th>
        <th>Option C</th>
        <th>Option D</th>
        <th>Correct Answer</th>
    </tr>
<%
    int srNo = 1;
    for (QuestionDTO q : questions) {
%>
    <tr>
        <td><%= srNo++ %></td>
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
