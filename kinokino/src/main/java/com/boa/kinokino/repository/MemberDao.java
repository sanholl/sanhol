package com.boa.kinokino.repository;

import com.boa.kinokino.entity.MemberDto;

public interface MemberDao {

	void join(MemberDto memberDto);

	MemberDto login(String memberId, String memberPw);

}
