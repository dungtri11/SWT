<%-- 
    Document   : InsertAuthor
    Created on : Mar 14, 2023, 5:31:28 AM
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
        <form action="authorController" method="post"> 
            <input type="hidden" name="go" value="insert">
            <div>
                <label for="name">Author Name</label>
                <input type="text" name="name" id="name">
            </div>
            <div>
                <label for="desc">Author Description</label>
                <textarea name="desc" id="desc"></textarea>
            </div>
            <div>
                <label for="img">Author Image</label>
                <input type="file" name="img" id="img">
            </div>
            <input type="submit" name="form" value="Add">
        </form>
    </body>
</html>
