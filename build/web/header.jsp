<%-- 
    Document   : header
    Created on : Mar 5, 2023, 3:59:38 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOUser, dao.DAOOrder, entity.User" %>
<!DOCTYPE html>

<html>
    <%
        User user = (User)session.getAttribute("user");
        Integer user_id = (user == null ? 0 : user.getId());
        DAOUser du = new DAOUser();
        DAOOrder dOrder = new DAOOrder();
    %>
    <!-- Mobile Nav (max width 767px)-->
    <div class="mobile-nav">
        <!-- Navbar Brand -->
        <div class="amado-navbar-brand">
            <a href="homepage.jsp"><img src="img/core-img/logo4.png" alt=""></a>
        </div>
        <!-- Navbar Toggler -->
        <div class="amado-navbar-toggler">
            <span></span><span></span><span></span>
        </div>
    </div>

    <!-- Header Area Start -->
    <header class="header-area clearfix">
        <!-- Close Icon -->
        <div class="nav-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <!-- Logo -->
        <div class="logo">
            <a href="homepage.jsp"><img src="img/core-img/logo4.png" alt=""></a>
        </div>
        <!-- Amado Nav -->
        <nav class="amado-nav">
            <ul>
                <li class="active"><a href="homepage.jsp">Home</a></li>
                <li><a href="shopController">Shop</a></li>
            </ul>
        </nav>
        <!-- Button Group -->
        <div class="amado-btn-group mt-30 mb-100">
            <a href="<%=(user_id != 0 ? "logoutController" : "loginController")%>" class="btn amado-btn mb-15"><%=(user_id == 0 ? "Log In" : "Log Out")%></a>
        </div>
        <%if(user_id != 0) { %>
        <div>
            <label for="username"><img width="50px" height="50px" src="img/core-img/conongcute2.png"></label>
            <h5 id="username"><%=user.getFirstName() + " " + user.getLastName()%></h5>
        </div>
        <% } else { %>
        <div>
            <label for="username"><img width="50px" height="50px" src="img/core-img/anonymous.png"></label>
            <h5 id="username">Anonymous</h5>
        </div>
        <% } %>
        <!-- Cart Menu -->
        <div class="cart-fav-search mb-100">
            <a href="<%=(user_id != 0 ? "cartController" : "loginController")%>" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(<%=dOrder.getOrderDetails(du.getCurrentOrders(user_id).getId()).size()%>)</span></a>
            <a href="accInfoController"><img src="img/core-img/favorites.png" alt=""> Account Info</a>
            <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
        </div>
        <!-- Social Button -->
        <div class="social-info d-flex justify-content-between">
            <a href="https://www.pinterest.com"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
            <a href="https://www.pinterest.com"><i class="fa fa-instagram" aria-hidden="true"></i></a>
            <a href="https://www.facebook.com"><i class="fa fa-facebook" aria-hidden="true"></i></a>
            <a href="https://twitter.com/?lang=vi"><i class="fa fa-twitter" aria-hidden="true"></i></a>
        </div>
    </header>
    <!-- Header Area End -->
</html>
