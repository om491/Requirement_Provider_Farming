<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Vendor Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#2e7d32,#81c784);
    font-family: 'Segoe UI';
}

.sidebar{
    height:100vh;
    background:#1b5e20;
    color:white;
    padding:20px;
}

.sidebar h2{
    text-align:center;
    color:#c8e6c9;
}

.sidebar a{
    display:block;
    padding:12px;
    margin:10px 0;
    color:white;
    text-decoration:none;
    border-radius:8px;
}

.sidebar a:hover{
    background:#66bb6a;
    color:black;
}

.card{
    border:none;
    border-radius:15px;
    background:#ffffff;
    box-shadow:0 5px 15px rgba(0,0,0,0.3);
}

.dashboard{
    padding:20px;
}

</style>
</head>

<body>

<div class="container-fluid">
<div class="row">

<!-- Sidebar -->
<div class="col-md-2 sidebar">
    <h2>🌾 Farmer</h2>
    <a href="vendorStockRegistration.jsp">🌽 Add Stock</a>
    <a href="viewAdminRequests.jsp">View Admin Requests</a>
    <a href="inventory.jsp">📦 My Inventory</a>
    <a href="logout.jsp">🚪 Logout</a>
</div>

<!-- Main -->
<div class="col-md-10 dashboard">

<h2 class="text-white mb-4">Welcome Farmer 👋</h2>

<div class="row">

<div class="col-md-4">
<div class="card p-3">
<h4>🌽 Add Crop Stock</h4>
<p>Add your harvested crops</p>
<a href="vendorStockRegistration.jsp" class="btn btn-success">Add Stock</a>
</div>
</div>

<div class="col-md-4">
<div class="card p-3">
<h4>📩 Admin Requests</h4>
<p>Check buyer/admin demands</p>
<a href="viewRequests.jsp" class="btn btn-primary">View Requests</a>
</div>
</div>

<div class="col-md-4">
<div class="card p-3">
<h4>📦 My Inventory</h4>
<p>Track your available crops</p>
<a href="inventory.jsp" class="btn btn-warning">View</a>
</div>
</div>

</div>
</div>

</div>
</div>

</body>
</html>