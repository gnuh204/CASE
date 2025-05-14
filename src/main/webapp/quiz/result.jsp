<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Kết Quả Bài Làm</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 800px;
        }

        .question-img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .list-group-item {
            font-size: 15px;
        }

        .question-content {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            gap: 16px;
        }

        .card-body {
            font-size: 15px;
            line-height: 1.5;
        }

        .question-content > div:last-child {
            width: 150px;
            flex-shrink: 0;
        }

        @media (max-width: 768px) {
            .question-content {
                flex-direction: column;
            }

            .question-content > div:last-child {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Kết Quả Bài Trắc Nghiệm</h2>

    <div class="alert alert-info text-center fs-5">
        Bạn làm đúng <strong>${score}</strong> / ${total} câu
    </div>

    <c:forEach var="q" items="${questions}">
        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <div class="question-content">
                    <!-- Cột trái: Đáp án -->
                    <div class="flex-grow-1">
                        <p class="fw-bold mb-1">Đáp án đã chọn:</p>
                        <ul class="list-group mb-3">
                            <c:forEach var="a" items="${allAnswers}">
                                <c:if test="${a.question_id == q.question_id && a.answer_id == userAnswers[q.question_id]}">
                                    <li class="list-group-item
                                        ${a.is_Correct == 1 ? 'list-group-item-success' : 'list-group-item-danger'}">
                                        <i class="bi ${a.is_Correct == 1 ? 'bi-check-circle-fill' : 'bi-x-circle-fill'} me-2"></i>
                                            ${a.content}
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>

                        <p class="fw-bold mb-1">Đáp án đúng:</p>
                        <ul class="list-group">
                            <c:forEach var="a" items="${allAnswers}">
                                <c:if test="${a.question_id == q.question_id && a.is_Correct == 1}">
                                    <li class="list-group-item list-group-item-success">
                                        <i class="bi bi-check-circle-fill me-2"></i>${a.content}
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                    <!-- Cột phải: Hình ảnh -->
                    <div>
                        <p><strong>Câu hỏi:</strong> ${q.content}</p>
                        <c:if test="${not empty q.q_image_url}">
                            <img src="${pageContext.request.contextPath}/${q.q_image_url}" class="question-img" alt="Hình ảnh câu hỏi">
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="text-center">
        <a href="Quizz" class="btn btn-primary btn-lg px-4">
            <i class="bi bi-arrow-left-circle me-2"></i>Quay về Trang chủ
        </a>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
