<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.Student"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thong bao diem danh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <main class="page-shell">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center page-hero mb-4">
                <div>
                    <h1 class="page-title">Luu diem danh thanh cong</h1>
                    <%
                        String className = (String) request.getAttribute("className");
                        if (className != null) {
                    %>
                        <p class="page-subtitle">Lop: <strong><%=className%></strong></p>
                    <%
                        } else {
                    %>
                        <p class="page-subtitle">Tong hop ket qua diem danh.</p>
                    <%
                        }
                    %>
                </div>
                <a class="btn btn-outline-secondary btn-sm" href="TeacherClassServlet">Danh sach lop</a>
            </div>

            <div class="card table-card">
                <div class="row text-center">
                    <div class="col-md-4 mb-3">
                        <div class="border rounded p-3">
                            <div class="fw-bold">Tong so</div>
                            <div class="fs-4"><%=request.getAttribute("totalCount")%></div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="border rounded p-3">
                            <div class="fw-bold text-success">Co mat</div>
                            <div class="fs-4 text-success"><%=request.getAttribute("presentCount")%></div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="border rounded p-3">
                            <div class="fw-bold text-danger">Vang</div>
                            <div class="fs-4 text-danger"><%=request.getAttribute("absentCount")%></div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-6 mb-3">
                        <h5 class="text-success mb-3">Danh sach co mat</h5>
                        <ul class="list-group">
                            <%
                                List<Student> presentStudents = (List<Student>) request.getAttribute("presentStudents");
                                if (presentStudents == null || presentStudents.isEmpty()) {
                            %>
                                <li class="list-group-item text-muted">Khong co</li>
                            <%
                                } else {
                                    for (Student s : presentStudents) {
                                        String name = s.getName();
                                        if (name == null || name.trim().isEmpty()) {
                                            name = "Chua cap nhat";
                                        }
                            %>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span><%=name%></span>
                                    <small class="text-muted">ID: <%=s.getUserId()%></small>
                                </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="col-md-6 mb-3">
                        <h5 class="text-danger mb-3">Danh sach vang</h5>
                        <ul class="list-group">
                            <%
                                List<Student> absentStudents = (List<Student>) request.getAttribute("absentStudents");
                                if (absentStudents == null || absentStudents.isEmpty()) {
                            %>
                                <li class="list-group-item text-muted">Khong co</li>
                            <%
                                } else {
                                    for (Student s : absentStudents) {
                                        String name = s.getName();
                                        if (name == null || name.trim().isEmpty()) {
                                            name = "Chua cap nhat";
                                        }
                            %>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <span><%=name%></span>
                                    <small class="text-muted">ID: <%=s.getUserId()%></small>
                                </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                </div>
<div class="action-bar justify-content-center">
                    <%
                        String classId = (String) request.getAttribute("classId");
                        if (classId != null && classId.trim().length() > 0) {
                    %>
                        <a class="btn btn-primary" href="TeacherServlet?classId=<%=classId%>">Quay lai lop</a>
                    <%
                        }
                    %>
                    <a class="btn btn-outline-secondary" href="TeacherClassServlet">Danh sach lop</a>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
