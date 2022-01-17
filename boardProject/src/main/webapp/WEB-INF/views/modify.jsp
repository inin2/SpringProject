<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<!-- css -->
<link rel="stylesheet" href="/resources/css/modify.css">
</head>

<body>
	
	<h2>게시물 수정</h2>

	<form id="modifyForm" method="post" action="/board/modify.do">
		<input type="hidden" value="${detailInfo.bno}" name="bno" id="bno">
		<div class="input_wrap">
			<input type="text" name="title" id="title" placeholder="제목" value='<c:out value="${detailInfo.title}"/>'>
		</div>
		<div class="input_wrap">
			<input type="text" name="writer" readonly="readonly" placeholder="작성자" value='<c:out value="${detailInfo.writer}"/>'>
		</div>
		<div class="input_wrap">
			<textarea name="content" id="content"><c:out value="${detailInfo.content}" /></textarea>
		</div>
		<div class="btn_wrap">
			<a href="/board/list" class="listBtn">목록</a>
			<a href="javascript:window.history.back();" class="cancleBtn">취소</a>
			<a href="#" class="enrollBtn" onclick="boardModifyFn();">완료</a>
		</div>
	</form>
	
	<script>
		function boardModifyFn() {
			
			const bno = $("#bno").val();
			const title = $("#title").val();
			const content = $("#content").val();
	
			$.ajax({
				url : "/board/modify.do",
				type : "POST",
				data : {
					bno : bno,
					title : title,
					content : content
				},
				success: function(data){
					if(data == "Y"){
						alert("글 수정이 완료되었습니다.");
 						$("#modifyForm").attr("action", "/board/detail");
 						$("#modifyForm").attr("method", "get");
 						$("#modifyForm").submit();
					}else{
						alert("글 수정이 실패되었습니다.");
					}
				},
				error: function(data){
					alert("실패");
					console.log(data);
				}
			});
		}
	
	
	
// 		alert(${detailInfo.bno});
// 		$(".enrollBtn").on("click", function(e){
// 			alert(document.getElementsByName("title")[0].value);
// 			alert(document.getElementsByName("content")[0].value);
// 		});
// 		let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
//   	  let mForm = $("#modifyForm");    // 페이지 데이터 수정 from
    
  	/* 목록 페이지 이동 버튼 */
// 	    $("#list_btn").on("click", function(e){
// 	        form.find("#bno").remove();
// 	        form.attr("action", "/board/list");
// 	        form.submit();
// 	    });
	    
// 	    /* 수정 완료 버튼 */
// 	    $(".enrollBtn").on("click", function(e){
// 	        mForm.submit();
// 	    });
	    
// 	    /* 취소 버튼 */
// 	    $(".cancleBtn").on("click", function(e){
// 	        form.attr("action", "/board/detail");
// 	        form.submit();
// 	    });
	</script>
</body>
</html>