<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<!-- css -->
<link rel="stylesheet" href="/resources/css/enroll.css">
</head>

<body>

	<h2>글쓰기</h2>

	<form method="post" action="/board/enroll.do">
		<div class="input_wrap">
			<input type="text" name="title" class="inputTitle" placeholder="제목">
		</div>
		<div class="input_wrap">
			<input type="text" name="writer"  class="inputWriter" placeholder="작성자">
		</div>
		<div class="input_wrap">
			<textarea name="content" class="inputContent"></textarea>
		</div>
		<div class="btn_wrap">
			<a href="/board/list" class="cancleBtn">취소</a>
			<button class="enrollBtn">등록</button>
		</div>
	</form>
	
	<script>
	
		$(document).ready(function() {
			
			$(".enrollBtn").on("click", function() {
				
				if ($(".inputTitle").val() == "") {
					alert("제목을 입력해주세요.");
					return false;
				}
				if ($(".inputWriter").val() == "") {
					alert("작성자를 입력해주세요.");
					return false;
				}
				if ($(".inputContent").val() == "") {
					alert("내용을 입력해주세요.");
					return false;
				}
				
			});
			
		});
		
	</script>
	
</body>
</html>