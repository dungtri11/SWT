<%-- 
    Document   : UpdateGenre
    Created on : Mar 14, 2023, 5:31:41 AM
    Genre     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Genre"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Genre genre = (Genre) request.getAttribute("genre");
        %>
        <form action="genreController" method="post"> 
            <input type="hidden" name="go" value="update">
            <input type="hidden" name="id" value="<%=genre.getId()%>">
            <div>
                <label for="name">Genre Name</label>
                <input type="text" name="name" id="name" value="<%=genre.getName()%>">
            </div>
            <div>
                <label for="desc">Genre Description</label>
                <textarea name="desc" id="desc" ><%=genre.getDescription()%></textarea>
            </div>
            <div>
                <label for="img">Genre Image</label>
                <input type="file" name="img" id="img" value="<%=genre.getImage()%>">
            </div>
            <input type="submit" name="form" value="Update">
        </form>
    </body>
</html>
