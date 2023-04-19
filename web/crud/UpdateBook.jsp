<%-- 
    Document   : UpdateBook
    Created on : Mar 14, 2023, 5:31:41 AM
    Book     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOGenre, entity.Genre" %>
<%@page import="dao.DAOAuthor, entity.Author" %>
<%@page import="dao.DAOBook, entity.Book" %>
<%@page import="dao.DAOUser, entity.User" %>
<%@page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        DAOBook db = new DAOBook();
        Vector<Book> vb = db.getAllBook();
        DAOAuthor da = new DAOAuthor();
        Vector<Author> va = da.getAllAuthor();
        DAOGenre dg = new DAOGenre();
        Vector<Genre> vg = dg.getAllGenre();
        Book book = (Book) request.getAttribute("book");
        %>
        <form action="bookController" method="post"> 
            <input type="hidden" name="go" value="update">
            <input type="number" name="id" value="<%=book.getId()%>" readonly>
            <div>
                <label for="name">Title</label>
                <input type="text" name="title" id="name" value="<%=book.getTitle()%>" required=>
            </div>
            <div>
                <label for="name">Author ID</label>
                <select name="author-id" required>
                    <%for(Author author: va) { %>
                    <option value="<%=author.getId()%>"><%=author.getName()%></option>
                    <% } %>
                </select>
            </div>
            <div>
                <label for="name">Genre ID</label>
                <select name="genre-id" required>
                    <%for(Genre genre: vg) { %>
                    <option value="<%=genre.getId()%>"><%=genre.getName()%></option>
                    <% } %>
                </select>
            </div>
                <label for="price">Price</label>
                <input name="price" type="number" id="price" value="<%=book.getPrice()%>" required>
            <div>
                <label for="desc">Book Description</label>
                <textarea name="desc" id="desc" ><%=book.getDescription()%></textarea>
            </div>
            <div>
                <label for="img">Book Image</label>
                <input type="file" name="img" id="img" value="<%=book.getImage()%>">
            </div>
            <input type="submit" name="form" value="Update">
        </form>
    </body>
</html>
