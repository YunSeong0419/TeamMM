<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
html, body{
	padding: 0px;
	margin: 0px;
}

header{
	width: 1200px;
	height: 200px;
	margin: 0px auto;
}

#logoDiv{
	width: 150px;
	padding: 20px 0px 0px 525px;
	margin: 30px auto;
	text-align: center;
	display: inline;
	float: left;
}

#logo{
	width: 150px;
	height: 60px;
}

#serviceAreaDiv{
	height: 150px;
}

#serviceAreaMenuBar{
	margin-top: 65px;
	margin-right: 20px;
	width: 300px;
	height: 30px;
	float: right;
}

#serviceAreaMenuBar > a{
	width: 60px;
	height: 30px;
	margin: 2px;
	padding: 4px 4px;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
	color: #666666;
}

#categoryMenuBar{
	width: 1200px;
	height: 50px;
}

#categoryMenuBar > div > a{
	display: inline-block;
	padding: 10px 123px;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	color: #666666;
	float: left;
}

.categoryVerticalLine {
	display: inline-block;
	border-left : 1px solid #A0A0A0;
	height: 47px;
	float: left;
}

#headerClearBlock{
	clear: both;
}

</style>

<header>
	<div id="serviceAreaDiv">
		<div id='logoDiv'>
			<a href="#"><img id='logo' alt="메인으로 이동" 
				src="/babiyo/resources/img/logo.png"></a>
		</div>
		
		<div id='serviceAreaMenuBar'>
			<c:if test="${mname eq 관리자}">
				<div id='serviceAreaManagerMenuBar'>
					<a id='logout' href="#">로그아웃</a>
					<a id='managerInfo' href="#">관리자</a>
				</div>
				<c:otherwise>
					<div id='serviceAreaMemberMenuBar'>
						<a id='cash' href="#">충전</a>
						<a id='memberInfo' href="#">내 정보</a>
						<a id='shoppingBasket' href="#">장바구니</a>
						<a id='bookMark' href="#">즐겨찾기</a>
						<a id='logout' href="#">로그아웃</a>
					</div>
				</c:otherwise>
			</c:if>
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
	</div>
	
	<div id='headerClearBlock'></div>
	
</header>