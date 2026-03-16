<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Student Dashboard</title>

        ```
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        ```

    </head>
    <body>

        <!-- Navbar -->

            <jsp:include page="header.jsp"/>
        

        <!-- Dashboard -->

        <div class="container mt-5">

            ```
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

                            <a href="student.jsp" class="btn btn-primary">
                                View Classes
                            </a>

                        </div>
                    </div>
                </div>

                <!-- Card 2 -->
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-center">

                            <h5 class="card-title">Profile</h5>

                            <p class="card-text">
                                Xem và chỉnh sửa thông tin cá nhân
                            </p>

                            <a href="profile.jsp" class="btn btn-success">
                                View Profile
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

                            <a href="index.jsp" class="btn btn-warning">
                                View Courses
                            </a>

                        </div>
                    </div>
                </div>

            </div>
            ```

        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Footer -->

        <footer>
            <jsp:include page="footer.jsp" />
        </footer>

    </body>
</html>
