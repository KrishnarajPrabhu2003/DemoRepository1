package com.dto;

public class QuizDTO {
    private int quizId;
    private String quizTitle;
    private String category;

    public int getQuizId() {
        return quizId;
    }
    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }
    public String getQuizTitle() {
        return quizTitle;
    }
    public void setQuizTitle(String quizTitle) {
        this.quizTitle = quizTitle;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
}
