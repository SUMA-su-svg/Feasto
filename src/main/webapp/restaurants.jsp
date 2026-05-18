<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.foodapp.model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Restaurants | Food Delivery</title>

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
    padding:100px 40px 40px;
}

/* ================= TOP SECTION ================= */

.top-section{
    margin-bottom:35px;
}

.page-title{
    font-size:42px;
    font-weight:700;
    margin-bottom:8px;
}

.page-subtitle{
    color:#666;
    font-size:16px;
}

/* ================= SEARCH ================= */

.search-container{
    position:relative;
    width:100%;
    margin-top:30px;
}

.search-box{
    width:100%;
    padding:18px 22px;
    border:none;
    border-radius:18px;
    background:white;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
    outline:none;
    font-size:16px;
    font-family:'Poppins',sans-serif;
}

/* ================= SUGGESTIONS ================= */

.suggestions{
    position:absolute;
    width:100%;
    background:white;
    border-radius:18px;
    margin-top:8px;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
    overflow:hidden;
    z-index:100;
    display:none;
}

.suggestion-item{
    padding:15px 20px;
    cursor:pointer;
    transition:0.2s;
    border-bottom:1px solid #eee;
    font-size:15px;
}

.suggestion-item:hover{
    background:#fff1f1;
}

.no-result{
    padding:15px 20px;
    color:#999;
    font-size:15px;
}

/* ================= GRID ================= */

.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill, minmax(300px, 1fr));
    gap:30px;
}

/* ================= CARD ================= */

.restaurant-card{
    background:white;
    border-radius:24px;
    overflow:hidden;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
    transition:0.3s;
}

.restaurant-card:hover{
    transform:translateY(-6px);
}

/* ================= IMAGE ================= */

.restaurant-image{
    width:100%;
    height:230px;
    object-fit:cover;
}

/* ================= CONTENT ================= */

.card-content{
    padding:22px;
}

.restaurant-name{
    font-size:25px;
    font-weight:600;
    margin-bottom:10px;
}

.restaurant-address{
    color:#666;
    font-size:14px;
    line-height:1.6;
    margin-bottom:16px;
}

/* ================= DETAILS ================= */

.restaurant-details{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:22px;
}

.rating{
    background:#1ba672;
    color:white;
    padding:7px 12px;
    border-radius:10px;
    font-size:14px;
    font-weight:500;
}

.phone{
    color:#555;
    font-size:14px;
}

/* ================= BUTTON ================= */

.view-btn{
    display:block;
    width:100%;
    text-align:center;
    padding:14px;
    border:none;
    border-radius:14px;
    background:#e23744;
    color:white;
    text-decoration:none;
    font-size:15px;
    font-weight:600;
    transition:0.3s;
}

.view-btn:hover{
    background:#c81d2a;
}

/* ================= EMPTY ================= */

.empty-box{
    width:100%;
    background:white;
    padding:60px 20px;
    border-radius:24px;
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

@media(max-width:700px){

    .main-container{
        padding:90px 15px 30px;
    }

    .page-title{
        font-size:32px;
    }

    .restaurant-grid{
        grid-template-columns:1fr;
    }

    .search-box{
        padding:16px 18px;
        font-size:15px;
    }
}

</style>

<script>

function searchRestaurant(){

    let input = document
    .getElementById("searchInput")
    .value
    .toLowerCase();

    let cards = document.getElementsByClassName("restaurant-card");

    let suggestionsBox = document.getElementById("suggestions");

    suggestionsBox.innerHTML = "";

    let found = false;

    for(let i = 0; i < cards.length; i++){

        let restaurantName = cards[i]
        .querySelector(".restaurant-name")
        .innerText
        .toLowerCase();

        if(restaurantName.includes(input)){

            cards[i].style.display = "block";

            found = true;

            let div = document.createElement("div");

            div.classList.add("suggestion-item");

            div.innerText = cards[i]
            .querySelector(".restaurant-name")
            .innerText;

            div.onclick = function(){

                document.getElementById("searchInput").value = div.innerText;

                suggestionsBox.style.display = "none";

                searchRestaurant();
            };

            suggestionsBox.appendChild(div);
        }
        else{
            cards[i].style.display = "none";
        }
    }

    suggestionsBox.style.display = "block";

    if(input === ""){

        suggestionsBox.style.display = "none";

        for(let i = 0; i < cards.length; i++){
            cards[i].style.display = "block";
        }

        return;
    }

    if(!found){

        let noDiv = document.createElement("div");

        noDiv.classList.add("no-result");

        noDiv.innerText = "No restaurant found";

        suggestionsBox.appendChild(noDiv);
    }
}

// HIDE SUGGESTIONS

document.addEventListener("click", function(e){

    if(!document.querySelector(".search-container").contains(e.target)){

        document.getElementById("suggestions").style.display = "none";
    }
});

</script>

</head>

<body>

<!-- HEADER -->

<jsp:include page="components/header.jsp" />

<div class="main-container">

    <!-- TOP SECTION -->

    <div class="top-section">

        <div class="page-title">
            Discover Restaurants 🍽️
        </div>

        <div class="page-subtitle">
            Order food from your favorite restaurants
        </div>

        <!-- SEARCH -->

        <div class="search-container">

            <input
            type="text"
            id="searchInput"
            class="search-box"
            placeholder="🔍 Search restaurants, foods, cuisines..."
            onkeyup="searchRestaurant()"
            onclick="searchRestaurant()">

            <div class="suggestions"
            id="suggestions"></div>

        </div>

    </div>

    <!-- RESTAURANTS GRID -->

    <div class="restaurant-grid">

<%
List<Restaurant> restaurants =
(List<Restaurant>)request.getAttribute("restaurants");

if(restaurants != null && !restaurants.isEmpty()){

    for(Restaurant r : restaurants){
%>

        <!-- CARD -->

        <div class="restaurant-card">

            <!-- IMAGE -->

            <img
            class="restaurant-image"
            src="<%=r.getImage()%>"
            alt="restaurant">

            <!-- CONTENT -->

            <div class="card-content">

                <div class="restaurant-name">
                    <%=r.getName()%>
                </div>

                <div class="restaurant-address">
                    <%=r.getAddress()%>
                </div>

                <!-- DETAILS -->

                <div class="restaurant-details">

                    <div class="rating">
                        ⭐ <%=r.getRating()%>
                    </div>

                    <div class="phone">
                        📞 <%=r.getPhone()%>
                    </div>

                </div>

                <!-- BUTTON -->

                <a class="view-btn"
                href="menu?restaurantId=<%=r.getRestaurantId()%>">

                    View Menu

                </a>

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

            <h2>No Restaurants Found</h2>

            <p>
                Restaurants will appear here once added.
            </p>

        </div>

<%
}
%>

    </div>

</div>

</body>
</html>