<%-- 
    Document   : ViewGenre
    Created on : Mar 14, 2023, 4:08:47 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Genre, dao.DAOGenre, java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOGenre dao = new DAOGenre();
            Vector<Genre> genreList = dao.getAllGenre();
        %>

        <table border="1">
            <thead>
                <tr>
                    <td>Author ID</td>
                    <td>Name</td>
                    <td>Description</td>
                    <td>Image</td>
                </tr>
            </thead>
            <tbody>
                <% for (Genre i : genreList) { %>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getName()%></td>
                    <td><%=i.getDescription()%></td>
                    <td><img width="150px" height="150px" src="img/genres-img/<%=i.getImage()%>"></td>                                  
                    <td><a href="genreController?go=update&id=<%=i.getId()%>">update</a></td>
                    <td><a href="genreController?go=delete&id=<%=i.getId()%>">delete</a></td>
                </tr>
                <% } %>

            </tbody>
        </table>
        <a href="genreController?go=insert">insert</a>
    </body>
</html>
