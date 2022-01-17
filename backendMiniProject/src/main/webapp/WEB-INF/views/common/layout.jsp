<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title><tiles:insertAttribute name="title" /></title>
	
	<!-- css -->
	<link rel="stylesheet" href="${contextPath}/resources/font/font.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
	
	<!-- favicon -->
	<link rel="shortcut icon" href="${contextPath}/resources/images/favicon.png">
	
	<!-- font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
	
	<!-- script -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>

</html>