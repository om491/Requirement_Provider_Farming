<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Crop Requests</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#eef7ee;
}

.table-box{
    margin-top:40px;
    background:white;
    padding:20px;
    border-radius:10px;
}

</style>
</head>

<body>

<div class="container">
<h2 class="text-center mt-4">📩 Crop Requests from Admin</h2>

<div class="table-box">

<table class="table table-bordered table-hover">
<tr class="table-success">
<th>ID</th>
<th>Crop</th>
<th>Quantity</th>
<th>Location</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from crop_requests");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("crop")%></td>
<td><%=rs.getInt("qty")%></td>
<td><%=rs.getString("location")%></td>
<td><%=rs.getString("status")%></td>

<td>
<a href="AcceptServlet?id=<%=rs.getInt("id")%>" class="btn btn-success btn-sm">Accept</a>
<a href="RejectServlet?id=<%=rs.getInt("id")%>" class="btn btn-danger btn-sm">Reject</a>
</td>
</tr>

<%
}
%>

</table>

</div>
</div>

</body>
</html>