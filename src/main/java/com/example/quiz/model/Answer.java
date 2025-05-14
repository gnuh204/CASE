package com.example.quiz.model;

public class Answer {
    int answer_id;
    int question_id;
    String content;
    int is_Correct;
    public Answer() {
        this.answer_id = answer_id;
        this.question_id = question_id;
        this.content = content;
        this.is_Correct = is_Correct;
    }

    public int getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(int answer) {
        this.answer_id = answer;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getIs_Correct() {
        return is_Correct;
    }

    public void setIs_Correct(int is_Correct) {
        this.is_Correct = is_Correct;
    }
}

