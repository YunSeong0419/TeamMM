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

.orderDateTd{
	width: 150px;
	height: 30px;
}
.orderNoTd{
	width: 100px;
	
}
.productNameTd{
	width: 300px;
}
.totalAmountTd{
	width: 100px;
}
.orderStateTd{
	width: 100px;
}
.btnTd{
	width: 100px;
}


</style>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />

	<div id="middleRightDiv">
	
	<div id="marginDiv">
			<div id="cartTableDiv">
				<table>
					<tr style="background-color: gray;">
						<th class="orderDateTd">주문일자</th><th class="orderNoTd">주문번호</th>
						<th class="productNameTd">상품명</th><th class="totalAmountTd">결제금액</th>
						<th class="orderStateTd">진행상황</th><th class="btnTd"></th>
					</tr>
					
					<c:choose>
					<c:when test="true">
					<c:forEach items="${orderList}" var="order">
					<tr>
						<td><fmt:formatDate value="${order.orderDate}"/></td>
						<td>${order.no}</td>
						<td>${order.preview}
						<c:choose>
							<c:when test="${order.productQuantity gt 1}">
							 외 ${order.productQuantity-1}건
							</c:when>
						</c:choose>
						</td>
						<td><fmt:formatNumber pattern="#,###" value="${order.totalAmount}"/>원</td>
						<td>${order.stateName}</td>
						
						<td>
						<c:choose>
							<c:when test="${order.stateName eq '대기'}">
							<input type="button" value="취소">
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
			
		</div>
	
		
		
	</div>
	
	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>

</body>
</html>