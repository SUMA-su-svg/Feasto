<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.foodapp.model.CartItem" %>

<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
}

double itemTotal = 0;

if(cart != null){
    for(CartItem item : cart){
        itemTotal += item.getTotalPrice();
    }
}

double deliveryFee = 40;
double platformFee = 10;
double gst = 20;

double grandTotal = itemTotal + deliveryFee + platformFee + gst;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Checkout | Food Delivery</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    background:#f5f5f5;
    font-family:'Poppins',sans-serif;
    color:#222;
}

/* ================= MAIN ================= */

.main-container{
    width:100%;
    max-width:850px;
    margin:auto;
    padding:100px 20px 40px;
}

/* ================= TITLE ================= */

.page-title{
    font-size:34px;
    font-weight:700;
    margin-bottom:8px;
}

.page-subtitle{
    color:#666;
    margin-bottom:30px;
}

/* ================= CARD ================= */

.card{
    background:white;
    border-radius:18px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
}

.card-title{
    font-size:22px;
    font-weight:600;
    margin-bottom:20px;
}

/* ================= INPUTS ================= */

.input-group{
    margin-bottom:18px;
}

.input-label{
    display:block;
    margin-bottom:8px;
    font-weight:500;
    color:#444;
}

input,
textarea,
select{
    width:100%;
    padding:14px;
    border-radius:12px;
    border:1px solid #ddd;
    outline:none;
    font-size:15px;
    font-family:'Poppins',sans-serif;
    transition:0.3s;
}

input:focus,
textarea:focus,
select:focus{
    border-color:#e23744;
}

textarea{
    resize:none;
    height:100px;
}

/* ================= PAYMENT ================= */

.payment-option{
    display:flex;
    align-items:center;
    gap:12px;
    border:1px solid #ddd;
    border-radius:14px;
    padding:16px;
    margin-bottom:15px;
    transition:0.3s;
    cursor:pointer;
}

.payment-option:hover{
    border-color:#e23744;
    background:#fff7f7;
}

.payment-option input{
    width:auto;
}

/* ================= ORDER ITEMS ================= */

.order-item{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 0;
    border-bottom:1px solid #eee;
}

.food-details{
    display:flex;
    flex-direction:column;
}

.food-name{
    font-weight:600;
    margin-bottom:5px;
}

.food-qty{
    font-size:14px;
    color:#666;
}

.food-price{
    font-weight:600;
    color:#e23744;
}

/* ================= BILL DETAILS ================= */

.bill-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    color:#444;
    font-size:15px;
}

.total-row{
    border-top:1px solid #ddd;
    padding-top:18px;
    margin-top:18px;
    font-size:22px;
    font-weight:700;
    color:#111;
}

/* ================= DELIVERY INFO ================= */

.delivery-box{
    margin-top:15px;
    background:#fff3e6;
    border:1px solid #ffd0a6;
    padding:15px;
    border-radius:14px;
    color:#8a4d00;
    font-size:14px;
}

/* ================= BUTTON ================= */

.place-order-btn{
    width:100%;
    padding:16px;
    border:none;
    border-radius:14px;
    background:#e23744;
    color:white;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    margin-top:10px;
}

.place-order-btn:hover{
    background:#c81d2a;
}

/* ================= RESPONSIVE ================= */

@media(max-width:600px){

    .page-title{
        font-size:28px;
    }

    .card{
        padding:18px;
    }

    .order-item{
        flex-direction:column;
        align-items:flex-start;
        gap:8px;
    }
}

</style>

</head>

<body>

<!-- HEADER -->
<jsp:include page="components/header.jsp" />

<div class="main-container">

<div class="page-title">
    Checkout
</div>

<div class="page-subtitle">
    Complete your order and enjoy your meal 🍔
</div>

<form action="placeOrder" method="post">

    <!-- ADDRESS -->

    <div class="card">

        <div class="card-title">
            Delivery Address
        </div>

        <div class="input-group">

            <label class="input-label">
                Full Address
            </label>

            <textarea
            name="address"
            placeholder="Enter your full delivery address"
            required></textarea>

        </div>

        <div class="input-group">

            <label class="input-label">
                Landmark
            </label>

            <input
            type="text"
            name="landmark"
            placeholder="Nearby landmark">

        </div>

        <div class="delivery-box">
            Estimated delivery time : 25 - 35 mins 🚀
        </div>

    </div>

    <!-- PAYMENT -->

    <div class="card">

        <div class="card-title">
            Payment Method
        </div>

        <label class="payment-option">

            <input
            type="radio"
            name="paymentMode"
            value="COD"
            required>

            <span>Cash On Delivery</span>

        </label>

        <label class="payment-option">

            <input
            type="radio"
            name="paymentMode"
            value="UPI">

            <span>UPI Payment</span>

        </label>

        <label class="payment-option">

            <input
            type="radio"
            name="paymentMode"
            value="CARD">

            <span>Credit / Debit Card</span>

        </label>

    </div>

    <!-- ORDER SUMMARY -->

    <div class="card">

        <div class="card-title">
            Order Summary
        </div>

        <%
        if(cart != null){
            for(CartItem item : cart){
        %>

        <div class="order-item">

            <div class="food-details">

                <div class="food-name">
                    <%= item.getItemName() %>
                </div>

                <div class="food-qty">
                    Quantity : <%= item.getQuantity() %>
                </div>

            </div>

            <div class="food-price">
                ₹<%= item.getTotalPrice() %>
            </div>

        </div>

        <%
            }
        }
        %>

    </div>

    <!-- BILL DETAILS -->

    <div class="card">

        <div class="card-title">
            Bill Details
        </div>

        <div class="bill-row">
            <span>Item Total</span>
            <span>₹<%= itemTotal %></span>
        </div>

        <div class="bill-row">
            <span>Delivery Fee</span>
            <span>₹<%= deliveryFee %></span>
        </div>

        <div class="bill-row">
            <span>Platform Fee</span>
            <span>₹<%= platformFee %></span>
        </div>

        <div class="bill-row">
            <span>GST & Taxes</span>
            <span>₹<%= gst %></span>
        </div>

        <div class="bill-row total-row">
            <span>Grand Total</span>
            <span>₹<%= grandTotal %></span>
        </div>

    </div>

    <!-- BUTTON -->

    <button type="submit" class="place-order-btn">
        Place Order
    </button>

</form>

</div>

</body>
</html>