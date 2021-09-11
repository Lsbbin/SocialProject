package com.SocialProject.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.SocialProject.dao.MemberDAO;
import com.SocialProject.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberDAO mdao;
	
	// 회원가입
	public ModelAndView regist(MemberDTO mdto) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile mfile = mdto.getMfile();
		
		String userProfile = "";
		
		String savePath = "C:\\Users\\82104\\Desktop\\SocialProject\\SocialProject\\SocialProject\\src\\main\\webapp\\resources\\profile";
		
		if(!mfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			userProfile = uuid.toString()+"_"+mfile.getOriginalFilename();
			mfile.transferTo(new File(savePath,userProfile));
		}
		mdto.setUserProfile(userProfile);
		System.out.println("userProfile = " + userProfile);
		
		int regist = mdao.regist(mdto);
		
		if(regist > 0) {
			mav.setViewName("home");
		}else {
			File file = new File(savePath,userProfile);
			file.delete();
			mav.setViewName("redirect:/registForm");
		}
		return mav;
	}
	// 아이디 중복체크
	public String idCheck(String userId) {
		String check = "OK";
		String result = mdao.idCheck(userId);
		
		if(result != null) {
			check = "NO";
		}
		return check;
	}
	// 회원 로그인
	public ModelAndView login(MemberDTO mdto) {
		ModelAndView mav = new ModelAndView();
		MemberDTO loginInfo = mdao.login(mdto);
		
		if(loginInfo != null) {
			session.setAttribute("loginId", loginInfo.getUserId());
			session.setAttribute("profile", loginInfo.getUserProfile());
			
			mav.setViewName("home");
		}else {
			mav.addObject("msg","아이디 / 비밀번호를 확인해주세요.");
			mav.setViewName("member/loginForm");
		}
		return mav;
	}
	// 회원 내정보
	public ModelAndView myInfo(String userId) {
		ModelAndView mav = new ModelAndView();
		MemberDTO myInfo = mdao.myInfo(userId);
		
		mav.addObject("myInfo", myInfo);
		mav.setViewName("member/myInfo");
		return mav;
	}
	// 회원정보 변경
	public ModelAndView modInfo(MemberDTO mdto) {
		ModelAndView mav = new ModelAndView();
		int result = mdao.modInfo(mdto);
		
		if(result > 0) {
			mav.setViewName("home");
		}else {
			mav.addObject("msg", "회원정보 변경 실패!");
			mav.setViewName("back");
		}
		return mav;
	}

}
