<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.Student"%>

<!DOCTYPE html>
<html>
<head>
<title>Điểm danh</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">`r`n</head>

<body>

<div class="container mt-5">

<h2>Danh sách học sinh</h2>

<form action="AttendanceServlet" method="post">

<table class="table table-bordered">

<tr>
<th>ID</th>
<th>Tên</th>
<th>Có mặt</th>
</tr>

<%
List<Student> list = (List<Student>)request.getAttribute("listStudent");

if(list != null){
for(Student s : list){
%>

<tr>

<td><%=s.getId()%></td>

<td><%=s.getName()%></td>

<td>
<input type="checkbox" name="present" value="<%=s.getId()%>">
</td>

</tr>

<%
}
}
%>

</table>

<button class="btn btn-success">Lưu điểm danh</button>

</form>

</div>

</body>
</html>