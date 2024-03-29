package com.boa.kinokino.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ClubDto {
	private int clubNo;
	private int clubLeader;
	private String clubName;
	private String clubSummary;
	private String clubMainCategory;
	private String clubSubCategory;
	private String clubPlace;
	private String clubJoinQuestion1;
	private String clubJoinQuestion2;
	private String clubJoinQuestion3;
	private int clubMemberLimit;
}
