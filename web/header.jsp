<%-- 
    Document   : header
    Created on : Mar 1, 2026, 2:25:07 AM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>E-Center</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

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
                    <div class="input-group search-group" style="max-width: 400px;max-height: 100px">
                        <input type="text" name="query" class="form-control search-input rounded-0" 
                               placeholder="Tìm kiếm..." aria-label="Search">
                        <button class="btn btn-search rounded-0" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                    <!-- Nút bên phải -->
                    <div class="d-flex gap-2">
                        <a href="Login.jsp" class="btn btn-login px-3">Đăng nhập</a>
                        <a href="register.jsp" class="btn btn-register px-3">Đăng ký</a>
                    </div>

                </div>
            </div>
        </nav>