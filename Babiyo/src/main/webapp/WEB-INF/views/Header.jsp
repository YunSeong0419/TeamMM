<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<header>
	<div style="width: 1200px; height: 100%; margin: auto;">
	
	<div id="serviceAreaDiv">
		<div id='serviceAreaMenuBar'>
		<c:choose>
			<c:when test="${_memberDto_.grade eq 1}">
				<div id='serviceAreaManagerMenuBar'>
					<a id='managerInfo' href="/babiyo/admin/adminHome.do">관리자</a>
					<a id='logout' href="/babiyo/auth/logout.do">로그아웃</a>
				</div>
			</c:when>
			
			<c:otherwise>
				<div id='serviceAreaMemberMenuBar'>
					<a id='cash' href="/babiyo/cash/chargeCash.do">충전</a>
					<a id='memberInfo' href="/babiyo/member/memberInfo.do">내 정보</a>
					<a id='shoppingBasket' href="/babiyo/cart/cartView.do">장바구니</a>
					<a id='bookMark' href="/babiyo/favorite/favoriteView.do">즐겨찾기</a>
					<a id='logout' href="/babiyo/auth/logout.do">로그아웃</a>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
	
		<div id='logoDiv'>
			<a href="/babiyo/main.do">
			<img id='logo' alt="메인으로 이동" src="/babiyo/resources/img/logo.png">
			</a>
		</div>
	</div>
	
	<div id='categoryMenuBar'>
		<div>
			<a id='mealKit' href="/babiyo/product/category.do">밀키트</a>
		</div>
		
		<div class='categoryVerticalLine'></div>
		
		<div>
			<a id='ranking' href="/babiyo/ranking.do">랭킹</a>
		</div>
		
		<div class='categoryVerticalLine'></div>
		
		<div>
			<a id='review' href="/babiyo/review/collection.do">리뷰</a>
		</div>
		
		<div class='categoryVerticalLine'></div>
		
		<div>
			<a id='notice' href="/babiyo/notice/list.do">공지</a>
		</div>
		<div class='clearBlock'></div>
	</div>
	
	</div>
	
	
</header>