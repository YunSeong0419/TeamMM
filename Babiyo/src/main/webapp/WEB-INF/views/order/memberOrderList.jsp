<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 주문목록</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/basic.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>



<style type="text/css">
table{
	border-collapse: collapse;
}

#cartTableDiv{
	min-height: 400px;
}

#orderListTable{
	margin: auto;
}

#orderDateTh{
	width: 120px;
	height: 30px;
}
#orderNoTh{
	width: 100px;
}
#productNameTh{
	width: 500px;
}
#totalAmountTh{
	width: 100px;
}
#orderStateTh{
	width: 50px;
}
#btnTh{
	width: 80px;
}

.orderDateTd, .orderNoTd, .orderStateTd, .btnTd{
	text-align: center;
}

.totalAmountTd{
	padding-right: 5px;
	text-align: right;
}

.productNameTd{
	padding-left: 10px;
}

td{
	height: 30px;
	border-bottom: 1px solid gray;
}

#detailLink{
	color: black;
	text-decoration: none;
}





</style>

<script type="text/javascript">

function cancelFnc(orderNo){
	
	location.href = '../cancel.do?orderNo=' + orderNo + '&backPage=list';
}

</script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />

	<div id="middleRightDiv">
	
		<div id="cartTableDiv">
			<table id="orderListTable">
				<tr style="background-color: gray;">
					<th id="orderDateTh">주문일자</th><th id="orderNoTh">주문번호</th>
					<th id="productNameTh">상품명</th><th id="totalAmountTh">결제금액</th>
					<th id="orderStateTh">상태</th><th id="btnTh"></th>
				</tr>
				
				<c:choose>
				<c:when test="true">
				<c:forEach items="${orderList}" var="order">
				<tr>
					<td class="orderDateTd"><fmt:formatDate value="${order.orderDate}"/></td>
					<td class="orderNoTd">${order.no}</td>
					<td class="productNameTd"><a id="detailLink" href="./detail.do?orderNo=${order.no}">${order.preview}
					<c:choose>
						<c:when test="${order.productQuantity gt 1}">
						 외 ${order.productQuantity-1}건
						</c:when>
					</c:choose>
					</a>
					</td>
					<td class="totalAmountTd"><fmt:formatNumber pattern="#,###" value="${order.totalAmount}"/>원</td>
					<td class="orderStateTd">${order.stateName}</td>
					
					<td class="btnTd">
					<c:choose>
						<c:when test="${order.stateName eq '대기'}">
						<input type="button" value="취소" onclick="cancelFnc(${order.no});">
						</c:when>
						<c:when test="${order.stateName eq '완료'}">
						<input type="button" value="리뷰쓰기">
						</c:when>
					</c:choose>
					</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="6">조회할 주문이 없습니다</td>
				</tr>
				</c:otherwise>
				</c:choose>
				
			</table>
			
			
			
		</div>
		<jsp:include page="/WEB-INF/views/Paging.jsp"/>
	
		<form method="get" id="pagingForm">
			<input type="hidden" name="curPage" id="curPage" value="${paging.curPage}">
		</form>
		
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>