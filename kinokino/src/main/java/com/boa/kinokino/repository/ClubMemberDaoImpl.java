package com.boa.kinokino.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boa.kinokino.entity.ClubMemberDto;

@Repository
public class ClubMemberDaoImpl implements ClubMemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void join(ClubMemberDto clubMemberDto) {
		sqlSession.insert("clubMember.join",clubMemberDto);
	}

}
