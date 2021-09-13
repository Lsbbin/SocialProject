package com.SocialProject.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.SocialProject.dto.BoardDTO;
import com.SocialProject.service.BoardService;

@Controller
public class BoardController {
	private ModelAndView mav;
	
	@Autowired
	private BoardService bsvc;
	
	// 게시판
	@RequestMapping("/boardList")
	public ModelAndView boardList(@RequestParam(value="page" , defaultValue="1")int page) {
		mav = bsvc.boardList(page);
		return mav;
	}
	// 글 작성 페이지 이동
	@RequestMapping("/boardWriteForm")
	public String boardWriteForm() {
		return "board/boardWriteForm";
	}
	// 글 작성
	@RequestMapping("/boardWrite")
	public ModelAndView boardWrite(BoardDTO bdto) throws IllegalStateException, IOException {
		mav = bsvc.boardWrite(bdto);
		return mav;
	}
	// 글 상세보기
	@RequestMapping("/boardView")
	public ModelAndView boardView(@RequestParam("bNum")int bNum) {
		mav = bsvc.boardView(bNum);
		return mav;
	}
}
