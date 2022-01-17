<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>RESERVE</title>
	
	<!-- css -->
	<link rel="stylesheet" href="../resources/css/reserve.css">
</head>

<body>
<!-- main -->
	<section id="main">
		<div class="container">
			<h2 class="title">픽업 예약</h2>
			<div class="reserve_box">
				<img src="${cakeInfo.cakeImage}" alt="">
				<div class="reserve_info">
					<h3>${cakeInfo.cakeName}</h3>
					<form id="reserve_form" method="post" action="/reserve.do">
						<table>
							<tbody>
								<tr>
									<th>가격</th>
									<td>
										<fmt:formatNumber pattern="#,###원"
											value="${cakeInfo.cakePrice}" />
									</td>
								</tr>
								<tr>
									<th>큰 초</th>
									<td>
										<select class="form_select candle1" name="reserveInfo1">
											<option value="">옵션을 선택해 주세요</option>
											<option value="0">0개</option>
											<option value="1">1개</option>
											<option value="2">2개</option>
											<option value="3">3개</option>
											<option value="4">4개</option>
											<option value="5">5개</option>
											<option value="6">6개</option>
											<option value="7">7개</option>
											<option value="8">8개</option>
											<option value="9">9개</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>작은 초</th>
									<td>
										<select class="form_select candle2" name="reserveInfo2">
											<option value="">옵션을 선택해 주세요</option>
											<option value="0">0개</option>
											<option value="1">1개</option>
											<option value="2">2개</option>
											<option value="3">3개</option>
											<option value="4">4개</option>
											<option value="5">5개</option>
											<option value="6">6개</option>
											<option value="7">7개</option>
											<option value="8">8개</option>
											<option value="9">9개</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>케이크 칼</th>
									<td>
										<select class="form_select knife" name="reserveInfo3">
											<option value="">옵션을 선택해 주세요</option>
											<option value="선택 안 함">선택 안 함</option>
											<option value="케이크 칼">케이크 칼</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>픽업 시간</th>
									<td>
										<select id="selDate" class="form_select date" name="reserveDate"
											style="width: 195px; margin-right: 10px;">
											<option value="">옵션을 선택해 주세요</option>
										</select>
									<td>
										<select class="form_select time" name="reserveTime" style="width: 195px;">
											<option value="">옵션을 선택해 주세요</option>
											<option value="09:00~10:00">09:00~10:00</option>
											<option value="10:00~11:00">10:00~11:00</option>
											<option value="11:00~12:00">11:00~12:00</option>
											<option value="12:00~13:00">12:00~13:00</option>
											<option value="13:00~14:00">13:00~14:00</option>
											<option value="14:00~15:00">14:00~15:00</option>
											<option value="15:00~16:00">15:00~16:00</option>
											<option value="16:00~17:00">16:00~17:00</option>
											<option value="17:00~18:00">17:00~18:00</option>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<button class="reserve_btn">예약하기</button>
