<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:'Poppins', sans-serif;
    background: url('images/farm.jpeg') no-repeat center center/cover;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    position:relative;
}

/* Dark overlay */
body::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.6);
}

/* Login Card */
.login-card{
    position:relative;
    width:350px;
    padding:40px;
    border-radius:20px;
    background: rgba(255,255,255,0.95);
    backdrop-filter: blur(10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
    text-align:center;
    animation:fadeIn 1s ease-in-out;
}

.login-card h2{
    margin-bottom:20px;
    color:#c62828;
    font-weight:700;
}

/* Input */
.input-group{
    position:relative;
    margin-bottom:20px;
}

.input-group i{
    position:absolute;
    left:12px;
    top:12px;
    color:#c62828;
}

.input-group input{
    width:100%;
    padding:10px 10px 10px 40px;
    border:none;
    border-bottom:2px solid #c62828;
    outline:none;
    background:transparent;
}

/* Button */
.btn-admin{
    width:100%;
    padding:10px;
    border:none;
    border-radius:25px;
    background: linear-gradient(45deg,#ff416c,#ff4b2b);
    color:white;
    font-size:16px;
    transition:0.3s;
}

.btn-admin:hover{
    transform:scale(1.05);
    box-shadow:0 5px 15px rgba(0,0,0,0.3);
}

/* Link */
a{
    text-decoration:none;
    color:#c62828;
    font-weight:500;
}

a:hover{
    text-decoration:underline;
}

/* Animation */
@keyframes fadeIn {
    from{
        opacity:0;
        transform: translateY(-20px);
    }
    to{
        opacity:1;
        transform: translateY(0);
    }
}
</style>
</head>

<body>

<div class="login-card">

    <h2>👨‍💼 Admin Login</h2>

    <form action="AdminLoginServlet" method="post">

        <div class="input-group">
            <i class="fa fa-user-shield"></i>
            <input type="text" name="username" placeholder="Admin Username" required>
        </div>

        <div class="input-group">
            <i class="fa fa-lock"></i>
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit" class="btn-admin">🔐 Login</button>

    </form>

    <div class="mt-3">
        <small>Back to Home?</small><br>
        <a href="landingPage.jsp">Go Back</a>
    </div>

</div>

</body>
</html>