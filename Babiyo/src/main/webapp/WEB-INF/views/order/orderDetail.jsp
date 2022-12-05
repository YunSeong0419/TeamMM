<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세내역</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

#receiverDiv {
	position: relative;
	margin-left: 50px;
	box-sizing: border-box;
	width: 550px;
	height: 500px;
	padding: 30px;
	border: 2px solid #FF9436;
	border-radius: 20px;
	float: left;
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

.receiverInfo {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	text-align: justify;
	line-height: 0;
}

.receiverInfo:before{
	width: 100%;
	display: inline-block;
	content: "";
}

.receiverInfo:after{
	width: 100%;
	display: inline-block;
	content: "";
}


.receiverInput {
	margin-left: 30px;
	height: 35px;
	width: 340px;
	line-height: 35px;
}

.receiverInfoDiv {
	margin-top: 20px;
}

#requestInfo {
	margin-top: 8px;
	float: left;
}

#requestText {
	resize: none;
	height: 130px;
	line-height: 20px;
	margin-left: 36px;
}

#paymentInfoDiv {
	margin: 0px 50px 0px 640px;
	width: 350px;
	min-height: 450px;
}

#mealkitListDiv{
	min-height: 150px;

} 

#mealkitUl{
	list-style: none;
	padding: 0px;
}

#mealkitListP, #stateName, #orderDateName, #totalAmountName{
	margin: 0px;
	font-weight: bold;
}

#balanceMoney, #stateValue, #orderDateValue, #totalAmountMoney{
	float: right;
	font-weight: bold;
}

.mealkitQuantity{
	display: inline-block;
	float: right;
	text-align: right;
}
.mealkitPrice{
	margin-left: 20px;
	text-align: right;
	width: 100px;
	float: right;
}
.btn{
	margin-top: 10px;
	width: 350px;
	height: 40px;
	font-weight: bold;
	border: 0px;
	border-radius: 5px;
	background-color: #FF9436;
	color: #fff;
}




</style>

<script type="text/javascript">

$(function(){

});

function goListFnc(grade){
	if(grade == 1){
		location.href = '../admin/orderList.do';
	}else{
		location.href = '../member/orderList.do';
	}
}

function cancelFnc(no){
	if(confirm('정말로 주문을 취소하시겠습니까?')){
		$('#orderNo').val(no);
		
		$('#orderInfoForm').attr('action','./cancel.do');
		$('#orderInfoForm').submit();
	}
}

function acceptFnc(no){
	if(confirm('정말로 주문접수를 하시겠습니까?')){
		
		$('#orderNo').val(no);
		
		$('#orderInfoForm').attr('action','./accept.do');
		$('#orderInfoForm').submit();
	}
}


</script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			
			<div id="receiverDiv">
				<span id="receiverTitle">받는사람 정보</span>
	
				<form action="./orderCtr.do" method="post" id="receiverForm">
					<div class="receiverInfoDiv">
						<span class="receiverInfo">받 는 사 람</span>
						<input type="text" name="receiverName" class="receiverInput" value="${orderMap.orderDto.receiverName}"
							readonly="readonly">
					</div>
					<div class="receiverInfoDiv">
						<span class="receiverInfo">전 화 번 호</span>
						<input type="text" name="receiverPhone" class="receiverInput" value="${orderMap.orderDto.receiverPhone}"
							readonly="readonly">
					</div>
					<div class="receiverInfoDiv">
						<span class="receiverInfo">우 편 번 호</span>
						<input type="text" name="post" class="receiverInput" value="${orderMap.orderDto.post}"
							readonly="readonly">
					</div>
					<div class="receiverInfoDiv">
						<span class="receiverInfo">주 소</span>
						<input type="text" name="address" class="receiverInput" value="${orderMap.orderDto.address}"
							readonly="readonly">
					</div>
					<div class="receiverInfoDiv">
						<span class="receiverInfo">상 세 주 소</span>
						<input type="text" name="addressDetail" class="receiverInput" value="${orderMap.orderDto.addressDetail}"
							readonly="readonly">
					</div>
					<div class="receiverInfoDiv">
						<span id="requestInfo" class="receiverInfo">요 청 사 항</span>
						<textarea name="request" id="requestText" class="receiverInput"
							readonly="readonly">${orderMap.orderDto.request}</textarea>
					</div>
			
				</form>
	
			</div>
	
			<div id="paymentInfoDiv">
				<div id="mealkitListDiv">
					<p id="mealkitListP">품목</p>
					<ul id="mealkitUl">
						<c:forEach items="${orderMap.orderDetailList}" var="mealkit">
							<li>
								<span class="mealkitName"><strong>${mealkit.productName}</strong></span>
								<span class="mealkitPrice">
									<fmt:formatNumber pattern="#,### 원" value="${mealkit.price * mealkit.quantity}"/>
								</span>
								<span class="mealkitQuantity">${mealkit.quantity}개</span>
							</li>
						</c:forEach>
					</ul>
				</div>
	
				<hr>
				
				<div>
					<p>
						<span id="totalAmountName">총 결제금액</span>
						<span id="totalAmountMoney">
							<fmt:formatNumber pattern="#,### 원" value="${orderMap.orderDto.totalAmount}"/>
						</span>
					</p>
					
					<p>
						<span id="stateName">상태</span>
						<span id="stateValue">${orderMap.orderDto.stateName}</span>
					</p>
					 
					<p>
						<span id="orderDateName">주문날짜</span>
						<span id="orderDateValue"><fmt:formatDate value="${orderMap.orderDto.orderDate}"/></span>
					</p>
					
				</div>
				
				<hr>
				
				<c:choose>
				<c:when test="${orderMap.orderDto.stateName eq '완료'}">
					<c:if test="${_memberDto_.grade eq 2}">
						<input id="reviewBtn" class="btn" type="button" value="리뷰쓰기">
					</c:if>
				</c:when>
				<c:when test="${orderMap.orderDto.stateName eq '대기'}">
					<c:if test="${_memberDto_.grade eq 1}">
						<input id="acceptBtn" class="btn" type="button" value="주문수락" onclick="acceptFnc(${orderMap.orderDto.no});">
					</c:if>
					<input id="cancelBtn" class="btn" type="button" value="주문취소" onclick="cancelFnc(${orderMap.orderDto.no});">
				</c:when>
				</c:choose>
				<input id="orderListBtn" class="btn" type="button" value="주문목록" onclick="goListFnc(${_memberDto_.grade});">
			</div>
			
			<form method="post" id="orderInfoForm">
				<input type="hidden" id="orderNo" name="orderNo" value="">
			</form>
			
		<div id="underPadding"></div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>