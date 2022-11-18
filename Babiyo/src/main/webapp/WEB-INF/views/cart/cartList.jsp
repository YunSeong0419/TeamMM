<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/basic.css?a"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<style type="text/css">
#middleDiv{
	float: left;
	width: 1050px;
	min-height: 548px;
}

#marginDiv{
	margin: auto;
	width: 850px;
}

#cartTableDiv{
	min-height: 400px;
}

.checkTd{
	height: 30px;
	width: 30px;
	text-align: center;
}
.nameTd{
	padding-left: 20px;
	width: 520px;
}
.priceTd{
	text-align: center;
	width: 100px;
}
.amountTd{
	text-align: center;
	width: 100px;
}
.sumTd{
	text-align: center;
	width: 100px;
}

table{
	border-collapse: collapse;
}

#totalPrice{
	float: right;
}
#orderBtnDiv{
	width: 200px;
	height: 40px;
	margin: auto;
	margin-top: 30px;
}

#selectOrder{
	width: 200px;
	height: 40px;
}

</style>
<script type="text/javascript">

$(function(){
	
	totalTrans(); // 페이지를 불러오자마자 합계금액을 적용시킴
	
	$('input[id^="amount"]').change(function() { // 품목갯수 변경시 합계가격 바꾸는 함수
		
		var no = $(this).attr("id").substr(6); // 이벤트가 일어난 카트no 찾기
		
		var priceHidId = '#priceHid' + no;
		var sumPrice = Number($(this).val()) * Number($(priceHidId).val()); //갯수와 가격을 곱함
		
		var sumPriceHidId = '#sumPriceHid' + no;
		$(sumPriceHidId).val(sumPrice); // 히든에 합계금액을 저장
		
		var sumPriceId = '#sumPrice' + no;
		
		$(sumPriceId).html(korTrans(sumPrice));
		totalTrans();
	});
	
	$('#selectDelete').click(function() { // 선택한 품목의 번호만 삭제로 보냄
		
		var submitCheck = false;
		var htmlStr = '';
		var index = 0;
		
		$('input[id^="cartNo"]').each(function() {
			
			var no = $(this).attr('id').substr(6);
			var checked = $(this).is(':checked');
			
			if(checked){ //선택이 됫으면 폼안에 히든으로 번호를 저장함
				htmlStr += '<input type="hidden" name="cartList[' + index + '].no" value="' + no + '">';
				submitCheck = true;
				index = index + 1;
			}
			
		});
		
		if(submitCheck){
			$('#deleteForm').html(htmlStr);
			$('#deleteForm').submit();
		}else{ 
			alert('선택한 항목이 없습니다');
		}
		
	});
	
	$('#selectOrder').click(function() {
		
		var submitCheck = false;
		var htmlStr = '';
		var index = 0;
		
		
		$('input[id^="cartNo"]').each(function() {
			
			var no = $(this).attr('id').substr(6);
			var checked = $(this).is(':checked');
			
			var productNoId = '#productNoHid' + no;
			var productNameId = '#productNameHid' + no;
			var amountId = '#amount' + no;
			var priceId = '#priceHid' + no;
			
			if(checked){
				htmlStr += '<input type="hidden" name="cartList[' + index + '].no" value="' + no + '">';
				htmlStr += '<input type="hidden" name="orderDetailList[' + index + '].productNo" value="'
					+ $(productNoId).val() + '">';
				htmlStr += '<input type="hidden" name="orderDetailList[' + index + '].productName" value="'
					+ $(productNameId).val() + '">';
				htmlStr += '<input type="hidden" name="orderDetailList[' + index + '].amount" value="'
					+ $(amountId).val() + '">';
				htmlStr += '<input type="hidden" name="orderDetailList[' + index + '].price" value="'
					+ $(priceId).val() + '">';
				
				index = index + 1;
				
				submitCheck = true;
			}
			
		});
		
		if(submitCheck){
			$('#selectOrderForm').html(htmlStr);
			$('#selectOrderForm').submit();
		}else{
			alert('선택한 항목이 없습니다');
		}
		
	});
	
	$('#allCheck').change(function() { // 전체선택 기능
		var checked = $(this).is(':checked');
		$('input[id^="cartNo"]').prop('checked', checked);
		
		totalTrans(); // 전체선택 후에 총합계가 변하게 함
	});
	
	
	
	$('input[id^="cartNo"]').change(function() { // 개별선택시에 총합계가 변하게하는 이벤트
		totalTrans();
	})
	
});

