<%-- 
    Document   : InsertUser
    Created on : Mar 14, 2023, 5:31:28 AM
    User     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="userController" method="post"> 
            <input type="hidden" name="go" value="insert">
            <div>
                <label for="name">First Name</label>
                <input type="text" name="first-name" id="name">
            </div>
            <div>
                <label for="name">Last Name</label>
                <input type="text" name="last-name" id="name">
            </div>
            <div>
                <label for="name">User Name</label>
                <input type="text" name="username" id="name">
            </div>
            <div>
                <label for="name">Password</label>
                <input type="password" name="password" id="name">
            </div>
            <div>
                <label for="name">Email</label>
                <input type="email" name="email" id="name">
            </div>
            <input type="submit" name="form" value="Add">
        </form>
    </body>
</html>
