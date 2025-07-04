<%--
  Created by IntelliJ IDEA.
  User: ignuh
  Date: 5/9/2025
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-4">
      <div class="card p-4 shadow-sm">
        <h3 class="text-center mb-4">Đăng ký</h3>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger text-center">
          <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <form  method="post">
          <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" required>
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" required>
          </div>
          <button type="submit" class="btn btn-success w-100">Đăng ký</button>
          <p class="text-center mt-3"><a href="userLogin?action=login">Đã có tài khoản? Đăng nhập</a></p>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
