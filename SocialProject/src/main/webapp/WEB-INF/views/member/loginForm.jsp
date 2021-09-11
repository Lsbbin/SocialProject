<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LoginForm</title>
<link rel="stylesheet" href="resources/css/loginForm.css">
<style type="text/css">
	*{
		margin: 0;
	}
	table{
		margin: auto;
		margin-top: 50px;
		width: 40%;
	}
	table,th,td{
		border: 2px darkgreen solid;
		border-collapse: collapse;
	}
	th,td{
		padding: 10px 30px 10px 30px;
	}
	.inp{
		width: 70%;
		height: 30px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 1px solid #4AB34A;
	}
	.btn1{
		background-color: white;
		border: 0;
		margin-left: 20px;
		padding: 10px;
	}
	.btn1:hover {
		background-color: silver;
	}
}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section style="background-color: #fafafa; top: 170px; width: 100%; min-height: 900px; margin-top: 170px;">
		<h2 style="text-align: center; padding-top: 50px;">로그인 페이지</h2>
		<form action="login" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="inp" name="userId">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" class="inp" name="userPw"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="submit" value="로그인" class="btn1">
				<input type="button" value="회원가입하러가기" onclick="location.href='registForm'" class="btn1">
				</td>
			</tr>
		</table>
		</form>
		<h6 style="color: red; text-align: center; margin-top: 10px;">${msg }</h6>
	</section>
	
	<%@ include file = "../footer.jsp" %>
</body>

</html>
