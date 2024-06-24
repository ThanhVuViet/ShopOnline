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
            List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
            String notif = (String) request.getAttribute("notif");
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
        <div class="px-4" style="margin: auto">
            <h5>Thêm sản phẩm:</h5>
            <span style="color:red;"><%=notif%></span>
            <form action="addProduct" method="POST">
                <div class="form-group">
                    <label for="name">Tên</label>
                    <input type="text" class="form-control" id="name" name="name" value="">
                </div>
                <div class="form-group">
                    <label for="image">Ảnh 1</label>
                    <input type="text" class="form-control" id="image" name="image" value="">
                </div>
                <div class="form-group">
                    <label for="price">Giá ($)</label>
                    <input type="number" class="form-control" id="price" name="price" value="">
                </div>
                <div class="form-group">
                    <label for="description">Thông tin chi tiết</label>
                    <textarea class="form-control" id="description" name="description" rows="6" ></textarea>
                </div>
                <div class="form-group">
                    <label for="cateID">Loại</label>
                    <select class="form-control" id="cateID" name="cateID">
                        <%for (Category category: categoryList) {%>
                        <option value="<%=category.getCateID()%>" ><%=category.getCname()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="image2">Ảnh 2</label>
                    <input type="text" class="form-control" id="image2" name="image2" value="">
                </div>
                <div class="form-group">
                    <label for="image3">Ảnh 3</label>
                    <input type="text" class="form-control" id="image3" name="image3" value="">
                </div>
                <div class="form-group">
                    <label for="image4">Ảnh 4</label>
                    <input type="text" class="form-control" id="image4" name="image4" value="">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

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
