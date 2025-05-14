<%--
  Created by IntelliJ IDEA.
  User: ignuh
  Date: 5/9/2025
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.quiz.model.User" %>

<html>
<head>
    <title>Quzi home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Css/Style.css">


</head>
<body>
<!-- Navbar -->
<%
    // Lấy user từ session để kiểm tra đăng nhập
    User user = (User) session.getAttribute("user");
%>
<header>
    <nav class="navbar navbar-expand-lg px-4 fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">QUIZ</a>
            <div class="ms-auto">
                <a href="#" class="btn btn-outline-primary ">Nhập mã</a>
                <% if (user != null) { %>
                Xin chào, <strong><%= user.getName()%>
            </strong> |
                <a href="${pageContext.request.contextPath}/userLogin?action=logout" class="btn btn-outline-primary">Đăng
                    xuất</a>


                <% } else {%>
                <a href="${pageContext.request.contextPath}/userLogin?action=login" class="btn btn-outline-primary ">Đăng
                    nhập</a>
                <% }%>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="#"><strong>+ Tạo mới</strong></a>
        <a href="#">Khám phá</a>
        <a href="#">Thư viện</a>
        <a href="#">Báo cáo</a>
    </div>
</header>
<!-- Nội dung chính -->

<div class="content">
    <div class="container-fluid text-center bg-warning py-4">
        <h3>Chào mừng</h3>
        <div>
            <form class="d-flex justify-content-center" role="search">
                <input class="form-control me-2 w-25 " type="search" placeholder="Tìm kiếm..." aria-label="Search">
                <button class="btn btn-outline-light" type="submit"><i class="bi bi-search text-dark"></i></button>
            </form>
        </div>
    </div>
    <div class="container mt-5">
        <h5>Thịnh hành</h5>
        <div class="row">
            <c:forEach var="topic" items="${parentTopics}">
                <div class="col-md-3 d-flex ">
                    <a href="/Quizz?action=view&id=${topic.getId()}" class="text-dark">
                        <div class="border rounded-4 p-2 d-flex flex-column justify-content-between w-100 bg-white">
                            <div>
                                <img src="${topic.getImage_url()}" style="height: 100px;">
                                <h6 class="mt-2 text-center Quiz-name">
                                    <c:out value="${topic.name}"/>
                                </h6>
                                <p>Lượt xem</p>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

</div>


</body>
</html>
