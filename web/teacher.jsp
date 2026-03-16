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
%>

<!DOCTYPE html>
<html>
<head>
    <title>Teacher - Điểm danh</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">Điểm danh học sinh</h2>

    <form action="AttendanceServlet" method="post">

        <table class="table table-bordered">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Tên học sinh</th>
                    <th>Email</th>
                    <th>Điểm danh</th>
                </tr>
            </thead>

            <tbody>

            <%
                if(list != null){
                    for(Student s : list){
            %>

                <tr>

                    <td><%=s.getUserId()%></td>

                    <td><%=s.getName()%></td>

                    <td><%=s.getEmail()%></td>

                    <td>

                        <input type="radio" 
                               name="attendance_<%=s.getUserId()%>" 
                               value="present" required> Có mặt

                        <input type="radio" 
                               name="attendance_<%=s.getUserId()%>" 
                               value="absent"> Vắng

                    </td>

                </tr>

            <%
                    }
                }
            %>

            </tbody>

        </table>

        <button class="btn btn-primary">Lưu điểm danh</button>

    </form>

</div>

</body>
</html>