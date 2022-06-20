package com.boa.kinokino.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boa.kinokino.entity.ClubDto;

@Repository
public class ClubDaoImpl implements ClubDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ClubDto> list() {
		return sqlSession.selectList("club.list");
	}

	@Override
	public int create(ClubDto clubDto) {
		int clubNo = sqlSession.selectOne("club.sequence");
		clubDto.setClubNo(clubNo);
		sqlSession.insert("club.create",clubDto);
		return clubNo;
	}

	@Override
	public ClubDto detail(int clubNo) {
		return sqlSession.selectOne("club.one",clubNo);
	}
	
	
	
}
