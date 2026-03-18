<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Courses</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <div class="container mt-5">
            <h2 class="mb-4">Danh sách môn học</h2>

            <c:choose>
                <c:when test="${status == 'enrolled'}">
                    <div class="alert alert-success">Đăng ký lớp thành công.</div>
                </c:when>
                <c:when test="${status == 'exists'}">
                    <div class="alert alert-info">Bạn đã đăng ký lớp này.</div>
                </c:when>
                <c:when test="${status == 'invalid'}">
                    <div class="alert alert-warning">Lớp không hợp lệ.</div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${empty availableClasses}">
                    <div class="alert alert-info">Chưa có lớp để đăng ký.</div>
                </c:when>
                <c:otherwise>
                    <div class="row g-3">
                        <c:forEach items="${availableClasses}" var="cl">
                            <div class="col-md-6 col-lg-4">
                                <div class="card shadow-sm h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            <c:choose>
                                                <c:when test="${empty cl.subjectName}">Chưa cập nhật môn</c:when>
                                                <c:otherwise>${cl.subjectName}</c:otherwise>
                                            </c:choose>
                                        </h5>
                                        <p class="card-text mb-1"><strong>Lớp:</strong> ${cl.className}</p>
                                        <p class="card-text mb-1"><strong>Giáo viên:</strong> ${cl.teacherName}</p>
                                        <p class="card-text"><strong>Số học sinh:</strong> ${cl.studentCount}</p>

                                        <c:choose>
                                            <c:when test="${cl.enrolled}">
                                                <button class="btn btn-outline-secondary btn-sm" disabled>Đã đăng ký</button>
                                            </c:when>
                                            <c:otherwise>
                                                <form action="CoursesServlet" method="post"
                                                      onsubmit="return confirm('Đăng ký lớp này?');">
                                                    <input type="hidden" name="classId" value="${cl.classId}">
                                                    <button type="submit" class="btn btn-primary btn-sm">Đăng ký</button>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <footer>
            <jsp:include page="footer.jsp" />
        </footer>

    </body>
</html>
