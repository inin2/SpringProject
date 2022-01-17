<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	
	<!-- css -->
	<link rel="stylesheet" href="/resources/font/font.css">
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/findIdAfter.css">
	
	<!-- favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.png">
	
	<!-- font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
</head>

<body>
	<div class="wrap">
		<div class="find_wrap">
			<h1>아이디 찾기</h1>
			<div class="contentBox">
				<p class="nope">일치하는 정보가 없습니다.</p>
				<p class="yeah">아이디는<span>&quot; ${idInfo} &quot;</span>입니다.</p>
			</div>
			<button onclick="javascript:window.close()">닫기</button>
		</div>
	</div>

	<script>
		if ("${idInfo}" == "") {
			document.querySelector(".nope").style.display = 'block';
			document.querySelector(".yeah").style.display = 'none';
		} else {
			document.querySelector(".nope").style.display = 'none';
			document.querySelector(".yeah").style.display = 'block';
		}
	</script>
</body>
</html>