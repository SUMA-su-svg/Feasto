<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Order Success | Food Delivery</title>

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

/* ================= SUCCESS CONTAINER ================= */

.success-wrapper{
    position:relative;
    z-index:2;
    width:100%;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
}

/* ================= CARD ================= */

.success-card{
    width:100%;
    max-width:520px;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(16px);
    border:1px solid rgba(255,255,255,0.2);
    border-radius:30px;
    padding:45px 35px;
    text-align:center;
    box-shadow:0 8px 40px rgba(0,0,0,0.35);
    animation:pop 0.5s ease;
}

/* ================= ANIMATION ================= */

@keyframes pop{

    from{
        transform:scale(0.8);
        opacity:0;
    }

    to{
        transform:scale(1);
        opacity:1;
    }
}

/* ================= ICON ================= */

.success-icon{
    width:120px;
    height:120px;
    margin:auto;
    margin-bottom:25px;
    border-radius:50%;
    background:#22c55e;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:60px;
    color:white;
    box-shadow:0 0 25px rgba(34,197,94,0.6);
}

/* ================= TITLE ================= */

.success-title{
    font-size:34px;
    font-weight:700;
    color:white;
    margin-bottom:15px;
}

.success-subtitle{
    color:#f0f0f0;
    font-size:16px;
    line-height:1.7;
    margin-bottom:30px;
}

/* ================= DELIVERY BOX ================= */

.delivery-box{
    background:rgba(255,255,255,0.15);
    border-radius:18px;
    padding:18px;
    margin-bottom:28px;
    color:white;
}

.delivery-time{
    font-size:28px;
    font-weight:700;
    margin-top:8px;
    color:#ffd166;
}

/* ================= BUTTONS ================= */

.btn-group{
    display:flex;
    gap:15px;
    justify-content:center;
    flex-wrap:wrap;
}

.btn{
    padding:14px 24px;
    border:none;
    border-radius:14px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    text-decoration:none;
    display:inline-block;
}

/* PRIMARY BUTTON */

.primary-btn{
    background:#ff4d4d;
    color:white;
}

.primary-btn:hover{
    background:#e63946;
    transform:translateY(-2px);
}

/* SECONDARY BUTTON */

.secondary-btn{
    background:rgba(255,255,255,0.15);
    color:white;
    border:1px solid rgba(255,255,255,0.2);
}

.secondary-btn:hover{
    background:rgba(255,255,255,0.25);
}

/* ================= RESPONSIVE ================= */

@media(max-width:600px){

    .success-card{
        padding:35px 22px;
    }

    .success-title{
        font-size:28px;
    }

    .success-subtitle{
        font-size:14px;
    }

    .btn{
        width:100%;
    }
}

</style>

</head>

<body>

<!-- HEADER -->

<jsp:include page="components/header.jsp" />

<!-- BACKGROUND -->

<div class="background"></div>

<!-- SUCCESS -->

<div class="success-wrapper">

    <div class="success-card">

        <!-- ICON -->

        <div class="success-icon">
            ✓
        </div>

        <!-- TITLE -->

        <div class="success-title">
            Order Placed Successfully!
        </div>

        <div class="success-subtitle">
            Your delicious food is being prepared 🍔 <br>
            Sit back and relax while we deliver it hot & fresh 🚀
        </div>

        <!-- DELIVERY -->

        <div class="delivery-box">

            Estimated Delivery Time

            <div class="delivery-time">
                25 - 35 mins
            </div>

        </div>

        <!-- BUTTONS -->

        <div class="btn-group">

            <a href="restaurants"
            class="btn primary-btn">

                Order More

            </a>

            <a href="restaurants"
            class="btn secondary-btn">

                Back To Home

            </a>

        </div>

    </div>

</div>

</body>
</html>