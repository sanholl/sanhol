package com.boa.kinokino.entity;

import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MbtiSurveyDto {
	private int surveyNo;
	private String surveyQuestion;
	private String surveyAnswer1;
	private String surveyAnswer2;
	private String surveyAnswerVal1;
	private String surveyAnswerVal2;
}
