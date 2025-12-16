<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Leaderboard</title>
</head>
<body>

<h2>Leaderboard</h2>

<table border="1" cellpadding="8">
<tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Score</th>
</tr>

<%
int rank = 1;
List<Map<String, String>> list =
    (List<Map<String, String>>) request.getAttribute("leaderboard");

for (Map<String, String> row : list) {
%>
<tr>
    <td><%= rank++ %></td>
    <td><%= row.get("name") %></td>
    <td><%= row.get("score") %></td>
</tr>
<% } %>

</table>

</body>
</html>
