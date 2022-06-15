package com.boa.kinokino.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDto {
	private int memberNo;
	private String memberId;
	private String memberPassword;
	private String memberEmail;
	private String memberPhone;
	private Date memberJoinDate;
	private String memberMbti;
}
