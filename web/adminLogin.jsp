<%-- 
    Document   : login
    Created on : Mar 12, 2023, 6:34:57 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Admin"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            boolean reLogin = false;
            if (request.getAttribute("admin") != null) {
                Admin admin = (Admin) request.getAttribute("admin");
                reLogin = (admin.getUsername() == null);
            }
        %>
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">

                    <div class="signin-form">
                        <h2 class="form-title">Admin</h2>
                        <form action="adminLoginController" method="POST" class="register-form" id="login-form" onchange="funcLogin()">
                            <input type="hidden" name="form" value="login">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_name" placeholder="Username"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="your_pass" id="your_pass" placeholder="Password"/>
                            </div>
                            <p id="invalid">Invalid Account! Please Try Again</p>

                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </section>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
    <style>
        html {
            background: #333333;
        }
        .sign-in {
           background: #333333;
        }
        <%if (reLogin) { %>
        #invalid {
            display: block;
        }
        <% } else { %> 
        #invalid {
            display: none;
        }
        <% } %>
    </style>
    <script>
        function funcLogin() {
            document.getElementById("invalid").style.display = "none";
        }
    </script>
</html>
