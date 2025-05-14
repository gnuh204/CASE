<%--
  Created by IntelliJ IDEA.
  User: ignuh
  Date: 5/14/2025
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Kết Quả Bài Làm</title>
    <style>
        .correct { color: green; font-weight: bold; }
        .wrong { color: red; }
    </style>
</head>
<body>
<h2>Kết Quả Bài Trắc Nghiệm</h2>
<p>Bạn làm đúng <strong>${score}</strong> / ${total} câu</p>
<hr>

<c:forEach var="q" items="${questions}">
    <div>
        <p><strong>Câu hỏi:</strong> ${q.content}</p>

        <c:if test="${not empty q.q_image_url}">
            <img src="${pageContext.request.contextPath}/${q.q_image_url}" width="200" />
        </c:if>

        <p><strong>Đáp án đã chọn:</strong>
            <c:forEach var="a" items="${allAnswers}">
                <c:if test="${a.question_id == q.question_id && a.answer_id == userAnswers[q.question_id]}">
                    <span class="${a.is_Correct == 1 ? 'correct' : 'wrong'}">${a.content}</span>
                </c:if>
            </c:forEach>
        </p>

        <p><strong>Đáp án đúng:</strong>
            <c:forEach var="a" items="${allAnswers}">
                <c:if test="${a.question_id == q.question_id && a.is_Correct == 1}">
                    <span class="correct">${a.content}</span>
                </c:if>
            </c:forEach>
        </p>
        <hr>
    </div>
</c:forEach>

<a href="Quizz">Quay về Trang chủ</a>
</body>
</html>


