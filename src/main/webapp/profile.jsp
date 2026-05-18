<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.foodapp.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>My Profile | Food Delivery</title>

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
    max-width:850px;
    margin:auto;
    padding:100px 20px 40px;
}

/* ================= PROFILE CARD ================= */

.profile-card{
    background:white;
    border-radius:28px;
    overflow:hidden;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
}

/* ================= TOP SECTION ================= */

.profile-top{
    background:
    linear-gradient(rgba(226,55,68,0.9),
    rgba(226,55,68,0.9)),
    url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?q=80&w=2070&auto=format&fit=crop');

    background-size:cover;
    background-position:center;

    padding:45px 30px;
    text-align:center;
    color:white;
}

/* PROFILE IMAGE */

.profile-image{
    width:110px;
    height:110px;
    border-radius:50%;
    background:white;
    color:#e23744;
    margin:auto;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:45px;
    font-weight:700;
    margin-bottom:18px;
    border:5px solid rgba(255,255,255,0.4);
}

.profile-name{
    font-size:32px;
    font-weight:700;
    margin-bottom:8px;
}

.profile-email{
    font-size:15px;
    opacity:0.9;
}

/* ================= CONTENT ================= */

.profile-content{
    padding:35px 30px;
}

/* ================= INFO BOX ================= */

.info-box{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:18px 0;
    border-bottom:1px solid #eee;
}

.info-left{
    display:flex;
    flex-direction:column;
}

.info-label{
    font-size:13px;
    color:#888;
    margin-bottom:5px;
}

.info-value{
    font-size:17px;
    font-weight:500;
}

/* ================= BUTTONS ================= */

.button-group{
    display:flex;
    gap:15px;
    flex-wrap:wrap;
    margin-top:30px;
}

.btn{
    padding:14px 22px;
    border:none;
    border-radius:14px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

/* EDIT */

.edit-btn{
    background:#e23744;
    color:white;
}

.edit-btn:hover{
    background:#c81d2a;
    transform:translateY(-2px);
}

/* SAVE */

.save-btn{
    background:#16a34a;
    color:white;
}

.save-btn:hover{
    background:#15803d;
}

/* LOGOUT */

.logout-btn{
    background:#dc2626;
    color:white;
}

.logout-btn:hover{
    background:#b91c1c;
}

/* CANCEL */

.cancel-btn{
    background:#ddd;
    color:#333;
}

.cancel-btn:hover{
    background:#ccc;
}

/* ================= EDIT FORM ================= */

.input-group{
    margin-bottom:22px;
}

.input-label{
    display:block;
    margin-bottom:8px;
    font-size:14px;
    font-weight:500;
    color:#444;
}

.input-box{
    width:100%;
    padding:15px;
    border:1px solid #ddd;
    border-radius:14px;
    outline:none;
    font-size:15px;
    transition:0.3s;
    font-family:'Poppins',sans-serif;
}

.input-box:focus{
    border-color:#e23744;
}

/* ================= RESPONSIVE ================= */

@media(max-width:600px){

    .profile-content{
        padding:25px 18px;
    }

    .profile-top{
        padding:35px 20px;
    }

    .profile-name{
        font-size:26px;
    }

    .button-group{
        flex-direction:column;
    }

    .btn{
        width:100%;
    }

    .info-box{
        flex-direction:column;
        align-items:flex-start;
        gap:8px;
    }
}

</style>

<script>

// ENABLE EDIT MODE

function enableEdit(){

    document.getElementById("viewMode").style.display = "none";

    document.getElementById("editMode").style.display = "block";
}

// CANCEL EDIT MODE

function cancelEdit(){

    document.getElementById("editMode").style.display = "none";

    document.getElementById("viewMode").style.display = "block";
}

</script>

</head>

<body>

<!-- HEADER -->

<jsp:include page="components/header.jsp" />

<div class="main-container">

    <div class="profile-card">

        <!-- TOP SECTION -->

        <div class="profile-top">

            <div class="profile-image">

                <%= user.getName().substring(0,1).toUpperCase() %>

            </div>

            <div class="profile-name">
                <%= user.getName() %>
            </div>

            <div class="profile-email">
                <%= user.getEmail() %>
            </div>

        </div>

        <!-- CONTENT -->

        <div class="profile-content">

            <!-- ================= VIEW MODE ================= -->

            <div id="viewMode">

                <!-- NAME -->

                <div class="info-box">

                    <div class="info-left">

                        <div class="info-label">
                            Full Name
                        </div>

                        <div class="info-value">
                            <%= user.getName() %>
                        </div>

                    </div>

                </div>

                <!-- EMAIL -->

                <div class="info-box">

                    <div class="info-left">

                        <div class="info-label">
                            Email Address
                        </div>

                        <div class="info-value">
                            <%= user.getEmail() %>
                        </div>

                    </div>

                </div>

                <!-- PHONE -->

                <div class="info-box">

                    <div class="info-left">

                        <div class="info-label">
                            Phone Number
                        </div>

                        <div class="info-value">
                            <%= user.getPhone() %>
                        </div>

                    </div>

                </div>

                <!-- ADDRESS -->

                <div class="info-box">

                    <div class="info-left">

                        <div class="info-label">
                            Delivery Address
                        </div>

                        <div class="info-value">
                            <%= user.getAddress() %>
                        </div>

                    </div>

                </div>

                <!-- BUTTONS -->

                <div class="button-group">

                    <button
                    class="btn edit-btn"
                    onclick="enableEdit()">

                        Edit Profile

                    </button>

                    <a href="logout">

                        <button
                        class="btn logout-btn"
                        type="button">

                            Logout

                        </button>

                    </a>

                </div>

            </div>

            <!-- ================= EDIT MODE ================= -->

            <div id="editMode" style="display:none;">

                <form action="updateProfile" method="post">

                    <input
                    type="hidden"
                    name="userId"
                    value="<%= user.getUserId() %>">

                    <!-- NAME -->

                    <div class="input-group">

                        <label class="input-label">
                            Full Name
                        </label>

                        <input
                        class="input-box"
                        type="text"
                        name="name"
                        value="<%= user.getName() %>"
                        required>

                    </div>

                    <!-- EMAIL -->

                    <div class="input-group">

                        <label class="input-label">
                            Email Address
                        </label>

                        <input
                        class="input-box"
                        type="email"
                        name="email"
                        value="<%= user.getEmail() %>"
                        required>

                    </div>

                    <!-- PHONE -->

                    <div class="input-group">

                        <label class="input-label">
                            Phone Number
                        </label>

                        <input
                        class="input-box"
                        type="text"
                        name="phone"
                        value="<%= user.getPhone() %>"
                        required>

                    </div>

                    <!-- ADDRESS -->

                    <div class="input-group">

                        <label class="input-label">
                            Delivery Address
                        </label>

                        <input
                        class="input-box"
                        type="text"
                        name="address"
                        value="<%= user.getAddress() %>"
                        required>

                    </div>

                    <!-- BUTTONS -->

                    <div class="button-group">

                        <button
                        type="submit"
                        class="btn save-btn">

                            Save Changes

                        </button>

                        <button
                        type="button"
                        class="btn cancel-btn"
                        onclick="cancelEdit()">

                            Cancel

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>