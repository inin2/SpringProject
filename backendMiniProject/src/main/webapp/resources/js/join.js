const memberName = document.getElementById("joinName");
const memberId = document.getElementById("joinId");
const memberPwd = document.getElementById("joinPw");
const memberPh = document.getElementById("joinPh");
const idChkButton = document.querySelector(".idChk_btn");
const joinButton = document.querySelector(".join_btn");
const pwdMsg = document.querySelector("#join .join_wrap .input_info dl dd span");

let idckCheck = false;	// 아이디 중복 검사
let phckCheck = false;	// 아이디 중복 검사

/* 아이디 중복 검사 */
function idCheckFunc() {
	$.ajax({
		type: "post",
		url: "/member/memberIdChk",
		data: { memberId: memberId.value },
		success: function(result) {
			if (memberId.value == "undefined" || memberId.value == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}
			if (result != 'false') {
				alert("사용 가능한 아이디입니다.");
				idckCheck = true;
			}
			else {
				alert("이미 존재하는 아이디입니다.");
				$('#joinId').val('');
				idckCheck = false;
			}
		}
	});
}
// 아이디 값이 변경되면 다시 중복 확인
$(function() {
	$(memberId).change(function() {
		idckCheck = false;
	})
});

/* 비밀번호 유효성 검사 */
function validatePwdFunc(character) {
	return /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/.test(character); // (4자 이상, 영문자 1개, 숫자 1개)
}
function removeBlink() {
	pwdMsg.classList.remove("blink");
}

/* 전화번호 유효성 검사 */
function validatePhFunc(character) {
	return /^[0-9]{8,15}$/.test(character);
}

/* 전화번호 중복 검사 */
function phCheckFunc() {
	$.ajax({
		type: "post",
		url: "/member/memberPhChk",
		data: { memberPhone: memberPh.value },
		success: function(result) {
			if (result == 'false') {
				phckCheck = false;
			} else {
				phckCheck = true;
			}
		}
	});
}

/* 회원가입 유효성 검사 */
function joinFunc(e) {
	e.preventDefault();

	if (memberName.value == "undefined" || memberName.value == "") {
		alert("이름을 입력해주세요.");
		return false;
	}

	if (memberId.value == "undefined" || memberId.value == "") {
		alert("아이디를 입력해주세요.");
		return false;
	}

	if (memberPwd.value == "undefined" || memberPwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		return false;
	}

	if (memberPh.value == "undefined" || memberPh.value == "") {
		alert("전화번호를 입력해주세요.");
		return false;
	}

	if (!validatePwdFunc(memberPwd.value)) {
		pwdMsg.classList.add("pw_check");
		pwdMsg.classList.add("blink");
		return false;
	}
	pwdMsg.classList.remove("pw_check");

	if (!validatePhFunc(memberPh.value)) {
		alert("전화번호를 정확하게 입력해주세요.")
		return false;
	}

	if (idckCheck && phckCheck) { // idckCheck가 true이면
		$("#join_form").attr("action", "/member/join.do");
		$("#join_form").submit();
		alert("회원가입이 완료되었습니다.");
	} else if (phckCheck == false) {
		alert("이미 존재하는 전화번호입니다.");
		$('#joinPh').val('');
	} else {
		alert("아이디 중복 확인을 해주세요.")
		return false;
	}
}

memberPh.addEventListener("blur", phCheckFunc);
idChkButton.addEventListener("click", idCheckFunc);
joinButton.addEventListener("click", joinFunc);
joinButton.addEventListener("mouseover", removeBlink);