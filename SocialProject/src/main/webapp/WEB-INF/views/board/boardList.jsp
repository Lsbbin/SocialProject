<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>boardList</title>
<link rel="stylesheet" href="resources/css/loginForm.css">
<style type="text/css">
	*{
		margin: 0;
	}
	table{
		margin-top: 50px;
		width: 100%;
	}
	table,th,td{
		border: 2px darkgreen solid;
		border-collapse: collapse;
	}
	th,td{
		padding: 10px 20px 10px 20px;
	}
	td{
		text-align: center;
	}
	.btn1{
		background-color: white;
		border: 0;
		margin-left: 20px;
		padding: 7px;
		font-size: 15px;
	}
	.btn1:hover {
		background-color: silver;
	}
	a{
		border: 0;
		color: black;
	}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section style="background-color: #fafafa; top: 170px; width: 100%; min-height: 900px; margin-top: 170px;">
		<h2 style="text-align: center; padding-top: 50px;">게시판</h2>
		<div style="width: 70%; margin: auto;">
			<table>
				<tr>
					<th style="width: 10%;">글번호</th>
					<th style="width: 50%;">글제목</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 20%;">등록일</th>
					<th style="width: 10%;">조회수</th>
				</tr>
				<c:forEach items="${bList }" var="bl">
				<tr>
					<td>${bl.bNum }</td>
					<td><a href="boardView?bNum=${bl.bNum }">${bl.bTitle }</a></td>
					<td>${bl.userId }</td>
					<td>${bl.bDate }</td>
					<td>${bl.bHits }</td>
				</tr>
				</c:forEach>
			</table>
			
		<c:if test="${sessionScope.loginId != null }">
			<button onclick="location.href='boardWriteForm'" class="btn1" style="float:right; margin-top: 30px;">글 작성</button>
		</c:if>
		
		</div>
	</section>

	<%@ include file = "../footer.jsp" %>
</body>

</html>
