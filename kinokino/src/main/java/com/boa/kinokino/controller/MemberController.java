package com.boa.kinokino.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boa.kinokino.entity.MbtiSurveyDto;
import com.boa.kinokino.entity.MemberDto;
import com.boa.kinokino.repository.MbtiSurveyDao;
import com.boa.kinokino.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MbtiSurveyDao mbtiSurveyDao;
	
	@GetMapping("/join")
	public String join(Model model) {
		List<MbtiSurveyDto> list = mbtiSurveyDao.select();
		model.addAttribute("list", list);
		return "member/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.join(memberDto);
		return "redirect:/";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(
			@RequestParam String memberId,
			@RequestParam String memberPw,
			HttpSession session) {
		MemberDto memberDto = memberDao.login(memberId, memberPw);
		if(memberDto != null) {
			session.setAttribute("login", memberDto.getMemberNo());
			return "redirect:/";
		}
		else {
			return "redirect:login?error";
		}
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
}
