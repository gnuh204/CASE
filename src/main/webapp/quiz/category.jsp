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

    <style>
        .bg-tim {
            background-color: purple;
            color: white;
        }
    </style>

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


    <div class="content">
        <c:forEach items="${topics}" var="category">
            <div class="container mt-5 mb-4 border rounded bg-white">
                <div class="row">
                    <div class="col-md-1 p-3">
                        <img src="${category.getImage_url()}" alt="" style="width:80px;height:80px;">
                    </div>
                    <div class="col-md-7 p-3 d-flex align-items-center">
                        <h3><c:out value="${category.name}"/></h3>
                    </div>
                    <div class="col-md-4 p-3 d-flex align-items-center gap-3">
                        <div class="border rounded bg-white px-3 py-3 text-center">
                            <h6 class="mb-0">Xem trước</h6>
                        </div>
                        <a href="/Quizz?action=start&topic_id=${category.getId()}" style="text-decoration: none;">
                            <div class="border rounded bg-tim px-3 py-3 text-center text-white">
                                <h6 class="mb-0"><i class="bi bi-play-fill"></i> Bắt đầu ngay bây giờ</h6>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

</body>
</html>
