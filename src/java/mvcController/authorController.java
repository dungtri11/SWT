/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mvcController;

import dao.DAOAuthor;
import entity.Author;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
public class authorController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String go = request.getParameter("go");
            String form = request.getParameter("form");
            HttpSession session = request.getSession(false);
            if (session.getAttribute("admin") == null) {
                response.sendRedirect("adminLoginController");
            }
            if (go.equals("insert")) {
                if (form == null) {
                    dispatch(request, response, "crud/InsertAuthor.jsp");
                } else {
                    DAOAuthor dao = new DAOAuthor();
                    Author author = new Author();
                    author.setName(request.getParameter("name"));
                    author.setDescription(request.getParameter("desc"));
                    author.setImage(request.getParameter("img"));
                    
                    int n = dao.addAuthor(author);
                    if (n > 0) {
                        response.sendRedirect("adminClientController?go=author");
                    }
                }
            }
            
            if (go.equals("delete")) {
                DAOAuthor dao = new DAOAuthor();
                int n = dao.deleteAuthor(Integer.parseInt(request.getParameter("id")));
                if (n > 0) {
                    response.sendRedirect("adminClientController?go=author");
                }
            }
            
            if (go.equals("update")) {
                DAOAuthor dao = new DAOAuthor();
                Author author = dao.getAuthor(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("author", author);
                if (form == null) {
                    dispatch(request, response, "crud/UpdateAuthor.jsp");
                } else {
                    author.setId(Integer.parseInt(request.getParameter("id")));
                    author.setName(request.getParameter("name"));
                    author.setDescription(request.getParameter("desc"));
                    author.setImage(request.getParameter("img"));
                    
                    int n = dao.updateAuthor(author);
                    if (n > 0) {
                        response.sendRedirect("adminClientController?go=author");
                    }
                }
            }
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
