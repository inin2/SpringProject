<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>로그인 폼</title>

<style>
h1 {
	text-align: center;
}

form {
	text-align: center;
}

.input-area {
	margin: 20px 0;
}

.input-area label {
	display: inline-block;
	width: 100px;
}

.btn-area input[type=submit] {
	width: 55px;
	margin-right: 10px;
}

.btn-area input[type=reset] {
	width: 55px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<body>
	<h1>로그인</h1>
	<hr>
	<form id="login_form" method="post">
		<div class="input-area">
			<label for="userid">아이디</label>
			<input type="text" id="userid" name="id">
			<br>
			<label for="userpw">비밀번호</label>
			<input type="password" id="userpw" name="pwd">
		</div>
		<div class="btn-area">
			<input type="submit" value="로그인" id="loginbtn">
			<input type="reset" value="취소">
		</div>
	</form>

	<script>
		const uid = document.getElementById("userid");
		const upwd = document.getElementById("userpw");

		/* 로그인 버튼 클릭 메서드 */
		$("#loginbtn").click(function(event) {
			event.preventDefault();

			if (uid.value == "") {
				alert("아이디를 입력해주세요");
				return false;
			}
			if (upwd.value == "") {
				alert("비밀번호를 입력해주세요");
				return false;
			}

			$.ajax({
				type : "post",
				url : "/controller/login.do",
				data : {
					id : uid.value,
					pwd : upwd.value
				},
				success : function(result) {
					if (result == 'false')
						alert("login fail");
					else
						alert("login ok");
				}
			});

		});
	</script>
</body>

</html>