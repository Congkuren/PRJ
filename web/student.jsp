<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>

        <!-- Navbar -->

            <jsp:include page="header.jsp"/>

        <!-- Dashboard -->

        <div class="container mt-5">

            <h2 class="mb-4">Student Dashboard</h2>

            <div class="row">

                <!-- Card 1 -->
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-center">

                            <h5 class="card-title">My Classes</h5>

                            <p class="card-text">
                                Xem danh sách các lớp bạn đã đăng ký
                            </p>

                            <a href="StudentClassesServlet" class="btn btn-primary">
                                View Classes
                            </a>

                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-center">

                            <h5 class="card-title">Attendance</h5>

                            <p class="card-text">
                                Xem điểm danh môn học
                            </p>

                            <a href="AttendanceServlet" class="btn btn-success">
                                check attendance
                            </a>

                        </div>
                    </div>
                </div>

                <!-- Card 3 -->
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-center">

                            <h5 class="card-title">Courses</h5>

                            <p class="card-text">
                                Xem các khóa học đang mở
                            </p>

                            <a href="CoursesServlet" class="btn btn-warning">
                                View Courses
                            </a>

                        </div>
                    </div>
                </div>

            </div>

            <c:if test="${classesLoaded}">
                <hr class="my-5">
                <h4 class="mb-3">Lớp đã đăng ký</h4>

                <c:choose>
                    <c:when test="${status == 'left'}">
                        <div class="alert alert-success">Bạn đã rời lớp thành công.</div>
                    </c:when>
                    <c:when test="${status == 'fail'}">
                        <div class="alert alert-danger">Không thể rời lớp. Vui lòng thử lại.</div>
                    </c:when>
                    <c:when test="${status == 'invalid'}">
                        <div class="alert alert-warning">Lớp không hợp lệ.</div>
                    </c:when>
                </c:choose>

                <c:choose>
                    <c:when test="${empty registeredClasses}">
                        <div class="alert alert-info">Bạn chưa đăng ký lớp nào.</div>
                    </c:when>
                    <c:otherwise>
                        <div class="row g-3">
                            <c:forEach items="${registeredClasses}" var="cl">
                                <div class="col-md-6">
                                    <div class="card shadow-sm h-100">
                                        <div class="card-body">
                                            <h5 class="card-title">${cl.className}</h5>
                                            <p class="card-text mb-1"><strong>Giáo viên:</strong> ${cl.teacherName}</p>
                                            <p class="card-text mb-1"><strong>Môn học:</strong> ${cl.subjectName}</p>
                                            <p class="card-text"><strong>Số học sinh:</strong> ${cl.studentCount}</p>
                                            <form action="StudentClassesServlet" method="post"
                                                  onsubmit="return confirm('Bạn muốn rời lớp này?');">
                                                <input type="hidden" name="action" value="leave">
                                                <input type="hidden" name="classId" value="${cl.classId}">
                                                <button type="submit" class="btn btn-outline-danger btn-sm">Rời lớp</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>

            <c:if test="${attendanceLoaded}">
                <hr class="my-5">
                <h4 class="mb-3">Điểm danh của bạn</h4>

                <c:choose>
                    <c:when test="${empty attendanceRecords}">
                        <div class="alert alert-info">Bạn chưa có dữ liệu điểm danh.</div>
                    </c:when>
                    <c:otherwise>
                        <div class="d-flex flex-wrap gap-2 mb-3">
                            <span class="badge bg-secondary">Tổng buổi: ${attendanceTotal}</span>
                            <span class="badge bg-success">Có mặt: ${attendancePresent}</span>
                            <span class="badge bg-danger">Vắng: ${attendanceAbsent}</span>
                            <c:if test="${attendanceLate > 0}">
                                <span class="badge bg-warning text-dark">Trễ: ${attendanceLate}</span>
                            </c:if>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-bordered align-middle">
                                <thead>
                                    <tr>
                                        <th>Ngày</th>
                                        <th>Lớp</th>
                                        <th>Môn học</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${attendanceRecords}" var="a">
                                        <tr>
                                            <td>${a.attendanceDate}</td>
                                            <td>${a.className}</td>
                                            <td>${a.subjectName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${a.status == 'Present'}">
                                                        <span class="text-success">Có mặt</span>
                                                    </c:when>
                                                    <c:when test="${a.status == 'Absent'}">
                                                        <span class="text-danger">Vắng</span>
                                                    </c:when>
                                                    <c:when test="${a.status == 'Late'}">
                                                        <span class="text-warning">Trễ</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${a.status}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:if>

        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Footer -->

        <footer>
            <jsp:include page="footer.jsp" />
        </footer>

    </body>
</html>
