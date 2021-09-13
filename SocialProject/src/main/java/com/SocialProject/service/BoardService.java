package com.SocialProject.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.SocialProject.dao.BoardDAO;
import com.SocialProject.dto.BoardDTO;
import com.SocialProject.dto.PageDTO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO bdao;
	@Autowired
	private HttpSession session;
	
	// 게시판
	public ModelAndView boardList(int page) {
		ModelAndView mav = new ModelAndView();
		
		int pageLimit = 10; // 보여줄 글 개수
		int pageNumLimit = 5; // 보여줄 페이지 개수
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		PageDTO pdto = new PageDTO();
		pdto.setStartRow(startRow);
		pdto.setEndRow(endRow);
		
		ArrayList<BoardDTO> boardList = bdao.boardList(pdto);
		int boardListCount = bdao.boardListCount();
		
		int maxPage = (int) (Math.ceil((double) boardListCount / pageLimit));
		int startPage = ((int) (Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		pdto.setPage(page);
		pdto.setStartPage(startPage);
		pdto.setEndPage(endPage);
		pdto.setMaxPage(maxPage);
		
		mav.addObject("page", pdto);
		mav.addObject("bList", boardList);
		mav.setViewName("board/boardList");
		
		return mav;
	}
	// 글 작성
	public ModelAndView boardWrite(BoardDTO bdto) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile mfile = bdto.getMfile();
		String bFile = "";
		String savePath = "C:\\Users\\82104\\Desktop\\SocialProject\\SocialProject\\SocialProject\\src\\main\\webapp\\resources\\board";
		
		if(!mfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			bFile = uuid.toString()+"_"+mfile.getOriginalFilename();
			mfile.transferTo(new File(savePath,bFile));  // 실패시 삭제해야됨
		}
		bdto.setbFile(bFile);
		
		// 글 번호 생성
		int boardNum = bdao.maxBNum() + 1;
		bdto.setbNum(boardNum);
		
		// 작성
		int writeResult = bdao.boardWrite(bdto);
		
		if(writeResult > 0) {
			mav.setViewName("home");
		}else {
			File file = new File(savePath,bFile);
			file.delete();
			mav.addObject("msg", "작성 실패!");
			mav.setViewName("back");
		}
		
		return mav;
	}
	// 글 상세보기
	public ModelAndView boardView(int bNum) {
		ModelAndView mav = new ModelAndView();
		
		// 조회수 증가
		bdao.updateHits(bNum);
		// 상세보기
		BoardDTO bView = bdao.boardView(bNum);
		
		if(bView != null) {
			mav.addObject("bView", bView);
			mav.setViewName("board/boardView");
		}else {
			mav.addObject("msg", "실패");
			mav.setViewName("back");
		}
		
		return mav;
	}
}
