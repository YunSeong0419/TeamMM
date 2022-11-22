<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">
.orderList{
	border: 2px solid #FF5E00;
}
</style>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			<!--여기서 작성 -->
			
			
			<form method="get">
				<div>
				기간 선택
				<input type="date" name="beginDate" value="<fmt:formatDate value="${searchOption.beginDate}" pattern="yyyy-MM-dd"/>"> ~ 
				<input type="date" name="endDate" max="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>"
				 value="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>">
				</div>
				<div>
				상태
				<select name="stateCode">
					<option value="0">전체</option>
					<c:forEach items="${stateList}" var="state">
					<option value="${state.CODE}">${state.NAME}</option>
					</c:forEach>
				</select>
				회원 검색<input type="text" name="search"><input type="submit" value="검색">
				</div>
			</form>
			
			<div>
				<c:choose>
				<c:when test="${!empty orderList}">
				<c:forEach items="${orderList}" var="order">
				<div class="orderList">
					<div>
						<span>주문번호</span>
						<span>${order.no}</span>
					</div>
					<div>
						<span>회원</span>
						<span>${order.memberId}</span>
					</div>
					<div>
						<span>품목</span>
						<span>${order.preview}
						<c:if test="${order.productQuantity ne 1}"> 외 ${order.productQuantity-1}개</c:if>
						</span>
					</div>
					<div>
						<span>상태</span>
						<span>${order.stateName}</span>
					</div>
					<div>
						<span>날짜</span>
						<span> <fmt:formatDate value="${order.orderDate}"/></span>
					</div>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					주문목록을 조회할 수 없습니다
				</c:otherwise>
				</c:choose>
			</div>
		
			<jsp:include page="/WEB-INF/views/Paging.jsp"/>
			
			<form id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${curPage}">
			</form>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>