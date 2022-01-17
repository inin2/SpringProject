/* 픽업 시간 날짜 옵션 추가 (3일 후 ~ 10일 후) */
for (var i = 3; i <= 10; i++) {

	var today = new Date();
	var pickupDate = new Date(today.setDate(today.getDate() + i));

	// select 태그의 option을 정의한다.
	var op = new Option();

	var year = pickupDate.getFullYear();
	var month = pickupDate.getMonth() + 1;
	var date = pickupDate.getDate();

	var format = `${year}-${month >= 10 ? month : '0' + month}-${date >= 10 ? date : '0' + date}`;

	op.text = format;
	op.value = format;

	// select 태그에 정의한 option을 넣는다.
	document.getElementById("selDate").add(op);
}

/* 예약 버튼 클릭 */
var select = document.querySelectorAll(".form_select");
var reserveButton = document.querySelector(".reserve_btn");

function selectFunc(e) {
	e.preventDefault();

	for (let i = 0; i < select.length; i++) {
		if (select[i].value == "") {
			alert("옵션을 선택해 주세요.");
			select[i].focus();
			return false;
		}
	}

	//	alert("예약이 완료되었습니다.");
	//	location.href = "reserveFinsh.html";
}

reserveButton.addEventListener("click", selectFunc);
