<%-- 
    Document   : product-details
    Created on : Mar 5, 2023, 3:05:06 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOGenre, entity.Genre" %>
<%@page import="dao.DAOAuthor, entity.Author" %>
<%@page import="dao.DAOBook, entity.Book" %>
<%@page import="dao.DAOUser, entity.User" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>ConOng Bookstore | Product Details</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/conongcute.png">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

    </head>

    <body>
        <%
            User user = (User)session.getAttribute("user");
            Integer user_id = (user == null ? 0 : user.getId());
            DAOUser du = new DAOUser();
            DAOGenre dg = new DAOGenre();
            DAOAuthor da = new DAOAuthor();
            DAOBook db = new DAOBook();
            int bookid = Integer.parseInt((request.getParameter("books") == null ? "0" : request.getParameter("books")));;
        %>
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
                                    <li class="breadcrumb-item"><a href="#"><%=dg.getGenre(db.getBook(bookid).getGenreId()).getName()%></a></li>
                                    <!--                                    <li class="breadcrumb-item"><a href="#">Chairs</a></li>-->

                                    <li class="breadcrumb-item active" aria-current="page"><%=db.getBook(bookid).getTitle()%></li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 col-lg-7">
                            <div class="single_product_thumb">
                                <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(img/books-img/<%=db.getBook(bookid).getImage()%>);">
                                        </li>
                                        <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(img/authors-img/<%=da.getAuthor(db.getBook(bookid).getAuthorId()).getImage()%>);">
                                        </li>
                                        <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/genres-img/<%=dg.getGenre(db.getBook(bookid).getGenreId()).getImage()%>);">
                                            <!--                                        </li>
                                                                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/product-img/pro-big-4.jpg);">
                                                                                    </li>-->
                                    </ol>
                                    <div class="carousel-inner"> 
                                        <div class="carousel-item active">
                                            <a class="gallery_img" href="img/book-cover/example.jpg">
                                                <img class="d-block w-100" src="img/books-img/<%=db.getBook(bookid).getImage()%>" alt="First slide">
                                            </a>
                                        </div>
                                        <div class="carousel-item">
                                            <a class="gallery_img" href="img/author-img/example.jpg">
                                                <img class="d-block w-100" src="img/authors-img/<%=da.getAuthor(db.getBook(bookid).getAuthorId()).getImage()%>" alt="Second slide">
                                            </a>
                                        </div>
                                        <div class="carousel-item">
                                            <a class="gallery_img" href="img/genre-img/example.jpg">
                                                <img class="d-block w-100" src="img/genres-img/<%=dg.getGenre(db.getBook(bookid).getGenreId()).getImage()%>" alt="Third slide">
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
                                    <p class="product-price"><%=db.getBook(bookid).getPrice()%> $$$</p>
                                    <a href="product-details.jsp">
                                        <h6><%=db.getBook(bookid).getTitle()%></h6>
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
                                    <p><%=db.getBook(7).getDescription()%></p>
                                    <p>
                                    <h3><%=da.getAuthor(db.getBook(bookid).getAuthorId()).getName()%></h3>
                                    <p><%=da.getAuthor(db.getBook(bookid).getAuthorId()).getDescription()%></p>
                                    </p>
                                </div>

                                <!-- Add to Cart Form -->
                                <form class="cart clearfix" action="quantityController" method="post">
                                    <input type="hidden" name="books" value="<%=bookid%>">
                                    <input type="hidden" name="orders" value="<%=du.getCurrentOrders(user_id).getId()%>">
                                    <button type="submit" name="quantity" value="add" class="btn amado-btn">Add to cart</button>
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