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
            Product product = (Product) request.getAttribute("product");
            List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
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

        <!-- Shop Detail Start -->
        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="row col-lg-12">
                    <div class="col-lg-3">
                        <img class="w-100 h-100" src="<%= product.getpImage() %>" alt="Image">
                    </div>
                    <div class="col-lg-3">
                        <img class="w-100 h-100" src="<%= product.getpImage2()%>" alt="Image">
                    </div>
                    <div class="col-lg-3">
                        <img class="w-100 h-100" src="<%= product.getpImage3()%>" alt="Image">
                    </div>
                    <div class="col-lg-3">
                        <img class="w-100 h-100" src="<%= product.getpImage4()%>" alt="Image">
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
                    <small class="pt-1"></small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">$<%=product.getPrice()%>"</h3>
                <p class="mb-4"><%= product.getpDescription()%></p>
                <h5>
                    <a href="updateProduct?pID=<%=product.getpID()%>">Cập nhập thông tin</a><br>
                </h5>
            </div>
        </div>
            <div class="col">
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="mb-4">Phản hồi:</h4>
                        <%
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
                        <p>Không có phản hồi nào.</p>
                        <%
                            }
                        %>
                        <div id="reviews"></div>
                    </div>
                </div>
            </div>
        <!-- Shop Detail End -->
        <!-- Manage Product-->
        <div class="col-lg-12">
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
