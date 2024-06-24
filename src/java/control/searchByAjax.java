package control;



import DAO.dao;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "searchByAjax", urlPatterns = {"/searchAjax"})
public class searchByAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String txtSearch = request.getParameter("txt");
        dao dao = new dao();

        // Get the list of products by name
        List<Product> list = dao.getProductByName(txtSearch);

        // Get the list of categories (not used in this example)
        List<Category> listC = dao.getCategory();

        // Process the retrieved data (this is just an example, modify as needed)
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
