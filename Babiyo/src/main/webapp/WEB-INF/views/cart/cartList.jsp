<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

#cartTableDiv{
	width: 950px;
	min-height: 380px;
	margin: 0px auto;
}

#checkTh{
	height: 30px;
	width: 30px;
}

.checkTd{
	text-align: center;
}

#nameTh{
	width: 620px;
}
.nameTd{
	padding-left: 20px;
}
#priceTh{
	width: 100px;
}
.priceTd{
	text-align: center;
}
#quantityTh{
	width: 100px;
}
.quantityTd{
	text-align: center;
}

.quantity{
	text-align: right;
	width: 40px;
}
#sumTh{
	width: 100px;
}
.sumTd{
	text-align: center;
}

table{
	border-collapse: collapse;
}

#firstRow{
	background-color: #E0E0E0;
}

#cartListTable{
	margin: 0px auto;
}

#totalAmountText{
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
#tableUnder{
	width: 950px;
	margin: auto;
}


</style>
<script type="text/javascript">

$(function(){
	
	$('.quantity').change(function() { // 품목갯수 변경 시 금액 바꾸는 함수
		
		if($(this).val() >= 100){
			$(this).val(99);
		}
	
		var no = $('.quantity').index(this);	// 이벤트가 일어난 클래스 인덱스 찾기
		var quantity = Number($(this).val());	// 변경한 갯수
		
		var productNo = $('.productNo').eq(no).val();	// 제품번호
		
		$.ajax({
		    type : 'post',           // 타입 (get, post, put 등등)
		    url : './cartModify.do',           // 요청할 서버url
		    async : true,            // 비동기화 여부 (default : true)
		    data : {
		    	productNo: productNo,
		    	quantity: quantity
		    },
		    success : function() { // 결과 성공 콜백함수
		    	
				var price = Number($('.price').eq(no).val()); // 제품의 가격
				var sumPrice = quantity * price; // 합계 금액
				
				$('.sumPrice').eq(no).val(sumPrice); // input에 값 저장
				
				$('.sumTd').eq(no).html(korTrans(sumPrice)); // 화면에 적용
				
				totalTrans();	// 주문금액 적용
		    }
		}); // ajax 종료
	});
	
	
	$('#selectDelete').click(function() { // 선택한 품목의 번호만 삭제로 보냄
	
		var checked = $('.check').is(':checked');
		
		if(checked == false){ // 하나라도 체크가 되어야지 수행
			alert('선택한 항목이 없습니다');
			return;
		}
		
		if(confirm('선택한 품목을 삭제하시겠습니까?') == false){ // 삭제를 할 것인지 확인
			return;
		}
		
		$('.check:checked').each(function(index) {
			var no = $('.check').index(this); // 체크가 되어있는 인덱스의 번호
			var name = 'cartList[' + index + '].productNo'; 
			$('.productNo').eq(no).attr('name', name); // 체크가 된 제품번호에만 name 태그를 달아줌
		});
			
		$('#cartForm').attr('action', './cartDelete.do');
		$('#cartForm').submit();
	});
	
	
	
	$('#selectOrder').click(function() {
		
		var checked = $('.check').is(':checked');
		
		if(checked == false){ // 하나라도 체크가 되어야지 수행
			alert('선택한 항목이 없습니다');
			return;
		}
		
		$('.check:checked').each(function(index) {
			var no = $('.check').index(this); // 체크가 되어있는 인덱스의 번호
			
			var productNo = 'orderDetailList[' + index + '].productNo'; 
			var productName = 'orderDetailList[' + index + '].productName'; 
			var quantity = 'orderDetailList[' + index + '].quantity'; 
			var price = 'orderDetailList[' + index + '].price'; 
			
			$('.productNo').eq(no).attr('name', productNo); // 체크가 된 제품번호에만 name 태그를 달아줌
			$('.productName').eq(no).attr('name', productName);
			$('.quantity').eq(no).attr('name', quantity); 
			$('.price').eq(no).attr('name', price); 
		});
		
		
		$('#cartForm').attr('action', '../order/order.do');
		$('#cartForm').submit();
	});
	
	
	
	$('#allCheck').change(function() { // 전체선택 기능
		var checked = $(this).is(':checked');
		$('.check').prop('checked', checked);
		
		totalTrans(); // 전체선택 후에 총합계가 변하게 함
	});
	
	
	
	$('.check').change(totalTrans); 
	
});

function korTrans(price){ // 숫자를 원화시키기 위한 함수
	return price.toLocaleString('ko-KR') + '원';
}

function totalTrans(){ // 체크한 주문금액을 반영해주는 함수
	var totalAmount = 0;
	
	$('.check:checked').each(function() {
		var no = $('.check').index(this); // 체크가 되어있는 인덱스의 번호
		var sumPrice = Number($('.sumPrice').eq(no).val()); // 체크가 된 상품금액
		totalAmount += sumPrice;
	});
	
	$('#totalAmount').val(totalAmount); // input에 값 저장
	$('#totalAmountText').html('주문금액: ' + korTrans(totalAmount)); // 화면을 위한 값
}



</script>


</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	
	<div id="middleDiv">
		
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		<div id="middleMainDiv">
			
			<div id='sideTitle'></div>
			
			<div id="cartTableDiv">
				<form id="cartForm" method="post">
					<table id="cartListTable">
						<tr id="firstRow">
							<th id="checkTh"><input type="checkbox" id="allCheck"></th><th id="nameTh">상품명</th>
							<th id="priceTh">가격</th><th id="quantityTh">수량</th><th id="sumTh">상품금액</th>
						</tr>
						<c:choose>
						<c:when test="${!empty cartList}">
						<c:forEach items="${cartList}" var="cart">
						<tr>
							<td class="checkTd"><input type="checkbox" class="check"></td>
							<td class="nameTd">${cart.productName}</td>
							<td class="priceTd">
								<fmt:formatNumber pattern="#,###">${cart.productPrice}</fmt:formatNumber>원
							</td>
							<td class="quantityTd">
								<input class="quantity" type="number" min="1" max="99" value="${cart.quantity}">
							</td>
							<td class="sumTd">
								<fmt:formatNumber pattern="#,###">${cart.productPrice * cart.quantity}</fmt:formatNumber>원
							</td>
						</tr>
						<div>
							<input type="hidden" value="${cart.productNo}" class="productNo">
							<input type="hidden" value="${cart.productName}" class="productName">
							<input type="hidden" value="${cart.productPrice}" class="price">
							<input type="hidden" value="${cart.productPrice * cart.quantity}" class="sumPrice">
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
					<input type="text" style="display: none">
				</form>
			</div>
			
			<div id="tableUnder">
				<input type="button" value="선택항목 삭제" id="selectDelete">
				<span id="totalAmountText">주문금액: 0원</span>
			</div>
			<input type="hidden" id="totalAmount" name="totalAmount" value="">
			
			<div id="orderBtnDiv">
				<input type="button" value="주문하기" id="selectOrder">
			</div>
		
			<div id="underPadding"></div>
		</div>
		
	</div>
	
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>