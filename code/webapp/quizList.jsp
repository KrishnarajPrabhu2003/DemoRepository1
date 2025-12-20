<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dto.QuizDTO" %>
 <%@ page import="com.dto.QuestionDTO" %>
<jsp:include page="adminmenu.jsp"/>
 
 
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
    if (quizzes != null && !quizzes.isEmpty()) {
        for (QuizDTO q : quizzes) {
%>
            <tr>
                <td><%= sr++ %></td>
                <td><%= q.getTitle() %></td>
                <td><%= q.getCategory() %></td>
                <td><a href="AddQuestionsToQuizController?quizid=<%= q.getQuizid() %>">Add Questions</a></td>
                <td><a href="QuizQuestionsController?quizid=<%= q.getQuizid() %>">List</a></td>
            </tr>
<%
        }
    } else {
%>
        <tr><td colspan="5">No quizzes found</td></tr>
<%
    }
%>

</table>
 
<br><br>
 
<% if (selectedQuiz != null) { %>
 
<h3>Quiz Title: <%= selectedQuiz.getTitle() %></h3>
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
 </div>
</body>
</html>