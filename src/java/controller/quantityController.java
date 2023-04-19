/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOBook;
import dao.DAOOrder;
import dao.DAOOrderDetail;
import dao.DAOUser;
import entity.Order;
import entity.OrderDetail;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Vector;

/**
 *
 * @author Asus
 */
public class quantityController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            response.setHeader("Cache-Control", "private, no-cache, no-store, must-revalidate");
            response.setHeader("Expires", "-1");
            response.setHeader("Pragma", "no-cache");
            /* TODO output your page here. You may use following sample code. */
            String quantity = request.getParameter("quantity");

            Integer order_id = Integer.parseInt((request.getParameter("orders") == null ? "0" : request.getParameter("orders")));
            Integer book_id = Integer.parseInt((request.getParameter("books") == null ? "0" : request.getParameter("books")));
            DAOOrderDetail dOrd = new DAOOrderDetail();
            DAOOrder dOrder = new DAOOrder();
            DAOBook dBook = new DAOBook();
            System.out.println(order_id + " " + book_id);
            Order order = dOrder.getOrder(order_id);

            if (quantity.equals("add")) {

                Vector<OrderDetail> orderDetails = dOrder.getOrderDetails(order_id);
                boolean hasItem = false;
                for (OrderDetail orderDetail : orderDetails) {
                    if (orderDetail.getBookId() == book_id) {
                        orderDetail.setQuantity(orderDetail.getQuantity() + 1);
                        order.setTotal(order.getTotal() + orderDetail.getPrice());
                        dOrder.updateOrder(order);
                        dOrd.updateOrderDetail(orderDetail);
                        hasItem = true;
                        break;
                    }
                }

                if (hasItem == false) {
                    dOrd.addOrderDetail(new OrderDetail(0, order.getId(), book_id, 1, dBook.getBook(book_id).getPrice()));
                    order.setTotal(order.getTotal() + dBook.getBook(book_id).getPrice());
                    dOrder.updateOrder(order);
                }

            } else {
                Vector<OrderDetail> orderDetails = dOrder.getOrderDetails(order_id);
                for (OrderDetail orderDetail : orderDetails) {
                    if (orderDetail.getBookId() == book_id) {
                        if (orderDetail.getQuantity() > 1) {
                            orderDetail.setQuantity(orderDetail.getQuantity() - 1);
                            order.setTotal(order.getTotal() - orderDetail.getPrice());
                            dOrder.updateOrder(order);
                            dOrd.updateOrderDetail(orderDetail);
                        } else {
                            dOrd.deleteOrderDetail(orderDetail.getId());
                            order.setTotal(order.getTotal() - orderDetail.getPrice());
                            dOrder.updateOrder(order);
                        }
                        break;
                    }
                }
            }
            dispatch(request, response, "cart.jsp");
        }
    }

    void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
    }// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
