package com.boa.kinokino.repository;

import java.util.List;

import com.boa.kinokino.entity.ClubDto;

public interface ClubDao {

	List<ClubDto> list();

	int create(ClubDto clubDto);

	ClubDto detail(int clubNo);

}
