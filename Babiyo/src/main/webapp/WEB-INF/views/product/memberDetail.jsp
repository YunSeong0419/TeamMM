<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 상세</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
.shortDivisionLine{
	width: 450px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF5E00;
	height: 2px;
}

.longDivisionLine{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF5E00;
	height: 2px;
}

#productMemberDetailDiv{
	margin: 0px auto;
	width: 900px;
	min-height: 550px;
}

#productCategoryDiv{
	margin-top: 10px;
	height: 30px;
}

.categoryName, .category{
	margin-right: 10px;
	font-size: 16px;
}

#productInfoDiv{
	width: 900px;
	height: 400px;
	float: left;
}

.imageDiv{
	padding: 0px 25px;
	width: 450px;
	height: 400px;
	text-align: center;
	float: left;
}

.imageDiv > a{
	width: 400px;
	height: 400px;
	float: left;
	background-color: lightgray;
}

.productInfo{
	width: 450px;
	height: 400px;
	float: left;
}

.productTitle{
	height: 40px;
	font-size: 30px;
	font-weight: bold;
	line-height: 40px;
}

.productTitle > input{
	margin-bottom: 10px;
	padding: 0px;
	height: 40px;
	border: 0px;
	color: red;
	background-color: transparent;
	font-size: 25px;
	line-height: 25px;
	cursor: pointer;
	vertical-align: middle;
}

.productName{
	margin-right: 10px;
}

.evaluationAndReviewCount{
	margin: 5px;
	height: 20px;
	font-size: 16px;
	line-height: 20px;	
}

.inputPurchaseDetail{
	height: 190px;
	margin-top: 40px
}

.price{
	margin-left: 10px;
	height: 25px;
}

.stock, .quantity{
	margin: 10px 10px;
	height: 25px;
}

.priceValue{
	margin-left: 50px;
	height: 25px;
	color: #FF0000;
}

.stockValue{
	margin-left: 25px;
	height: 25px;
}

.quantitySelect{
	margin-left: 65px;
	width: 50px;
	height: 25px;
}

.totalPrice{
	margin: 50px 0px 0px 10px;
	height: 25px;
	font-size: 16px;
	font-weight: bold;
	line-height: 25px;
}

.totalPriceName{
	margin-right: 20px;
	height: 25px;
}

.productInfoButton{
	text-align: center;
}

.putShoppingCart, .purchaseOrder{
	margin: 20px;
	width: 150px;
	height: 50px;
	font-size: 16px;
}

#productContentDiv{
	min-height: 200px;
	float: left;
}

.contentTitle, .reviewName{
	margin: 10px 0px;
	height: 30px;
	font-size: 22px;
	font-weight: bold;
	line-height: 30px;
}

.content{
	margin: 30px 20px;
}

#reviewDiv{
	margin-bottom: 30px;
	min-height: 200px;
	float: left;
}

.inlineDiv{
	height: 40px;
	line-height: 40px;
}

.reviewTitle, .filter, .writeReview{
	float: left;
}

.shortVerticalLine{
	margin: 0px 5px;
	display: inline-block;
	margin-top:10px;
	border-left : 2px solid #A0A0A0;
	height: 20px;
	float: left;
}

.latest{
	margin-left: 20px;
}

#lowerButtonDiv{
	margin-top: 10px;
	width: 900px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

.lowerButton{
	margin: 0px;
	border: 0px;
	width: 300px;
	height: 40px;
	background-color: orange;
	border-radius: 5px;
	font-size: 16px;
}

.writeReview{
	float: right;
}

.writeReviewButton{
	width: 100px;
	height: 30px;
	font-size: 16px;
}

.userEvaluation{
	padding-top: 30px;
	width: 900px;
	min-height: 200px;
	float: left;
/* 	background-color: lightgray; */
}

.nickname{
	margin: 0px 50px;
	font-size: 16px;
	font-weight: bold;
	line-height: 100px;
	float: left;	
}

