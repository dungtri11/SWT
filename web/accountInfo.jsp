<%-- 
Document   : cart
Created on : Mar 5, 2023, 3:02:58 PM
Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOBook,dao.DAOOrderDetail,dao.DAOOrder,dao.DAOUser" %>
<%@page import="entity.Order, entity.OrderDetail, entity.User" %>
<%@page import="java.util.Vector, java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>ConOng Bookstore | Cart</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/conongcute2.png">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

    </head>

    <body>
        <%
            User user = (User)session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("loginController?sendTo=cart");
            } else {
        %>
        <%
            Integer user_id = (user == null ? 0 : user.getId());
            DAOUser dUser = new DAOUser();
            DAOOrder dOrder = new DAOOrder();
            Vector<Order> listOrder = dUser.getCheckredOut(user_id);
            
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

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-8">
                            <div class="cart-title mt-50">
                                <h2>Your Orders</h2>
                            </div>

                            <div class="cart-table clearfix">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(Order ord : listOrder) { %>
                                        <tr>
                                            <td class="cart_product_img">
                                                <form action="accInfoController" method="post">
                                                    <input type="hidden" name="id" value="<%=ord.getId()%>">
                                                    <input type="submit" name="submit" value="Cancel" id="button">
                                                </form>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h4><%=dOrder.getOrderCode(ord)%></h4>
                                                <p style="color: gray">Date: <%=ord.getDate()%></p>
                                                <a href="BillDetailController?order_id=<%=ord.getId()%>" style="color: blue; text-decoration: underline">More Detail</a>
                                            </td>

                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

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
        <% } %>
    </body>
    <style>
        #button {
            background-color: #ff9900;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</html>