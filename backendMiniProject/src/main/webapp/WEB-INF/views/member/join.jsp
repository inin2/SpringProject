<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>회원가입</title>

	<!-- css -->
	<link rel="stylesheet" href="../resources/css/join.css">
</head>

<body>
	<!-- join -->
	<section id="join">
		<div class="container">
			<h2>회원가입</h2>
			<h3>정보입력</h3>
			<div class="join_wrap">
				<form id="join_form" method="post">	
					<div class="input_info">
						<dl>
							<dt>이름<span class="ess"></span></dt>
							<dd>
								<input id="joinName" class="form_text" name="memberName" type="text" placeholder="이름 입력">
							</dd>
						</dl>
					</div>
					<div class="input_info">
						<dl>
							<dt>아이디<span class="ess"></span></dt>
							<dd>
								<input id="joinId" class="form_text" name="memberId" type="text" placeholder="아이디 입력">
								<input class="idChk_btn" type="button" value="중복확인">
							</dd>
						</dl>
					</div>
					<div class="input_info">
						<dl>
							<dt>비밀번호<span class="ess"></span></dt>
							<dd>
								<input id="joinPw" class="form_text" type="text" name="memberPwd" placeholder="비밀번호 입력" style="width: 140px;">
								<span>
									4자 이상 입력하세요. (영문자 1개, 숫자 1개 필수)
								</span>
							</dd>
						</dl>
					</div>
					<div class="input_info">
						<dl>
							<dt>전화번호<span class="ess"></span></dt>
							<dd>
								<input id="joinPh" class="form_text" name="memberPhone" type="text" placeholder="전화번호 입력">
							</dd>
						</dl>
					</div>
					<div class="join_btn">
						<a href="#">회원가입 완료</a>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- //join -->
	
	<!-- footer -->
	<footer>
		<div class="container">
		</div>
	</footer>
	<!-- //footer -->
	
	<!-- script -->
	<script src="../resources/js/join.js"></script>
</body>
</html>