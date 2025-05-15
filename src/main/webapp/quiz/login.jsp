<%--
  Created by IntelliJ IDEA.
  User: ignuh
  Date: 5/9/2025
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
</head>

<body class="bg-light">
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="card p-4 shadow-sm">
        <h3 class="text-center mb-4">Đăng nhập</h3>
        <%
          String errorMessage = (String) session.getAttribute("Loi");
          if (errorMessage != null) {
        %>
        <div class="alert alert-danger text-center">
          <%= errorMessage %>
        </div>
        <%
            session.removeAttribute("Loi"); /
          }
        %>
        <form  method="post">
          <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
          <p class="text-center mt-3"><a href="userLogin?action=register">Chưa có tài khoản? Đăng ký</a></p>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
