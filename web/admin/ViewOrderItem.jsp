<%-- 
    Document   : ViewOrderItem
    Created on : Mar 14, 2023, 4:09:24 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.OrderDetail, dao.DAOOrderDetail, java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOOrderDetail dao = new DAOOrderDetail();
            Vector<OrderDetail> ordList = dao.getAllOrderDetail();
        %>

        <table border="1">
            <thead>
                <tr>
                    <td>Order-Detail ID</td>
                    <td>Order ID</td>
                    <td>Book ID</td>
                    <td>Quantity</td>
                    <td>Price</td>
                </tr>
            </thead>
            <tbody>
                <% for (OrderDetail i : ordList) { %>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getOrderId()%></td>
                    <td><%=i.getBookId()%></td>
                    <td><%=i.getQuantity()%></td>
                    <td>$<%=i.getPrice()%></td>     
                </tr>
                <% } %>

            </tbody>
        </table>
    </body>
</html>
