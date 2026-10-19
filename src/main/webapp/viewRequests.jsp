<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Customer Orders</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins', sans-serif;
    margin:0;
    background:linear-gradient(135deg,#667eea,#764ba2);
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
    color:#764ba2;
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

/* Buttons */
button{
    padding:8px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    margin:2px;
    font-weight:bold;
    transition:0.3s;
}

button:hover{
    transform:scale(1.05);
}

/* Action Buttons */
.accept{
    background:#28a745;
    color:white;
}

.reject{
    background:#dc3545;
    color:white;
}

.deliver{
    background:#007bff;
    color:white;
}

/* Status Text */
.done{
    color:green;
    font-weight:bold;
}

.pending{
    color:orange;
    font-weight:bold;
}

.accepted{
    color:#007bff;
    font-weight:bold;
}

.rejected{
    color:red;
    font-weight:bold;
}
</style>

</head>

<body>

<!-- Navbar -->
<div class="navbar">
    <h2>🌾 Admin Panel - Orders</h2>
    <a href="adminDashboard.jsp">
        <button>⬅ Back</button>
    </a>
</div>

<div class="container">

<div class="card">

<h3>📦 Customer Orders</h3>

<table>
<tr>
    <th>ID</th>
    <th>Product</th>
    <th>Qty</th>
    <th>Total</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try{
    con = DBConnection.getConnection();
    String q = "SELECT o.*, p.name FROM orders o JOIN products p ON o.product_id=p.id ORDER BY o.id DESC";

    st = con.createStatement();
    rs = st.executeQuery(q);

    while(rs.next()){
        String status = rs.getString("status");
%>

<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("name")%></td>
    <td><%=rs.getInt("quantity")%></td>
    <td>₹<%=rs.getDouble("total")%></td>

    <!-- STATUS -->
    <td class="<%=status.toLowerCase()%>">
        <%=status%>
    </td>

    <!-- ACTION -->
    <td>
        <% if(status.equals("Pending")){ %>

            <a href="UpdateOrderServlet?id=<%=rs.getInt("id")%>&status=Accepted">
                <button class="accept">✔ Accept</button>
            </a>

            <a href="UpdateOrderServlet?id=<%=rs.getInt("id")%>&status=Rejected">
                <button class="reject">✖ Reject</button>
            </a>

        <% } else if(status.equals("Accepted")){ %>

            <a href="UpdateOrderServlet?id=<%=rs.getInt("id")%>&status=Delivered">
                <button class="deliver">🚚 Deliver</button>
            </a>

        <% } else if(status.equals("Rejected")){ %>

            <span class="rejected">✖ Rejected</span>

        <% } else { %>

            <span class="done">✔ Delivered</span>

        <% } %>
    </td>
</tr>

<%
    }
}catch(Exception e){
    out.println("<tr><td colspan='6'>Error loading orders</td></tr>");
    e.printStackTrace();
}finally{
    if(rs!=null) rs.close();
    if(st!=null) st.close();
    if(con!=null) con.close();
}
%>

</table>

</div>

</div>

</body>
</html>