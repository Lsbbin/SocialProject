<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>boardWriteForm</title>
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
	.inp{
		width: 80%;
		height: 30px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 1px solid #4AB34A;
	}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section style="background-color: #fafafa; top: 170px; width: 100%; min-height: 900px; margin-top: 170px;">
		<h2 style="text-align: center; padding-top: 50px;">글 작성</h2>
		<div style="width: 50%; margin: auto;">
		
		<form action="boardWrite" method="post" enctype="multipart/form-data" onsubmit="return boardWriteCheck()">
		<input type="hidden" name="userId" value="${sessionScope.loginId }">
			<table>
				<tr>
					<th>글 제목</th>
					<td><input type="text" class="inp" id="bTitle" name="bTitle"></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea cols="70" rows="10" style="resize: none;" id="bContent" name="bContent"></textarea></td>
				</tr>
				<tr>
					<th>첨부 파일</th>
					<td><input type="file" name="mfile"></td>
				</tr>
			</table>
		<input type="submit" class="btn1" style="float:right; margin-top: 30px;" value="글 작성">
		</form>
		
		</div>
	</section>

	<%@ include file = "../footer.jsp" %>
</body>
	<script type="text/javascript">
		// 유효성 체크
		function boardWriteCheck() {
			if($("#bTitle").val() == ""){
				alert("글 제목을 입력해 주세요!")
				$("#bTitle").focus();
				return false;
			}
			if($("#bContent").val() == ""){
				alert("글 내용을 입력해 주세요!")
				$("#bContent").focus();
				return false;
			}
		}
	</script>
</html>
