package com.boa.kinokino.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boa.kinokino.entity.ClubDto;
import com.boa.kinokino.repository.ClubDao;


@Controller
@RequestMapping("/club")
public class ClubController {
	
	@Autowired
	private ClubDao clubDao;
	
	// 클럽 목록 
	@GetMapping("/list")
	public String clubList(Model model) {
		List<ClubDto> list = clubDao.list();
		model.addAttribute("list",list);
		return "club/list";
	}

	// 클럽 생성
	@GetMapping("/create")
	public String clubCreate() {
		return "club/create";
	}
	@PostMapping("/create")
	public String clubCreate(@ModelAttribute ClubDto clubDto) {
		int clubNo = clubDao.create(clubDto);
		return "redirect:detail/"+clubDto.getClubNo();
	}
	
	// 클럽 상세
	@GetMapping("/detail/{clubNo}")
	public String clubDetail(@PathVariable int clubNo, Model model) {
		ClubDto clubDto = clubDao.detail(clubNo);
		model.addAttribute("clubDto",clubDto);
		return "club/detail";
	}
	
}
