/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.dao;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import static java.time.LocalDate.now;
import java.util.Date;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addReview", urlPatterns = {"/addReview"})
public class addReview extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");

        if (a == null) {
            response.sendRedirect("login");
            return;
        }

        int accountID = a.getId();
        String contentReview = request.getParameter("contentReview");
        int productID = Integer.parseInt(request.getParameter("productID"));
          LocalDate now = LocalDate.now();
        java.sql.Date review_Date = java.sql.Date.valueOf(now);
        dao dao = new dao();
        dao.getNewReview(accountID, productID);
        dao.insertReview(productID, productID, contentReview, review_Date);

        PrintWriter out = response.getWriter();
        out.println("<div class=\"col-md-6\">");
       
        out.println("<div class=\"media mb-4\">");
        out.println("<img src=\"img/user.jpg\" alt=\"Image\" class=\"img-fluid mr-3 mt-1\" style=\"width: 45px;\">");
        out.println("<div class=\"media-body\">");
        out.println("<h6>" + a.getUserName() + "<small> - <i>" + LocalDate.now() + "</i></small></h6>");
        out.println("<div class=\"text-primary mb-2\">");
        out.println("<i class=\"fas fa-star\"></i>");
        out.println("<i class=\"fas fa-star\"></i>");
        out.println("<i class=\"fas fa-star\"></i>");
        out.println("<i class=\"fas fa-star-half-alt\"></i>");
        out.println("<i class=\"far fa-star\"></i>");
        out.println("</div>");
        out.println("<p>" + contentReview + "</p>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
