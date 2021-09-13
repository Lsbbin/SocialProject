package com.SocialProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.SocialProject.dto.BoardDTO;
import com.SocialProject.dto.PageDTO;

public interface BoardDAO {
	
	// 게시판 목록
	@Select("SELECT * FROM (SELECT ROWNUM RN,  USERID,BNUM,BCONTENT,BTITLE,TO_CHAR(BDATE,'YYYY-MM-DD HH24:MI:SS') AS BDATE,BHITS,BFILE FROM BOARDS ORDER BY BNUM) WHERE RN BETWEEN #{startRow} AND #{endRow}")
	ArrayList<BoardDTO> boardList(PageDTO pdto);
	// 게시판 전체 개수
	@Select("SELECT COUNT(*) FROM BOARDS")
	int boardListCount();
	// 글 번호 생성
	@Select("SELECT NVL(MAX(BNUM),0) FROM BOARDS")
	int maxBNum();
	// 글 작성
	@Insert("INSERT INTO BOARDS VALUES(#{userId},#{bNum},#{bContent},#{bTitle},SYSDATE,0,#{bFile})")
	int boardWrite(BoardDTO bdto);
	// 조회수 증가
	@Update("UPDATE BOARDS SET BHITS = BHITS + 1 WHERE BNUM = #{bNum}")
	void updateHits(@Param("bNum")int bNum);
	// 글 상세보기
	@Select("SELECT USERID,BNUM,BCONTENT,BTITLE,TO_CHAR(BDATE,'YYYY-MM-DD HH24:MI:SS'),BHITS,BFILE FROM BOARDS WHERE BNUM = #{bNum}")
	BoardDTO boardView(@Param("bNum")int bNum);
	
}
