<%@ page import="com.example.quiz.model.Questions" %>
<%@ page import="com.example.quiz.model.Answer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Questions question = (Questions) request.getAttribute("question");
    List<Answer> answers = (List<Answer>) request.getAttribute("answers");
    int totalQuestions = (Integer) request.getAttribute("totalQuestions");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Quiz</title>
    <style>
        body {
            background-color: #3d0f75;
            color: white;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .question-box {
            background-color: #1c0033;
            margin: 20px auto;
            padding: 20px;
            width: 60%;
            border-radius: 10px;
        }
        .answers {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            width: 70%;
            margin: 0 auto;
            margin-top: 30px;
        }
        .answer {
            padding: 30px;
            border-radius: 12px;
            cursor: pointer;
            font-size: 18px;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }
        .answer:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }
        .blue { background-color: #2196F3; }
        .teal { background-color: #00BCD4; }
        .orange { background-color: #FF9800; }
        .pink { background-color: #E91E63; }
    </style>
</head>
<body>

<div class="question-box">
    <h2>Câu hỏi:</h2>
    <p>${question.content}</p>
    <c:if test="${not empty question.q_image_url}">
        <img src="${pageContext.request.contextPath}/${question.q_image_url}" width="200" />
    </c:if>
</div>

<form action="Quizz" method="post">
    <input type="hidden" name="action" value="answer">
    <input type="hidden" name="questionId" value="${question.question_id}">

    <div class="answers">
        <c:forEach var="a" items="${answers}" varStatus="status">
            <button type="submit" name="answerId" value="${a.answer_id}" class="answer
                ${status.index == 0 ? 'blue' :
                  status.index == 1 ? 'teal' :
                  status.index == 2 ? 'orange' :
                  'pink'}">
                    ${a.content}
            </button>
        </c:forEach>
    </div>
</form>



</body>
</html>
