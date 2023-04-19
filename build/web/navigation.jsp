<%-- 
    Document   : navigation
    Created on : Mar 14, 2023, 3:38:28 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="adminClientController?go=user">Users</a> |
        <a href="adminClientController?go=order">Orders</a> |
        <a href="adminClientController?go=orderitem">Order-Items</a> |
        <a href="adminClientController?go=book">Books</a> |
        <a href="adminClientController?go=genre">Genres</a> |
        <a href="adminClientController?go=author">Authors</a>                                            
        <a href="adminLogoutController">Log out</a>
    </body>
</html>
