<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문화면</title>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<style type="text/css">

#rootDiv{
	
}

#middleDiv{
	margin: auto;
	width: 1200px;
	min-height: 650px; 
}

#receiverDiv {
	position: relative;
	margin-left: 50px;
	box-sizing: border-box;
	width: 550px;
	height: 500px;
	padding: 30px;
	border: 1px solid black;
	border-radius: 20px;
	float: left;
}

#paymentInfoDiv {
	margin: 0px 50px;
	width: 500px;
	height: 500px;
	float: left;
}

#title{
	text-align: center;
	padding-top: 30px;
	margin: 0px 0px 30px 0px;
}

.receiverInfo {
	display: inline-block;
	width: 200px;
}

.receiverInput {
	width: 270px;
}

.receiverInfoDiv {
	margin-top: 20px;
}

#requestInfo {
	float: left;
}

#requestText {
	resize: none;
	margin-left: 6px;
	height: 200px;
}

#mealkitListDiv{
	height: 300px;

}

#mealkitUl{
	list-style: none;
	padding: 0px;
}

#orderBtn, #backBtn{
	width:240px;
	height:40px;
}

#backBtn{
	margin-left: 12px;
}

#mealkitListP,#balanceName,#totalPriceName{
	font-weight: bold;
}

#balanceMoney, #totalPriceMoney{
	float: right
}

.mealkitName{
	display: inline-block;
	width: 300px;
}
.mealkitAmount{
	display: inline-block;
	width: 100px;
	text-align: right;
}
.mealkitPrice{
	float: right;
}

#receiverTitle{
	position: absolute;
	top: -14px; 
	left: 40px;
	font-size:20px; 
	font-weight: bold;
	background-color: white;
	padding: 0px 5px;
}


</style>
<script type="text/javascript">

$(document).ready(function(){
	
	var totalPrice = 0;
	
	$('.price').each(function(i, element) {
		totalPrice += Number($(element).val()) * Number($('.amount').eq(i).val());
	});
	
	var htmlStr = totalPrice.toLocaleString('ko-KR') + '원';
	
	$('#totalPrice').val(totalPrice);
	$('#totalPriceMoney').html(htmlStr);
	
	$('#orderBtn').click(function(){
		$('#receiverForm').submit();
	});
	
});


</script>
</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
	<h2 id="title">주문하기</h2>
	
	

		<div id="receiverDiv">
			<span id="receiverTitle">받는사람 정보</span>

			<form action="./orderCtr.do" method="post" id="receiverForm">
				<div class="receiverInfoDiv">
					<span class="receiverInfo">받으시는 분 성함</span> <input type="text"
						name="receiverName" class="receiverInput" value="">
				</div>
				<div class="receiverInfoDiv">
					<span class="receiverInfo">받으시는 분 연락처</span> <input type="text"
						name="receiverPhone" class="receiverInput" value="">
				</div>
				<div class="receiverInfoDiv">
					<span class="receiverInfo">배송지 입력</span> <input type="text"
						name="address" class="receiverInput">
				</div>
				<div class="receiverInfoDiv">
					<span class="receiverInfo">우편번호</span> <input type="text"
						name="post" class="receiverInput">
				</div>
				<div class="receiverInfoDiv">
					<span class="receiverInfo">상세주소</span> <input type="text"
						name="addressDetail" class="receiverInput">
				</div>
				<div class="receiverInfoDiv">
					<span id="requestInfo" class="receiverInfo">배송 시 요청사항</span>
					<textarea name="request" id="requestText" class="receiverInput"></textarea>
				</div>
				
				<div>
					<c:forEach items="${orderDetailList}" var="mealkit" varStatus="status">
						<input type="hidden" name="orderDetailList[${status.index}].productNo" value="${mealkit.productNo}">
						<input type="hidden" class="amount" name="orderDetailList[${status.index}].amount" value="${mealkit.amount}">
						<input type="hidden" class="price" name="orderDetailList[${status.index}].price" value="${mealkit.price}">
					</c:forEach>
					<input type="hidden" id="totalPrice" name="totalPrice" value="">
					<input type="hidden" id="memberId" name="memberId" value="">
				</div>
				
			</form>

		</div>
		<div id="paymentInfoDiv">
			<div id="mealkitListDiv">
				<p id="mealkitListP">품목</p>
				<ul id="mealkitUl">
					<c:forEach items="${orderDetailList}" var="mealkit">
						<li>
							<span class="mealkitName">${mealkit.productName}</span>
							<span class="mealkitAmount">${mealkit.amount}개</span>
							<span class="mealkitPrice">
							<fmt:formatNumber pattern="#,###">${mealkit.price * mealkit.amount}</fmt:formatNumber>원
							</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<p>
					<span id="balanceName">보유금액</span> <span id="balanceMoney"></span>
				</p>
				<p>
					<span id="totalPriceName">총 결제금액</span> <span id="totalPriceMoney"></span>
				</p>
			</div>

			<p>위 내용을 확인하였으며 결제에 동의합니다</p>
			<hr>
			<input id="orderBtn" type="button" value="결제하기">
			<input id="backBtn" type="button" value="뒤로가기">
		</div>

		<div style="clear: both;"></div>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>