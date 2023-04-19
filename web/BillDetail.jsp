<%-- 
    Document   : BillDetail
    Created on : Mar 22, 2023, 2:37:16 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Order, dao.DAOOrder, entity.OrderDetail, java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Detail</title>
    </head>
    <body>
        <%
            Order order = (Order) request.getAttribute("order");
            DAOOrder dao = new DAOOrder();
            Vector<Vector> listBill = dao.getBillDetail(order.getId());
        %>
        <div style="border: 1px solid black; width: 40vw; padding: 5px">
            <div style="width: 30%; margin: 15px">
                <img src="img/core-img/logo4.png" style="width: 100%; height: 100%">
            </div>
            <div style="margin: 15px">
                <h3>Code: <%=dao.getOrderCode(order)%></h3>
                <h3>Date: <%=order.getDate()%></h3>
            </div>
            <div style="margin: 50px 15px">
                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <th style="text-align: center">Category Name</th>
                            <th style="text-align: right">Price</th>
                            <th style="text-align: right">Quantity</th>
                            <th style="text-align: right">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for(Vector v : listBill) { %>
                        <tr>
                            <td><%=(String)v.get(0)%></td>
                            <td style="text-align: right"><%=(double)v.get(1)%></td>
                            <td style="text-align: right"><%=(int)v.get(2)%></td>
                            <td style="text-align: right"><%=(double)v.get(3)%></td>
                        </tr>
                        <% } %>
                    </tbody>
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th style="text-align: right">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td style="text-align: right">$<%=order.getTotal()%></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
    <style>
        h3 {
            margin: 5px;
        }
    </style>
</html>
