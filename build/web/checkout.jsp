<%-- 
    Document   : checkout
    Created on : Mar 5, 2023, 3:04:17 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOOrder,dao.DAOUser,entity.User" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>ConOng Bookstore | Checkout</title>

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
            DAOOrder dOrder = new DAOOrder();
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
                            <div class="checkout_details_area mt-50 clearfix">

                                <div class="cart-title">
                                    <h2>Checkout</h2>
                                </div>

                                <form action="checkoutController" method="post" id="myForm">
                                    <input type="hidden" name="info" value="get">
                                    <input type="hidden" name="orders" value="<%=du.getCurrentOrders(user_id).getId()%>">
                                    <input type="hidden" name="method" id="method">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" id="first_name" value="" placeholder="First Name" required>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" id="last_name" value="" placeholder="Last Name" required>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="email" class="form-control" id="email" placeholder="Email" value="">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="text" class="form-control" id="street_address" placeholder="Address" value="">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="number" class="form-control mb-3" id="phone_number" placeholder="Phone Number" value="">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="text" class="form-control" id="city" placeholder="City" value="">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" id="district" placeholder="District" value="">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="text" class="form-control" id="ward" placeholder="Ward" value="">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <textarea name="comment" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Leave a comment about your order"></textarea>
                                        </div>

                                        <div class="col-12">
                                            <div class="custom-control custom-checkbox d-block mb-2">
                                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                <label class="custom-control-label" for="customCheck2">Create an accout</label>
                                            </div>
                                            <div class="custom-control custom-checkbox d-block">
                                                <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                <label class="custom-control-label" for="customCheck3">Ship to a different address</label>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="cart-summary">
                                <h5>Cart Total</h5>
                                <ul class="summary-table">
                                    <li><span>subtotal:</span> <span>$<%=du.getCurrentOrders(user_id).getTotal()%></span></li>
                                    <li><span>delivery:</span> <span>Free</span></li>
                                    <li><span>total:</span> <span>$<%=du.getCurrentOrders(user_id).getTotal()%></span></li>
                                </ul>
                                <form >
                                    <div class="payment-method">
                                        <!-- Cash on delivery -->
                                        <div class="custom-control custom-radio mr-sm-2">
                                            <input type="radio" class="custom-control-input" id="cod" name="payment" value="cash" checked>
                                            <label class="custom-control-label" for="cod">Cash on Delivery</label>
                                        </div>
                                        <!-- Paypal -->
                                        <div class="custom-control custom-radio mr-sm-2">
                                            <input type="radio" class="custom-control-input" id="paypal" name="payment" value="card">
                                            <label class="custom-control-label" for="paypal">Paypal <img class="ml-15" src="img/core-img/paypal.png" alt=""></label>
                                        </div>
                                    </div>
                                </form>    
                                <div class="cart-btn mt-100 btn amado-btn w-100" onclick="checkout()">
                                    Checkout
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
        <!-- Active js -->
        <script>
                                    function checkout() {
                                        alert("Done!");
                                        let op = document.getElementsByName("payment");
                                        if (op[0].checked)
                                            document.getElementById("method").value = op[0].value;
                                        else 
                                            document.getElementById("method").value = op[1].value;
                                        document.getElementById("myForm").submit();
                                    }
        </script>

    </body>

</html>