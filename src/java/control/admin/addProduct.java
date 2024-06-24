package control.admin;

import DAO.dao;
import entity.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author MyPC
 */
@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet {
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
        dao u = new dao();
        List<Category> categoryList = u.getCategory();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("notif", "");
        request.getRequestDispatcher("adminPage/addProduct.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        dao u = new dao();
        List<Category> categoryList = u.getCategory();
        String pName = request.getParameter("name");
        String image = request.getParameter("image");
        String price =request.getParameter("price");
        String description = request.getParameter("description");
        String cateID = request.getParameter("cateID");
        String image2 = request.getParameter("image2");
        String image3 = request.getParameter("image3");
        String image4 = request.getParameter("image4");
        String n;
        if (pName.isBlank() || image.isBlank() || price.isBlank() || description.isBlank() || image2.isBlank() || image3.isBlank() || image4.isBlank()) {
            n = "Vui lòng điền đầy đủ thông tin.";
        } else {
            Product p = new Product(pName, image,  Double.parseDouble(price), description, cateID, null, null, image2, image3, image4);
            u.addProduct(p);
            n = "Thêm sản phẩm thành công.";
        }
        request.setAttribute("pName", pName);
        request.setAttribute("image", image);
        request.setAttribute("price", price);
        request.setAttribute("description", description);
        request.setAttribute("cateID", cateID);
        request.setAttribute("image2", image2);
        request.setAttribute("image3", image3);
        request.setAttribute("image4", image4);
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("notif", n);
        request.getRequestDispatcher("adminPage/addProduct.jsp").forward(request, response);
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
