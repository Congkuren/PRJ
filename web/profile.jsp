<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <title>Chỉnh sửa thông tin</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="header.jsp"/>

        <div class="container mt-5">

            <div class="col-md-6 mx-auto card shadow p-4">

                <h3 class="text-center mb-4">Chỉnh sửa thông tin</h3>

                <form action="UpdateProfileServlet" method="post">

                    <div class="mb-3">
                        <label>Tên</label>
                        <input type="text" name="name"
                               value="${profile.name}"
                               class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Email</label>
                        <input type="text" name="email"
                               value="${profile.email}"
                               class="form-control">
                    </div>

                    <div class="mb-3">
                        <label>Số điện thoại</label>
                        <input type="text" name="phone"
                               value="${profile.phone}"
                               class="form-control">
                    </div>

                    <c:choose>

                        <c:when test="${sessionScope.user.role == 'teacher'}">

                            <div class="mb-3">
                                <label>Kinh nghiệm</label>
                                <input type="text" name="experience"
                                       value="${profile.experience}"
                                       class="form-control">
                            </div>

                        </c:when>

                        <c:otherwise>

                            <div class="mb-3">
                                <label>Ngày sinh</label>
                                

                                <input type="date" name="dob"
                                        value="${profile.dob}"
                                       class="form-control">
                            </div>

                        </c:otherwise>

                    </c:choose>

                    <button class="btn btn-primary w-100">
                        Cập nhật
                    </button>

                </form>
            </div>

        </div>

    </body>
</html>