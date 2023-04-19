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
            DAOOrderDetail dOrd = new DAOOrderDetail();
            DAOOrder dOrder = new DAOOrder();
            DAOBook dBook = new DAOBook();
            DAOUser dUser = new DAOUser();
            Vector<Order> orders = dUser.getOrders(user_id);
            Order order = null;
            for (Order i : orders) {
                if (i.getStatus() == 1) {
                    order = i;
                    break;
                }
            }
            if (order == null) dOrder.addOrder(new Order(0, user_id, (new Timestamp(System.currentTimeMillis())).toString(), 0, 1));
            orders = dUser.getOrders(user_id);
            for (Order i : orders) {
                if (i.getStatus() == 1) {
                    order = i;
                    break;
                }
            }
            
            Vector<OrderDetail> orderDetails = dOrder.getOrderDetails(order.getId());
            
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
                                <h2>Shopping Cart</h2>
                            </div>

                            <div class="cart-table clearfix">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(OrderDetail ord : orderDetails) { %>
                                        <tr>
                                            <td class="cart_product_img">
                                                <a href="#"><img src="img/books-img/<%=dBook.getBook(ord.getBookId()).getImage()%>" alt="Product"></a>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5><%=dBook.getBook(ord.getBookId()).getTitle()%></h5>
                                            </td>
                                            <td class="price">
                                                <span>$<%=ord.getPrice()%></span>
                                            </td>
                                            <td class="qty">
                                                <form action="quantityController" method="post">
                                                    <input type="hidden" name="books" value="<%=ord.getBookId()%>">
                                                    <input type="hidden" name="orders" value="<%=order.getId()%>">
                                                    <button type="submit" name="quantity" id="quantity" value="subtract" style="border: 0; background-color: white">-</button>
                                                    <span><%=ord.getQuantity()%></span>
                                                    <button type="submit" name="quantity" id="quantity" value="add" style="border: 0; background-color: white">+</button>
                                                </form>
                                                
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="cart-summary">
                                <h5>Cart Total</h5>
                                <ul class="summary-table">
                                    <li><span>subtotal:</span> <span>$<%=order.getTotal()%></span></li>
                                    <li><span>delivery:</span> <span>Free</span></li>
                                    <li><span>total:</span> <span>$<%=order.getTotal()%></span></li>
                                </ul>
                                <div class="cart-btn mt-100">
                                    <a href="checkoutController?orders=<%=order.getId()%>" class="btn amado-btn w-100">Checkout</a>
                                </div>
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

</html>