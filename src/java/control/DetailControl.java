/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.dao;
import entity.Account;
import entity.Category;
import entity.Product;
import entity.Review;
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
@WebServlet(name="detailControl", urlPatterns={"/detail"})
public class DetailControl extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    // Get product ID from request parameter
    String id = request.getParameter("pid");

    // Instantiate DAO
    dao dao = new dao();

    // Get product by ID
    Product product = dao.getProductById(Integer.parseInt(id));

    // Get category ID of the product
    String cateID = product.getCateID();

    // Get a list of products from the same category
    List<Product> alsoLikeProductList = dao.getProductByCID(cateID);
    List<Review> listReview= dao.getAllReviewByProductID(id);
     List<Category> categoryList = dao.getCategory();
        request.setAttribute("categoryList", categoryList);
    // Set attributes in the request to be used in the detail.jsp page
    request.setAttribute("detailProduct", product);
    request.setAttribute("alsoLikeProductList", alsoLikeProductList);
    request.setAttribute("reviewList", listReview);
    // Forward the request and response to the detail.jsp page
    request.getRequestDispatcher("detail.jsp").forward(request, response);
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
