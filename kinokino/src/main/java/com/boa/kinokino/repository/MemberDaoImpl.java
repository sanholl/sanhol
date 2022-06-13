package com.boa.kinokino.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boa.kinokino.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@Override
	public void join(MemberDto memberDto) {
		// 시퀀스 생성
		memberDto.setMemberNo(sqlSession.selectOne("member.sequence"));
		// 회원가입
		sqlSession.insert("member.insert",memberDto);
	}
	
	// 로그인
	@Override
	public MemberDto login(String memberId, String memberPw) {
		MemberDto memberDto = sqlSession.selectOne("member.one",memberId);
		if(memberDto == null) {
			return null;
		}
		boolean isPasswordMatch = memberDto.getMemberPassword().equals(memberPw);
		if(isPasswordMatch) {
			return memberDto;
		}
		else {
			return null;
		}
	}

}
