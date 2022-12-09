<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

#reviewDetailDiv{
	width: 1200px;
	margin: 0px auto;
	min-height: 550px;
}

#productInfoDiv{
	margin-left: 80px;
	padding: 25px;
	width: 250px;
	min-height: 550px;
	text-align: center;
	float: left;
}

.productImage{
	width: 200px;
	height: 200px;
}

.productImage > a{
	margin: auto;
	width: 200px;
	height: 200px;
	text-align: center;
	float: left;
 	background-color: lightgray; 
}

.productName{
	margin-top: 20px;
	width: 200px;
	height: 25px;
	font-size: 16px;
	text-align: center;
}

#reviewInfoDiv{
	margin: 0px;
	padding: 25px;
	width: 870px;
	height: 250px;
	float: left;
}

.nickname{
	margin-top: 20px;
	height: 30px;
	font-size: 18px;
	font-weight: bold;
	line-height: 30px;
	float: left;	
}

.userEvaluation{
	margin-top: 20px;
	margin-left: 50px;
	width: 150px;
	height: 30px;
	float: left;
}

.starRating{
	width: 150px;
	float: left;
}

.starRating > h2{
	font-size: 16px;
}

.starRating, .starRating > span{
	display: inline-block;
	height: 30px;
	overflow: hidden;
	background-image: url("/babiyo/resources/img/star.png");
	background-image: ;
}

.starRating > span{
	background-position: left bottom;
	line-height: 0px;
	vertical-align: top;
}

.submissionDate{
	margin-top: 20px;
	margin-left: 50px;
	height: 30px;
	font-size: 16px;
	line-height: 30px;
	float: left;
}

.reviewImage{
	margin-top: 30px;
	width: 820px;
	height: 100px;
	float: left;
}

.reviewImage > a{
	margin-right: 20px;
	width: 100px;
	height: 100px;
	text-align: center;
	float: left;
 	background-color: lightgray;
}

.reviewImage > a > img{
	border: 0px;
	width: 100px;
	height: 100px;
}

.reviewContentDiv{
	padding: 25px;
	font-size: 16px;
	width: 870px;
	min-height: 300px;
	float: left;
}

.lowerButtonDiv{
	margin-top: 10px;
	width: 1200px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

.lowerButton{
	margin: 0px 15px;
	width: 100px;
	height: 40px;
	font-size: 16px;
}
</style>

</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<div id='centerTitle'></div>
		<!--여기서 작성 -->
		<div id='reviewDetailDiv'>
			<div id='productInfoDiv'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div id='reviewInfoDiv'>
				<div class='reviewInfo'>
					<div class='nickname'>조윤성</div>
					<div class='userEvaluation'>
						<div class='wrapStar'>
							<div class='starRating'>
							</div>
						</div>
					</div>
					<div class='submissionDate'>
						2022-11-27 PM 4:14 
					</div>
				</div>
				<div class='reviewImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>
			</div>
			<div class='reviewContentDiv'>
				오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.
				윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.
				매워서땀이났지만맛있게매워서좋았다.
				사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.
				보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.
				근데맛이레드불에그냥음료탄맛이다.
				이걸4천원받고팔다니양심이있는건지모르겠다.
				음료수라고생각하면나쁘지않기는하다.
				내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
			</div>
			<c:choose>
				<c:when test="${_memberDto_.grade eq 1}">
					<div class='lowerButtonDiv'>
						<input type="button" value="뒤로가기" class='lowerButton' 
							onclick="location.href='./collection.do'">
						<input type='button' value='삭제' class='lowerButton' 
							onclick='pageMoveDeleteFnc();'>  
					</div>
				</c:when>
<%-- 		<c:otherwise>
				<c:when test="${memberDto.memberId eq reviewDto.memberId}">
					<div class='lowerButtonDiv'>
						<input type="submit" value="수정" class='lowerButton'>
						<input type="button" value="뒤로가기" class='lowerButton'
							onclick="location.href='./collection.do'"> -->
						<input type='button' value='삭제' class='lowerButton'
							onclick='pageMoveDeleteFnc();'>
					</div>
				</c:when> --%>
				<c:otherwise>
					<div class='lowerButtonDiv'>
						<input type="button" value="뒤로가기" class='lowerButton' 
							onclick="location.href='./collection.do'">
					</div>
				</c:otherwise>	
<%-- 		</c:otherwise> --%>
			</c:choose>
			
		</div>
		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>