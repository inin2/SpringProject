<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<!-- css -->
<link rel="stylesheet" href="/resources/css/list.css">
</head>

<body>

	<h2>게시판 목록</h2>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bList}" var="list">
				<tr>
					<td style="width: 10%"><c:out value="${list.bno}" /></td>
					<td style="width: 42%"><a class="move"
						href='/board/detail?bno=<c:out value="${list.bno}"/>'> <c:out
								value="${list.title}" />
					</a></td>
					<td style="width: 25%"><c:out value="${list.writer}" /></td>
					<td style="width: 13%"><c:out value="${list.regDate}" /></td>
					<td style="width: 10%"><c:out value="${list.viewsCnt}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<a href="/board/enroll" class="enrollBtn">글쓰기</a>

	<script>
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "enroll") {
					alert("등록이 완료되었습니다.");
				}

				if (result === "modify") {
					alert("수정이 완료되었습니다.");
				}

				if (result === "delete") {
					alert("삭제가 완료되었습니다.");
				}

			}
		});

	</script>

</body>
</html>