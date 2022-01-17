<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- header -->
<header id="header">
	<div class="container">
		<h1>
			<a href="/main">PARIS BAGUETTE</a>
		</h1>
		<div class="util_menu">
				<ul>
					<!-- 로그인 X -->
	                <c:if test = "${member == null}">
	                    <li><a href="/member/login" class="login">LOGIN</a></li>
						<li><a href="/member/join" class="join">JOIN</a></li>              
	                </c:if>
	                <!-- 로그인 O -->
	                <c:if test="${ member != null}">
	            		<li><a href="/member/logout.do" class="login">LOGOUT</a></li>
						<li><a href="/mypage/${member.memberId}" class="join">MYPAGE</a></li>    
	                </c:if>
				</ul>
			</div>
	</div>
</header>
<!-- //header -->