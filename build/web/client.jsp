<%-- 
    Document   : client
    Created on : Mar 14, 2023, 3:00:59 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Admin" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Admin admin = (Admin)session.getAttribute("admin");
            System.out.println(admin);
            if (admin == null) {
                response.sendRedirect("adminLoginController");
            } else {
            
        %>
        <div>
            <jsp:include page="navigation.jsp"></jsp:include>
        </div>
        <%
            String req = (String)request.getAttribute("request");
        %>
        <h1><%=req%></h1>
        <% if (req.equals("author")) { %> <div><jsp:include page="admin/ViewAuthor.jsp"></jsp:include></div> <% } %>
        <% if (req.equals("book")) { %> <div><jsp:include page="admin/ViewBook.jsp"></jsp:include></div> <% } %>
        <% if (req.equals("genre")) { %> <div><jsp:include page="admin/ViewGenre.jsp"></jsp:include></div> <% } %>
        <% if (req.equals("order")) { %> <div><jsp:include page="admin/ViewOrder.jsp"></jsp:include></div> <% } %>
        <% if (req.equals("orderitem")) { %> <div><jsp:include page="admin/ViewOrderItem.jsp"></jsp:include></div> <% } %>
        <% if (req.equals("user")) { %> <div><jsp:include page="admin/ViewUser.jsp"></jsp:include></div> <% } %>
        <% } %>
    </body>
</html>
