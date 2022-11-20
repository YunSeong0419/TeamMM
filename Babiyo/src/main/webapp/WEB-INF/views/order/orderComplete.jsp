<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	margin-bottom: 60px;
}

.info{
	float: left;
	height: 200px;
}

#receiverInfoUl{
	list-style: none;
	padding: 0px;
	margin: 0px;
}

.completeMsg{
	text-align: center;
	margin: 0px;
	font-weight: bold;
}

#infoDiv{
	width: 1000px;
	margin-top: 30px;
	margin-left: 100px;
}

#receiverInfo, #paymentInfo{
	box-sizing: border-box;
	padding: 10px;
	width: 499px;
}


#receiverInfoTitle, #paymentInfoTitle{
	font-size: 18px;
	font-weight: bold;
	margin: 0px 0px 10px 10px;

}

.receiverText{
	margin-bottom: 5px;
	width: 80px;
	display: inline-block;
	font-weight: bold;
}

#totalAmountDiv{
	height: 115px;
}

#btnDiv{
	text-align: center;
}

#orderDetailViewBtn, #orderAddBtn{
	width: 200px;
	height: 40px;
	margin: 30px 10px;
}
.moneyText{
	font-weight: bold;
	display: inline-block;
	width: 120px;
}

.moneySpan{
	display: inline-block;
	width: 350px;
	text-align: right;
}

</style>
</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
	
	<h2 id="title">주문완료</h2>
	
	
	<div>
		<p class="completeMsg" style="font-size: 35px;">주문이 완료되었습니다.</p>
		<p class="completeMsg" style="font-size: 25px;">상품을 구매해주셔서 감사합니다!</p>
	</div>
	
	<div id="infoDiv">
		<div id="receiverInfo" class="info">
			<p id="receiverInfoTitle">받는사람 정보</p>
			<ul id="receiverInfoUl">
				<li><span class="receiverText">받는 사람</span><span>${orderDto.receiverName}</span></li>
				<li><span class="receiverText">받는 주소</span><span>${orderDto.address}</span></li>
				<li><span class="receiverText">상세 주소</span><span>${orderDto.addressDetail}</span></li>
				<li><span class="receiverText">요청 사항</span><span>${orderDto.request}</span></li>
			</ul>
			
		</div>
		
		<hr class="info" style="">
		
		<div id="paymentInfo" class="info">
			<p id="paymentInfoTitle">결제 정보</p>
			<div id="totalAmountDiv">
				<span class="moneyText">주문금액</span>
				<span class="moneySpan"><fmt:formatNumber pattern="#,###">${orderDto.totalAmount}</fmt:formatNumber>원</span>
			</div>
			<hr>
			<div>
				<span class="moneyText">결제후 보유금액</span>
				<span class="moneySpan"><fmt:formatNumber pattern="#,###">${_memberDto_.cash}</fmt:formatNumber>원</span>
			</div>
		</div>
		
		<hr style="clear:both;">
	</div>
	
	<div id="btnDiv">
		<input id="orderDetailViewBtn" type="button" value="상세내역 보기">
		<input id="orderAddBtn" type="button" value="추가 주문하기">
	</div>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>