<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css">

<!-- script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.wrap {
	position: relative;
	background: #e1e1e1;
	height: 100vh;
}

.content {
	background: #fff;
	width: 80vw;
	height: 80vh;
	padding: 4vh;
	border-radius: 10px;
	box-sizing: border-box;
	
	position: absolute;
	top: 50%;
	left: 50%;
	margin-left: -40vw;
	margin-top: -36vh;

	overflow: auto; /* 스크롤 */
}
</style>

<title><tiles:insertAttribute name="title" /></title>
</head>

<body>
	<div class="wrap">
		<tiles:insertAttribute name="header" />
		<div class="content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>

</html>