<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.foodapp.model.Menu"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Menu | Food Delivery</title>

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
    color:#222;
}

/* ================= MAIN ================= */

.main-container{
    width:100%;
    padding:100px 25px 40px;
}

/* ================= TOP SECTION ================= */

.top-section{
    margin-bottom:35px;
}

.page-title{
    font-size:38px;
    font-weight:700;
    margin-bottom:8px;
}

.page-subtitle{
    color:#666;
    font-size:15px;
}

/* ================= SEARCH BAR ================= */

.search-box{
    margin-top:25px;
    width:100%;
    max-width:500px;
}

.search-box input{
    width:100%;
    padding:15px 18px;
    border:none;
    border-radius:14px;
    background:white;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
    outline:none;
    font-size:15px;
}

/* ================= MENU GRID ================= */

.menu-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill, minmax(290px, 1fr));
    gap:28px;
}

/* ================= CARD ================= */

.menu-card{
    background:white;
    border-radius:22px;
    overflow:hidden;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
    transition:0.3s;
    position:relative;
}

.menu-card:hover{
    transform:translateY(-6px);
}

/* ================= IMAGE ================= */

.menu-image{
    width:100%;
    height:220px;
    object-fit:cover;
}

/* ================= BADGE ================= */

.badge{
    position:absolute;
    top:15px;
    left:15px;
    background:#e23744;
    color:white;
    padding:7px 12px;
    border-radius:30px;
    font-size:13px;
    font-weight:500;
}

/* ================= CONTENT ================= */

.card-content{
    padding:20px;
}

.food-name{
    font-size:22px;
    font-weight:600;
    margin-bottom:10px;
}

.food-desc{
    color:#666;
    font-size:14px;
    line-height:1.6;
    height:45px;
    overflow:hidden;
}

/* ================= DETAILS ================= */

.food-details{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:18px;
}

.price{
    color:#e23744;
    font-size:22px;
    font-weight:700;
}

.rating{
    background:#1ba672;
    color:white;
    padding:6px 10px;
    border-radius:10px;
    font-size:13px;
    font-weight:500;
}

/* ================= BUTTON ================= */

.add-btn{
    width:100%;
    margin-top:20px;
    padding:14px;
    border:none;
    border-radius:14px;
    background:#e23744;
    color:white;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.add-btn:hover{
    background:#c81d2a;
}

/* ================= EMPTY ================= */

.empty-box{
    width:100%;
    background:white;
    padding:60px 20px;
    border-radius:22px;
    text-align:center;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
}

.empty-box img{
    width:170px;
    margin-bottom:20px;
}

.empty-box h2{
    margin-bottom:10px;
}

.empty-box p{
    color:#666;
}

/* ================= RESPONSIVE ================= */

@media(max-width:600px){

    .main-container{
        padding:90px 15px 30px;
    }

    .page-title{
        font-size:30px;
    }

    .menu-grid{
        grid-template-columns:1fr;
    }
}

</style>

<script>

function searchFood(){

    let input = document.getElementById("searchInput").value.toLowerCase();

    let cards = document.getElementsByClassName("menu-card");

    for(let i = 0; i < cards.length; i++){

        let foodName = cards[i]
        .querySelector(".food-name")
        .innerText
        .toLowerCase();

        if(foodName.includes(input)){
            cards[i].style.display = "block";
        }
        else{
            cards[i].style.display = "none";
        }
    }
}

</script>

</head>

<body>

<!-- HEADER -->

<jsp:include page="components/header.jsp" />

<div class="main-container">

    <!-- TOP SECTION -->

    <div class="top-section">

        <div class="page-title">
            Explore Menu 🍔
        </div>

        <div class="page-subtitle">
            Discover delicious dishes and add your favorites to cart
        </div>

        <!-- SEARCH -->

        <div class="search-box">

            <input
            type="text"
            id="searchInput"
            placeholder="Search food items..."
            onkeyup="searchFood()">

        </div>

    </div>

    <!-- MENU GRID -->

    <div class="menu-grid">

<%
List<Menu> menuList = (List<Menu>)request.getAttribute("menuList");

if(menuList != null && !menuList.isEmpty()) {

    for(Menu m : menuList) {
%>

        <!-- CARD -->

        <div class="menu-card">

            <!-- IMAGE -->

            <img
            class="menu-image"
            src="<%=m.getImage()%>"
            alt="food">

            <!-- BADGE -->

            <div class="badge">
                Bestseller
            </div>

            <!-- CONTENT -->

            <div class="card-content">

                <div class="food-name">
                    <%=m.getItemName()%>
                </div>

                <div class="food-desc">
                    <%=m.getDescription()%>
                </div>

                <!-- DETAILS -->

                <div class="food-details">

                    <div class="price">
                        ₹<%=m.getPrice()%>
                    </div>

                    <div class="rating">
                        ⭐ 4.5
                    </div>

                </div>

                <!-- FORM -->

                <form action="cart" method="post">

                    <input
                    type="hidden"
                    name="itemId"
                    value="<%=m.getMenuId()%>">

                    <input
                    type="hidden"
                    name="itemName"
                    value="<%=m.getItemName()%>">

                    <input
                    type="hidden"
                    name="price"
                    value="<%=m.getPrice()%>">

                    <input
                    type="hidden"
                    name="quantity"
                    value="1">

                    <input
                    type="hidden"
                    name="restaurantId"
                    value="<%=request.getAttribute("restaurantId")%>">

                    <input
                    type="hidden"
                    name="action"
                    value="add">

                    <input
                    type="hidden"
                    name="imageUrl"
                    value="<%=m.getImage()%>">

                    <button class="add-btn">
                        Add to Cart 🛒
                    </button>

                </form>

            </div>

        </div>

<%
    }
}
else{
%>

        <!-- EMPTY -->

        <div class="empty-box">

            <img src="https://cdn-icons-png.flaticon.com/512/706/706164.png">

            <h2>No Menu Available</h2>

            <p>
                Menu items will appear here once added.
            </p>

        </div>

<%
}
%>

    </div>

</div>

</body>
</html>