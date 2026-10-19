<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Payment</title>

<style>
body{
    font-family:'Poppins';
    background:#f5f5f5;
}
.card{
    width:350px;
    margin:100px auto;
    padding:20px;
    background:white;
    border-radius:15px;
    text-align:center;
}
.amount{
    font-size:22px;
    font-weight:bold;
    margin:15px 0;
}
button{
    width:100%;
    padding:10px;
    background:green;
    color:white;
    border:none;
}
</style>
</head>

<body>

<div class="card">

<h2>💳 Payment Page</h2>

<form action="PlaceOrderServlet" method="post">

    <!-- DATA PASS -->
    <input type="hidden" name="product_id" value="<%=request.getParameter("product_id")%>">
    <input type="hidden" name="qty" value="<%=request.getParameter("qty")%>">
    <input type="hidden" name="total" value="<%=request.getParameter("total")%>">

    <div class="amount">
        ₹ <%=request.getParameter("total")%>
    </div>

    <select name="mode">
        <option>UPI</option>
        <option>Card</option>
        <option>Cash</option>
    </select>

    <br><br>

    <button type="submit">Pay Now</button>

</form>

</div>

</body>
</html>