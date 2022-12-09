<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 주문목록</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

#stateForm{
	width: 900px;
	margin: auto;
}

#orderList{
	margin-top: 10px;
	min-height: 400px;
}

#orderListTable{
	border-collapse: collapse;
	margin: auto;
}

#orderListTable td{
	height: 35px;
	border-bottom: 2px solid #FF9436;
	padding: 0px 10px;
}

#firstRow{
	background-color: #FF9436;
	color: #fff;
}

#orderDateTh{
	width: 200px;
	height: 30px;
}
#orderNoTh{
	width: 80px;
}
#productNameTh{
	width: 320px;
}
#totalAmountTh{
	width: 120px;
}
#orderStateTh{
	width: 80px;
}
#btnTh{
	width: 100px;
}

.orderDateTd, .orderStateTd, .btnTd{
	text-align: center;
}

.totalAmountTd, .orderNoTd{
	text-align: right;
}

.productNameTd{
	padding-left: 10px;
}

#detailLink{
	color: black;
	text-decoration: none;
}

#searchOption{
	margin: 0px 50px;
}

.inputBox{
	line-height: 35px;
	height: 35px;
	border: 1px solid black;
	border-radius: 5px;
}
</style>

<script type="text/javascript">

$(function(){
	$('#stateSelect').val($('#stateCode').val());
});

function cancelFnc(orderNo){
	if(confirm('정말로 주문을 취소하시겠습니가?')){
		$('#orderNo').val(orderNo);
		
		$('#orderInfoForm').attr('action','../order/cancel.do');
		$('#orderInfoForm').submit();
	}
}

function stateSelectFnc(){
	
	$('#stateForm').submit();
	
}

function reviewWrite(){
	
	location.href = '/babiyo/review/write.do';
	
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
		
			<div id="searchOption">
				<form id="stateForm" method="get">
					<strong>상태</strong>
					<select id="stateSelect" name="stateCode" class="inputBox" onchange="stateSelectFnc();">
					<option value="0">전체</option>
					<c:forEach items="${stateList}" var="state">
					<option value="${state.CODE}">${state.NAME}</option>
					</c:forEach>
					</select>
				</form>
			</div>
		
			<div id="orderList">
				<table id="orderListTable">
					<tr id="firstRow">
						<th id="orderDateTh">주문일자</th><th id="orderNoTh">주문번호</th>
						<th id="productNameTh">상품명</th><th id="totalAmountTh">결제금액</th>
						<th id="orderStateTh">상태</th><th id="btnTh"></th>
					</tr>
					
					<c:choose>
					<c:when test="${!empty orderList}">
					<c:forEach items="${orderList}" var="order">
					<tr>
						<td class="orderDateTd"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						<td class="orderNoTd">${order.no}</td>
						<td class="productNameTd"><a id="detailLink" href="../order/detail.do?orderNo=${order.no}">
							${order.preview}
							<c:choose>
								<c:when test="${order.productQuantity gt 1}">
								 외 ${order.productQuantity-1}건
								</c:when>
							</c:choose>
							</a>
						</td>
						<td class="totalAmountTd"><fmt:formatNumber pattern="#,### 원" value="${order.totalAmount}"/></td>
						<td class="orderStateTd">${order.stateName}</td>
						
						<td class="btnTd">
						<c:choose>
							<c:when test="${order.stateCode eq 1}">
							<input type="button" value="취소" onclick="cancelFnc(${order.no});">
							</c:when>
							<c:when test="${order.stateCode eq 2}">
							<input type="button" value="리뷰쓰기" onclick="reviewWrite();">
							</c:when>
						</c:choose>
						</td>
					</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td colspan="6" style="text-align: center; height: 350px; font-size: 25px;">
						<strong>조회 내용이 없습니다</strong>
						</td>
					</tr>
					</c:otherwise>
					</c:choose>
					
				</table>
				
			</div>
			
			<jsp:include page="/WEB-INF/views/Paging.jsp"/>
			
			<form method="post" id="orderInfoForm">
				<input type="hidden" id="orderNo" name="orderNo" value="">
			</form>
		
			<form method="get" id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" id="stateCode" name="stateCode" value="${searchOption.stateCode}">
			</form>
			
			<div id="underPadding"></div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>