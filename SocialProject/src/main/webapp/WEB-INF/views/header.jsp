<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		font-family: 'Noto Sans KR', sans-serif;
	}
	nav a{
		text-decoration: none;
		color: white;
	}
	nav a:visited {
		color: white;
	}
</style>
</head>
<body>

	<header style="background-color: #4AB34A; top: 0; height: 120px; width: 100%; color: white; text-align: center; line-height: 120px; font-size: 30px; position: fixed;">
		스프링 게시판 프로젝트 
		
		<c:if test="${sessionScope.loginId != null }">
		<label style="color: white; font-size: 15px; float: right; margin-right: 50px;">
		${sessionScope.loginId } 님 환영합니다 !
		</label>
		</c:if>
	</header>
	
	<nav style="background-color: 	darkgreen; color: white; top: 120px; width: 100%; height: 50px; position: fixed; line-height: 50px;">
		<a href="home" style="margin-left: 20px;">홈으로</a>
		<a href="boardList" style="margin-left: 20px;">게시판</a>
		
		<c:choose>
		<c:when test="${sessionScope.loginId == null }">
		<a href="loginForm" style="float: right; margin-right: 20px;">로그인</a>
		<a href="registForm" style="float: right; margin-right: 20px;">회원가입</a>
		</c:when>
		
		<c:otherwise>
		<a href="logout?userId=${sessionScope.loginId }" style="float: right; margin-right: 20px;">로그아웃</a>
		<a href="myInfo?userId=${sessionScope.loginId }" style="float: right; margin-right: 20px;">내정보</a>
		</c:otherwise>
		</c:choose>
	</nav>
	
</body>
</html>