fađ<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="entity.Product" %>
    <%@page import = "entity.Category" %>
    <%@page import = "java.util.*" %>
    <%@page import = "entity.Product" %>
    <%@page import = "entity.Review" %>
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shop Detail</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Shop Detail Start -->
        <%
        Product product = (Product) request.getAttribute("detailProduct");
        %>
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-12">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <div class="carousel-item active">
                                <img class="w-100 h-100" src="<%= product.getpImage() %>" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="<%= product.getpImage2()%>" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="<%= product.getpImage3()%>" alt="Image">
                            </div>
                            <div class="carousel-item">
                                <img class="w-100 h-100" src="<%= product.getpImage4()%>" alt="Image">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold"><%= product.getpName()%></h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(50 Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">$150.00</h3>
                <p class="mb-4"><%= product.getpDescription()%></p>


                <div class="d-flex align-items-center mb-4 pt-2">
                    <form action="addCart" method="get" class="d-flex align-items-center" id="quantityForm">
                        <div class="input-group quantity mr-3" style="width: 130px;">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-minus" type="button" onclick="decreaseQuantity()">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control bg-secondary text-center" value="1" min="0" name="quantity" id="quantityInput">
                            <div class="input-group-btn">
                                <button class="btn btn-primary btn-plus" type="button" onclick="increaseQuantity()">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <input type="hidden" name="pid" value="<%=product.getpID()%>">
                        <button type="button" class="btn btn-primary px-3" onclick="addToCart()">
                            <i class="fa fa-shopping-cart mr-1"></i> Add To Cart
                        </button>
                    </form>

                    <script>
                        function increaseQuantity() {
                            var quantityInput = document.getElementById('quantityInput');
                            var currentValue = parseInt(quantityInput.value);
                            quantityInput.value = currentValue++;
                        }

                        function decreaseQuantity() {
                            var quantityInput = document.getElementById('quantityF');
                            var currentValue = parseInt(quantityInput.value);
                            if (currentValue > 1) {
                                quantityInput.value = currentValue--;
                            }
                        }

                        function addToCart() {
                            document.getElementById('quantityForm').submit();
                        }
                    </script>
                </div>

            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p> <%= product.getpDescription() %></p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Additional Information</h4>
                        <p>Eos no lorem eirmod diam diam, eos elitr et gubergren diam sea. Consetetur vero aliquyam invidunt duo dolores et duo sit. Vero diam ea vero et dolore rebum, dolor rebum eirmod consetetur invidunt sed sed et, lorem duo et eos elitr, sadipscing kasd ipsum rebum diam. Dolore diam stet rebum sed tempor kasd eirmod. Takimata kasd ipsum accusam sadipscing, eos dolores sit no ut diam consetetur duo justo est, sit sanctus diam tempor aliquyam eirmod nonumy rebum dolor accusam, ipsum kasd eos consetetur at sit rebum, diam kasd invidunt tempor lorem, ipsum lorem elitr sanctus eirmod takimata dolor ea invidunt.</p>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                </ul> 
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Sit erat duo lorem duo ea consetetur, et eirmod takimata.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Amet kasd gubergren sit sanctus et lorem eos sadipscing at.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Duo amet accusam eirmod nonumy stet et et stet eirmod.
                                    </li>
                                    <li class="list-group-item px-0">
                                        Takimata ea clita labore amet ipsum erat justo voluptua. Nonumy.
                                    </li>
                                </ul> 
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4">1 review for "Colorful Stylish Shirt"</h4>
                                <%
     List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");

     if (reviewList != null && !reviewList.isEmpty()) {
         for (Review review : reviewList) {
                                %>
                                <div class="media mb-4">
                                    <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                    <div class="media-body">
                                        <h6><%= product.getpName() %> <small> - <i><%= review.getReviewDate() %></i></small></h6>
                                        <p><%= review.getComment() %></p>
                                    </div>
                                </div>
                                <%
                                        }
                                    } else {
                                %>
                                <p>No reviews available.</p>
                                <%
                                    }
                                %>

                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">Leave a review</h4>
                                <small>Your email address will not be published. Required fields are marked *</small>
                                <div class="d-flex my-3">
                                    <p class="mb-0 mr-2">Your Rating * :</p>
                                    <div class="text-primary">
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                        <i class="far fa-star"></i>
                                    </div>
                                </div>

                                <form id="reviewForm" action="addReview" method="post">
                                    <div class="form-group">
                                        <label for="message">Your Review *</label>
                                        <textarea id="message" name="contentReview" cols="30" rows="5" class="form-control"></textarea>
                                    </div>

                                    <div class="form-group mb-0">
                                        <input onclick="addReview(<%=product.getpID()%>, <%=session.getAttribute("acc") != null %>)" type="button" value="Leave Your Review" class="btn btn-primary px-3">

                                    </div>
                                </form>
                            </div>

                            <div id="reviews"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <%
   
    List<Product> relatedProducts = (List<Product>) request.getAttribute("alsoLikeProductList");
    %>
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <% for (Product relatedProduct : relatedProducts) { %>
                    <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src="<%= relatedProduct.getpImage() %>" alt="<%= relatedProduct.getpName() %>">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3"><%= relatedProduct.getpName() %></h6>
                            <div class="d-flex justify-content-center">
                                <h6>$123.00</h6><h6 class="text-muted ml-2"><del><%= relatedProduct.getPrice() %></del></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between bg-light border">
                            <a href="detail?pid=<%= product.getpID() %>"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                            <a href=""><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->


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

    <script>
        window.addEventListener("load", function loadAmountCart() {
            $.ajax({
                url: "/WebsiteBanGiay/loadAllAmountCart",
                type: "get", //send it through get method
                data: {

                },
                success: function (responseData) {
                    document.getElementById("amountCart").innerHTML = responseData;
                }
            });
        }, false);

        function addReview(pID, checkLogin) {
            if (!checkLogin) {
                // Redirect to the login page
                window.location.href = '/BanHang/login'; // Replace '/login' with the actual login page URL
            } else {
                var cntReview = document.getElementById("message").value;
                $.ajax({
                    url: "/BanHang/addReview",
                    type: "get", //send it through get method
                    data: {
                        productID: pID,
                        contentReview: cntReview
                    },
                    success: function (data) {
                        var row = document.getElementById("reviews");
                        row.innerHTML += data;
                    },
                    error: function (xhr) {
                        // Do Something to handle error
                    }
                });
            }
        }

    </script>
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