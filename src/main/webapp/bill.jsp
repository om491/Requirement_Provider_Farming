<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<%
int orderId = Integer.parseInt(request.getParameter("orderId"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT o.*, p.name FROM orders o JOIN products p ON o.product_id=p.id WHERE o.id=?"
);

ps.setInt(1, orderId);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Receipt</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins',sans-serif;
    background:#f4f6f9;
    margin:0;
    padding:30px;
}

/* RECEIPT CARD */
.box{
    width:400px;
    margin:auto;
    background:#fff;
    padding:25px;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
    border:1px solid #eee;
}

/* HEADER */
.header{
    text-align:center;
    border-bottom:2px dashed #ccc;
    padding-bottom:10px;
}

.header h2{
    margin:0;
}

.header p{
    color:#888;
    font-size:13px;
}

/* ROW */
.row{
    display:flex;
    justify-content:space-between;
    margin:10px 0;
    font-size:14px;
}

/* TOTAL */
.total{
    border-top:2px dashed #ccc;
    margin-top:15px;
    padding-top:10px;
    font-weight:600;
    font-size:18px;
    color:#27ae60;
    text-align:right;
}

/* STATUS */
.status{
    text-align:center;
    margin-top:10px;
    padding:6px;
    border-radius:5px;
    background:#eafaf1;
    color:#27ae60;
    font-weight:500;
}

/* BUTTON */
.btn{
    display:block;
    margin:25px auto;
    padding:12px 25px;
    background:linear-gradient(135deg,#27ae60,#2ecc71);
    color:white;
    border:none;
    border-radius:8px;
    font-size:15px;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 8px 20px rgba(0,0,0,0.2);
}

/* PRINT */
@media print{
    body{
        background:white;
    }
    .btn{
        display:none;
    }
    .box{
        box-shadow:none;
        border:none;
    }
}
.view-btn-outline{
    padding:10px 20px;
    border:2px solid #3498db;
    color:#3498db;
    text-decoration:none;
    border-radius:8px;
    transition:0.3s;
}
.view-btn-outline:hover{
    background:#3498db;
    color:white;
}
</style>

<script>
function downloadReceipt(){
    window.print();
}
</script>

</head>

<body>

<div class="box">

<div class="header">
    <h2>🧾 Payment Receipt</h2>
    <p>Thank you for your purchase</p>
</div>

<div class="row">
    <span><b>Order ID</b></span>
    <span>#<%=orderId%></span>
</div>

<div class="row">
    <span><b>Product</b></span>
    <span><%=rs.getString("name")%></span>
</div>

<div class="row">
    <span><b>Quantity</b></span>
    <span><%=rs.getInt("quantity")%></span>
</div>

<div class="row">
    <span><b>Total</b></span>
    <span>₹ <%=rs.getDouble("total")%></span>
</div>

<div class="status">
    Status: <%=rs.getString("status")%>
</div>

<div class="total">
    Paid: ₹ <%=rs.getDouble("total")%>
</div>

</div>

<button class="btn" onclick="downloadReceipt()">⬇ Download / Print</button>
<a href="customerDashboard.jsp" class="view-btn-outline">View Orders</a>
</body>
</html>