<%-- 
    Document   : ViewUser
    Created on : Mar 14, 2023, 4:09:48 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.User, dao.DAOUser, java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOUser dao = new DAOUser();
            Vector<User> userList = dao.getAllUser();
        %>

        <table border="1">
            <thead>
                <tr>
                    <td>Author ID</td>
                    <td>Name</td>
                    <td>Username</td>
                    <td>Email</td>
                </tr>
            </thead>
            <tbody>
                <% for (User i : userList) { %>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getFirstName() + " " + i.getLastName()%></td>
                    <td><%=i.getUsername()%></td>
                    <td><%=i.getEmail()%></td>                                
                    <td><a href="userController?go=update&id=<%=i.getId()%>">update</a></td>
                    <td><a href="userController?go=delete&id=<%=i.getId()%>">delete</a></td>
                </tr>
                <% } %>

            </tbody>
        </table>
        <a href="userController?go=insert">insert</a>
    </body>
</html>
