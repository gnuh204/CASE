package com.example.quiz.service;

import com.example.quiz.model.Answer;
import com.example.quiz.model.Questions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    private static final  String GET_ALL_TABLE ="SELECT * FROM questions WHERE topic_id = ?";
    private  static final  String GET_ANSWER_BY_QUESTION_ID ="SELECT * FROM answers WHERE question_id = ?";
    private Connection connection;

    public List<Questions> getAllQuestions(int topi_id) {
        List<Questions>  list=new ArrayList<Questions>();
        try{
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_TABLE);
            preparedStatement.setInt(1, topi_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Questions questions = new Questions();
                questions.setQuestion_id(resultSet.getInt("question_id"));
                questions.setTopic_id(resultSet.getInt("topic_id"));
                questions.setContent(resultSet.getString("content"));
                questions.setQ_image_url(resultSet.getString("q_image_url"));
                list.add(questions);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public List<Answer> getAllAnswer(int question_id) {
        List<Answer>  list=new ArrayList<Answer>();
        try{
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ANSWER_BY_QUESTION_ID);
            preparedStatement.setInt(1, question_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Answer answer = new Answer();
                answer.setAnswer_id(resultSet.getInt("answer_id"));
                answer.setQuestion_id(resultSet.getInt("question_id"));
                answer.setContent(resultSet.getString("content"));
                answer.setIs_Correct(resultSet.getInt("is_correct"));
                list.add(answer);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
