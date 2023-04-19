<%-- 
    Document   : ViewAuthor
    Created on : Mar 14, 2023, 4:02:50 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Author, dao.DAOAuthor, java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOAuthor dao = new DAOAuthor();
            Vector<Author> authorList = dao.getAllAuthor();
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
                <% for (Author i : authorList) { %>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getName()%></td>
                    <td><%=i.getDescription()%></td>
                    <td><img width="150px" height="150px" src="img/authors-img/<%=i.getImage()%>"></td>                                  
                    <td><a href="authorController?go=update&id=<%=i.getId()%>">update</a></td>
                    <td><a href="authorController?go=delete&id=<%=i.getId()%>">delete</a></td>
                </tr>
                <% } %>

            </tbody>
        </table>
        <a href="authorController?go=insert">insert</a>
    </body>
</html>
