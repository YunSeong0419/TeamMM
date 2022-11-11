<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문화면</title>

<style type="text/css">
.receiverInfo {
	display: inline-block;
	width: 200px;
}
#receiverDiv{
	display: inline-block;
	height: 500px;
	padding: 30px;
	border: 1px solid black;
	border-radius: 20px;
}

.receiverInput{
	width: 200px;
}
.receiverInfoDiv{
	margin-top : 20px;
}
#requestInfo{
	float: left;
}

#requestText{
/* 	display: block; */
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
}
</style>
</head>

<body>

<h3>주문하기</h3>

<div id="middleDiv">
	<div id="receiverDiv">
	
		<form action="/orderCtr.do" >
			<div class="receiverInfoDiv">
				<span class="receiverInfo">받으시는 분 성함</span> <input type="text" name="name" class="receiverInput">
			</div>
			<div class="receiverInfoDiv">
				<span class="receiverInfo">받으시는 분 연락처</span> <input type="text" name="phone" class="receiverInput">
			</div>
			<div class="receiverInfoDiv">
				<span class="receiverInfo">배송지 입력</span> <input type="text" name="address" class="receiverInput">
			</div>
			<div class="receiverInfoDiv">
				<span class="receiverInfo">우편번호</span> <input type="text" name="post" class="receiverInput">
			</div>
			<div class="receiverInfoDiv">
				<span class="receiverInfo">상세주소</span> <input type="text" name="addressDetail" class="receiverInput">
			</div>
			<div class="receiverInfoDiv">
				<span id="requestInfo" class="receiverInfo">배송 시 요청사항</span> <textarea name="request" id="requestText" class="receiverInput"></textarea>
			</div>
		</form>
		
	</div>
	<div>
	
	</div>
</div>




</body>
</html>