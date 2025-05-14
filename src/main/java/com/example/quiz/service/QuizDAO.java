package com.example.quiz.service;

import com.example.quiz.model.QuizTopic;

import java.sql.*;
import java.util.*;


public class QuizDAO {
    private static final String GET_ALL_PARENT_TOPICS = "SELECT * FROM Topics WHERE parent_id IS NULL";
    private static final String GET_TOPICS_BY_PARENT = "SELECT * FROM Topics WHERE parent_id = ? ";
    private Connection connection;

        public List<QuizTopic> getParentTopics() {
            List<QuizTopic> list = new ArrayList<>();
            try {connection = DBConnection.getConnection();
                 PreparedStatement ps = connection.prepareStatement(GET_ALL_PARENT_TOPICS);
                 ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    QuizTopic topic = new QuizTopic();
                    topic.setId(rs.getInt("topic_id"));
                    topic.setName(rs.getString("name"));
                    topic.setParent_id(rs.getInt("parent_id"));
                    topic.setImage_url(rs.getString("image_url"));
                    list.add(topic);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }
        public List<QuizTopic> getTopicsByParent(int id) {
            List<QuizTopic> list = new ArrayList<>();
            try{
                connection = DBConnection.getConnection();
                PreparedStatement ps = connection.prepareStatement(GET_TOPICS_BY_PARENT);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    QuizTopic topic = new QuizTopic();
                    topic.setId(rs.getInt("topic_id"));
                    topic.setName(rs.getString("name"));
                    topic.setParent_id(rs.getInt("parent_id"));
                    topic.setImage_url(rs.getString("image_url"));
                    list.add(topic);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return list;
        }
}
