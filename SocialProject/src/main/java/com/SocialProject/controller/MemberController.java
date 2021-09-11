package com.SocialProject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.SocialProject.dto.MemberDTO;
import com.SocialProject.service.MemberService;

@Controller
public class MemberController {
	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc;
	
	@Autowired
	private HttpSession session;
	
	// 회원가입 요청
	@RequestMapping("/regist")
	public ModelAndView regist(MemberDTO mdto) throws IllegalStateException, IOException {
		System.out.println("회원가입 request");
		mav = msvc.regist(mdto);
		return mav;
	}
	// ajax 아이디 중복체크
	@ResponseBody
	@RequestMapping("/idCheck")
	public String idCheck(@RequestParam("userId") String userId) {
		String check = msvc.idCheck(userId);
		return check;
	}
	// 회원 로그인
	@RequestMapping("/login")
	public ModelAndView login(MemberDTO mdto) {
		mav = msvc.login(mdto);
		return mav;
	}
	// 회원 로그아웃
	@RequestMapping("/logout")
	public String logout(@RequestParam("userId") String userId) {
		session.invalidate();
		return "home";
	}
	// 회원 내정보
	@RequestMapping("/myInfo")
	public ModelAndView myInfo(@RequestParam("userId") String userId) {
		mav = msvc.myInfo(userId);
		return mav;
	}
	// 회원정보 변경
	@RequestMapping("/modInfo")
	public ModelAndView modInfo(MemberDTO mdto) {
		mav = msvc.modInfo(mdto);
		return mav;
	}
}