function korTrans(price){ // 숫자를 원화시키기 위한 함수
	return price.toLocaleString('ko-KR') + '원';
}

function totalTrans(){ // 장바구니의 총합계금액을 반영해주는 함수
	var totalPrice = 0;
	
	$('input[id^="sumPriceHid"]').each(function(index, item) {
		var no = $(this).attr('id').substr(11);
		var id = '#cartNo' + no;
		var checked = $(id).is(':checked');
		
		if(checked){ // 체크를 해야지만 합계 금액에 포함됌
			totalPrice += Number($(item).val());
		}
	});
	
	$('#totalPriceHid').val(totalPrice); // form으로 보내기 위해서 히든에 저장
	$('#totalPrice').html('총 합계: ' + korTrans(totalPrice)); // 화면을 위한 값
}

// function go(){
	
// 	$.ajax({
// 	    type : 'post',           // 타입 (get, post, put 등등)
// 	    url : './ajax/amountModify.do',           // 요청할 서버url
// 	    async : true,            // 비동기화 여부 (default : true)
// 	    dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
// 	    data : {  // 보낼 데이터 (Object , String, Array)
// 	    },
// 	    success : function(result) { // 결과 성공 콜백함수
// 	        console.log(result);
// 	    },
// 	    error : function(request, status, error) { // 결과 에러 콜백함수
// 	        console.log(error)
// 	    }
// 	});
	
// }



</script>


</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div id="middleDiv">
		
		<div id="marginDiv">
			<div id="cartTableDiv">
				<table>
					<tr style="background-color: gray;">
						<th class="checkTd"><input type="checkbox" id="allCheck"></th><th class="nameTd">상품명</th>
						<th class="priceTd">단가</th><th class="amountTd">수량</th><th class="sumTd">합계</th>
					</tr>
					<c:choose>
					<c:when test="${!empty cartList}">
					<c:forEach items="${cartList}" var="cart" varStatus="status">
					<tr>
						<td class="checkTd"><input type="checkbox" id="cartNo${cart.no}"></td>
						<td class="nameTd">${cart.productName}</td>
						<td class="priceTd" id="price${cart.no}">
							<fmt:formatNumber pattern="#,###">${cart.productPrice}</fmt:formatNumber>원
						</td>
						<td class="amountTd">
							<input id="amount${cart.no}" type="number" value="${cart.amount}"
								 min="1" max="99" style="width: 35px; text-align: right;">
						</td>
						<td class="sumTd" id="sumPrice${cart.no}">
							<fmt:formatNumber pattern="#,###">${cart.productPrice * cart.amount}</fmt:formatNumber>원
						</td>
					</tr>
					<div>
						<input type="hidden" value="${cart.productNo}" id="productNoHid${cart.no}">
						<input type="hidden" value="${cart.productName}" id="productNameHid${cart.no}">
						<input type="hidden" value="${cart.productPrice}" id="priceHid${cart.no}">
						<input type="hidden" value="${cart.productPrice * cart.amount}" id="sumPriceHid${cart.no}">
					</div>
					</c:forEach>
					</c:when>
					
					<c:otherwise>
					<tr>
						<td colspan="5" style="text-align: center;"><span>장바구니가 비었습니다</span></td>
					</tr>
					</c:otherwise>
					</c:choose>
					
				</table>
			</div>
			
			<div>
				<input type="button" value="선택항목 삭제" id="selectDelete">
				<span id="totalPrice"></span>
			</div>
			<input type="hidden" id="totalPriceHid" name="totalPrice" value="">
			
			<div id="orderBtnDiv">
				<input type="button" value="주문하기" id="selectOrder">
			</div>
		
		</div>
		<form action="./delete.do" method="post" id="deleteForm"></form>
		<form action="../order/order.do" method="post" id="selectOrderForm"></form>
	
	</div>
	
	
	<input type="button" onclick="go();">
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>