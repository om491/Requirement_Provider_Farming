<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Register Customer</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body{
            margin:0;
            font-family:'Poppins', sans-serif;
            background: url('images/farm2.jpeg') no-repeat center center/cover;
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
            background: rgba(0,0,0,0.5);
        }

        /* Glass Card */
        .card{
            position:relative;
            border:none;
            border-radius:20px;
            backdrop-filter: blur(10px);
            background: rgba(255,255,255,0.9);
            box-shadow:0 10px 30px rgba(0,0,0,0.3);
            animation:fadeIn 1s ease-in-out;
        }

        .title{
            font-weight:bold;
            color:#2e7d32;
        }

        .form-control{
            border-radius:10px;
            padding-left:40px;
            border-bottom:2px solid #2e7d32;
        }

        .input-group{
            position:relative;
        }

        .input-group i{
            position:absolute;
            left:12px;
            top:12px;
            color:#2e7d32;
        }

        /* Button */
        .btn-success{
            border-radius:25px;
            width:100%;
            background:#2e7d32;
            border:none;
            transition:0.3s;
        }

        .btn-success:hover{
            background:#1b5e20;
            transform:scale(1.05);
        }

        a{
            text-decoration:none;
            color:#2e7d32;
            font-weight:500;
        }

        a:hover{
            text-decoration:underline;
        }

        @keyframes fadeIn {
            from { opacity:0; transform:translateY(-20px); }
            to { opacity:1; transform:translateY(0); }
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4 card p-4">

            <h3 class="text-center title mb-3">🌾Farmer Registration</h3>
            <p class="text-center text-muted">Join our farming platform</p>

            <form action="RegisterCustomerServlet" method="post">

                <div class="input-group mb-3">
                    <i class="fa fa-user"></i>
                    <input type="text" class="form-control" name="name" placeholder="Full Name" required>
                </div>

                <div class="input-group mb-3">
                    <i class="fa fa-envelope"></i>
                    <input type="email" class="form-control" name="email" placeholder="Email Address" required>
                </div>

                <div class="input-group mb-3">
                    <i class="fa fa-lock"></i>
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>

                <div class="input-group mb-3">
                    <i class="fa fa-phone"></i>
                    <input type="text" class="form-control" name="phone" placeholder="Phone Number" required>
                </div>

                <button type="submit" class="btn btn-success"> Register</button>
            </form>

            <div class="text-center mt-3">
                <small>Already have an account?</small><br>
                <a href="customerLogin.jsp">Login here</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>