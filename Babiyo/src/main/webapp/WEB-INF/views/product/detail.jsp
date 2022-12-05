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

#categoryName, #category{
	margin-right: 10px;
	font-size: 16px;
}

#categoryName{
	font-weight: bold;
}

#productInfoDiv{
	width: 900px;
	height: 400px;
	float: left;
}

#imageDiv{
	padding: 0px;
	width: 450px;
	height: 400px;
	text-align: center;
	float: left;
}

#imageDiv > img{
	width: 400px;
	height: 400px;
	float: left;
}

#productInfo{
	width: 450px;
	height: 400px;
	float: left;
}

#productTitle{
	height: 40px;
	font-size: 30px;
	font-weight: bold;
	line-height: 40px;
}

#productTitle > input{
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

#productName{
	margin-right: 10px;
}

#evaluationAndReviewCount{
	margin: 5px;
	height: 20px;
	font-size: 16px;
	line-height: 20px;	
}

#inputPurchaseDetail{
	margin-top: 40px;
	width: 250px;
	height: 190px;
	float: left;
}

#adjustDiv{
	margin-top: 40px;
	width: 200px;
	height: 190px;
	float: left;
}

#price{
	margin-left: 10px;
	height: 25px;
}

#priceName{
	float: left;
}

#stock, #quantity{
	margin: 10px 0px 0px 10px;
	height: 25px;
}

#priceValue{
	margin-left: 50px;
	height: 25px;
	color: #000000;
	float: right;
}

#stockValue{
	margin-left: 25px;
	height: 25px;
	float: right;
}

#quantitySelect{
	margin-left: 65px;
	width: 50px;
	height: 25px;
	float: right;
}

#totalPrice{
	margin: 50px 0px 0px 10px;
	height: 25px;
	font-size: 16px;
	font-weight: bold;
	line-height: 25px;
}

#totalPriceName{
	margin-right: 20px;
	height: 25px;
}

#totalPriceValue{
	float: right;
}

#productInfoButton{
	text-align: center;
}

#putShoppingCart, #purchaseOrder{
	margin: 20px;
	width: 150px;
	height: 50px;
	font-size: 16px;
}

#productContentDiv{
	min-height: 200px;
	float: left;
}

#contentTitle, #reviewName{
	margin: 10px 0px;
	height: 30px;
	font-size: 22px;
	font-weight: bold;
	line-height: 30px;
}

#content{
	margin: 30px 20px;
}

#reviewDiv{
	margin-bottom: 30px;
	min-height: 200px;
	float: left;
}

#inlineDiv{
	height: 40px;
	line-height: 40px;
}

#reviewTitle, #filter, #writeReview{
	float: left;
}

#shortVerticalLine{
	margin: 0px 5px;
	display: inline-block;
	margin-top:10px;
	border-left : 2px solid #A0A0A0;
	height: 20px;
	float: left;
}

#latest{
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

#lowerButton{
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

#favoriteHeart{
	cursor: pointer;
}



</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">


function korTrans(price){ // 숫자를 원화시키기 위한 함수
	return price.toLocaleString('ko-KR') + '  원';
}


function totalPriceFnc(obj){
	
	var price = Number($('#priceOrigin').val());
	
	var totalPrice = price * $(obj).val();
	
	var priceKor = korTrans(totalPrice);
	
	$('#totalPriceValue').text(priceKor);
	
}

function favoriteFnc(){
	
	var productNo = $('#productNo').val();
	
	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : '../favorite/favoriteBtn.do',           // 요청할 서버url
	    async : true,            // 비동기화 여부 (default : true)
	    data : {productNo: productNo},
	    success : function(check) { // 결과 성공 콜백함수
	    	// 즐겨찾기에서 삭제가 됬으면 true 추가됬으면 false
	    	if(check){
	    		$('#favoriteHeart').attr('src', '/babiyo/resources/img/heartEmpty.png');
	    	}else{
		    	$('#favoriteHeart').attr('src', '/babiyo/resources/img/heart.png');
	    	}
	    }
	}); // ajax 종료
}

function cartAddBtn(){
	
	var productNo = $('#productNo').val();
	var quantity = $('#quantitySelect').val();
	
	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : '../cart/cartAdd.do',        // 요청할 서버url
	    async : true,            // 비동기화 여부 (default : true)
	    data : {
	    	productNo : productNo,
	    	quantity : quantity
	    },
	    success : function() { // 결과 성공 콜백함수
			alert('장바구니에 추가되었습니다');
	    }
	}); // ajax 종료
}



</script>


</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
		<div id='productMemberDetailDiv'>
			<div id='productCategoryDiv'>
				<span id='categoryName'>음식 분류</span>
				<span id='category'>${productDto.categoryName}</span>
			</div>
			<div id='productInfoDiv'>
				<form action="../order/order.do" method="post">
					<input type="hidden" id="productNo" name="orderDetailList[0].productNo" value="${productDto.no}">
					<div id='imageDiv'>
						<img alt="${productDto.name} 이미지" src="/babiyo/img/${productImg.STORED_NAME}">
					</div>
					
					<div id='productInfo'>
						<div id='productTitle'>
							<span id='productName'>${productDto.name}</span>
							<input type="hidden" name="orderDetailList[0].productName" value="${productDto.name}">
							<c:choose>
							<c:when test="${favoriteCheck}">
								<img id="favoriteHeart" alt="heart" src="/babiyo/resources/img/heart.png" onclick="favoriteFnc();">
							</c:when>
							<c:otherwise>
								<img id="favoriteHeart" alt="heart" src="/babiyo/resources/img/heartEmpty.png" onclick="favoriteFnc();">
							</c:otherwise>
							</c:choose>
						</div>
					
						<div id='evaluationAndReviewCount'>
							☆4.9(${reviewDto})
						</div>
					
						<hr class='shortDivisionLine'/>	
						
						<div id='inputPurchaseDetail'>
							<div id='price'>
								<span id='priceName'>가격 </span>
								<span id='priceValue'>
									<fmt:formatNumber value="${productDto.price}" pattern="#,###"/>&nbsp;&nbsp;원
								</span>
								<input type="hidden" id="priceOrigin" name="orderDetailList[0].price" value="${productDto.price}">
							</div>
							<div id='stock'>
								<span id='stockName'>남은 개수 </span>
								<span id='stockValue'>${productDto.stock}&nbsp;&nbsp;개</span>
							</div>
							<div id='quantity'>
								<span id='quantityName'>수량 </span>
								<select id='quantitySelect' name="orderDetailList[0].quantity" onchange="totalPriceFnc(this);">
									<c:forEach begin="1" end="${productDto.stock}" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
							</div>
							<div id='totalPrice'>
								<span id='totalPriceName'>총 결제금액 </span>
								<span id='totalPriceValue'>
									<fmt:formatNumber value="${productDto.price}" pattern="#,###"/>&nbsp;&nbsp;원	
								</span>
							</div>
						</div>
						
						<div id='adjustDiv'></div>
						
						<hr class='shortDivisionLine'/>
						
						<div id='productInfoButton'>
							<input type="button" value="장바구니 담기" id='putShoppingCart' onclick="cartAddBtn();">
							<input type="submit" value="주문하기" id='purchaseOrder'>
						</div>
					</div>
				</form>
			</div>
			<div id='productContentDiv'>
				<div id='contentTitle'>
					<p>설명</p>
				</div>
				
				<hr class='longDivisionLine'/>
				
				<div id='content'>
					${productDto.content}
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
					</div>
					<div class='reviewContent'>
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