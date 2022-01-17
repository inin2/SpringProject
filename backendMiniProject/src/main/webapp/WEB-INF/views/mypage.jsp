<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>MYPAGE</title>

	<!-- css -->
	<link rel="stylesheet" href="../resources/css/mypage.css">
</head>

<body>
	<!-- main -->
	<section id="main">
		<div class="container">
			<h2 class="title">예약 현황</h2>
			<div class="reserve_status">
				<table>
					<tr>
						<th colspan="2" style="width: 380px">상품</th>
						<th style="width: 100px">큰 초</th>
						<th style="width: 100px">작은 초</th>
						<th style="width: 140px">케이크 칼</th>
						<th colspan="2" style="width: 300px">픽업 시간</th>
						<th style="width: 90px">취소</th>
					</tr>
					<c:forEach items="${reserveInfo}" var="ri">
						<tr class="reserveInfo">
							<td style="width: 130px"><img src="../${ri.cakeImage}" alt=""></td>
							<td style="width: 250px">${ri.cakeName}</td>
							<td style="width: 100px">${ri.reserveInfo1}개</td>
							<td style="width: 100px">${ri.reserveInfo2}개</td>
							<td style="width: 140px">${ri.reserveInfo3}</td>
							<td style="width: 150px" class="rDate">${ri.reserveDate}</td>
							<td style="width: 150px">${ri.reserveTime}</td>
							<td style="width: 90px" class="rCancleY"><a href="/reserveCancle.do?reserveId=${ri.reserveId}" class="cancleBtn">x</a></td>
							<td style="width: 90px" class="rCancleN">불가</td>
						</tr>
					</c:forEach>
					<tr class="reserveInfoNone" style="display: none">
						<td colspan="8">예약 내역이 없습니다.</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<!-- //main -->
	
	<!-- script -->
	<script>
		/* 예약 내역이 없을 경우 */
		const isReserveInfo = document.querySelectorAll('.reserveInfo');
		if (isReserveInfo.length <= 0) {
			document.querySelector(".reserveInfoNone").style.display = '';
		}
		
		/* 예약 취소 불가능 */
		const reserveDate = document.querySelectorAll(".rDate");
		const cancleY = document.querySelectorAll(".rCancleY");
		const cancleN = document.querySelectorAll(".rCancleN");
		const today = new Date();
		
		for (var i = 0; i < reserveDate.length; i++) {
			let rdate = new Date(reserveDate[i].textContent);
			let dateDiff = Math.floor((rdate.getTime()-today.getTime()) / (1000*3600*24));
			
			if(dateDiff <= 2){
				cancleY[i].style.display='none';
				cancleN[i].style.display='';
			} else {
				cancleY[i].style.display='';
				cancleN[i].style.display='none';
			}
			
			if(rdate < today){
				isReserveInfo[i].style.background = "#eee";
			}
		}
		
	</script>
</body>

</html>