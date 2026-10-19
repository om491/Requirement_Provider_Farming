<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Customer Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins', sans-serif;
    margin:0;
    background:linear-gradient(135deg,#667eea,#764ba2);
}

.navbar{
    background:white;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
}

.section{
    padding:20px;
}

.container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.card{
    background:white;
    border-radius:15px;
    padding:15px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}

.card img{
    width:100%;
    height:180px;
    object-fit:cover;
}

button{
    width:100%;
    padding:10px;
    margin-top:10px;
    background:#28a745;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

table{
    width:100%;
    background:white;
    margin-top:20px;
}

th,td{
    padding:10px;
    text-align:center;
}

th{
    background:#333;
    color:white;
}

.pending{color:orange;}
.accepted{color:green;}
.rejected{color:red;}

.view-btn-dark{
    padding:12px 25px;
    background:#2c3e50;
    color:white;
    text-decoration:none;
    border-radius:8px;
}
.view-btn-dark:hover{
    background:#1a252f;
}
</style>
</head>

<body>

<div class="navbar">
    <h2>🌾 Farmer Market</h2>
</div>

<%
Connection con = DBConnection.getConnection();
%>

<!-- PRODUCTS -->
<div class="section">
<h2 style="color:white;">🛒 Products</h2>

<div class="container">

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM products");

while(rs.next()){
%>

<div class="card">
<img src="<%=request.getContextPath()+"/"+rs.getString("image")%>">    <h3><%=rs.getString("name")%></h3>
    <p>₹<%=rs.getDouble("price")%></p>
    <p>Stock: <%=rs.getInt("quantity")%></p>

    <!-- BUY FORM -->
   <form action="payment.jsp" method="post">

    <input type="hidden" name="product_id" value="<%=rs.getInt("id")%>">
<input type="hidden" name="total"
       id="hidden_total_<%=rs.getInt("id")%>"
       value="<%=rs.getDouble("price")%>">    
    Qty:
    <input type="number" name="qty"
           min="1"
           max="<%=rs.getInt("quantity")%>"
           value="1"
           id="qty_<%=rs.getInt("id")%>"
           oninput="updateTotal(<%=rs.getInt("id")%>)">

    <button type="submit">Buy Now</button>
</form>
</div>

<%
}
%>

</div>
</div>

<!-- MY ORDERS -->
<div class="section">
<h2 style="color:white;">📦 My Orders</h2>

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
Statement st2 = con.createStatement();
ResultSet rs2 = st2.executeQuery(
"SELECT o.*, p.name FROM orders o JOIN products p ON o.product_id=p.id ORDER BY o.id DESC"
);

while(rs2.next()){
String status = rs2.getString("status");
%>

<tr>
    <td><%=rs2.getInt("id")%></td>
    <td><%=rs2.getString("name")%></td>
    <td><%=rs2.getInt("quantity")%></td>
    <td>₹<%=rs2.getDouble("total")%></td>
    <td class="<%=status.toLowerCase()%>"><%=status%></td>
    <td class="<%=status.toLowerCase()%>"><%=status%></td>

<td>
    <a href="DeleteProductServlet?id=<%=rs2.getInt("id")%>" 
       onclick="return confirm('Are you sure to delete this order?')">
        <button style="background:red;color:white;border:none;padding:5px 10px;border-radius:5px;">
            Delete
        </button>
    </a>
</td>
</tr>

<%
}
%>

</table>
</div>

<!-- JS -->
<script>
function updateTotal(id){
    let price = document.getElementById("price_" + id).value;
    let qty = document.getElementById("qty_" + id).value;

    let total = price * qty;

    document.getElementById("total_" + id).innerText = total;
    document.getElementById("hidden_total_" + id).value = total;
}
</script>
<a href="landingPage.jsp" class="view-btn-outline">View Orders</a></body>
</html>