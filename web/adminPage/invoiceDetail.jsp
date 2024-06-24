<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "entity.*" %>
<%@page import = "control.Functions" %>
<%@page import = "java.util.*" %>
<%@page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%
        if (session.getAttribute("acc") != null) {
            if (((entity.Account) session.getAttribute("acc")).isAdmin()) {
            Functions f = new Functions();
            Invoice invoice = (Invoice) request.getAttribute("invoice");
            List<InvoiceItems> invoiceItems = (List<InvoiceItems>) request.getAttribute("invoiceItems");
            List<Product>productList = (List<Product>) request.getAttribute("productList");
            Product product;
        %>
        <div class="row align-items-center py-2 px-xl-3">
            <div class="col-lg-7 d-none d-lg-block">
                <a href="admin" class="text-decoration-none">
                    <h3 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-2 mr-0">E</span>Shopper / quản lí</h3>
                </a>
            </div>
            <div class="col-lg-5 col-6 text-right">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                            <a href="" class="btn border nav-item nav-link">
                                <i class="fas fa-bell text-primary"></i>
                                <span class="badge">0</span>
                            </a>
                            <% if (session.getAttribute("acc") != null) { %>
                            <a class="nav-item nav-link" href="#">Chào <%= ((entity.Account) session.getAttribute("acc")).getUserName() %></a>
                            <a class="nav-item nav-link" href="logout">Đăng xuất</a>
                            <% } else { %>
                            <a class="nav-link" href="login">Đăng nhập</a>
                            <a href="signUp.jsp" class="nav-item nav-link">Đăng kí</a>
                            <% } %>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Cart Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>ID Sản phẩm</th>
                                <th>Giá đơn</th>
                                <th>Số lượng</th>
                                <th>Tổng giá</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <%
                                for (InvoiceItems invoiceItem : invoiceItems) {
                                    product = f.getProductWithID(productList, invoiceItem.getpID());
                            %>
                            <tr>
                                <td class="align-middle">
                                    <%= product.getpID() %>
                                </td>
                                <td class="align-middle">$<%= product.getPrice() %></td>
                                <td class="align-middle"><%= invoiceItem.getQuantity() %></td>
                                <td class="align-middle">$<%= product.getPrice() * invoiceItem.getQuantity() %></td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <div class="card border-secondary mb-4">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Invoice Summary</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <!-- Phần này bạn có thể để trống hoặc điền giá trị nếu cần -->
                                <h6 class="font-weight-medium">$<%=invoice.getTotalPrice()%></h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">$<%=invoice.getTotalPrice()*0.1%></h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$<%=invoice.getTotalPrice() * 1.1%> </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
            <%} else {%>
        <h2>Page is not found</h2>
        <a href="home">Back to home page</a>
        <%}} else {%>
        <h2>Page is not found</h2>
        <a href="home">Back to home page</a>
        <%}%>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <!--
        
        -->
    </body>
</html>
