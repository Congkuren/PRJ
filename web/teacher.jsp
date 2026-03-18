<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.Student"%>
<%@page import="models.User"%>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !user.getRole().equals("teacher")){
        response.sendRedirect("Login.jsp");
        return;
    }

    List<Student> list = (List<Student>) request.getAttribute("studentList");
    String className = (String) request.getAttribute("className");
    Object classIdObj = request.getAttribute("classId");

    if(list == null){
        response.sendRedirect("TeacherServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Teacher - Diem danh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <header>
        <jsp:include  page="header.jsp"/>
    </header>

    <main class="page-shell">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center page-hero mb-4">
                <div>
                    <h1 class="page-title">Diem danh hoc sinh</h1>
                    <% if(className != null){ %>
                        <p class="page-subtitle">Lop: <strong><%=className%></strong></p>
                    <% } else { %>
                        <p class="page-subtitle">Chon lop de diem danh.</p>
                    <% } %>
                </div>
                <a class="btn btn-outline-secondary btn-sm" href="TeacherClassServlet">Danh sach lop</a>
            </div>

            <div class="card table-card">
                <form action="AttendanceServlet" method="post">
                    <% if(classIdObj != null){ %>
                        <input type="hidden" name="classId" value="<%=classIdObj%>">
                    <% } %>

                    <table class="table table-bordered align-middle">
                        <thead>
                            <tr>
                                <th style="width: 120px;">ID</th>
                                <th>Ten hoc sinh</th>
                                <th>Email</th>
                                <th style="width: 260px;">Diem danh</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            if(list == null || list.isEmpty()){
                        %>
                            <tr>
                                <td colspan="4" class="text-center text-muted">Khong co hoc sinh</td>
                            </tr>
                        <%
                            }else{
                                for(Student s : list){
                        %>
                            <tr>
                                <td><%=s.getUserId()%></td>
                                <td><%=s.getName()%></td>
                                <td><%=s.getEmail()%></td>
                                <td>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="attendance_<%=s.getUserId()%>"
                                               value="present" required>
                                        <label class="form-check-label">Co mat</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="attendance_<%=s.getUserId()%>"
                                               value="absent">
                                        <label class="form-check-label">Vang</label>
                                    </div>
                                </td>
                            </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>

                    <div class="action-bar">
                        <button class="btn btn-primary">Luu diem danh</button>
                    </div>
                </form>
            </div>

        </div>
    </main>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
