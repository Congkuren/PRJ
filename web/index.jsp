<%-- 
    Document   : index.jsp
    Created on : Mar 1, 2026, 1:18:15 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>English Center</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <!-- ===== NAVBAR ===== -->
        <header>
            <jsp:include  page="header.jsp"/>
        </header>

        <!-- ===== HERO SECTION ===== -->
        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center">

                    <!-- LEFT -->
                    <div class="col-lg-6">
                        <h1 class="fw-bold display-5 mb-4">
                            Chuẩn kiến thức  <br>
                            Vững kỹ năng
                        </h1>

                        <a href="#" class="btn btn-lg btn-warning rounded-pill px-5 py-3 mb-4">
                            Tham gia ngay
                        </a>

                        <div class="feature-tags">
                            <span> 1.Cung cấp tài nguyên</span>
                            <span> 2.Giao bài tập</span>
                            <span> 3.Quản lý lớp học</span>
                        </div>
                    </div>

                    <!-- RIGHT -->
                    <div class="col-lg-6 text-center position-relative">
                        <div class="hero-image">
                            <img src="images/teacher.png" class="img-fluid main-img">
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        
        <footer>
            <jsp:include page="footer.jsp" />
        </footer>
    </body>
</html>