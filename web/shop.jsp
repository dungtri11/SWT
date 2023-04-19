<%-- 
    Document   : shop
    Created on : Mar 5, 2023, 3:05:44 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
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
        <title>ConOng Bookstore | Shop</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/conongcute2.png">

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
            Vector<Genre> vg = dg.getAllGenre();
            DAOAuthor da = new DAOAuthor();
            Vector<Author> va = da.getAllAuthor();
            DAOBook db = new DAOBook();
            Double range = (request.getParameter("price") == null ? 0.0 : Double.parseDouble(request.getParameter("price")));
            String key = request.getParameter("search");
            Integer author_id = (request.getParameter("authors") == null ? null : Integer.parseInt(request.getParameter("authors")));
            Integer genre_id = (request.getParameter("genres") == null ? null : Integer.parseInt(request.getParameter("genres")));
            String order = request.getParameter("orders");
            Vector<Book> vb = db.searchBook(key, author_id, genre_id, order, range);
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
                            <form action="shopController" method="get">
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

            <div class="shop_sidebar_area">

                <!-- ##### Single Widget ##### -->
                <form action="shopController" method="post"> 
                    <div class="widget brands mb-50">
                        <!-- Widget Title -->
                        <h6 class="widget-title mb-30">Genres</h6>

                        <div class="widget-desc">                       
                            <%for(Genre genre: vg) { %>
                            <div class="form-check">
                                <input type="radio" name="genres" id="genre<%=vg.indexOf(genre)%>" value="<%=genre.getId()%>"/> 
                                <label class="form-check-label" for="genre<%=vg.indexOf(genre)%>"><%=genre.getName()%></label>
                            </div>
                            <% } %>
                        </div>
                    </div>

                    <!-- ##### Single Widget ##### -->
                    <div class="widget brands mb-50">
                        <!-- Widget Title -->
                        <h6 class="widget-title mb-30">Authors</h6>

                        <div class="widget-desc">

                            <%for(Author author: va) { %>
                            <div class="form-check">
                                <input type="radio" name="authors" id="author<%=va.indexOf(author)%>" value="<%=author.getId()%>"/> 
                                <label class="form-check-label" for="author<%=va.indexOf(author)%>"><%=author.getName()%></label>
                            </div>
                            <% } %>
                        </div>
                    </div>


                    <!-- ##### Single Widget ##### -->
                    <div class="widget price mb-50">
                        <!-- Widget Title -->
                        <h6 class="widget-title mb-30">Price</h6>
                        <label for="price">Select price range:</label>
                        <input type="range" id="price" name="price" min="0" max="10" value="0">
                        <span id="price-value"></span>

                    </div>

                    <input class="btn amado-btn mb-15" type="submit" value="Beelter">
                </form>

            </div>

            <div class="amado_product_area section-padding-100">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                                <!-- Total Products -->
                                <div class="total-products">
                                    <p>Showing Room</p>
                                    <div class="view d-flex">
                                        <a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                        <a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                                <!-- Sorting -->
                                <div class="product-sorting d-flex">
                                    <div class="sort-by-date d-flex align-items-center mr-15">
                                        <p>Sort by</p>  
                                        <form action="shopController?<%=(author_id == null ? "" : "authors="+author_id+"&")%><%=(genre_id == null ? "" : "genres="+genre_id+"&")%>" method="post" id="myForm" >

                                            <select name="orders" id="sortBydate" onchange="submit()">
                                                <option value="default" selected disabled></option>
                                                <option value="price" >Price</option>
                                                <option value="atoz">A to Z</option>                                            
                                            </select>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                        <!-- Single Product Area -->


                        <!-- Single Product Area -->


                        <!-- Single Product Area -->


                        <!-- Single Product Area -->


                        <!-- Single Product Area -->

                        <% for(Book book : vb) { %>
                        <!-- Single Product Area -->
                        <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                            <div class="single-product-wrapper">
                                <!-- Product Image -->
                                <div class="product-img">
                                    <img src="img/books-img/<%=book.getImage()%>" alt="">
                                    <!-- Hover Thumb -->
                                </div>

                                <!-- Product Description -->
                                <div class="product-description d-flex align-items-center justify-content-between">
                                    <!-- Product Meta Data -->
                                    <div class="product-meta-data">
                                        <div class="line"></div>
                                        <p class="product-price"><%="$"+book.getPrice()%></p>
                                        <a href="productDetailController?books=<%=book.getId()%>">
                                            <h6><%=book.getTitle()%></h6>
                                            <h6>Author: <%=da.getAuthor(book.getAuthorId()).getName()%></h6>
                                            <h6>Genre: <%=dg.getGenre(book.getGenreId()).getName()%></h6>
                                        </a>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="ratings-cart text-right">
                                        <div class="ratings">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </div>
                                        <div class="cart">
                                            <a href="quantityController?books=<%=book.getId()%>&orders=<%=du.getCurrentOrders(user_id).getId()%>&quantity=add" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <% } %>
                    </div>

                   
                </div>
            </div>
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
        <!-- Active js -->
        <script>
                                                var priceRange = document.getElementById("price");
                                                var priceValue = document.getElementById("price-value");

                                                priceRange.addEventListener("input", function () {
                                                    priceValue.innerHTML = "Price: $" + priceRange.value;
                                                });

        </script>
        <script>
            function submit() {
                document.getElementById("myForm").submit();
            }
        </script>

    </body>

</html>