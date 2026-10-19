<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Vendor Stock</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins', sans-serif;
    margin:0;
    background:linear-gradient(135deg,#36d1dc,#5b86e5);
}

/* Navbar */
.navbar{
    background:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);
}

.navbar h2{
    color:#5b86e5;
}

/* Container */
.container{
    padding:30px;
}

/* Card */
.card{
    background:white;
    border-radius:15px;
    padding:20px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
}

/* Table */
table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

th{
    background:#333;
    color:white;
    padding:12px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
}

/* Stock Colors */
.low{ color:red; font-weight:bold; }
.medium{ color:orange; font-weight:bold; }
.high{ color:green; font-weight:bold; }

/* Back Button */
.back-btn{
    padding:8px 15px;
    background:#5b86e5;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}
</style>

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <h2>📦 Vendor Stock Management</h2>
    <a href="adminDashboard.jsp">
        <button class="back-btn">⬅ Back</button>
    </a>
</div>

<div class="container">
<div class="card">

<h3>🛒 Vendors Stock List</h3>

<table>
<tr>
    <th>ID</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Vendor Name</th>
    <th>Status</th>
</tr>

<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    con = DBConnection.getConnection();

    // ✅ JOIN query
    String q = "SELECT p.*, v.name AS vendor_name FROM products p LEFT JOIN vendor v ON p.vendor_id = v.id ORDER BY p.id DESC";

    ps = con.prepareStatement(q);
    rs = ps.executeQuery();

    while(rs.next()){
        int qty = rs.getInt("quantity");

        String statusClass="";
        String statusText="";

        if(qty <= 5){
            statusClass="low";
            statusText="Low Stock";
        } else if(qty <= 20){
            statusClass="medium";
            statusText="Medium";
        } else {
            statusClass="high";
            statusText="In Stock";
        }
%>

<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("name")%></td>
    <td>₹<%=rs.getDouble("price")%></td>
    <td><%=qty%></td>

    <!-- ✅ Vendor Name Safe -->
    <td>
        <%= (rs.getString("vendor_name") != null) ? rs.getString("vendor_name") : "N/A" %>
    </td>

    <td class="<%=statusClass%>">
        <%=statusText%>
    </td>
</tr>

<%
    }

}catch(Exception e){
    out.println("<tr><td colspan='6'>Error: "+e.getMessage()+"</td></tr>");
}finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

</table>

</div>
</div>

</body>
</html>