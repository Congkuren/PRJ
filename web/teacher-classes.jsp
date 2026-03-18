<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.ClassRoom"%>
<%@page import="models.User"%>

<%
    User user = (User) session.getAttribute("user");

    if(user == null || !"teacher".equals(user.getRole())){
        response.sendRedirect("Login.jsp");
        return;
    }

    List<ClassRoom> list = (List<ClassRoom>) request.getAttribute("classList");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Teacher - Class List</title>
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
                    <h1 class="page-title">Danh sach lop</h1>
                    <p class="page-subtitle">Chon lop de xem danh sach hoc sinh va diem danh.</p>
                </div>
</div>

            <%
                Boolean showAll = (Boolean) request.getAttribute("showAllClasses");
                if (showAll != null && showAll) {
            %>
                <div class="text-center text-muted mb-3">Khong co lop gan voi giao vien nay, dang hien tat ca lop.</div>
            <%
                }
            %>

            <div class="card table-card">
                <table class="table table-bordered align-middle">
                    <thead>
                        <tr>
                            <th style="width: 120px;">ID</th>
                            <th>Ten lop</th>
                            <th style="width: 260px;"></th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        if(list == null || list.isEmpty()){
                    %>
                        <tr>
                            <td colspan="3" class="text-center text-muted">Khong co lop</td>
                        </tr>
                    <%
                        }else{
                            for(ClassRoom c : list){
                    %>
                        <tr>
                            <td><%=c.getClassId()%></td>
                            <td><%=c.getClassName()%></td>
                            <td>
                                <a class="btn btn-sm btn-primary" href="TeacherServlet?classId=<%=c.getClassId()%>">Xem danh sach hoc sinh</a>
                            </td>
                        </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>

        </div>
    </main>

    <footer>
        <jsp:include page="footer.jsp"/>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
