<%-- 
    Document   : product-details
    Created on : Mar 5, 2023, 3:05:06 PM
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
        <title>Amado - Furniture Ecommerce Template | Product Details</title>

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

            <!-- Product Details Area Start -->
            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mt-50">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Genre</a></li>
<!--                                    <li class="breadcrumb-item"><a href="#">Chairs</a></li>-->
                                    <li class="breadcrumb-item active" aria-current="page">Bookname</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-lg-7">
                            <div class="single_product_thumb">
                                <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(img/book-cover/example.jpg);">
                                        </li>
                                        <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(img/author-img/example.jpg);">
                                        </li>
                                        <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/genre-img/example.jpg);">
<!--                                        </li>
                                        <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/product-img/pro-big-4.jpg);">
                                        </li>-->
                                    </ol>
                                    <div class="carousel-inner"> 
                                        <div class="carousel-item active">
                                            <a class="gallery_img" href="img/book-cover/example.jpg">
                                                <img class="d-block w-100" src="img/book-cover/example.jpg" alt="First slide">
                                            </a>
                                        </div>
                                        <div class="carousel-item">
                                            <a class="gallery_img" href="img/author-img/example.jpg">
                                                <img class="d-block w-100" src="img/author-img/example.jpg" alt="Second slide">
                                            </a>
                                        </div>
                                        <div class="carousel-item">
                                            <a class="gallery_img" href="img/genre-img/example.jpg">
                                                <img class="d-block w-100" src="img/genre-img/example.jpg" alt="Third slide">
                                            </a>
                                        </div>
<!--                                        <div class="carousel-item">
                                            <a class="gallery_img" href="img/product-img/pro-big-4.jpg">
                                                <img class="d-block w-100" src="img/product-img/pro-big-4.jpg" alt="Fourth slide">
                                            </a>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-5">
                            <div class="single_product_desc">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <p class="product-price">Book price $$$</p>
                                    <a href="product-details.jsp">
                                        <h6>Book name</h6>
                                    </a>
                                    <!-- Ratings & Review -->
                                    <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                        <div class="ratings">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </div>
                                        <div class="review">
                                            <a href="#">Write A Review</a>
                                        </div>
                                    </div>
                                    <!-- Avaiable -->
                                    <p class="avaibility"><i class="fa fa-circle"></i> In Stock</p>
                                </div>

                                <div class="short_overview my-5">
                                    <p>Book description</p>
                                    <p>
                                    <h4>Author's name</h4>
                                        Author description
                                    </p>
                                </div>

                                <!-- Add to Cart Form -->
                                <form class="cart clearfix" method="post">
                                    <div class="cart-btn d-flex mb-50">
                                        <p>Qty</p>
                                        <div class="quantity">
                                            <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if (!isNaN(qty) & amp; & amp; qty & gt; 1) effect.value--; return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                            <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                            <span class="qty-plus" onclick="var effect = document.getElementById('qty');
                                                    var qty = effect.value;
                                                    if (!isNaN(qty))
                                                        effect.value++;
                                                    return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                    <button type="submit" name="addtocart" value="5" class="btn amado-btn">Add to cart</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product Details Area End -->
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