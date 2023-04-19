<%-- 
    Document   : newjsp
    Created on : Mar 15, 2023, 10:26:32 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DAOGenre, java.util.Map" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DAOGenre dao = new DAOGenre();
            Map<String, Integer> map = dao.getSeller();
        %>
        <div id="1stchart" style="height: 250px;"></div>
        <div id="2ndchart" style="height: 250px;"></div>
    </body>
</html>
<script>
    //chart1
    Morris.Donut({
        element: '1stchart',
        data: [
    <% for(Map.Entry<String, Integer> m: map.entrySet()) { %>
            {value: <%=m.getValue()%>, label: '<%=m.getKey()%>'},
    <% } %>
        ],
        formatter: function (x) {
            return x + "%"
        }
    }).on('click', function (i, row) {
        console.log(i, row);
    });

    //chart 2
    var day_data = [
        {"elapsed": "2023-01", "value": 34},
        {"elapsed": "2023-02", "value": 24},
        {"elapsed": "2023-03", "value": 3},
        {"elapsed": "2023-04", "value": 12},
        {"elapsed": "2023-05", "value": 13},
        {"elapsed": "2023-06", "value": 22},
        {"elapsed": "2023-07", "value": 5},
        {"elapsed": "2023-08", "value": 26},
        {"elapsed": "2023-09", "value": 12},
        {"elapsed": "2023-10", "value": 19},
        {"elapsed": "2023-11", "value": 12},
        {"elapsed": "2023-12", "value": 13}
    ];
    Morris.Line({
        element: '2ndchart',
        data: day_data,
        xkey: 'elapsed',
        ykeys: ['value'],
        labels: ['value'],
        parseTime: false
    });
</script>

