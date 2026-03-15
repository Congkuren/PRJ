<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>

        <title>Admin Panel</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/admin.css">

    </head>

    <body>

        <jsp:include page="header.jsp"/>

        <div class="container mt-5">

            <h3>Quản lý người dùng</h3>

            <table class="table table-bordered">

                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Account</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach items="${users}" var="u">

                        <tr>

                            <td>${u.userid}</td>
                            <td>${u.account}</td>

                            <td>

                                <c:choose>

                                    <c:when test="${u.role == 'admin'}">
                                        <span class="role-admin">Admin</span>
                                    </c:when>

                                    <c:when test="${u.role == 'teacher'}">
                                        <span class="role-teacher">Teacher</span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="role-student">Student</span>
                                    </c:otherwise>

                                </c:choose>

                            </td>

                            <!-- STATUS -->
                            <td>

                                <c:choose>

                                    <c:when test="${u.status == 1}">
                                        <span class="text-success">Active</span>
                                    </c:when>

                                    <c:otherwise>
                                        <span class="text-danger">Banned</span>
                                    </c:otherwise>

                                </c:choose>

                            </td>

                            <!-- ACTION -->
                            <td>

                                <c:choose>

                                    <c:when test="${u.status == 1}">
                                        <a href="BanUserServlet?id=${u.userid}"
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('Cấm tài khoản này?')">
                                            Cấm
                                        </a>
                                    </c:when>

                                    <c:otherwise>
                                        <a href="UnbanUserServlet?id=${u.userid}"
                                           class="btn btn-success btn-sm">
                                            Mở lại
                                        </a>
                                    </c:otherwise>

                                </c:choose>

                            </td>

                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </div>

    </body>
</html>