<%-- 
    Document   : UpdateUser
    Created on : Mar 14, 2023, 5:31:41 AM
    User     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
        %>  

        <form action="userController" method="post"> 
            <input type="hidden" name="go" value="update">
            <input type="hidden" name="id" value="<%=user.getId()%>">
            <div>
                <label for="name">First Name</label>
                <input type="text" name="first-name" id="first-name" value="<%=user.getFirstName()%>">
            </div>
            <div>
                <label for="name">Last Name</label>
                <input type="text" name="last-name" id="last-name" value="<%=user.getLastName()%>">
            </div>
            <div>
                <label for="name">Username</label>
                <input type="text" name="username" id="username" value="<%=user.getUsername()%>">
            </div>
            <div>
                <label for="name">Password</label>
                <input type="password" name="password" id="password" value="<%=user.getPassword()%>">
            </div>
            <div>
                <label for="name">Email</label>
                <input type="text" name="email" id="email" value="<%=user.getEmail()%>">
            </div>
            
            <input type="submit" name="form" value="Update">
        </form>
    </body>
</html>
