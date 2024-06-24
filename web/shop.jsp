<%-- 
    Document   : shop
    Created on : Mar 5, 2024, 11:30:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entity.Product" %>
<%@page import = "entity.Category" %>
<%@page import = "java.util.*" %>
<%@page import = "entity.Product" %>
<!DOCTYPE html>
<html lang="en">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="search" method="post">
                        <div class="input-group">
                            <input oninput="searchByName(this)" name="txt" type="text" class="form-control" placeholder="Search for products">
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shop</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-12" >
                    <!-- Price Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                        <form>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" name="price" id="price-all">
                                <label class="custom-control-label" for="price-all">All Price</label>
                                <span class="badge border font-weight-normal">1000</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByPriceUnder100()" type="radio" class="custom-control-input" name="price" id="price-1">
                                <label class="custom-control-label" for="price-1">$0 - $100</label>
                                <span class="badge border font-weight-normal">150</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByPrice100to200()" type="radio" class="custom-control-input" name="price" id="price-2">
                                <label class="custom-control-label" for="price-2">$100 - $200</label>
                                <span class="badge border font-weight-normal">295</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByPrice200to300()" type="radio" class="custom-control-input" name="price" id="price-3">
                                <label class="custom-control-label" for="price-3">$200 - $300</label>
                                <span class="badge border font-weight-normal">246</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByPrice300to400()" type="radio" class="custom-control-input" name="price" id="price-4">
                                <label class="custom-control-label" for="price-4">$300 - $400</label>
                                <span class="badge border font-weight-normal">145</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                <input onchange="searchByPriceAbove400()" type="radio" class="custom-control-input" name="price" id="price-5">
                                <label class="custom-control-label" for="price-5">$Above 400</label>
                                <span class="badge border font-weight-normal">168</span>
                            </div>
                        </form>
                    </div>
                    <!-- Price End -->

                    <!-- Color Start -->
                    <div class="border-bottom mb-4 pb-4">
                        <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                        <form>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" name="color" id="color-all">
                                <label class="custom-control-label" for="color-all">All Color</label>
                                <span class="badge border font-weight-normal">1000</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByColorWhite()" type="radio" class="custom-control-input" name="color" id="color-1">
                                <label class="custom-control-label" for="color-1">Trắng</label>
                                <span class="badge border font-weight-normal">150</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByColorDen()" type="radio" class="custom-control-input" name="color" id="color-2">
                                <label class="custom-control-label" for="color-2">Đen</label>
                                <span class="badge border font-weight-normal">295</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByColorXam()" type="radio" class="custom-control-input" name="color" id="color-3">
                                <label class="custom-control-label" for="color-3">Xám</label>
                                <span class="badge border font-weight-normal">246</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByColorBe()" type="radio" class="custom-control-input" name="color" id="color-4">
                                <label class="custom-control-label" for="color-4">Be</label>
                                <span class="badge border font-weight-normal">145</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByColorNau()" type="radio" class="custom-control-input" name="color" id="color-5">
                                <label class="custom-control-label" for="color-5">Nâu</label>
                                <span class="badge border font-weight-normal">168</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input onchange="searchByColorXanh()" type="radio" class="custom-control-input" name="color" id="color-6">
                                <label class="custom-control-label" for="color-6">Xanh</label>
                                <span class="badge border font-weight-normal">168</span>
                            </div>
                        </form>
                    </div>
                    <!-- Color End -->

                    <!-- Size Start -->

                    <!-- Size End -->
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-12">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <form action="search" method="post">
                                    <div class="input-group">
                                        <input name="txt" type="text" class="form-control" placeholder="Search by name" oninput="searchByName(this)">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search"></i> Search
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <div class="row"  id="product-container">
                            <% for (Product product : (List<Product>) request.getAttribute("productList")) { %>
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                                <form action ="addCart" method="post">
                                    <div class="card product-item border-0 mb-4">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                            <img class="img-fluid w-100" src="<%= product.getpImage() %>" alt="">
                                        </div>
                                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                            <h6 class="text-truncate mb-3"><%= product.getpName() %></h6>
                                            <div class="d-flex justify-content-center">
                                                <h6>$<%= product.getPrice() %></h6><h6 class="text-muted ml-2"><del><%= String.format("%.2f", product.getPrice() * 1.1) %></del></h6>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-between bg-light border">
                                            <a href="detail?pid=<%= product.getpID() %>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                            <a href="addCartShop?pid=<%=product.getpID() %>" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <% } %>
                        </div>

                    </div>
                </div>


                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center mb-3">
                            <%
                                int index = (int) request.getAttribute("index");
                                if (index != 1) {
                            %>
                            <li class="page-item disabled">
                                <a class="page-link" href="shop?index=<%= index - 1 %>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <%
                                }
                            %>

                            <%
                                int endPage = Integer.parseInt(request.getAttribute("endPage").toString());
                                for (int i = 1; i <= endPage; i++) {
                                    String pageItemClass = (index == i) ? "page-item active" : "page-item";
                            %>
                            <li class="<%= pageItemClass %>">
                                <a href="shop?index=<%= i %>" class="page-link"><%= i %></a>
                            </li>
                            <%
                                }
                            %>

                            <%
                                if (index != endPage) {
                            %>
                            <li class="page-item">
                                <a href="shop?index=<%= index + 1 %>" class="page-link" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->
    </div>
</div>
<!-- Shop End -->


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
<script>
            function searchByName(param) {
                var txtSearch = param.value;
                $.ajax({
                    url: "/BanHang/searchAjax",
                    type: "get", // send it through the get method
                    data: {
                        txt: txtSearch
                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        // Do something to handle the error
                        console.error("Error:", xhr.statusText);
                    }
                });
            }
            function searchByPriceUnder100() {
                $.ajax({
                    url: "/BanHang/searchByAjaxUnder100",
                    type: "get",
                    data: {},
                    success: function (data) {
                        var container = document.getElementById("product-container");
                        container.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.error("Error:", xhr.statusText);
                    }
                });
            }
            function searchByPrice100to200() {
                $.ajax({
                    url: "/BanHang/searchByAjax100to200",
                    type: "get",
                    data: {},
                    success: function (data) {
                        var container = document.getElementById("product-container");
                        container.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.error("Error:", xhr.statusText);
                    }
                });
            }
            function searchByPrice200to300() {
                $.ajax({
                    url: "/BanHang/searchByAjax200to300",
                    type: "get",
                    data: {},
                    success: function (data) {
                        var container = document.getElementById("product-container");
                        container.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.error("Error:", xhr.statusText);
                    }
                });
            }
            function searchByPrice300to400() {
                $.ajax({
                    url: "/BanHang/searchByAjax300to400",
                    type: "get",
                    data: {},
                    success: function (data) {
                        var container = document.getElementById("product-container");
                        container.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.error("Error:", xhr.statusText);
                    }
                });
            }

            function searchByPriceAbove400() {
                $.ajax({
                    url: "/BanHang/searchByAjaxAbove400",
                    type: "get",
                    data: {},
                    success: function (data) {
                        var container = document.getElementById("product-container");
                        container.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.error("Error:", xhr.statusText);
                    }
                });
            }
            function searchByColorWhite() {
                $.ajax({
                    url: "/BanHang//SearchTrangColor",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        console.error("Error:", xhr.statusText);
                    }
                });
            }
            function searchByColorDen() {
                $.ajax({
                    url: "/BanHang/SearchDenColor",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            function searchByColorXam() {
                $.ajax({
                    url: "/BanHang/SearchXamColor",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            function searchByColorBe() {
                $.ajax({
                    url: "/BanHang/SearchBeColor",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            function searchByColorNau() {
                $.ajax({
                    url: "/BanHang/SearchNauColor",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            function searchByColorXanh() {
                $.ajax({
                    url: "/BanHang/SearchXanhColor",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (data) {
                        var row = document.getElementById("product-container");
                        row.innerHTML = data;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }

</script>
</html>
