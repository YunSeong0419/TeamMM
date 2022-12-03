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

table{
	border-collapse: collapse;
}

#orderList{
	margin-top: 10px;
	min-height: 400px;
}

#orderListTable{
	margin: auto;
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
#orderMemberIdTh{
	width: 150px;
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

.orderDateTd, .orderStateTd, .btnTd, .orderMemberIdTd{
	text-align: center;
}

.orderNoTd, .totalAmountTd{
	text-align: right;
}



td{
	height: 30px;
	border-bottom: 1px solid gray;
	padding: 0px 10px;
}

#detailLink{
	color: black;
	text-decoration: none;
}

#searchOption{
	margin: 5px 50px;
}

#periodSelect{
	margin-left: 20px;
}

#searchKeword{
	float: right;
}

#stateCodeSel{
	width: 60px;
}

#search{
	width: 150px;
}

#beginDate, #endDate{
	width: 100px;
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
	
	// 상태를 저장하는 함수
	$('#stateCodeSel').val($('#stateCode').val());
	
	$('#endDate').change(function() {
		
		var beginDateObj = $('#beginDate');
		var endDateObj = $('#endDate');
		
		var beginDate = new Date(beginDateObj.val());
		var endDate = new Date(endDateObj.val());
		
		var period = endDate.getTime() - beginDate.getTime();
		
		//시작날짜가 끝나는 날짜보다 커지지 못하게 max설정
		beginDateObj.attr('max', $('#endDate').val());
		
		//끝나는 날짜가 시작날짜보다 적어질 경우 시작날짜를 끝나는 날짜를 한달 전으로 만듬
		if(period < 0){
				
			var year = endDate.getFullYear();
			var month = endDate.getMonth();
			var date = endDate.getDate();
				
			var lastDate = new Date(year, month, 0).getDate();
			
			if(date > lastDate){ // 한달전의 말일이 작으면 말일로 맞춰줌
				date = lastDate;
			}
			
			if(month == 0){ // 1월일때 년도를 1년 줄임
				year = year - 1;
				month = 12;
			}
			
			if(month < 10){ // 10보다 작을경우 0을 넣어줌 ex) 4 > 04
				month = '0' + month;
			}
			if(date < 10){
				date = '0' + date;
			}
			
			var beginDateStr = year + '-' + month + '-' + date;
			beginDateObj.val(beginDateStr);
			
		}
		
		stateSelectFnc();
		
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
				<div id="searchOptionContainer">
					<span>
						<strong>상태</strong>
						<select id="stateCodeSel" class="inputBox" name="stateCode" onchange="stateSelectFnc();">
							<option value="0">전체</option>
							<c:forEach items="${stateList}" var="state">
							<option value="${state.CODE}">${state.NAME}</option>
							</c:forEach>
						</select>
					</span>
					<span id="periodSelect">
						<strong>기간 선택</strong>
						<input type="date" name="beginDate" id="beginDate" class="inputBox" onchange="stateSelectFnc();"
							max="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>"
							value="<fmt:formatDate value="${searchOption.beginDate}" pattern="yyyy-MM-dd"/>">
						 ~ 
						<input type="date" name="endDate" id="endDate" class="inputBox"	max="${today}"
							value="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>">
					</span>
					<span id="searchKeword">
						<strong>회원 검색</strong>
						<input type="text" name="search" id="search" class="inputBox" value="${searchOption.search}">
						<input type="submit" value="검색">
					</span>
				</div>
			</form>
			
			
			<div id="orderList">
				<table id="orderListTable">
					<tr id="firstRow">
						<th id="orderDateTh">주문일자</th>
						<th id="orderNoTh">주문번호</th>
						<th id="orderMemberIdTh">회원아이디</th>
						<th id="productNameTh">상품명</th>
						<th id="totalAmountTh">결제금액</th>
						<th id="orderStateTh">상태</th>
					</tr>
					
					<c:choose>
					<c:when test="true">
					<c:forEach items="${orderList}" var="order">
					<tr>
						<td class="orderDateTd"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
						<td class="orderNoTd">${order.no}</td>
						<td class="orderMemberIdTd">${order.memberId}</td>
						<td class="productNameTd"><a id="detailLink" href="../order/detail.do?orderNo=${order.no}">
							${order.preview}
							<c:choose>
								<c:when test="${order.productQuantity gt 1}">
								 외 ${order.productQuantity-1}건
								</c:when>
							</c:choose>
							</a>
						</td>
						<td class="totalAmountTd"><fmt:formatNumber pattern="#,###" value="${order.totalAmount}"/>원</td>
						<td class="orderStateTd">${order.stateName}</td>
						
					</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<tr><td colspan="5">
					<c:choose>
						<c:when test="${searchOption.search ne ''}">
							${searchOption.search}님의 주문목록이 존재하지 않습니다
						</c:when>
						<c:otherwise>
							주문목록을 조회할 수 없습니다
						</c:otherwise>
					</c:choose>
					</td></tr>
					</c:otherwise>
					</c:choose>
					
				</table>
				
			</div>
			
		
			<jsp:include page="/WEB-INF/views/Paging.jsp"/>
			
			<form id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
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