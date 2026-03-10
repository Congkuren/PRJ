<!DOCTYPE html>

<html>
<head>
    <title>Register</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="card">

<h2>Create Account</h2>

<form action="Register" method="post">

<div class="input-group">
<label>Account</label>
<input type="text" name="account" required>
</div>

<div class="input-group">
<label>Password</label>
<input type="password" name="password" required>
</div>

<div class="input-group">
<label>Role</label>
<select name="role">
<option value="student">Student</option>
<option value="teacher">Teacher</option>
</select>
</div>

<button type="submit">Create Account</button>

</form>

<a href="Login.jsp" class="back">Back to Login</a>

</div>

</body>
</html>
