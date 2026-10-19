<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

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

/* Glass Card */
.container{
    position:relative;
    text-align:center;
    color:white;
    background: rgba(255,255,255,0.1);
    padding:50px;
    border-radius:20px;
    backdrop-filter: blur(10px);
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
    animation: fadeIn 1s ease-in-out;
}

h1{
    margin-bottom:30px;
    font-weight:700;
}

/* Buttons */
button{
    width:220px;
    padding:15px;
    margin:15px;
    border:none;
    border-radius:30px;
    font-size:18px;
    cursor:pointer;
    transition:0.3s;
    font-weight:500;
}

/* Individual colors */
.admin{
    background: linear-gradient(45deg,#ff416c,#ff4b2b);
    color:white;
}

.customer{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    color:white;
}

.vendor{
    background: linear-gradient(45deg,#56ab2f,#a8e063);
    color:white;
}

/* Hover effect */
button:hover{
    transform:scale(1.1);
    box-shadow:0 5px 15px rgba(0,0,0,0.3);
}

/* Animation */
@keyframes fadeIn {
    from{
        opacity:0;
        transform: translateY(-30px);
    }
    to{
        opacity:1;
        transform: translateY(0);
    }
}
</style>
</head>

<body>

<div class="container">
    <h1>🌾 Welcome to Smart Farming System</h1>
    <p>Select your role</p>

    <form action="adminLogin.jsp">
        <button type="submit" class="admin">👨‍💼 Admin</button>
    </form>

    <form action="customerRegistration.jsp">
        <button type="submit" class="customer">🛒 Customer</button>
    </form>

    <form action="vendorRegister.jsp">
        <button type="submit" class="vendor">🚜 Vendor</button>
    </form>
</div>

</body>
</html>