<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page session="true" %>

<style>
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #1e1e1e;
    padding: 15px 40px;
}

.nav-left {
    font-size: 22px;
    color: #ff4d4d;
    font-weight: bold;
}

.nav-center input {
    padding: 8px;
    border-radius: 5px;
    border: none;
    width: 250px;
}

.nav-right a {
    margin-left: 15px;
    color: white;
    text-decoration: none;
}
</style>

<div class="navbar">

    <!-- Logo -->
    <div class="nav-left">🍔 Feasto</div>

    <!-- Search -->
    <div class="nav-center">
        <input type="text" placeholder="Search food...">
    </div>

    <!-- Right Links -->
    <div class="nav-right">

        <a href="${pageContext.request.contextPath}/restaurants">Home</a>

        <%
            Object user = session.getAttribute("user");
            if(user == null){
        %>
            <a href="login.jsp">Login</a>
        <%
            } else {
        %>
            <a href="profile">Profile</a>
            <a href="cart.jsp">Cart</a>
            <a href="logout">Logout</a>
        <%
            }
        %>

    </div>

</div>