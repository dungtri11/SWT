<%-- 
    Document   : reg
    Created on : Mar 12, 2023, 6:35:18 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOUser,java.util.Vector,entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Register</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            DAOUser du = new DAOUser();
            Vector<User> listUser = du.getAllUser();
        %>
        <!-- Sign up form -->
        <% for(User user : listUser) { %> 
        <p hidden class="<%=listUser.indexOf(user)%>"><%=user.getUsername()%></p>
        <p hidden class="<%=listUser.indexOf(user)%>"><%=user.getEmail()%></p>
        <% } %>
        <p hidden id="length"><%=listUser.size()%></p>
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Register form</h2>
                        <form action="registerController" method="POST" class="register-form" id="register-form" onchange="funcRegister()">
                            <input type="hidden" name="form" value="register">

                            <div class="form-group">
                                <input type="text" name="fname" id="fname" placeholder="Your First Name"/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="lname" id="lname" placeholder="Your Last Name"/>
                            </div>

                            <div class="form-group">
                                <label for="account" id="account-lable"><i id="account-icon" class="zmdi zmdi-account"></i></label>
                                <input type="text" name="account" id="account" placeholder="Account" onchange="funcAccount()"/>
                            </div>
                            <div class="form-group">
                                <label for="email" id="email-lable"><i id="email-icon" class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" onchange="funcEmail()()"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i id="pass-icon" class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass" id="re_pass-lable"><i id="re-pass-icon" class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" onchange="funcRePassword()"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"/>
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="https://teamserv.com/" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" disabled="true"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                        <a href="loginController" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            function funcAccount() {
                let text = document.getElementById("account").value;
                
                let length = document.getElementById("length").innerText;
                if (text == false) {
                    document.getElementById("account-lable").innerHTML = '<i class="zmdi zmdi-account"></i>';
                } else {
                    let check = true;
                    for (let i = 0; i < length; ++i) {
                        if (document.getElementsByClassName(i)[0].innerText == text) {
                            check = false;
                            break;
                        }
                    }
                    if (check == true) document.getElementById("account-lable").innerHTML = "✓";
                    else document.getElementById("account-lable").innerHTML = "✕";
                }
            }
            
            function funcEmail() {
                let text = document.getElementById("email").value;
                
                let length = document.getElementById("length").innerText;
                if (text == false) {
                    document.getElementById("email-lable").innerHTML = '<i id="email-icon" class="zmdi zmdi-email"></i>';
                } else {
                    let check = true;
                    for (let i = 0; i < length; ++i) {
                        if (document.getElementsByClassName(i)[1].innerText == text) {
                            check = false;
                            break;
                        }
                    }
                    if (check == true) document.getElementById("email-lable").innerHTML = "✓";
                    else document.getElementById("email-lable").innerHTML = "✕";
                }
            }
        
            function funcRePassword() {
                let text = document.getElementById("re_pass").value;

                if (text == false) {
                    document.getElementById("re_pass-lable").innerHTML = '<i class="zmdi zmdi-lock-outline"></i>';
                } else {
                    
                    if (text == document.getElementById("pass").value) document.getElementById("re_pass-lable").innerHTML = "✓";
                    else document.getElementById("re_pass-lable").innerHTML = "✕";
                }
            }
            
            function funcRegister() {
                let account = document.getElementById("account-lable").innerHTML == "✓";
                let repass = document.getElementById("re_pass-lable").innerHTML == "✓";
                let agree = document.getElementById("agree-term").checked;
                document.getElementById("signup").disabled = !(account && repass && agree);
            }
        </script>
    </body>
    <style>
        html {
            background: linear-gradient(to top, #333333 50%, #ffff00 100%);
        }
        .signup {
            background: linear-gradient(to top, #333333 40.1%, #ffff00 100%);
        }
    </style>

</html>
