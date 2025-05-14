package com.example.quiz.service;

import com.example.quiz.model.User;

import java.sql.SQLException;

public interface IUserDAO {
 public void insertUser(User user) throws SQLException;
}
