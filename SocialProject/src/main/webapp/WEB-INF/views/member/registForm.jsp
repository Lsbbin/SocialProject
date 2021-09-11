<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RegistForm</title>
<link rel="stylesheet" href="resources/css/loginForm.css">
<style type="text/css">
	*{
		margin: 0;
	}
	table{
		margin: auto;
		margin-top: 50px;
		width: 65%;
	}
	table,th,td{
		border: 2px darkgreen solid;
		border-collapse: collapse;
	}
	th,td{
		padding: 10px 30px 10px 30px;
	}
	.inp{
		width: 50%;
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
		padding: 5px;
	}
	.btn1:hover {
		background-color: silver;
	}
	th{
		width: 20%;
	}
</style>
</head>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<section style="background-color: #fafafa; top: 170px; width: 100%; min-height: 900px; margin-top: 170px;">
		<h2 style="text-align: center; padding-top: 50px;">회원가입 페이지</h2>
		<form action="regist" method="post" enctype="multipart/form-data" onsubmit="return registCheck()">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="inp" name="userId" id="userId" placeholder="아이디는 6~12자리 입니다.">
					<span style="font-size: 10px; margin-left: 3px;" id="idMsg"></span>
					<button type="button" class="btn1" onclick="idCheck()" style="float: right; visibility: hidden;" id="idCheckBtn">중복체크</button>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" class="inp" name="userPw" id="userPw" placeholder="비밀번호는 8~12자리 입니다.">
					<span style="font-size: 10px; margin-left: 3px;" id="pwMsg"></span>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" class="inp" name="userBirth" placeholder="ex) 1999-09-09"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" class="inp" name="userAddr"></td>
			</tr>
			<tr>
				<th>프로필 사진</th>
				<td><input type="file" name="mfile"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<input type="submit" value="회원가입" class="btn1" id="registBtn" disabled="disabled">
				<input type="button" value="로그인하러가기" onclick="location.href='loginForm'" class="btn1">
				</td>
			</tr>
		</table>
		</form>
	</section>
	
	<%@ include file = "../footer.jsp" %>
</body>
	<script type="text/javascript">
		function idCheck() {
			var id = $("#userId").val();
			 $.ajax({
				 type : "post",
				 url : "idCheck",
				 data : {"userId" : id},
				 success : function(result) {
					if(result == "OK"){
						alert("사용가능한 아이디입니다.")
						$("#registBtn").removeAttr("disabled")
						$("#userId").attr("readonly","readonly")
					}else{
						alert("중복되는 아이디입니다.")
					}
				}
			 })
		}
		$(document).ready(function() {
			$("#userId").keyup(function() {
				var id = $("#userId").val();
				if(id.length < 6 || id.length > 12){
					$("#idMsg").html("아이디는 6~12 자리입니다.").css("color","red")
					$("#idCheckBtn").css("visibility" , "hidden")
				}else{
					$("#idMsg").html("")
					$("#idCheckBtn").css("visibility" , "visible")
				}
			})
			$("#userPw").keyup(function() {
				var pw = $("#userPw").val();
				if(pw.length < 8 || pw.length > 12){
					$("#pwMsg").html("비밀번호는 8~12 자리입니다.").css("color","red")
				}else{
					$("#pwMsg").html("")
				}
			})
		})
		function registCheck() {
			var id = $("#userId").val();
			var pw = $("#userPw").val();
			var birth = $("#userBirth").val();
			var addr = $("#userAddr").val();
			
			if(id == "" || id.length < 6 || id.length > 12){
				alert("아이디를 확인해주세요")
				$("#userId").focus();
				return false;
			}
			if(pw == "" || pw.length < 8 || pw.length > 12){
				alert("비밀번호를 확인해주세요")
				$("#userPw").focus();
				return false;
			}
			if(birth == ""){
				alert("생년월일을 확인해주세요")
				$("#userBirth").focus();
				return false;
			}
			if(addr == ""){
				alert("주소를 확인해주세요")
				$("#userAddr").focus();
				return false;
			}
		}
	</script>
</html>
