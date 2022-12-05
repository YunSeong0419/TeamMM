<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

#searchOptionContainer{
	width: 950px;	
	margin: 0 auto;
}

#searchOption{
}

#periodSelect{
	margin-left: 20px;
}

#searchKeword{
	float:right;
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

#salesListContainer{
	margin-top: 10px;
}


#salesTable{
	border-collapse: collapse;
	margin: auto;
}

#salesTable td{
	border-bottom: 2px solid #FF9436;
}

#firstRow{
	background-color: #FF9436;
	color: #fff;
}
#orderDateTh {
	height: 30px;
	width: 200px;
}
#memberIdTh{
	width: 150px;
}
#productTh {
	width: 280px;
}
#quantityTh {
	width: 80px;
}
#priceTh {
	width: 120px;
}
#totalAmount {
	width: 120px;
}

.orderDateTd{
	height: 35px;
}
.memberIdTd{
	text-align: center;
}
.productTd{
	text-align: left;
}
.quantityTd{
	text-align: right;
}
.priceTd{
	text-align: right;
}
.totalAmountTd{
	text-align: right;
}

#emptySales{
	text-align: center;
	height: 350px;
	line-height: 350px;
	font-size: 25px;
	font-weight: bold;
}



</style>

<script type="text/javascript">
$(function(){
	
	if($('#sortVal').val()){
		$('#sort').val($('#sortVal').val());
	}
	
	if($('#searchOptionVal').val()){
		$('#searchOption').val($('#searchOptionVal').val());
	}
	
	$('#sort').change(function() {
		searchOptionForm.submit();
	});
	
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
</script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			<!--여기서 작성 -->
				<form id="searchOptionForm" method="get">
				<div id="searchOptionContainer">
					<span>
						<select id="sort" class="inputBox" name="sort">
							<option value="ORDER_DATE DESC">날짜 ↑</option>
							<option value="ORDER_DATE ASC">날짜 ↓</option>
							<option value="TOTAL_AMOUNT ASC">총액 ↑</option>
							<option value="TOTAL_AMOUNT DESC">총액 ↓</option>
							<option value="PRODUCT_NAME ASC">품명 ↑</option>
							<option value="PRODUCT_NAME DESC">품명 ↓</option>
						</select>
					</span>
					<span id="periodSelect">
						<strong>기간</strong>
						<input type="date" name="beginDate" id="beginDate" class="inputBox"
							 onchange="stateSelectFnc();"
							max="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>"
							value="<fmt:formatDate value="${searchOption.beginDate}" pattern="yyyy-MM-dd"/>">
						 ~ 
						<input type="date" name="endDate" id="endDate" class="inputBox"	max="${today}"
							value="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>">
					</span>
					<span id="searchKeword">
						<select id="searchOption" class="inputBox" name="searchOption">
							<option value="">전체</option>
							<option value="MEMBER_ID">회원</option>
							<option value="PRODUCT_NAME">밀키트</option>
						</select>
						<input type="text" name="search" id="search" class="inputBox"
							 value="${searchOption.search}" placeholder="검색어 입력">
						<input type="submit" value="검색">
						
						<input id="searchOptionVal" type="hidden" value="${searchOption.searchOption}">
						<input id="sortVal" type="hidden" value="${searchOption.sort}">
					</span>
				</div>
			</form>
			
			<c:forEach begin="1" end="12" var="i">
			<span id="month${i}">
				${i}월
			</span>
			</c:forEach>
			
			<div>
				총 합계
			</div>
			
			<div id="salesListContainer">
				<table id="salesTable">
					<tr id="firstRow">
						<th id="orderDateTh">주문일자</th>
						<th id="memberIdTh">회원아이디</th>
						<th id="productTh">상품명</th>
						<th id="quantityTh">수 량</th>
						<th id="priceTh">가 격</th>
						<th id="totalAmount">금 액</th>
					</tr>
					<c:choose>
					<c:when test="${!empty salesList}">
						<c:forEach items="${salesList}" var="sales">
						<tr>
							<td class="orderDateTd"><fmt:formatDate value="${sales.orderDate}"
								pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td class="memberIdTd">${sales.memberId}</td>
							<td class="productTd">${sales.productName}</td>
							<td class="quantityTd">
								${sales.quantity}
							</td>
							<td class="priceTd">
								<fmt:formatNumber value="${sales.price}" pattern="#,### 원"/>
								<input type="hidden" value="${sales.price}">
							</td>
							<td class="totalAmountTd">
								<fmt:formatNumber value="${sales.quantity * sales.price}"
									 pattern="#,### 원"/>
								<input type="hidden" value="${sales.quantity * sales.price}">
							</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<tr>
						<td id="emptySales" colspan="6">
							<span>매출 기록이 없습니다</span>
						</td>
					</tr>
					</c:otherwise>
					</c:choose>
				</table>
			</div>
			
			
				
				
				
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>