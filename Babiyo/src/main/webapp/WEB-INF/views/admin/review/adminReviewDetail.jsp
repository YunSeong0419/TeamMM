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

<style type="text/css">
#productInfoDiv{
	width: 900px;
 	height: 150px;
	margin: 0px 75px;
	text-align: center;
}

#productInfo{
	margin-left: 300px;
	width: 300px;
 	height: 100px;
 	float: left;
}

#productInfo > img{
	width: 100px;
 	height: 100px;
 	float: left;
 	background-color: lightgrey;
}

#productName{
	margin: 5px 0px 5px 20px;
	width: 180px;
	height: 25px;
	font-size: 18px;
	font-weight: bold;
	line-height: 20px;
	text-align: left;
 	float: left;
}

.article{
	margin: 5px 0px 5px 20px;
	width: 70px;
	height: 20px;
	font-size: 16px;
	text-align: left;
 	float: left;
}

.articleValue{
	margin: 5px auto;
	width: 50px;
	height: 20px;
	font-size: 16px;
	text-align: right;
 	float: left;	
}

#goToListButtonDiv{
	width: 300px;
 	height: 100px;
 	text-align:right;
 	float: left;	
}

#goToListButton{
	width: 100px;
 	height: 35px;
 	font-size: 16px;
}

#filterAndSearch{
	margin: 5px 0px;
	width: 900px;
	height: 40px;
	float: left;
}

#sortBox{
	height: 40px;
	float: left;
}

#searchBox{
	height: 40px;
	float: right;
}

.filterBoxName{
	margin: auto 20px auto 0px;	
	line-height: 40px;
	font-size: 18px;
	font-weight: bold;
	float: left;
}

.filterBoxClassificationForm{
 	line-height: 40px; 
	float: right;
}

#filterBoxClassification{
	margin-top: 3px;
	margin-right: 10px;	
	width: 100px;
	height: 35px;
	border-radius: 5px;
	float: left;
}

#inputBox{
	margin-top: 3px;
	width: 150px;
	height: 35px;
	float: left;
}

#productListbutton{
	margin-left: 10px;
	width: 60px;
	height: 35px;	
}

.reviewArea{
	width: 900px;
	height: 250px;
	margin: 0px auto;
}

.productInfo{
	width: 150px;
	height: 250px;
	float: left;
}

.productImage{
	margin-top: 20px;
	width: 150px;
	height: 150px;
	text-align: center;
}

.productImage > a{
	margin: auto;
	width: 100px;
	height: 100px;
	text-align: center;
}

.productName{
	margin-top: 20px;
	width: 150px;
	height: 20px;
	font-weight: bold;
	text-align: center;
}

.userEvaluation{
	padding-top: 20px;
	width: 750px;
	height: 150px;
	float: left;
}

.nickname{
	margin-left: 20px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
	line-height: 30px;
	float: left;	
}

.reportingDate{
	margin-left: 20px;
	height: 30px;
	font-size: 14px;
	line-height: 30px;
	float: left;
}

.starRating{
	margin-top: 4px;
	margin-left: 30px;
	width: 120px;
	float: left;
}

.starRating, .starRating > span{
	display: inline-block;
	height: 21px;
	overflow: hidden;
	background: url("/babiyo/resources/img/star.png")no-repeat;
	background-size: 120px 42px;
}

.starRating > span{
	width: 120px;
	height: 21px;
	background-position: left bottom;
	line-height: 0px;
	vertical-align: top;
}

.reviewContent{
	margin-left: 20px;
	font-size: 14px;
	width: 700px;
	height: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	line-height: 1.4;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
}

.userUploadImage{
	padding-left: 20px;
	width: 750px;
	height: 100px;
	float: left;
}

.userUploadImage > a{
	width: 100px;
	height: 100px;
	margin-right: 20px;
	float: left;
}

.userUploadImage > a > img{
	width: 100px;
	height: 100px;
}

.lowerDivisionLine{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF9436;
	height: 2px;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">

		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			<!--여기서 작성 -->
			<div id='productInfoDiv'>
				<div id='productInfo'>
					<img alt="상품 이미지" src="#">
					<p id='productName'>까르보나라</p>
					<p class='article'>평균 평점</p><p class='articleValue'>4.5</p>
					<p class='article'>리뷰 수</p><p class='articleValue'>554</p>
				</div>
				<div id='goToListButtonDiv'>
					<input type="button" value="목록으로" id='goToListButton'>
				</div>
				<div id='filterAndSearch'>
					<div id='sortBox'>
						<p class='filterBoxName'>정렬</p> 
						<form action='./adminList.do' method='post' class='filterBoxClassificationForm'>
							<select name='sortOption' id='filterBoxClassification'>
								<option value='all' selected="selected">전체</option>
								<option value='STAR_RATING DESC'>평점 높은 순</option>
								<option value='STAR_RATING ASC'>평점 낮은 순</option>
								<option value='CREATE_DATE DESC'>최근 등록순</option>
								<option value='CREATE_DATE ASC'>등록순</option>
							</select>
						</form>
					</div>
					<div id='searchBox'>
						<p class='filterBoxName'>회원 검색</p> 
						<form action='./adminList.do' method='post' class='filterBoxClassificationForm'>
							<input type='text' id='inputBox' name='keyword' value="${searchMap.keyword}">
							<input type='submit' value="검색" id='productListbutton'>
						</form>
					</div>
				</div>
				<hr class='lowerDivisionLine'/>		
			</div>
					
			<div id='reviewDiv'>
				<div class='reviewArea'>
					<div class='productInfo'>
						<div class='productImage'>
							<a href="#"><img alt="밀키트 이미지 " src=""></a>
						</div>				
						<div class='productName'>
							태극전사 레드불
						</div>
					</div>
					<div class='userEvaluation'>
						<div class='nickname'>조윤성</div>
							<div class='starRating'>
								<span style="width: 80%"></span>
							</div>
						<div class='reportingDate'>
							2022-12-05 12:12:12
						</div>
						<div class='reviewContent'>
							오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
							오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
						</div>
					</div>
					<div class='userUploadImage'>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
					</div>
				</div>
				
				<hr class='lowerDivisionLine'/>	
			</div>
			
			<jsp:include page="/WEB-INF/views/Paging.jsp" />

			<form id="pagingForm" method="get">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" name="keyword" value="${searchMap.keyword}">
				<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" name="sortOption" value="${sortMap.sortOption}">
			</form>	
			
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>