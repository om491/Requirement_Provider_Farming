<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Inventory</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right,#dcedc8,#a5d6a7);
}

.inventory-box{
    margin-top:40px;
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    color:#2e7d32;
}

</style>
</head>

<body>

<div class="container">

<h2 class="mt-4">Available Stock</h2>

<div class="inventory-box">

<table class="table table-bordered table-hover">
<tr class="table-success">
<th>ID</th>
<th>Product</th>
<th>Category</th>
<th>Quantity</th>
<th>Price</th>
<th>Description</th>
<th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM stock");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("product")%></td>
<td><%=rs.getString("category")%></td>
<td>₹ <%=rs.getInt("quantity")%></td>
<td><%=rs.getInt("price")%></td>
<td><%=rs.getString("description")%></td>

<td>
<a href="DeleteProductServlet?id=<%=rs.getInt("id")%>" class="btn btn-danger btn-sm">Delete</a>
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