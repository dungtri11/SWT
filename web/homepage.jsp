<%-- 
    Document   : HomePage
    Created on : Mar 5, 2023, 2:28:05 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Amado - Furniture Ecommerce Template | Home</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

    </head>

    <body>
        <!-- Search Wrapper Area Start -->
        <div class="search-wrapper section-padding-100">
            <div class="search-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="search-content">
                            <form action="#" method="get">
                                <input type="search" name="search" id="search" placeholder="Type your keyword...">
                                <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Wrapper Area End -->

        <!-- ##### Main Content Wrapper Start ##### -->
        <div class="main-content-wrapper d-flex clearfix">

            <jsp:include page="header.jsp" />

            <!-- Product Catagories Area Start (HIEN THI MOT SO THU HAY HO-->
<!--            VI DU: TAC GIA CO NHIEU SACH NHAT
            THE LOAI CO NHIEU SACH NHAT
            SACH MOI NHAT (CO ID CAO NHAT)
            HOAC NHUNG TINH NANG SE THEM VAO SAU-->
            <div class="products-catagories-area clearfix">
                <div class="amado-pro-catagory clearfix">

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/1.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $180</p>
                                <h4>Modern Chair</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/2.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $180</p>
                                <h4>Minimalistic Plant Pot</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/3.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $180</p>
                                <h4>Modern Chair</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/4.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $180</p>
                                <h4>Night Stand</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/5.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $18</p>
                                <h4>Plant Pot</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/6.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $320</p>
                                <h4>Small Table</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/7.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $318</p>
                                <h4>Metallic Chair</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/8.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $318</p>
                                <h4>Modern Rocking Chair</h4>
                            </div>
                        </a>
                    </div>

                    <!-- Single Catagory -->
                    <div class="single-products-catagory clearfix">
                        <a href="shop.jsp">
                            <img src="img/bg-img/9.jpg" alt="">
                            <!-- Hover Content -->
                            <div class="hover-content">
                                <div class="line"></div>
                                <p>From $318</p>
                                <h4>Home Deco</h4>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- Product Catagories Area End -->
        </div>
        <!-- ##### Main Content Wrapper End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <jsp:include page="footer.jsp" />
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

    </body>

</html>