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

<script type="text/javascript">
$(function(){
	
	// 상태를 저장하는 함수
	$('#stateCodeSel').val($('#stateCode').val());
	
	$('#endDate').change(function() {
		
		var beginDateObj = $('#beginDate');
		var endDateObj = $('#endDate');
		
		var beginDate = new Date(beginDateObj.val());
		var endDate = new Date(endDateObj.val());
		
		var date = endDate.getTime() - beginDate.getTime();
		
		//시작날짜가 끝나는 날짜보다 커지지 못하게 max설정
		beginDateObj.attr('max', $('#endDate').val());
		
		//끝나는 날짜가 시작날짜보다 적어질 경우 시작날짜를 끝나는 날짜를 한달 전으로 만듬
		if(date < 0){
			
			var str = endDate.getFullYear() + '-';
			
			if(endDate.getMonth() - 1 < 10){
				str += '0' + (endDate.getMonth() - 1) + '-';
			}else {
				str += endDate.getMonth() - 1 + '-';
			} 
			
			if(endDate.getDate() < 10){
				str += '0' + endDate.getDate();
			}else {
				str += endDate.getDate();
			}
			
			beginDateObj.val(str);
		}
		
	});
	
	$('.stateColor').each(function(i, element) {
		
		var state = $(this).text();
		
		if(state == '완료'){
			$(this).css("color", "green");
		}else if(state == '대기'){
			$(this).css("color", "blue");
		}else if(state == '취소'){
			$(this).css("color", "red");
		}
		
	});
	
	
});

function stateSelectFnc(){
	$('#searchOption').submit();
}
</script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			
			<form id="searchOption" method="get">
				<div>
					기간 선택
					<input type="date" name="beginDate" id="beginDate" max="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>"
						value="<fmt:formatDate value="${searchOption.beginDate}" pattern="yyyy-MM-dd"/>"> ~ 
					<input type="date" name="endDate" id="endDate" max="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>"
						value="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>">
				</div>
				<div>
				상태
				<select id="stateCodeSel" name="stateCode" onchange="stateSelectFnc();">
					<option value="0">전체</option>
					<c:forEach items="${stateList}" var="state">
					<option value="${state.CODE}">${state.NAME}</option>
					</c:forEach>
				</select>
				회원 검색<input type="text" name="search" value="${searchOption.search}"><input type="submit" value="검색">
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
						<span><a href="../order/detail.do?orderNo=${order.no}">${order.preview}
						<c:if test="${order.productQuantity ne 1}"> 외 ${order.productQuantity-1}개</c:if>
						</a>
						</span>
					</div>
					<div>
						<span>상태</span>
						<span class="stateColor">${order.stateName}</span>
					</div>
					<div>
						<span>날짜</span>
						<span> <fmt:formatDate value="${order.orderDate}"/></span>
					</div>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					
					<c:choose>
						<c:when test="${searchOption.search ne ''}">
							${searchOption.search}님의 주문목록이 존재하지 않습니다
						</c:when>
						
						<c:otherwise>
							주문목록을 조회할 수 없습니다
						</c:otherwise>
					</c:choose>
				
				</c:otherwise>
				</c:choose>
			</div>
		
			<jsp:include page="/WEB-INF/views/Paging.jsp"/>
			
			<form id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${curPage}">
				<input type="hidden" name="beginDate"
					 value="<fmt:formatDate value="${searchOption.beginDate}" pattern="yyyy-MM-dd"/>">
				<input type="hidden" name="endDate"
					 value="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>">
				<input type="hidden" id="stateCode" name="stateCode" value="${searchOption.stateCode}">
				<input type="hidden" name="search" value="${searchOption.search}">
			</form>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>