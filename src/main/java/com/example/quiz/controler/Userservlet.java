package com.example.quiz.controler;

import com.example.quiz.service.UserDAO;
import com.example.quiz.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserServlet", urlPatterns = "/userLogin")
public class Userservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "login":
                    LoginUser(request, response);
                    break;
                case "register":
                    RegisterUser(request, response);
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
                case "login":
                    ShowLoginForm(request, response);
                    break;
                case "register":
                    ShowRegisterForm(request, response);
                    break;
                case "logout":
                   ShowHomeForm(request, response);
                    break;


            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void ShowRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("quiz/register.jsp");
        rd.forward(request, response);
    }

    private void ShowLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("quiz/login.jsp");
        rd.forward(request, response);
    }

    private void ShowHomeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "Quizz");

    }

    // post
    private  void LoginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userDAO.checklogin(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/Quizz");

        }else  {
            request.getSession().setAttribute("Loi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            RequestDispatcher rd = request.getRequestDispatcher("quiz/login.jsp");
            rd.forward(request, response);
        }
    }
    private void RegisterUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        User newuser = new User(username, password, email);
        userDAO.insertUser(newuser);
        RequestDispatcher rd = request.getRequestDispatcher("quiz/login.jsp");
        rd.forward(request, response);
    }

}
