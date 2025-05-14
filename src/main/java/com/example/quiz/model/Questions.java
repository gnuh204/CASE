package com.example.quiz.model;

public class Questions {
    int question_id;
    int topic_id ;
    String content ;
    String q_image_url;
    public Questions() {
        this.question_id = question_id;
        this.topic_id = topic_id;
        this.content = content;
        this.q_image_url = q_image_url;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getQ_image_url() {
        return q_image_url;
    }

    public void setQ_image_url(String q_image_url) {
        this.q_image_url = q_image_url;
    }
}
