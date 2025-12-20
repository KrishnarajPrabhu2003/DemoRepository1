<%@ page import="java.util.*" %>
 <jsp:include page="userhome.jsp"/>

<!DOCTYPE html>
<html>
<head>
<title>Leaderboard</title>
<style>

    h2 {
        text-align: center;
        font-size: 32px;
        margin-bottom: 30px;
        color: #333;
    }

    table {
        width: 90%;
        margin: 0 auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
        border-radius: 6px;
        overflow: hidden;
    }

    th {
        background: #333;   /* header color */
        color: #fff;
        padding: 12px;
        text-align: center;
        font-size: 16px;
    }

    td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-size: 15px;
    }

    tr:nth-child(even) {
        background: #f9f9f9;
    }

    tr:hover {
        background: #eef2fa;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        table {
            width: 100%;
        }
        th, td {
            font-size: 14px;
            padding: 10px;
        }
    }
</style>
</head>

<body>

<h2>Leaderboard</h2>

<table border="1" cellpadding="8">
<tr>
    <th>Rank</th>
    <th>Name</th>
    <th>Category</th>
    <th>Score</th>
    <th>Total Attempts</th>
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
    <td><%= row.get("category") %></td>
    <td><%= row.get("score") %></td>
    <td><%= row.get("attempts") %></td>

</tr>
<% } %>

</table>

</body>
</html>