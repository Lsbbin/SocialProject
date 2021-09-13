<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>boardView</title>
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
		border: 1px darkgreen solid;
		border-collapse: collapse;
	}
	th,td{
		padding: 10px 30px 10px 30px;
	}
	th{
		width: 20%;
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
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section style="background-color: #fafafa; top: 170px; width: 100%; min-height: 900px; margin-top: 170px;">
		<h2 style="text-align: center; padding-top: 50px;">글 상세보기</h2>
		<div style="width: 50%; margin: auto;">
		
			<table>
				<tr>
					<th>글 제목</th>
					<td>${bView.bTitle }</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><pre>${bView.bContent }</pre></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${bView.userId }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${bView.bHits }</td>
				</tr>
				<c:if test="${bView.bFile != null }">
				<tr>
					<th>첨부 파일</th>
					<td><img src="resources/board/${bView.bFile }" style="width: 200px;"></td>
				</tr>
				</c:if>
			</table>
		
		</div>
	</section>

	<%@ include file = "../footer.jsp" %>
</body>

</html>
