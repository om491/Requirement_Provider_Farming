<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor Registration</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#56ab2f,#a8e063);
    font-family:'Segoe UI';
}

.register-box{
    background:white;
    padding:30px;
    border-radius:20px;
    margin-top:50px;
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

<div class="col-md-6">
<div class="register-box">

<h2>🌾 Vendor Registration</h2>

<form action="vendorRegisterServlet" method="post">
<div class="mb-3">
<label>Full Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Mobile</label>
<input type="text" name="mobile" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<div class="mb-3">
<label>Village</label>
<input type="text" name="village" class="form-control">
</div>

<button class="btn btn-success w-100">Register</button>
<p class="text-center mt-3">
    Already Registered? 
    <a href="vendorLogin.jsp" class="text-success fw-bold">Go to Login</a>
</p>

</form>

</div>
</div>

</div>
</div>

</body>
</html>