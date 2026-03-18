<%-- 
    Document   : header
    Created on : Mar 1, 2026, 2:25:07 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>E-Center</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg shadow-sm">
            <div class="container">

                <!-- Logo -->
                <a class="navbar-brand" href="index.jsp">E-Center</a>

                <button class="navbar-toggler" type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">

                    <!-- Menu giữa -->
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Giới thiệu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Tính năng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đối tác</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Liên hệ</a>
                        </li>
                    </ul>
                    <c:if test="${sessionScope.user.role == 'admin'}">
                        <a href="AdminServlet" class="text-primary fs-5">
                            <i class="bi bi-sliders"></i>
                        </a>

                        <div class="vr"></div>
                    </c:if>
                    <div class="input-group search-group" style="max-width: 400px;max-height: 100px">
                        <input type="text" name="query" class="form-control search-input rounded-0" 
                               placeholder="Tìm kiếm..." aria-label="Search">
                        <button class="btn btn-search rounded-0" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>

                    <!-- Nút bên phải -->
                    <c:choose>

                        <c:when test="${sessionScope.user != null}">

                            <div class="dropdown">

                                <button class="btn btn-primary dropdown-toggle"
                                        type="button"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                    ${sessionScope.user.account}
                                </button>

                                <ul class="dropdown-menu dropdown-menu-end">

                                    <li>
                                        <a class="dropdown-item" href="UpdateProfileServlet">
                                            Chỉnh sửa thông tin
                                        </a>
                                    </li>

                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>

                                    <li class="px-3 py-2">
    <a class="btn btn-outline-danger w-100" href="LogoutServlet">
        Dang xuat
    </a>
</li>

                                </ul>

                            </div>

                        </c:when>

                        <c:otherwise>

                            <div class="d-flex gap-2">
                                <a href="Login.jsp" class="btn btn-login px-3">Đăng nhập</a>
                                <a href="register.jsp" class="btn btn-register px-3">Đăng ký</a>
                            </div>

                        </c:otherwise>

                    </c:choose>

                </div>
            </div>
        </nav>