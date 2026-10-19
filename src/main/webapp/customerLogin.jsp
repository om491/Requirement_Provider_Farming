<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>

<style>
body {
    margin:0;
    font-family:'Poppins', sans-serif;
    background: url('images/farm.jpeg') no-repeat center center/cover;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    position:relative;
}

/* Dark overlay for better visibility */
body::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.5);
}

/* Login Box */
.login-box {
    position:relative;
    background: rgba(255,255,255,0.9);
    padding:40px;
    border-radius:15px;
    width:300px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
    backdrop-filter: blur(5px);
}

.login-box h2 {
    margin-bottom:20px;
    color:#2e7d32;
}

/* Input */
.input-box {
    margin:15px 0;
}

.input-box input {
    width:100%;
    padding:10px;
    border:none;
    border-bottom:2px solid #2e7d32;
    outline:none;
    background:transparent;
}

/* Button */
button {
    margin-top:20px;
    padding:10px;
    width:100%;
    background:#2e7d32;
    border:none;
    color:white;
    font-size:16px;
    border-radius:25px;
    cursor:pointer;
    transition:0.3s;
}

button:hover {
    transform:scale(1.05);
    background:#1b5e20;
}
</style>
</head>

<body>

<div class="login-box">
    <h2>🌾 Farmer Login</h2>

    <form action="CustomerLoginServlet" method="post">
        <div class="input-box">
            <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit">🚜 Login</button>
    </form>
</div>

</body>
</html>