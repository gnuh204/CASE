package com.example.quiz.service;

import com.example.quiz.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO  implements IUserDAO{

    private Connection connection;
    private static final String INSERT_USER = "insert into users (username, password,email) values (?, ?,?)";
    private static final String GET_USER = "select * from users where username = ? and password = ?";
    private static final String CHECK_USER_ = "SELECT * FROM users WHERE username = ? OR email = ?";

    @Override
    public void insertUser(User user) throws SQLException {
        try {

            connection = DBConnection.getConnection();
            if (connection == null) {
                System.out.println("Connection is null, check DBConnection.getConnection()");
                return;
            }
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getPassword());
            preparedStatement.setString(3,user.getEmail());
            preparedStatement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }


    }
    public User checklogin(String username, String password) {
        User user = null;
        try {
            connection = DBConnection.getConnection();
            if (connection == null) {
                System.out.println("Connection is null, check DBConnection.getConnection()");
            }
            PreparedStatement preparedStatement  = connection.prepareStatement(GET_USER);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String email = resultSet.getString("email");
                user = new User(username,password,email);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public boolean check(String username, String email) {
        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_USER_);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,email);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }



}
