package com.example.quiz.model;

public class QuizTopic {
int  id;
String name;
int parent_id;
String image_url;

public QuizTopic() {
    this.id = id;
    this.name = name;
    this.parent_id = parent_id;
    this.image_url = image_url;
}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}