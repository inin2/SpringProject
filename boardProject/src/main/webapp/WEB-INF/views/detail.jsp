<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<!-- css -->
<link rel="stylesheet" href="/resources/css/detail.css">
</head>

<body>

	<h2><c:out value="${detailInfo.title}"/></h2>

	<div class="input_wrap">
		<label>작성자</label>
		<input type="text" name="writer" class="writer" placeholder="작성자" readonly="readonly" value='<c:out value="${detailInfo.writer}"/>'>
	</div>
	<div class="input_wrap textareaBox">
		<textarea name="content" readonly="readonly"><c:out value="${detailInfo.content}" /></textarea>
	</div>
	<div class="input_wrap">
		<label>작성일</label>
		<input type="text" name="regDate" class="regDate" readonly="readonly" value='<c:out value="${detailInfo.regDate}"/>'>
		<label>조회수</label>
		<input type="text" name="viewsCnt" class="viewsCnt" readonly="readonly" value='<c:out value="${detailInfo.viewsCnt}"/>'>
	</div>
	<div class="btn_wrap">
		<a class="modifyBtn">수정</a>
		<a class="deleteBtn">삭제</a>
		<a class="listBtn">목록</a>
	</div>
	
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${detailInfo.bno}"/>'>
	</form>

	<script>
		let form = $("#infoForm");

		$(".listBtn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/list");
			form.submit();
		});

		$(".modifyBtn").on("click", function(e) {
			form.attr("action", "/board/modify");
			form.submit();
		});
		
		$(".deleteBtn").on("click", function(e) {
			form.attr("action", "/board/delete.do");
			form.attr("method", "post");
			form.submit();
		});
	</script>
</body>

</html>