<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home</title>
<link rel="stylesheet" href="resources/css/loginForm.css">
<style type="text/css">
	*{
		margin: 0;
	}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<section style="background-color: #fafafa; top: 170px; width: 100%; height: 100%; margin-top: 170px;">
		<h2 style="text-align: center; padding-top: 50px;">메인 홈페이지</h2>
	</section>

	<%@ include file = "footer.jsp" %>
</body>

</html>
