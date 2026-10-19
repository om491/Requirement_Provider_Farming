<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Farm Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* 🌿 Background */
body{
    background: linear-gradient(to right,#2e7d32,#81c784);
    font-family: 'Segoe UI';
    color:white;
}

/* 🌾 Header */
h2{
    text-align:center;
    font-weight:bold;
    margin-bottom:25px;
}

/* 🌱 Card */
.card{
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    border-radius:15px;
    padding:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.2);
}

/* Inputs */
input{
    border-radius:10px !important;
}

/* 🌿 Buttons */
.btn-green{
    background:#1b5e20;
    color:white;
    border:none;
}
.btn-green:hover{
    background:#145a1a;
    transform:scale(1.05);
}

/* 🌾 Table */
table{
    color:white;
}
thead{
    background: rgba(0,0,0,0.4);
}

/* 🌽 Image */
img{
    width:80px;
    height:80px;
    border-radius:10px;
    object-fit:cover;
    transition:0.3s;
}
img:hover{
    transform:scale(1.2);
}

/* ❌ Delete */
.delete-btn{
    background:#c62828;
    border:none;
}
.delete-btn:hover{
    background:#b71c1c;
}

/* 🌼 Badge */
.badge-green{
    background:#388e3c;
}

</style>

</head>

<body class="container mt-4">

<h2>🌾 Admin Dashboard</h2>

<!-- Add Product -->
<div class="card mb-4">

<h4>🌱 Add Farming Product</h4>

<form action="UploadProductServlet" method="post" enctype="multipart/form-data" class="row g-3">

    <div class="col-md-3">
        <input type="text" name="name" class="form-control" placeholder="Crop / Product Name" required>
    </div>

    <div class="col-md-2">
        <input type="number" name="price" class="form-control" placeholder="Price (₹)" required>
    </div>

    <div class="col-md-2">
        <input type="number" name="quantity" class="form-control" placeholder="Quantity (pcs)" required>
    </div>

    <div class="col-md-3">
        <input type="file" name="image" class="form-control" required>
    </div>

    <div class="col-md-2">
        <button class="btn btn-green w-100">🌿 Upload</button>
    </div>

</form>

<div class="text-center mt-3">
    <a href="viewRequests.jsp" class="btn btn-light">📦 Customer Orders</a>
</div>

<div class="text-center mt-3">
    <a href="viewVendorsStock.jsp" class="btn btn-light">View Vendors Stock</a>
</div>

</div>

<!-- Product Table -->
<div class="card">

<h4>🌾 Available Products</h4>

<table class="table table-hover text-center align-middle">

<thead>
<tr>
    <th>ID</th>
    <th>Crop</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Image</th>
    <th>Action</th>
</tr>
</thead>

<tbody>

<%
Connection con = DBConnection.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM products");

while(rs.next()){
%>

<tr>
    <td><%=rs.getInt("id")%></td>

    <td>
        <span class="badge badge-green p-2">
            🌱 <%=rs.getString("name")%>
        </span>
    </td>

    <td>₹ <%=rs.getDouble("price")%></td>A

    <td><%=rs.getInt("quantity")%> pcs</td>

    <td>
        <img src="<%=request.getContextPath()+"/"+rs.getString("image")%>" 
     onerror="this.src='images/farm.jpeg'">
    </td>

    <td>
        <a href="DeleteProductServlet?id=<%=rs.getInt("id")%>">
            <button class="btn delete-btn btn-sm">Delete</button>
        </a>
    </td>
</tr>

<%
}
%>

</tbody>
</table>

</div>
<a href="landingPage.jsp">Go to Main Screen</a>
</body>
</html>