package com.dto;

public class LeaderboardDTO {

    private String fullName;
    private String quizTitle;
    private String category;
    private int score;

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
    }
}
