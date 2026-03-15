<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%
        String account = "";
        String password = "";

        Cookie[] cookies = request.getCookies();

        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals("account")){
                    account = c.getValue();
                }
                if(c.getName().equals("password")){
                    password = c.getValue();
                }
            }
        }
        %>
        <div class="container mt-5">
            <div class="col-md-5 mx-auto card p-4 shadow">
                <h2 class="text-center mb-4">Đăng nhập</h2>

                <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
                <% } %>
                <% if(request.getAttribute("success") != null) { %>
                <div class="alert alert-success"><%= request.getAttribute("success") %></div>
                <% } %>

                <form action="${pageContext.request.contextPath}/Login" method="post">
                    <div class="mb-3">
                        <label>Tài khoản</label>
                        <input type="text" name="account"
                               value="<%=account%>"
                               class="form-control">
                    </div>
                    <div class="mb-3">
                        <label>Mật khẩu</label>
                        <input type="password" name="password"
                               value="<%=password%>"
                               class="form-control">
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" name="remember">
                        <label class="form-check-label">
                            Ghi nhớ đăng nhập
                        </label>
                    </div>
                    <button class="btn btn-primary w-100">Đăng nhập</button>
                </form>

                <p class="mt-3 text-center">
                    Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
                    <a href="../src/java/controller/CreateAccountServlet.java"></a>
                </p>
            </div>
        </div>

    </body>
</html>