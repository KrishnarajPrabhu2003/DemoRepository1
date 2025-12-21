package com.dto;

public class QuizAttemptDTO {
    private int attemptId;
    private int quizId;
    private int userId;
    private int score;

    public int getAttemptId() {
        return attemptId;
    }
    public void setAttemptId(int attemptId) {
        this.attemptId = attemptId;
    }
    public int getQuizId() {
        return quizId;
    }
    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
    }
}
