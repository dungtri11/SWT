<%-- 
    Document   : header
    Created on : Mar 5, 2023, 3:59:38 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <!-- Mobile Nav (max width 767px)-->
    <div class="mobile-nav">
        <!-- Navbar Brand -->
        <div class="amado-navbar-brand">
            <a href="homepage.jsp"><img src="img/core-img/logo.png" alt=""></a>
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
            <a href="homepage.jsp"><img src="img/core-img/logo.png" alt=""></a>
        </div>
        <!-- Amado Nav -->
        <nav class="amado-nav">
            <ul>
                <li class="active"><a href="homepage.jsp">Home</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="product-details.jsp">Product</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="checkout.jsp">Checkout</a></li>
            </ul>
        </nav>
        <!-- Button Group -->
        <div class="amado-btn-group mt-30 mb-100">
            <a href="#" class="btn amado-btn mb-15">%Discount%</a>
            <a href="#" class="btn amado-btn active">New this week</a>
        </div>
        <!-- Cart Menu -->
        <div class="cart-fav-search mb-100">
            <a href="cart.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
            <a href="#" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Account Info</a>
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
