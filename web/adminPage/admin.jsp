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
        <script>
            function openTab(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
        </script>
        <style>
            /* Style the tab */
            .tab {
                float: left;
                border: 1px solid #ccc;
                background-color: #D19C97 !important;
                width: 30%;
                height: 100vh;
            }

            /* Style the buttons inside the tab */
            .tab button {
                display: block;
                background-color: inherit;
                color: black;
                padding: 22px 16px;
                width: 100%;
                border: none;
                outline: none;
                text-align: left;
                cursor: pointer;
                transition: 0.3s;
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #b18581;
            }
            .tab button.active {
                background-color: #8a6865;
            }

            /* Style the tab content */
            .tabcontent {
                float: left;
                padding: 0px 12px;
                border: 1px solid #ccc;
                width: 100%;
                border-left: none;
                height: 300px;
                display:none;

            }
            .button {
                background-color: #D19C97 !important;
                color:black!important;
            }
            .button:hover {
                background-color: #b18581!important;
            }
            .button:active {
                background-color: #8a6865!important;
            }
        </style>
    </head>

    <body>
        <%
        if (session.getAttribute("acc") != null) {
            if (((entity.Account) session.getAttribute("acc")).isAdmin()) {
            Functions f = new Functions();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            List<Invoice> invoiceList = (List<Invoice>) request.getAttribute("invoiceList");
            List<TotalSell> totalSpentList = (List<TotalSell>) request.getAttribute("totalSpentList");
            List<Account> accountList = (List<Account>) request.getAttribute("accountList");
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

        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-3 px-2">
                <div class="tab col-lg-2">
                    <button class="tablinks" onclick="openTab(event, 'Products')" id="defaultOpen">Sản phẩm</button>
                    <button class="tablinks" onclick="openTab(event, 'Invoices')">Hóa đơn</button>
<!--                    <button class="tablinks" onclick="openTab(event, 'Income')">Doanh thu</button>-->
                    <button class="tablinks" onclick="openTab(event, 'Accounts')">Tài khoản</button>
                </div>
                <div class="col-lg-10">
                    <!-- Products -->
                    <div class="tabcontent" id="Products" >
                        <nav class="navbar navbar-light justify-content-between">
                            <a class="navbar-brand">Danh mục sản phẩm</a>
                            <a class="nav-item nav-link button" href="addProduct">+ Thêm sản phẩm mới <span class="sr-only">(current)</span></a>
                        </nav>
                        <table class="table table-borderless">
                            <tr style="background:lightgray">
                                <th> ID </th>
                                <th> Tên </th>
                                <th> Ảnh</th>
                                <th> Giá</th>
                                <th> Chi tiết</th>
                            </tr>
                            <br>
                            <%if (productList != null && productList.size() > 0) {%>
                            <% for (Product product : productList) { %>
                            <tr>
                                <td><%= product.getpID() %> </td>
                                <td><%= product.getpName() %> </td>
                                <td><img src="<%=product.getpImage()%>" width="40px"></td>
                                <td><%= product.getPrice() %> </td>
                                <td><a href="manageProduct?pID=<%=product.getpID()%>">Xem</a></td>
                            </tr>  
                            <% } %>
                            <%} else { %>
                            <p>Hiện tại chưa có sản phẩm nào được bày bán.</p>
                            <%}%>
                        </table>
                    </div>
                    <!--Product End-->
                    <!--Invoices-->
                    <div class="tabcontent" id="Invoices" >
                        <nav class="navbar navbar-light justify-content-between">
                            <a class="navbar-brand">Hóa đơn</a>
                        </nav>
                        <table class="table table-borderless">
                            <tr style="background:lightgray">
                                <th> ID Hóa đơn</th>
                                <th> ID Người mua </th>
                                <th> Ngày</th>
                                <th> Tổng giá</th>
                                <th> Chi tiết</th>
                            </tr>
                            <br>
                            <%if (invoiceList != null && invoiceList.size() > 0) {%>
                            <% for (Invoice invoice : invoiceList) { %>
                            <tr>
                                <td><%= invoice.getiID() %> </td>
                                <td><%= invoice.getuID() %> </td>
                                <td><%= sdf.format(invoice.getDate()) %> </td>
                                <td><%= invoice.getTotalPrice() %> </td>
                                <td><a href="invoiceDetail?iID=<%=invoice.getiID()%>">Xem</a></td>
                            </tr>  
                            <% } %>
                            <%} else { %>
                            <p>Hiện tại chưa có hóa đơn nào.</p>
                            <%}%>
                        </table>
                    </div>
                    <!-- Invoice end -->
                    <!--TotalSell-->
                    <div class="tabcontent" id="Income" >
                        <nav class="navbar navbar-light justify-content-between">
                            <a class="navbar-brand">Top khách hàng chi tiêu</a>
                        </nav>
                        <table class="table table-borderless">
                            <tr style="background:lightgray">
                                <th> Hạng </th>
                                <th> Người mua </th>
                                <th> Tổng số tiền</th>
                            </tr>

                            <br>
                            <%if (totalSpentList != null && totalSpentList.size() > 0) {%>
                            <%int counter = 1;
                              for (TotalSell totalSpent : totalSpentList) { %>
                            <tr>
                                <td><%= counter %> </td>
                                <td><%= f.getAccountWithID(accountList, totalSpent.getuID()) %> </td>
                                <td><%= totalSpent.getTotalSpent() %> </td>
                            </tr>  
                            <%counter++;
                            } %>
                            <%} else { %>
                            <p>Hiện tại chưa có ai mua hàng cả :,).</p>
                            <%}%>
                        </table>
                    </div>
                    <!<!-- Invoice end -->
                    <!-- Accounts -->
                    <div class="tabcontent" id="Accounts" >
                        <nav class="navbar navbar-light justify-content-between">
                            <a class="navbar-brand">Danh sách tài khoản</a>
                        </nav>
                        <table class="table table-borderless">
                            <tr style="background:lightgray">
                                <th> ID </th>
                                <th> Tên </th>
                                <th> Mật khẩu</th>
                                <th> Vai trò</th>
                                <th> Email</th>
                                <th>Chi tiết</th>
                            </tr>
                            <br>
                            <%if (accountList != null && accountList.size() > 0) {%>
                            <% for (Account account : accountList) { %>
                            <tr>
                                <td><%= account.getId() %> </td>
                                <td><%= account.getUserName() %> </td>                                <td><%= account.getPass() %> </td>
                                <td><%if (account.isAdmin()) {%>Quản lí<%}else {%>Khách hàng<%}%></td>
                                <td><%= account.getEmail() %> </td>
                                <td><a href="accountDetail?uID=<%=account.getId()%>">Xem</a></td>
                            </tr>  
                            <% } %>
                            <%} %>
                        </table>
                    </div>
                    <!--Account End-->
                </div>
            </div>
        </div>
        <!-- Back to Top -->
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
