<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login | Food Delivery</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Poppins',sans-serif;
    background:#f5f5f5;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    overflow:hidden;
    position:relative;
}

/* ================= BACKGROUND ================= */

.background{
    position:absolute;
    width:100%;
    height:100%;
    background:
    linear-gradient(rgba(0,0,0,0.55), rgba(0,0,0,0.65)),
    url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1974&auto=format&fit=crop');
    background-size:cover;
    background-position:center;
    filter:blur(2px);
    transform:scale(1.1);
}

/* ================= LOGIN BOX ================= */

.login-wrapper{
    position:relative;
    z-index:2;
    width:100%;
    max-width:430px;
    padding:20px;
}

.login-card{
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(16px);
    border:1px solid rgba(255,255,255,0.2);
    border-radius:28px;
    padding:40px 35px;
    box-shadow:0 8px 40px rgba(0,0,0,0.35);
}

/* ================= LOGO ================= */

.logo{
    text-align:center;
    font-size:34px;
    font-weight:700;
    color:white;
    margin-bottom:10px;
}

.logo span{
    color:#ff4d4d;
}

/* ================= TITLE ================= */

.title{
    text-align:center;
    color:white;
    font-size:30px;
    font-weight:600;
    margin-bottom:8px;
}

.subtitle{
    text-align:center;
    color:#ddd;
    font-size:14px;
    margin-bottom:30px;
}

/* ================= MESSAGE ================= */

.error,
.success{
    padding:12px;
    border-radius:12px;
    margin-bottom:18px;
    text-align:center;
    font-size:14px;
}

.error{
    background:#ffebeb;
    color:#d60000;
}

.success{
    background:#eaffea;
    color:#008000;
}

/* ================= INPUTS ================= */

.input-group{
    margin-bottom:20px;
}

.input-label{
    display:block;
    margin-bottom:8px;
    color:white;
    font-size:14px;
    font-weight:500;
}

.input-box{
    position:relative;
}

.input-box input{
    width:100%;
    padding:15px;
    border:none;
    outline:none;
    border-radius:14px;
    background:rgba(255,255,255,0.15);
    color:white;
    font-size:15px;
    transition:0.3s;
}

.input-box input::placeholder{
    color:#ddd;
}

.input-box input:focus{
    background:rgba(255,255,255,0.22);
    border:1px solid #ff4d4d;
}

/* ================= OPTIONS ================= */

.options{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
    color:white;
    font-size:14px;
}

.options a{
    color:#ff8080;
    text-decoration:none;
}

.options a:hover{
    text-decoration:underline;
}

/* ================= BUTTON ================= */

.login-btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    background:#ff4d4d;
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.login-btn:hover{
    background:#e63946;
    transform:translateY(-2px);
}

/* ================= REGISTER ================= */

.register-text{
    text-align:center;
    margin-top:25px;
    color:#eee;
    font-size:14px;
}

.register-text a{
    color:#ff8080;
    text-decoration:none;
    font-weight:600;
}

.register-text a:hover{
    text-decoration:underline;
}

/* ================= RESPONSIVE ================= */

@media(max-width:500px){

    .login-card{
        padding:30px 22px;
    }

    .title{
        font-size:26px;
    }
}

</style>

</head>

<body>

<!-- BACKGROUND -->

<div class="background"></div>

<!-- LOGIN -->

<div class="login-wrapper">

    <div class="login-card">

        <!-- LOGO -->

        <div class="logo">
            🍔 <span>Feasto</span>
        </div>

        <!-- TITLE -->

        <div class="title">
            Welcome Back
        </div>

        <div class="subtitle">
            Login to continue ordering your favorite food
        </div>

        <!-- MESSAGE -->

        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");

            if(error != null){
        %>

        <div class="error">
            <%= error %>
        </div>

        <%
            }

            if(success != null){
        %>

        <div class="success">
            <%= success %>
        </div>

        <%
            }
        %>

        <!-- FORM -->

        <form action="login" method="post">

            <!-- EMAIL -->

            <div class="input-group">

                <label class="input-label">
                    Email Address
                </label>

                <div class="input-box">

                    <input
                    type="email"
                    name="email"
                    placeholder="Enter your email"
                    required>

                </div>

            </div>

            <!-- PASSWORD -->

            <div class="input-group">

                <label class="input-label">
                    Password
                </label>

                <div class="input-box">

                    <input
                    type="password"
                    name="password"
                    placeholder="Enter your password"
                    required>

                </div>

            </div>

            <!-- OPTIONS -->

            <div class="options">

                <label>
                    <input type="checkbox">
                    Remember me
                </label>

                <a href="#">
                    Forgot Password?
                </a>

            </div>

            <!-- BUTTON -->

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <!-- REGISTER -->

        <div class="register-text">

            Don't have an account?

            <a href="register.jsp">
                Register
            </a>

        </div>

    </div>

</div>

</body>
</html>