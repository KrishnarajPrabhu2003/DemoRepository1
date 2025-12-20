package com.dto;

public class QuizQuestionsDTO {
	
	private int id;
	private int quizid;
	private int questionid;
	
	public QuizQuestionsDTO() {
		// TODO Auto-generated constructor stub
	}

	public QuizQuestionsDTO(int id, int quizid, int questionid) {
		super();
		this.id = id;
		this.quizid = quizid;
		this.questionid = questionid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuizid() {
		return quizid;
	}

	public void setQuizid(int quizid) {
		this.quizid = quizid;
	}

	public int getQuestionid() {
		return questionid;
	}

	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	
	

}
