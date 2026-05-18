<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.foodapp.model.CartItem" %>

<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
String message = (String) request.getAttribute("message");

if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
    return;
}

double grandTotal = 0;
int totalItems = 0;

if(cart != null){
    for(CartItem item : cart){
        grandTotal += item.getTotalPrice();
        totalItems += item.getQuantity();
    }
}

double deliveryFee = 40;
double platformFee = 10;
double gst = 20;

double finalTotal = grandTotal + deliveryFee + platformFee + gst;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Cart | Food Delivery</title>

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

/* ================= MESSAGE ================= */

.popup{
    background:#16a34a;
    color:white;
    padding:14px;
    border-radius:12px;
    margin-bottom:20px;
}

.warning{
    background:#dc2626;
}

/* ================= CART CARD ================= */

.cart-card{
    background:white;
    border-radius:18px;
    padding:18px;
    margin-bottom:20px;
    display:flex;
    gap:18px;
    align-items:center;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
    transition:0.3s;
}

.cart-card:hover{
    transform:translateY(-2px);
}

.food-img{
    width:120px;
    height:120px;
    border-radius:16px;
    object-fit:cover;
}

/* ================= DETAILS ================= */

.food-details{
    flex:1;
}

.food-name{
    font-size:22px;
    font-weight:600;
    margin-bottom:8px;
}

.food-desc{
    color:#666;
    font-size:14px;
    margin-bottom:10px;
}

.food-price{
    color:#e23744;
    font-size:18px;
    font-weight:600;
    margin-bottom:15px;
}

/* ================= QUANTITY ================= */

.qty-wrapper{
    display:flex;
    align-items:center;
    gap:12px;
}

.qty-btn{
    width:34px;
    height:34px;
    border:none;
    border-radius:50%;
    background:#e23744;
    color:white;
    font-size:20px;
    cursor:pointer;
    transition:0.3s;
}

.qty-btn:hover{
    background:#c81d2a;
}

.qty{
    font-size:18px;
    font-weight:600;
}

/* ================= RIGHT SIDE ================= */

.card-right{
    text-align:right;
}

.item-total{
    font-size:20px;
    font-weight:700;
    margin-bottom:15px;
}

.remove-btn{
    border:none;
    background:#fff0f0;
    color:#e23744;
    padding:10px 16px;
    border-radius:10px;
    cursor:pointer;
    font-weight:500;
    transition:0.3s;
}

.remove-btn:hover{
    background:#ffe2e2;
}

/* ================= BILL CARD ================= */

.bill-card{
    background:white;
    border-radius:18px;
    padding:25px;
    margin-top:25px;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
}

.bill-title{
    font-size:24px;
    font-weight:700;
    margin-bottom:20px;
}

.bill-row{
    display:flex;
    justify-content:space-between;
    margin-bottom:16px;
    color:#444;
}

.total-row{
    border-top:1px solid #ddd;
    padding-top:18px;
    margin-top:18px;
    font-size:22px;
    font-weight:700;
    color:#111;
}

/* ================= BUTTONS ================= */

.add-more-btn{
    display:inline-block;
    margin-top:15px;
    text-decoration:none;
    background:#222;
    color:white;
    padding:12px 20px;
    border-radius:12px;
    transition:0.3s;
}

.add-more-btn:hover{
    background:#000;
}

