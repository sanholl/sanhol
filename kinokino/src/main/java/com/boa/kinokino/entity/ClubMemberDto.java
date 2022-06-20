package com.boa.kinokino.entity;

import lombok.Builder;

import java.sql.Date;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.Data;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubMemberDto {
	private int clubMemberNo;
	private int clubNo;
	private Date clubMemberDate;
	private String clubMemberGrade;
	private String clubMemberAnswer1;
	private String clubMemberAnswer2;
	private String clubMemberAnswer3;
	private int clubMemberPermission;
}
