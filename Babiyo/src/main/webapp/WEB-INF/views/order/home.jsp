<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문화면</title>

<style type="text/css">


#wrapDiv{
	margin: auto;
	width: 1200px;
	min-height: 600px; 
}

#receiverDiv {
	width: 500px;
	height: 500px;
	padding: 30px;
	border: 1px solid black;
	border-radius: 20px;
	float: left;
}

#paymentInfoDiv {
	width: 500px;
	height: 500px;
	padding: 30px;
	float: left;
}

#title{
	text-align: center;
	margin: 0px;
}

.receiverInfo {
	display: inline-block;
	width: 200px;
}

.receiverInput {
	width: 200px;
}

.receiverInfoDiv {
	margin-top: 20px;
}

#requestInfo {
	float: left;
}

#requestText {
}


</style>
</head>

<body>
<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="wrapDiv">
	
	<h2 id="title">주문하기</h2>

		<div id="receiverDiv">

			<form action="/orderCtr.do">
				<div class="receiverInfoDiv">
					<span class="receiverInfo">받으시는 분 성함</span> <input type="text"
						name="name" class="receiverInput">
				</div>
				<div class="receiverInfoDiv">
					<span class="receiverInfo">받으시는 분 연락처</span> <input type="text"
						name="phone" class="receiverInput">
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
			</form>

		</div>
		<div id="paymentInfoDiv">
			<div>
				<p>품목</p>
				<ul>
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</div>
			<div>
				<p>
					<span>보유금액</span> <span>10,000원 </span>
				</p>
				<p>
					<span>총 결제금액</span> <span>10,000원 </span>
				</p>
			</div>

			<p>위 내용을 확인하였으며 결제에 동의합니다</p>
			<hr>
			<input type="button" value="결제하기">
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>