.starRating{
	margin-top: 35px;
	width: 150px;
	float: left;
	background-color: lightgray;
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

.userUploadImage{
	margin-left: 70px;
	height: 100px;
	float: left;
}

.userUploadImage > a{
	margin: 0px 10px;
	width: 100px;
	height: 100px;
	float: left;
 	background-color: lightgray;
}

.userUploadImage > a > img{
	border: 0px;
	width: 100px;
	height: 100px;
}

.reviewContent{
	margin: 20px;
	float: left;
}

</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
		<div id='productMemberDetailDiv'>
			<div id='productCategoryDiv'>
				<span class='categoryName'>음식 분류</span>
				<span class='category'>양식</span>
			</div>
			<div id='productInfoDiv'>
				<div class='imageDiv'>
					<a href="#"><img alt="밀키트 이미지" src=""></a>	
				</div>
				<div class='productInfo'>
					<div class='productTitle'>
						<span class='productName'>봉골레 파스타</span>
						<input type="button" value="♡">
					</div>
					<div class='evaluationAndReviewCount'>
						☆4.9(2,348)
					</div>
					
					<hr class='shortDivisionLine'/>	
					
					<div class='inputPurchaseDetail'>
						<div class='price'>
							<span class='priceName'>가격: </span>
							<span class='priceValue'>6,000</span>&nbsp;&nbsp;원
						</div>
						<div class='stock'>
							<span class='stockName'>남은 개수: </span>
							<span class='stockValue'>100</span>
						</div>
						<div class='quantity'>
							<span class='quantityName'>수량: </span>
							<select class='quantitySelect'>
								<option value="1">1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
								<option value="6">6
								<option value="7">7
								<option value="8">8
								<option value="9">9
								<option value="10">10
							</select>
						</div>
						<div class='totalPrice'>
							<span class='totalPriceName'>총 결제금액: </span>
							<span class='totalPriceValue'>18,000</span>&nbsp;원
						</div>
					</div>
					
					<hr class='shortDivisionLine'/>
					
					<div class='productInfoButton'>
						<input type="button" value="장바구니 담기" class='putShoppingCart'>
						<input type="button" value="주문하기" class='purchaseOrder'>
					</div>
				</div>
			</div>
			<div id='productContentDiv'>
				<div class='contentTitle'>
					<p>설명</p>
				</div>
				
				<hr class='longDivisionLine'/>
				
				<div class='content'>
					여기서 끝이 아니다~~밤대추풋고추생강계피당귀향로타임로즈마리백미흑미오곡잡곡설탕구운소금
					히말라야소금말돈소금후추대파쪽파양파실파잣은행초콜릿된장콩장쌈장두반장애호박늙은호박단호박
					딸기양배추파파야두리안등의열대과일등을몽땅찜기에때려넣고50시간푹끓인후여기서끝이아니다
					돼지고기소고기말고기양고기닭고기꿩고기쥐고기하마고기악어고기코끼리고기개고기물고기
					불고기바람고기환단고기참치꽁치넙치뭉치면살고흝어지면참다랑어를갈아넣고여기서끝이아니다
					비린내를제거하기위해월계수청주잭다니엘피노누아와인머루주매화수막걸리커피콩을넣고
					여기서끝이아니다잡내제거를위해랍스타곰발바닥제비집아토끼발닭모이주머니
					최고급와규스테이크마이아르겉껍질테운부분으로잡내를제거하고여기서끝이아니다
					에비양삼다수아이시스아리수보리수빼어날수라싸수아름다울미백미현미흑미별미를넣고여기서끝이아니다
					여기서 끝이 아니다~~밤대추풋고추생강계피당귀향로타임로즈마리백미흑미오곡잡곡설탕구운소금
					히말라야소금말돈소금후추대파쪽파양파실파잣은행초콜릿된장콩장쌈장두반장애호박늙은호박단호박
					딸기양배추파파야두리안등의열대과일등을몽땅찜기에때려넣고50시간푹끓인후여기서끝이아니다
					돼지고기소고기말고기양고기닭고기꿩고기쥐고기하마고기악어고기코끼리고기개고기물고기
					불고기바람고기환단고기참치꽁치넙치뭉치면살고흝어지면참다랑어를갈아넣고여기서끝이아니다
					비린내를제거하기위해월계수청주잭다니엘피노누아와인머루주매화수막걸리커피콩을넣고
					여기서끝이아니다잡내제거를위해랍스타곰발바닥제비집아토끼발닭모이주머니
					최고급와규스테이크마이아르겉껍질테운부분으로잡내를제거하고여기서끝이아니다
					에비양삼다수아이시스아리수보리수빼어날수라싸수아름다울미백미현미흑미별미를넣고여기서끝이아니다
				</div>
			</div>
			<div id='reviewDiv'>
				<div class='inlineDiv'>
					<div class='reviewTitle'>
						<span class='reviewName'>리뷰(2,348)</span>
					</div>
					<div class='filter'>
						<span class='latest'>최신순</span>
					</div>
					
					<div class='shortVerticalLine'></div>
					
					<div class='filter'>
						<span class='highRating'>평점 높은 순</span>
					</div>
					<div class='writeReview'>
						<input type="button" value='리뷰 쓰기' class='writeReviewButton'>
					</div>
				</div>
				
				<hr class='longDivisionLine'/>
				
				<div class='userEvaluation'>
					<div class='nickname'>조윤성</div>
					<div class='wrapStar'>
						<div class='starRating'>
						</div>
					</div>
					<div class='userUploadImage'>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
						<a href="#"><img alt="밀키트 이미지 " src=""></a>
					</div>
					<div class='reviewContent'>
						오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.
						윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.
						매워서땀이났지만맛있게매워서좋았다.
						사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.
						보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.
						근데맛이레드불에그냥음료탄맛이다.
						이걸4천원받고팔다니양심이있는건지모르겠다.
						음료수라고생각하면나쁘지않기는하다.
						내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
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
				</div>
			</div>
			<div id='lowerButtonDiv'>
				<input type="submit" value="리뷰 더 보기" class='lowerButton'>	
			</div>
		</div>
		
		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>