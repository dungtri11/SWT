<%-- 
    Document   : ViewOrder
    Created on : Mar 14, 2023, 4:09:31 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector" %>
<%@page import="entity.Order, dao.DAOOrder, dao.DAOUser" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            DAOOrder dao = new DAOOrder();
            DAOUser du = new DAOUser();
            Vector<Order> orderList = dao.getAllOrder();
        %>
        <form action="orderController" method="post" id="form">
            <input type="hidden" name="status" id="status">
            <input type="hidden" name="id" id="id">
        </form>
        <table border="1">
            <thead>
                <tr>
                    <td>Order ID</td>
                    <td>User ID</td>
                    <td>Contact</td>
                    <td>Order Date</td>
                    <td>Total</td>
                    <td>Status</td>
                </tr>
            </thead>
            <tbody>
                <% for (Order i : orderList) { %>
                <tr>
                    <td><%=i.getId()%></td>
                    <td><%=i.getUserId()%></td>
                    <td><%=du.getUser(i.getUserId()).getEmail()%></td>
                    <td><%=i.getDate()%></td>
                    <td>$<%=i.getTotal()%></td>
                    <td>
                        <form action="orderController" method="post" id="form">
                            <select name="orderstatus" onchange="update('<%=orderList.indexOf(i)%>')">
                                <option value="1" <%=(i.getStatus() == 1 ? "selected" : "")%> disabled="true">Ordering</option>
                                <option value="-1" <%=(i.getStatus() == -1 ? "selected" : "")%>>Sold</option>
                                <option value="0" <%=(i.getStatus() == 0 ? "selected" : "")%>>Checked Out</option>
                            </select>
                            <input type="hidden" name="orderid" value="<%=i.getId()%>">
                        </form>
                    </td>  
                </tr>
                <% } %>
            </tbody>
        </table>
    </body>
    <script>
        function update(text) {
            document.getElementById("status").value = document.getElementsByName("orderstatus")[text].value;
            document.getElementById("id").value = document.getElementsByName("orderid")[text].value;
            document.getElementById("form").submit();
        }
    </script>
</html>
