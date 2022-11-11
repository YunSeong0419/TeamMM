<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
html, body{
	padding: 0px;
	margin: 0px;
}

header{
	width: 1200px;
	height: 170px;
	margin: 0px auto;
/* 	border: 1px solid black; */
}

#logoDiv{
	width: 150px;
	padding: 30px 0px 20px 525px;
	margin: 0px auto;
	text-align: center;
	display: inline;
	float: left;
}

#logo{
	width: 150px;
	height: 60px;
}

#serviceAreaMenuBar{
	margin-top: 45px;
	margin-right: 20px;
	width: 300px;
	height: 30px;
/* 	border: 1px solid black; */
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
/* 	border: 1px solid black; */
	clear: both;
}

#categoryMenuBar > a{
	width: 300px;
	height: 30px;
	padding: 10px 123px;
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	color: #666666;
}

.categoryVerticalLine {
  border-left : 2px solid #A0A0A0;
  height: 30px;
}
</style>

<header>
	<div id='logoDiv'>
		<a href="#">
			<img id='logo' alt="메인으로 이동" src="/babiyo/resources/img/logo.png">
		</a>
	</div>
	
	<div id='serviceAreaMenuBar'>
			<a id='cash' href="#">충전</a>
			<a id='myInfo' href="#">내 정보</a>
			<a id='shoppingBasket' href="#">장바구니</a>
			<a id='bookMark' href="#">즐겨찾기</a>
			<a id='logout' href="#">로그아웃</a>
	</div>
	
	<div id='categoryMenuBar'>
		<a id='mealKit' href="#">밀키트</a>
		<span class='categoryVerticalLine'></span>
		<a id='ranking' href="#">랭킹</a>
		<span class='categoryVerticalLine'></span>
		<a id='review' href="#">리뷰</a>
		<span class='categoryVerticalLine'></span>
		<a id='notice' href="#">공지</a>
	</div>
</header>