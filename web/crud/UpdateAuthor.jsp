<%-- 
    Document   : UpdateAuthor
    Created on : Mar 14, 2023, 5:31:41 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Author"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Author author = (Author) request.getAttribute("author");
        %>
        <form action="authorController" method="post"> 
            <input type="hidden" name="go" value="update">
            <input type="hidden" name="id" value="<%=author.getId()%>">
            <div>
                <label for="name">Author Name</label>
                <input type="text" name="name" id="name" value="<%=author.getName()%>">
            </div>
            <div>
                <label for="desc">Author Description</label>
                <textarea name="desc" id="desc" ><%=author.getDescription()%></textarea>
            </div>
            <div>
                <label for="img">Author Image</label>
                <input type="file" name="img" id="img" value="<%=author.getImage()%>">
            </div>
            <input type="submit" name="form" value="Update">
        </form>
    </body>
</html>
