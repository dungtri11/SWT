<%-- 
    Document   : ViewBook
    Created on : Mar 14, 2023, 4:09:01 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Book, dao.DAOBook, java.util.Vector" %>
<%@page import="entity.Genre, dao.DAOGenre" %>
<%@page import="entity.Author, dao.DAOAuthor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOBook dao = new DAOBook();
            Vector<Book> bookList = dao.getAllBook();
            DAOAuthor da = new DAOAuthor();
            DAOGenre dg = new DAOGenre();
        %>

        <table border="1">
            <thead>
                <tr>
                    <td>Book ID</td>
                    <td>Title</td>
                    <td>Author</td>
                    <td>Genre</td>
                    <td>Price</td>
                    <td>Description</td>
                    <td>Image</td>
                </tr>
            </thead>
            <tbody>
                <% for (Book i : bookList) { %>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getTitle()%></td>
                    <td><%=da.getAuthor(i.getAuthorId()).getName()%></td>
                    <td><%=dg.getGenre(i.getGenreId()).getName()%></td>
                    <td><%=i.getPrice()%></td>
                    <td><%=i.getDescription()%></td>
                    <td><img width="150px" height="150px" src="img/books-img/<%=i.getImage()%>"></td>                                  
                    <td><a href="bookController?go=update&id=<%=i.getId()%>">update</a></td>
                    <td><a href="bookController?go=delete&id=<%=i.getId()%>">delete</a></td>
                </tr>
                <% } %>

            </tbody>
        </table>
        <a href="bookController?go=insert">insert</a>
    </body>
</html>
