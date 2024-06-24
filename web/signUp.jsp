<%-- 
    Document   : signUp
    Created on : Mar 5, 2024, 5:26:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.3/components/logins/login-9/assets/css/login-9.css">
    </head>
    <body>
       <form  action="signup" method="post" >
    <div class="row gy-3 overflow-hidden">
        <div class="col-12">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="username" id="username" placeholder="Username" required aria-label="Username">
                <label for="username" class="form-label">Username</label>
            </div>
        </div>
        <div class="col-12">
            <div class="form-floating mb-3">
                <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required aria-label="Email">
                <label for="email" class="form-label">Email</label>
            </div>
        </div>
        <div class="col-12">
            <div class="form-floating mb-3">
                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required aria-label="Password">
                <label for="password" class="form-label">Password</label>
            </div>
        </div>
        <div class="col-12">
            <div class="form-floating mb-3">
                <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="Confirm Password" required aria-label="Confirm Password">
                <label for="confirm_password" class="form-label">Confirm Password</label>
            </div>
        </div>
        <div class="col-12">
            <div class="d-grid">
                <button class="btn btn-primary btn-lg" type="submit">Sign up now</button>
            </div>
        </div>
         <%
                                                    boolean loginFailed = (request.getAttribute("signUpFailed") != null);
                                            %>
                                            <% if (loginFailed) { %>
                                            <div class="alert alert-primary" role="alert">
                                                Password must be the same
                                            </div>
                                            <% } %>
         <%
                                                    boolean loginFailed1 = (request.getAttribute("sameUserName") != null);
                                            %>
                                            <% if (loginFailed1) { %>
                                            <div class="alert alert-primary" role="alert">
                                                Same UserName exist
                                            </div>
                                            <% } %>
    </div>
</form>
    </body>
</html>
