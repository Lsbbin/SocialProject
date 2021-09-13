<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyInfo</title>
<link rel="stylesheet" href="resources/css/loginForm.css">
<style type="text/css">
	*{
		margin: 0;
	}
	table{
		margin: auto;
		margin-top: 50px;
		width: 40%;
		margin-bottom: 50px;
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
		<h2 style="text-align: center; padding-top: 50px;">내정보 페이지</h2>
		<form action="modInfo" method="post" onsubmit="return modInfo()">
		<input type="hidden" name="userId" value="${myInfo.userId }">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="inp" name="userId" id="userId" value="${myInfo.userId }" disabled="disabled"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" class="inp" name="userPw" id="userPw" value="${myInfo.userPw }" disabled="disabled"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" class="inp" name="userBirth" id="userBirth" value="${myInfo.userBirth }" disabled="disabled"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" class="inp" name="userAddr" id="userAddr" value="${myInfo.userAddr }" disabled="disabled"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="button" value="수정하기" class="btn1" onclick="modStart()" id="modStartBtn">
				<input type="submit" value="수정완료" class="btn1" id="modBtn" style="display: none;">
				</td>
			</tr>
		</table>
		</form>
			<!-- 프로필사진 없을때 -->
			<c:if test="${myInfo.userProfile == null }">
				<div style="width: 50%; margin:auto;">
					<h4 style="text-align: center; margin-bottom: 20px;">프로필 사진
					<button class="btn1" id="ImgBtn" onclick="modImgBtnClick()">등록</button>
					</h4> 
				</div>
				
				<div style="width: 20%; margin:auto; height: 300px; margin-bottom: 20px;">
				<form action="modImg" method="post" enctype="multipart/form-data" onsubmit="return modImgCheck()">
				<input type="hidden" name="userId" value="${myInfo.userId }">
					<input type="file" style="display: none; margin-left: 20%;" id="modImgInput" name="mfile">
					<input type="submit" class="btn1" value="등록" style="display: none; margin-left: 40%; margin-top: 20px;" id="modImgBtn">
				</form>
				</div>
			</c:if>
			<!-- 프로필사진 있을때 -->
			<c:if test="${myInfo.userProfile != null }">
				<div style="width: 50%; margin:auto;">
					<h4 style="text-align: center; margin-bottom: 20px;">프로필 사진
					<button class="btn1" id="ImgBtn" onclick="modImgBtnClick()">변경</button>
					</h4> 
				</div>

				<div style="width: 20%; margin:auto; height: 300px; margin-bottom: 20px;">
				<form action="modImg" method="post" enctype="multipart/form-data" onsubmit="return modImgCheck()">
				<input type="hidden" name="userId" value="${myInfo.userId }">
				<input type="hidden" name="profile" value="${myInfo.userProfile }">
					<img src="resources/profile/${myInfo.userProfile }" style="width: 100%; height: 100%;" id="userProfile">
					<input type="file" style="display: none; margin-left: 20%;" id="modImgInput" name="mfile">
					<input type="submit" class="btn1" value="등록" style="display: none; margin-left: 40%; margin-top: 20px;" id="modImgBtn">
				</form>
				</div>
				
			</c:if>
			
	</section>
	
	<%@ include file = "../footer.jsp" %>
</body>
	<script type="text/javascript">
		function modStart() {
			$("#modStartBtn").css("display","none")
			$("#modBtn").css("display","")
			$("#userPw").removeAttr("disabled","")
			$("#userBirth").removeAttr("disabled","")
			$("#userAddr").removeAttr("disabled","")
		}
		
		$(document).ready(function() {
			$("#userPw").keyup(function() {
				var pw = $("#userPw").val();
				
				if(pw.length < 6 || pw.length > 12){
					$("#modBtn").attr("disabled","disabled")
				}else{
					$("#modBtn").removeAttr("disabled","")
				}
			})
		})
		
		// 유효성 체크
		function modInfo() {
			var birth = $("#userBirth").val();
			var addr = $("#userAddr").val();
			
			if(birth == "" || addr == ""){
				alert('생년월일 / 주소를 확인해주세요')
				return false
			}
		}
		
		// 프로필사진 변경버튼 클릭시
		function modImgBtnClick() {
			$("#ImgBtn").css("display","none");
			$("#modImgInput").css("display","");
			$("#userProfile").css("display","none");
			$("#modImgBtn").css("display","");
		}
		
		// 사진변경 유효성 체크
		function modImgCheck() {
			var img = $("#modImgInput").val();
			if(img == ""){
				alert("사진을 등록해주세요!")
				$("#modImgInput").focus();
				return false;
			}
		}
	</script>
</html>
					
				