<!-- 						<a href="#" class="reserve_btn">예약하기</a> -->
					</form>
				</div>
			</div>
			<div class="product_info_box">
				<h4>제품 정보</h4>
				<div class="product_info">
					<p class="product_name">${cakeInfo.cakeName}</p>
					<p class="product_desc">${cakeInfo.cakeIntro}</p>
					<img src="${cakeInfo.cakeImage}" alt="" class="product_img">
					<div class="more_info">
						<h6>추가 정보</h6>
						<div class="info_text">
							<table>
								<tr class="more_info_a">
									<th>당도</th>
									<td>담백</td>
									<td>약간 달음</td>
									<td>적당함</td>
									<td>달콤함</td>
								</tr>
								<tr class="more_info_b">
									<th>식감</th>
									<td>부드러움</td>
									<td>적당함</td>
									<td>쫄깃함</td>
									<td>바삭함</td>
								</tr>
								<tr class="more_info_c">
									<th>크기</th>
									<td>한입</td>
									<td>간식용</td>
									<td>한끼대용</td>
									<td>2인이상</td>
								</tr>

							</table>
						</div>
					</div>
					<div class="nutrition_info">
						<h6>영양 정보</h6>
						<div class="info_text">
							<table>
								<tr>
									<th>총 내용량</th>
									<th>${cakeInfo.cakeInfoNutrA}</th>
								</tr>
								<tr>
									<th>100g당</th>
									<th>열량</th>
									<th>나트륨</th>
									<th>당류</th>
									<th>포화지방</th>
									<th>단백질</th>
								</tr>
								<tr>
									<td></td>
									<td>${cakeInfo.cakeInfoNutrB}</td>
									<td>${cakeInfo.cakeInfoNutrC}</td>
									<td>${cakeInfo.cakeInfoNutrD}</td>
									<td>${cakeInfo.cakeInfoNutrE}</td>
									<td>${cakeInfo.cakeInfoNutrF}</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="allergy_info">
						<h6>알레르기 정보</h6>
						<div class="info_text">
							<p>${cakeInfo.cakeInfoAllergy}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //main -->

	<!-- script -->
	<script src="resources/js/reserve.js"></script>
	<script>
		/* 추가 정보 */
		const moreInfoAChild = document.querySelectorAll(".more_info_a td");
		const moreInfoBChild = document.querySelectorAll(".more_info_b td");
		const moreInfoCChild = document.querySelectorAll(".more_info_c td");
	
		for (let i = 0; i < moreInfoAChild.length; i++) {
			if (moreInfoAChild[i].innerText == "${cakeInfo.cakeInfoMoreA}")
				moreInfoAChild[i].classList.add('check');
	
			if (moreInfoBChild[i].innerText == "${cakeInfo.cakeInfoMoreB}")
				moreInfoBChild[i].classList.add('check')
					;
			if (moreInfoCChild[i].innerText == "${cakeInfo.cakeInfoMoreC}")
				moreInfoCChild[i].classList.add('check');
		}
	
		if ("${ cakeInfo.cakeInfoMoreA }" == "" && "${ cakeInfo.cakeInfoMoreB }" == "" && "${ cakeInfo.cakeInfoMoreC }" == "") {
			document.querySelector(".more_info").style.display = 'none';
		}
		
		/* 영양 정보 */
		/* cakeId = 26 */
		if(${cakeInfo.cakeId} == 26)
			document.querySelector('.nutrition_info .info_text tr:nth-child(2) th').textContent = '총 내용량당';
		
		/* 알레르기 정보 */
		if ("${ cakeInfo.cakeInfoAllergy }" == "") {
			document.querySelector(".allergy_info").style.display = 'none';
		}
		
		$(".reserve_btn").click(function(){
			$(".reserve_form").submit();
		});
		
		/* 서버로 전송할 데이터 */
		const form = {
				memberId : '${member.memberId}',
				cakeId : '${cakeInfo.cakeId}',
				reserveInfo1 : '',
				reserveInfo2 : '',
				reserveInfo3 : '',
				reserveDate : '',
				reserveTime : ''
		}
		
		/* 케이크 예약 버튼 */
		$(".reserve_btn").on("click", function(e){
			form.reserveInfo1 = $(".candle1 option:selected").val();
			form.reserveInfo2 = $(".candle2 option:selected").val();
			form.reserveInfo3 = $(".knife option:selected").val();
			form.reserveDate = $(".date option:selected").val();
			form.reserveTime = $(".time option:selected").val();
			
			$.ajax({
				url: '/reserve.do',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
				}
			});
		});
		
		function cartAlert(result){
			if(result == "1"){
				alert("예약이 완료되었습니다.");
				location.href="/mypage/" + form.memberId;
			} else if(result == "false"){
				alert("로그인이 필요합니다.");
				location.href="/member/login";
			} else {
				alert("ERROR");
			}
		}
		
	</script>
</body>

</html>