package com.example.quiz.controler;

import com.example.quiz.model.Answer;
import com.example.quiz.model.Questions;
import com.example.quiz.service.QuestionDAO;
import com.example.quiz.service.QuizDAO;
import com.example.quiz.model.QuizTopic;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "QuizServlet",urlPatterns ="/Quizz")
public class QuizServlet extends HttpServlet {
    private QuizDAO quizDAO = new QuizDAO();
    private QuestionDAO questionDAO = new QuestionDAO();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "answer":
                    showNextQuestion(request, response);
                    break;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "logout":
                    ShowHome(request, response);
                    break;
                    case "view":
                        showTopics(request, response);
                        break;
                    case "start":
                        showQuestions(request, response);
                        break;
                default: ShowHome(request, response);
                break;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void ShowHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<QuizTopic> parentTopics = quizDAO.getParentTopics();
        request.setAttribute("parentTopics",parentTopics);
        RequestDispatcher rd = request.getRequestDispatcher("/quiz/index.jsp");
        rd.forward(request, response);
    }
    private void showTopics(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<QuizTopic> topics = quizDAO.getTopicsByParent(id);
        request.setAttribute("topics",topics);
        RequestDispatcher rd = request.getRequestDispatcher("/quiz/category.jsp");
        rd.forward(request, response);
    }
    private void showQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int topic_id = Integer.parseInt(request.getParameter("topic_id"));
        List<Questions> questions = questionDAO.getAllQuestions(topic_id);

        if (!questions.isEmpty()) {
            Questions question = questions.get(0);
            List<Answer> answers = questionDAO.getAllAnswer(question.getQuestion_id());

            HttpSession session = request.getSession();
            session.setAttribute("questions", questions);
            session.setAttribute("currentIndex", 0);
            session.setAttribute("userAnswers", new HashMap<Integer, String>());

            request.setAttribute("question", question);
            request.setAttribute("answers", answers);
            request.setAttribute("totalQuestions", questions.size());

            RequestDispatcher rd = request.getRequestDispatcher("/quiz/quiz.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("/quiz/index.jsp");
        }
    }

    private void showNextQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Questions> questions = (List<Questions>) session.getAttribute("questions");
        Integer currentIndex = (Integer) session.getAttribute("currentIndex");


        Map<Integer, String> userAnswers = (Map<Integer, String>) session.getAttribute("userAnswers");
        if (userAnswers == null) {
            userAnswers = new HashMap<>();
        }

        int questionId = Integer.parseInt(request.getParameter("questionId"));
        String selectedAnswer = request.getParameter("answerId"); // tên đúng từ form

        userAnswers.put(questionId, selectedAnswer);
        session.setAttribute("userAnswers", userAnswers); // lưu lại vào session

        currentIndex++;
        session.setAttribute("currentIndex", currentIndex);

        if (currentIndex < questions.size()) {
            Questions currentQ = questions.get(currentIndex);
            List<Answer> answers = questionDAO.getAllAnswer(currentQ.getQuestion_id());

            request.setAttribute("question", currentQ);
            request.setAttribute("answers", answers);
            request.setAttribute("totalQuestions", questions.size());
            request.getRequestDispatcher("/quiz/quiz.jsp").forward(request, response);
        }else {
            int score = 0;
            List<Answer> allAnswers = new ArrayList<>();

            for (Questions q : questions) {
                List<Answer> answers = questionDAO.getAllAnswer(q.getQuestion_id());
                allAnswers.addAll(answers); // gom hết vào để dùng ở result.jsp

                for (Answer a : answers) {
                    String userAnsId = userAnswers.get(q.getQuestion_id());
                    if (a.getAnswer_id() == Integer.parseInt(userAnsId) && a.getIs_Correct() == 1) {
                        score++;
                        break;
                    }
                }
            }

            request.setAttribute("score", score);
            request.setAttribute("total", questions.size());
            request.setAttribute("questions", questions);
            request.setAttribute("userAnswers", userAnswers);
            request.setAttribute("allAnswers", allAnswers); // tất cả đáp án để xử lý ở result.jsp

            request.getRequestDispatcher("/quiz/result.jsp").forward(request, response);
        }
    }


}
