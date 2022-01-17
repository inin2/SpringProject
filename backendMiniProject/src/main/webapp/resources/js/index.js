/* 제품 모두 보이게 */
$(document).ready(function() {
	$("#main h2 a").click(function(e) {
		e.preventDefault();

		$(".filters ul li").removeClass("active");

		var filters = $(this).attr("category");

		$(".product_list .product").fadeOut("fast");
		$(".product_list .product").fadeIn("fast");
	});
});

/* 카테고리 필터 */
$(document).ready(function() {
	$(".filters ul li").click(function(e) {
		e.preventDefault();

		// active
		var idx = $(this).index();
		$(".filters ul li").removeClass("active");
		$(".filters ul li").eq(idx).addClass("active");

		// 제품 분류
		var filters = $(this).attr("category");
		$(".product_list .product").fadeOut("fast");
		$(".product_list ul li[class*=" + filters + "]").fadeIn("fast");
	});
});

/* 모달 팝업창 열기/닫기 */
var modal = document.querySelector(".modal");
var trigger = document.querySelectorAll(".product_list ul li");
var closeButton = document.querySelector(".close_btn");

function toggleModal() {
	setTimeout(function() {
		modal.classList.toggle("show_modal");
	}, 100);

	return false;
}

function windowOnClick(event) {
	if (event.target === modal) {
		toggleModal();
	}
}

function preventDefault(e) {
	e.preventDefault();
}

for (var i = 0; i < trigger.length; i++) {
	trigger[i].addEventListener("click", preventDefault);
	trigger[i].addEventListener("click", toggleModal);
}
closeButton.addEventListener("click", toggleModal);
window.addEventListener("click", windowOnClick);

/* 모달 예약 버튼 클릭 */
var reserveButton = document.querySelectorAll(".reserve_btn");

for (var i = 0; i < reserveButton.length; i++) {
	//	alert("reserve?cakeId=" + i);
	reserveButton[i].href = "reserve?cakeId=" + (i + 1);
}

/* 모달 내용 변경하기 */
var leftContent = document.querySelectorAll(".modal_left_content");
var rightContent = document.querySelectorAll(".modal_right_content");

$(document).ready(function() {
	$(trigger).click(function() {
		var idx = $(this).index();
		// alert(idx);
		$(leftContent).css("display", "none");
		$(leftContent).siblings().eq(idx).css("display", "block");
		$(rightContent).css("display", "none");
		$(rightContent).siblings().eq(idx).css("display", "block");
	});
});


