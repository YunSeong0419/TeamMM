<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<style type="text/css">
#middleDiv{
	min-height: 650px;
	width: 1200px;
	margin: auto;
}

#title{
	text-align: center;
	padding-top: 30px;
	margin-top: 0px;
	margin-bottom: 30px;
}

.info{
	float: left;
	height: 200px;
}

#receiverInfoUl{
	list-style: none;
	padding: 0px;
}

.completeMsg{
	text-align: center;
	margin: 0px;
	font-weight: bold;
}
#infoDiv{
	width: 1000px;
	margin-left: 100px;
}

#receiverInfo{
	width: 499px;
	
}

#paymentInfo{
	width: 499px;
}

#btnDiv{
	margin: auto;
	text-align: center;
	width: 300px;
}
#receiverInfoTitle, #paymentInfoTitle{
	font-size: 18px;
	font-weight: bold;
}
#paymentInfoTitle{
}

</style>
</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
	
	<h2 id="title">주문완료</h2>
	
	
	<div style="margin-top: 100px;">
		<p class="completeMsg" style="font-size: 35px;">주문이 완료되었습니다.</p>
		<p class="completeMsg" style="font-size: 25px;">상품을 구매해주셔서 감사합니다!</p>
	</div>
	
	<div id="infoDiv">
		<div id="receiverInfo" class="info">
			<span id="receiverInfoTitle">받는사람 정보</span>
			<ul id="receiverInfoUl">
				<li><span>받는사람</span> <span></span></li>
				<li><span>받는주소</span> <span></span></li>
				<li><span>요청사항</span> <span></span></li>
			</ul>
		
		</div>
		
		<hr class="info" style="">
		
		<div id="paymentInfo" class="info">
			<span id="paymentInfoTitle">결제 정보</span>
			
			<div><span>주문금액</span><span>${totalPrice}원</span></div>
			<hr>
			<div><span>결제후 보유금액</span><span>${cashBalance}원</span></div>
		</div>
		
		<hr style="clear:both;">
	</div>
	
	<div id="btnDiv">
		<input type="button" value="상세내역 보기">
		<input type="button" value="추가 주문하기">
	</div>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>