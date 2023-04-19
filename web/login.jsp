<%-- 
    Document   : login
    Created on : Mar 12, 2023, 6:34:57 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            String sendTo = request.getParameter("sendTo");
            System.out.println("req sendTo: " + sendTo);
            if (request.getAttribute("user_id") != null) {
                Integer user_id = (Integer) request.getAttribute("user_id");
                reLogin = (user_id == 0);
            }
        %>
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="img/signin-image.jpg" alt="sing up image"></figure>
                        <a href="registerController" class="signup-image-link">Create an account</a>
                        <a href="adminLoginController" class="signup-image-link">I'm admin</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Login</h2>
                        <form action="loginController" method="POST" class="register-form" id="login-form" onchange="funcLogin()">
                            <input type="hidden" name="form" value="login">
                            <input type="hidden" name="sendTo" value="<%=sendTo%>">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_name" placeholder="Username / Email"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="your_pass" id="your_pass" placeholder="Password"/>
                            </div>
                            <p id="invalid">Invalid Account! Please Try Again</p>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="https://www.facebook.com/"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="https://twitter.com/"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="https://www.google.com/gmail/about/"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
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
            background: #ffff00;
        }
        .sign-in {
           background: #ffff00;
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
