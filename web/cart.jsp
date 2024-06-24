<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import = "entity.Category" %>
    <%@page import = "java.util.*" %>
    <%@page import = "entity.Product" %>
    <%@page import = "entity.Cart" %>
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
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-secondary py-2 px-xl-5">
               
                </div>
            </div>
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                  <%
    int countProduct = (int) session.getAttribute("count");
                %>
                <div class="col-lg-3 col-6 text-right">
                    <a href="managerCart" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge"><%=countProduct%></span>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 200px">
                            <% 
                            List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
                            if (categoryList != null) {
             for (Category category : categoryList) {
                            %>
                            <a href="category?cid=<%= category.getCateID() %>" class="nav-item nav-link"><%= category.getCname()%></a>
                            <% 
                             }
}                               
                            %>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                             <div class="navbar-nav mr-auto py-0">
                                <a href="home" class="nav-item nav-link active">Home</a>
                                <a href="shop" class="nav-item nav-link">Shop</a>
                              
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="managerCart" class="dropdown-item">Shopping Cart</a>
                                        <a href="order" class="dropdown-item">Checkout</a>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="navbar-nav ml-auto py-0">
                                <% if (session.getAttribute("acc") != null) { %>
                                <a class="nav-item nav-link" href="#">Hello <%= ((entity.Account) session.getAttribute("acc")).getUserName() %></a>
                                <a class="nav-item nav-link" href="logout">Logout</a>
                                <% } else { %>
                                <a class="nav-link" href="login">Login</a>
                                <a href="signUp.jsp" class="nav-item nav-link">Register</a>
                                <% } %>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shopping Cart</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Cart Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th>Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <%
                                List<Cart> listCart = (List<Cart>) request.getAttribute("listCart");
                                List<Product> listProduct = (List<Product>) request.getAttribute("listProduct");

                                for (Cart cart : listCart) {
                                    for (Product product : listProduct) {
                                        if (cart.getpID()==product.getpID()) { 
                            %>
                            <tr>
                                <td class="align-middle">
                                    <img src="<%= product.getpImage() %>" alt="<%= product.getpName() %>" style="width: 50px;">
                                    <%= product.getpName() %>
                                </td>
                                <td class="align-middle">$<%= product.getPrice() %></td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <a href="subAmountCart?productID=<%=product.getpID()%>&amount=<%=cart.getQuantity()%>" class="btn btn-sm btn-primary">
                                                <i class="fa fa-minus"></i>
                                            </a>
                                        </div>
                                        <input type="text" class="form-control form-control-sm bg-secondary text-center" value="<%= cart.getQuantity() %>" readonly>
                                        <div class="input-group-btn">
                                            <a href="addAmountCart?productID=<%=product.getpID()%>&amount=<%=cart.getQuantity()%>" class="btn btn-sm btn-primary">
                                                <i class="fa fa-plus"></i>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">$<%= product.getPrice() * cart.getQuantity() %></td>
                                <td class="align-middle">
                                    <a href="deleteCart?productID=<%=product.getpID()%>" class="btn btn-sm btn-primary">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </td>
                            </tr>
                            <%
                                        }
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
    int totalMoney = (int) request.getAttribute("totalMoney");
                %>

                <div class="col-lg-4">
                    <form class="mb-0" action="">
                        
                    </form>
                    <div class="card border-secondary mb-4">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-2 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <!-- Phần này bạn có thể để trống hoặc điền giá trị nếu cần -->
                                <h6 class="font-weight-medium">$<%= totalMoney %></h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">$10</h6>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold"><%= totalMoney + 10 %></h5>
                                <!-- Phần này cộng thêm 10 đô cho phí vận chuyển -->
                            </div>
                                 <a class="btn btn-block btn-primary mt-3" href="order">Proceed To Checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->


        <!-- Footer Start -->
          <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                   
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="home"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                
                                <a class="text-dark mb-2" href="managerCart"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="order"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                               
                            </div>
                        </div>
                       
                        
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. 

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed by <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


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
    </body>

</html>