<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right,#00b09b,#96c93d);
}

.login-box{
    background:white;
    padding:30px;
    border-radius:20px;
    margin-top:100px;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    color:#2e7d32;
}

</style>
</head>

<body>

<div class="container">
<div class="row justify-content-center">

<div class="col-md-5">
<div class="login-box">

<h2>🌱 Farmer Login</h2>

<form action="VendorLoginServlet" method="post">

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<button class="btn btn-success w-100">Login</button>

<p class="text-center mt-3">
New user? <a href="vendorRegister.jsp">Register here</a>
</p>

</form>

</div>
</div>

</div>
</div>

</body>
</html>