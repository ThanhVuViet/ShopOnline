/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.dao;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name="SearchNauColor", urlPatterns={"/SearchNauColor"})
public class SearchNauColor extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
        
        request.setCharacterEncoding("UTF-8");
      
        dao dao = new dao();
        List<Product> list = dao.searchNauColor();
          try (PrintWriter out = response.getWriter()) {
    out.println("<div class=\"row\">"); // Start a row container

    for (Product product : list) {
        out.println("<div class=\"col-lg-4 col-md-6 col-sm-12 pb-1\">");
        out.println("    <div class=\"card product-item border-0 mb-4\">");
        out.println("        <div class=\"card-header product-img position-relative overflow-hidden bg-transparent border p-0\">");
        out.println("            <img class=\"img-fluid w-100\" src=\"" + product.getpImage() + "\" alt=\"\">");
        out.println("        </div>");
        out.println("        <div class=\"card-body border-left border-right text-center p-0 pt-4 pb-3\">");
        out.println("            <h6 class=\"text-truncate mb-3\">" + product.getpName() + "</h6>");
        out.println("            <div class=\"d-flex justify-content-center\">");
        out.println("                <h6>$" + product.getPrice() + "</h6><h6 class=\"text-muted ml-2\"><del>$123.00</del></h6>");
        out.println("            </div>");
        out.println("        </div>");
        out.println("        <div class=\"card-footer d-flex justify-content-between bg-light border\">");
        out.println("            <a href=\"detail?pid=" + product.getpID() + "\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-eye text-primary mr-1\"></i>View Detail</a>");
        out.println("            <a href=\"#\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-shopping-cart text-primary mr-1\"></i>Add To Cart</a>");
        out.println("        </div>");
        out.println("    </div>");
        out.println("</div>");
    }

    out.println("</div>"); // Close the row container
}
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
