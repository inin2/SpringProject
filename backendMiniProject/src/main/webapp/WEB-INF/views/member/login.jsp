<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>회원가입</title>

	<!-- css -->
	<link rel="stylesheet" href="../resources/css/login.css">
</head>

<body>
	<!-- login -->
	<section id="login">
		<div class="container">
			<div class="login_wrap">
				<form id="login_form" method="post">
					<h2>LOGIN</h2>
					<div class="login_input">
						<ul>
							<li>
								<span>아이디</span>
								<input type="text" id="uid" name="memberId" placeholder="아이디 입력">
							</li>
							<li>
								<span>비밀번호</span>
								<input type="password" id="upw" name="memberPwd" placeholder="비밀번호 입력">
							</li>
						</ul>
					</div>
					<div class="login_btn">
						<input type="button" id="loginBtn" name="login" value="로그인">
					</div>
					<div class="login_find">
						<ul>
							<li><a href="#" class="findIdBtn">아이디 찾기</a></li>
							<li><a href="#" class="findPwdBtn">비밀번호 찾기</a></li>
							<li><a href="/member/join">회원가입</a></li>
						</ul>
					</div>
				</form>	
			</div>
		</div>
	</section>
	<!-- //login -->
	
	<script>
		const memberId = document.getElementById("uid");
		const memberPwd = document.getElementById("upw");
		const loginButton = document.getElementById("loginBtn");
		
		/* 로그인 유효성 검사 */
		function loginFunc(e) {
			e.preventDefault();
	
			if (memberId.value == 'undefined' || memberId.value == '') {
				alert('아이디를 입력해주세요.');
				return false;
			}
	
			if (memberPwd.value == 'undefined' || memberPwd.value == '') {
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
			$.ajax({
				type: "post",
				url: "/member/login.do",
				data: {
					memberId: memberId.value,
					memberPwd: memberPwd.value	
				},
				success: function(result) {
					if (result == 'false') {
				 		alert("아이디 혹은 비밀번호가 잘못되었습니다.");
					}
					else {
			 	    	$("#login_form").attr("action", "/member/login");
			 	        $("#login_form").submit();
			 	        location.href="/main";
					}
				}
			});
		}
		
		loginButton.addEventListener("click", loginFunc);
		
		const popWidth = 650;	// 팝업창 너비
		const popHeight = 550;	// 팝업창 높이   
		const winWidth = document.body.clientWidth;		// 현재창 너비
		const winHeight = document.body.clientHeight;	// 현재창 높이
		const winX = window.screenLeft;	// 현재창 x좌표
		const winY = window.screenTop;	// 현재창 y좌표

		const popX = winX + (winWidth - popWidth)/2;
		const popY = winY + (winHeight - popHeight)/2;
		
		/* 아이디 찾기 팝업창 */
		$('.findIdBtn').on("click",function(e){
			e.preventDefault();

			window.open("/member/findId", "아이디 찾기", "width="+popWidth+",height="+popHeight+", top="+popY+", left="+popX+", scrollbars=yes,resizable=no");
		});
		
		/* 비밀번호 찾기 팝업창 */
		$('.findPwdBtn').on("click",function(e){
			e.preventDefault();

			window.open("/member/findPwd", "비밀번호 찾기", "width="+popWidth+",height="+popHeight+", top="+popY+", left="+popX+", scrollbars=yes,resizable=no");
		});
	</script>
</body>
</html>