.checkout-btn{
    width:100%;
    margin-top:25px;
    padding:16px;
    border:none;
    border-radius:14px;
    background:#e23744;
    color:white;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.checkout-btn:hover{
    background:#c81d2a;
}

/* ================= EMPTY CART ================= */

.empty-cart{
    background:white;
    border-radius:18px;
    padding:60px 20px;
    text-align:center;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
}

.empty-cart img{
    width:150px;
    margin-bottom:20px;
}

.empty-cart h2{
    margin-bottom:10px;
}

.empty-cart p{
    color:#666;
    margin-bottom:25px;
}

/* ================= RESPONSIVE ================= */

@media(max-width:700px){

    .cart-card{
        flex-direction:column;
        align-items:flex-start;
    }

    .food-img{
        width:100%;
        height:220px;
    }

    .card-right{
        width:100%;
        display:flex;
        justify-content:space-between;
        align-items:center;
    }

    .page-title{
        font-size:28px;
    }
}

</style>

<script>

function changeQty(itemId, price, action){

    let qtyEl = document.getElementById("qty_" + itemId);
    let totalEl = document.getElementById("total_" + itemId);

    let qty = parseInt(qtyEl.innerText);

    if(action === "plus"){
        qty++;
    }

    if(action === "minus" && qty > 1){
        qty--;
    }

    qtyEl.innerText = qty;

    totalEl.innerText = "₹" + (qty * price);

    document.getElementById("inputQty_" + itemId).value = qty;

    document.getElementById("form_" + itemId).submit();
}

function confirmDelete(formId){

    if(confirm("Remove this item from cart?")){
        document.getElementById(formId).submit();
    }
}

</script>

</head>

<body>

<!-- HEADER -->
<jsp:include page="components/header.jsp" />

<div class="main-container">

<div class="page-title">
    Your Cart
</div>

<div class="page-subtitle">
    <%= totalItems %> item(s) added in cart 🛒
</div>

<% if(message != null){ %>

<div class="popup <%= message.contains("⚠️") ? "warning" : "" %>">
    <%= message %>
</div>

<% } %>

<% if(cart != null && !cart.isEmpty()){ %>

<!-- ================= CART ITEMS ================= -->

<%
for(CartItem item : cart){
%>

<div class="cart-card">

    <!-- IMAGE -->

    <img class="food-img"
    src="<%= (item.getImageUrl() != null && !item.getImageUrl().isEmpty())
    ? item.getImageUrl()
    : "https://via.placeholder.com/300" %>">

    <!-- DETAILS -->

    <div class="food-details">

        <div class="food-name">
            <%= item.getItemName() %>
        </div>

        <div class="food-desc">
            Fresh and delicious food prepared with quality ingredients.
        </div>

        <div class="food-price">
            ₹<%= item.getPrice() %>
        </div>

        <!-- QUANTITY -->

        <div class="qty-wrapper">

            <button class="qty-btn"
            onclick="changeQty(<%=item.getItemId()%>, <%=item.getPrice()%>, 'minus')">
            −
            </button>

            <span class="qty"
            id="qty_<%=item.getItemId()%>">

                <%= item.getQuantity() %>

            </span>

            <button class="qty-btn"
            onclick="changeQty(<%=item.getItemId()%>, <%=item.getPrice()%>, 'plus')">
            +
            </button>

        </div>

        <!-- UPDATE FORM -->

        <form id="form_<%=item.getItemId()%>"
        action="cart"
        method="post">

            <input type="hidden"
            name="action"
            value="update">

            <input type="hidden"
            name="itemId"
            value="<%=item.getItemId()%>">

            <input type="hidden"
            id="inputQty_<%=item.getItemId()%>"
            name="quantity"
            value="<%=item.getQuantity()%>">

        </form>

    </div>

    <!-- RIGHT -->

    <div class="card-right">

        <div class="item-total"
        id="total_<%=item.getItemId()%>">

            ₹<%= item.getTotalPrice() %>

        </div>

        <!-- DELETE -->

        <form id="delete_<%=item.getItemId()%>"
        action="cart"
        method="post">

            <input type="hidden"
            name="action"
            value="delete">

            <input type="hidden"
            name="itemId"
            value="<%=item.getItemId()%>">

            <button type="button"
            class="remove-btn"
            onclick="confirmDelete('delete_<%=item.getItemId()%>')">

                Remove

            </button>

        </form>

    </div>

</div>

<%
}
%>

<!-- ================= ADD MORE ================= -->

<%
Integer restaurantId = (Integer) session.getAttribute("restaurantId");
%>

<a class="add-more-btn"
href="menu?restaurantId=<%= restaurantId %>">

    + Add More Items

</a>

<!-- ================= BILL DETAILS ================= -->

<div class="bill-card">

    <div class="bill-title">
        Bill Details
    </div>

    <div class="bill-row">
        <span>Item Total</span>
        <span>₹<%= grandTotal %></span>
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
        <span>₹<%= finalTotal %></span>
    </div>

    <!-- CHECKOUT -->

    <form action="${pageContext.request.contextPath}/checkout"
    method="get">

        <button class="checkout-btn">
            Proceed to Checkout
        </button>

    </form>

</div>

<% } else { %>

<!-- ================= EMPTY CART ================= -->

<div class="empty-cart">

    <img src="https://cdn-icons-png.flaticon.com/512/2038/2038854.png">

    <h2>Your Cart is Empty</h2>

    <p>
        Looks like you haven't added any food items yet.
    </p>

    <a class="add-more-btn" href="home.jsp">
        Browse Restaurants
    </a>

</div>

<% } %>

</div>

</body>
</html>