<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<header>
	<div style="width: 1200px; margin: auto;">
	
	<div id="serviceAreaDiv">
		<div id='logoDiv'>
			<a href="/babiyo">
			<img id='logo' alt="메인으로 이동" src="/babiyo/resources/img/logo.png">
			</a>
		</div>
		
		<div id='serviceAreaMenuBar'>
		<c:choose>
			<c:when test="${_memberDto_.grade eq 1}">
				<div id='serviceAreaManagerMenuBar'>
					<a id='managerInfo' href="#">관리자</a>
					<a id='logout' href="#">로그아웃</a>
				</div>
			</c:when>
			
			<c:otherwise>
				<div id='serviceAreaMemberMenuBar'>
					<a id='cash' href="#">충전</a>
					<a id='memberInfo' href="#">내 정보</a>
					<a id='shoppingBasket' href="#">장바구니</a>
					<a id='bookMark' href="#">즐겨찾기</a>
					<a id='logout' href="#">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	
	<div id='categoryMenuBar'>
		<div>
			<a id='mealKit' href="#">밀키트</a>
		</div>
		
		<div class='categoryVerticalLine'></div>
		
		<div>
			<a id='ranking' href="#">랭킹</a>
		</div>
		
		<div class='categoryVerticalLine'></div>
		
		<div>
			<a id='review' href="#">리뷰</a>
		</div>
		
		<div class='categoryVerticalLine'></div>
		
		<div>
			<a id='notice' href="#">공지</a>
		</div>
		<div class='clearBlock'></div>
	</div>
	
	</div>
	
	
</header>