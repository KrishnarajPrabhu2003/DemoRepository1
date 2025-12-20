package com.dto;
 
public class QuizDTO {
    private int quizid;
    private String title;
    private String category;
 
    public int getQuizid() {
        return quizid;
    }
    public void setQuizid(int quizid) {
        this.quizid = quizid;
    }
 
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
 
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
}