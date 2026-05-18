<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Register | Food Delivery</title>

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
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    overflow:hidden;
    position:relative;
    background:#f5f5f5;
}

/* ================= BACKGROUND ================= */

.background{
    position:absolute;
    width:100%;
    height:100%;
    background:
    linear-gradient(rgba(0,0,0,0.55),
    rgba(0,0,0,0.65)),
    url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1974&auto=format&fit=crop');

    background-size:cover;
    background-position:center;
    filter:blur(2px);
    transform:scale(1.1);
}

/* ================= CONTAINER ================= */

.register-wrapper{
    position:relative;
    z-index:2;
    width:100%;
    max-width:480px;
    padding:20px;
}

/* ================= CARD ================= */

.register-card{
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(16px);
    border:1px solid rgba(255,255,255,0.2);
    border-radius:30px;
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

/* ================= INPUT GROUP ================= */

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

/* ================= BUTTON ================= */

.register-btn{
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
    margin-top:10px;
}

.register-btn:hover{
    background:#e63946;
    transform:translateY(-2px);
}

/* ================= LOGIN LINK ================= */

.login-text{
    text-align:center;
    margin-top:25px;
    color:#eee;
    font-size:14px;
}

.login-text a{
    color:#ff8080;
    text-decoration:none;
    font-weight:600;
}

.login-text a:hover{
    text-decoration:underline;
}

/* ================= RESPONSIVE ================= */

@media(max-width:500px){

    .register-card{
        padding:32px 22px;
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

<!-- REGISTER -->

<div class="register-wrapper">

    <div class="register-card">

        <!-- LOGO -->

        <div class="logo">
            🍔 <span>Feasto</span>
        </div>

        <!-- TITLE -->

        <div class="title">
            Create Account
        </div>

        <div class="subtitle">
            Join now and order your favorite meals
        </div>

        <!-- FORM -->

        <form action="register" method="post">

            <!-- NAME -->

            <div class="input-group">

                <label class="input-label">
                    Full Name
                </label>

                <div class="input-box">

                    <input
                    type="text"
                    name="name"
                    placeholder="Enter your full name"
                    required>

                </div>

            </div>

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
                    placeholder="Create password"
                    required>

                </div>

            </div>

            <!-- PHONE -->

            <div class="input-group">

                <label class="input-label">
                    Phone Number
                </label>

                <div class="input-box">

                    <input
                    type="text"
                    name="phone"
                    placeholder="Enter phone number"
                    required>

                </div>

            </div>

            <!-- ADDRESS -->

            <div class="input-group">

                <label class="input-label">
                    Delivery Address
                </label>

                <div class="input-box">

                    <input
                    type="text"
                    name="address"
                    placeholder="Enter your address"
                    required>

                </div>

            </div>

            <!-- BUTTON -->

            <button type="submit" class="register-btn">
                Create Account
            </button>

        </form>

        <!-- LOGIN -->

        <div class="login-text">

            Already have an account?

            <a href="login.jsp">
                Login
            </a>

        </div>

    </div>

</div>

</body>
</html>