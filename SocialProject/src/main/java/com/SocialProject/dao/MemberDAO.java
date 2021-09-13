package com.SocialProject.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.SocialProject.dto.MemberDTO;

public interface MemberDAO {
	
	// 회원가입
	@Insert("INSERT INTO MEMBERS VALUES(#{userId},#{userPw},#{userBirth},#{userAddr},#{userProfile})")
	int regist(MemberDTO mdto);
	// 아이디 중복체크용
	@Select("SELECT * FROM MEMBERS WHERE USERID = #{userId}")
	String idCheck(@Param("userId") String userId);
	// 회원 로그인
	@Select("SELECT USERID,USERPROFILE FROM MEMBERS WHERE USERID = #{userId} AND USERPW = #{userPw}")
	MemberDTO login(MemberDTO mdto);
	// 회원 내정보
	@Select("SELECT USERID,USERPW,TO_CHAR(USERBIRTH,'YYYY-MM-DD') AS USERBIRTH,USERADDR,USERPROFILE FROM MEMBERS WHERE USERID = #{userId}")
	MemberDTO myInfo(@Param("userId")String userId);
	// 회원정보 변경
	@Update("UPDATE MEMBERS SET USERPW = #{userPw}, USERBIRTH = #{userBirth}, USERADDR = #{userAddr} WHERE USERID = #{userId}")
	int modInfo(MemberDTO mdto);
	// 프로필 사진 변경
	@Update("UPDATE MEMBERS SET USERPROFILE = #{userProfile} WHERE USERID = #{userId}")
	int modImg(MemberDTO mdto);
	
}
