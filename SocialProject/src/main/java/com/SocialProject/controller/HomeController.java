package com.SocialProject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	// 홈으로
	@RequestMapping("/home")
	public String home1() {
		return "home";
	}
	// 로그인 페이지
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	// 회원가입 페이지
	@RequestMapping("/registForm")
	public String registForm() {
		return "member/registForm";
	}
	
}
