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

#searchOptionForm{
	width: 900px;	
	margin: 0 auto;
}

#sort{
	width: 65px;
}

#searchContainer{
	float:right;
}

#searchOption{
	width: 65px;
}

#search{
	width: 150px;
}

#period{
	display: inline-block;
}

#presetPeriod{
}

#customPeriod{
	width: 500px;
	font-weight: bold;
}

#periodSelect{
	margin-left: 20px;
}

.month{
	display: inline-block;
	width: 30px;
	height: 30px;
	line-height: 30px;
	background-color: #FF9436;
	border-radius: 5px;
	font-weight: bold;
	text-align: center;
	font-size: 11px;
	color: #fff;
	cursor: pointer;
}

.month:hover{
	background-color: #FF8224;
}

#stateCodeSel{
	width: 60px;
}

#beginDate, #endDate{
	width: 100px;
}

#beginDateContainer, #endDateContainer{
	display: inline-block;
	margin-left: 10px;
}

.inputBox{
	line-height: 35px;
	height: 35px;
	border: 1px solid black;
	border-radius: 5px;
}

#salesTotalAmountContainer{
	width: 900px;
	margin: 20px auto;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
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
	width: 50px;
}
#priceTh {
	width: 100px;
}
#totalAmountTh {
	width: 120px;
}

.orderDateTd{
	text-align: center;
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
	
	// 정렬 셀렉박스 설정
	if($('#sortVal').val()){
		$('#sort').val($('#sortVal').val());
	}
	
	// 검색옵션 셀렉박스 설정
	if($('#searchOptionVal').val()){
		$('#searchOption').val($('#searchOptionVal').val());
	}
	
	// 년도선택 셀렉박스 설정
	$('#yearSel').val($('#yearSelVal').val());
	
	// 선택한 년도에 맞춰서 화면변경
	yearSelFnc();
	
	let month = Number($('#endDate').val().substr(5,2));
	
	// 선택한 월의 버튼배경색 변경
	$('.month').eq(month-1).css('background-color', '#FF8224');
	
	// 
	if($('#yearSel').val() != 'custom'){
		
		let year = $('#yearSel').val();
		
		if(!year){
			year = new Date().getFullYear();
		}
		
		let html = year + '년 ' + $('.month').eq(month-1).text();
		
		$('#periodText').html(html);
	}else{
		$('#periodText').html($('#beginDate').val() + ' ~ ' + $('#endDate').val());
	}
	
	let salesTotalAmount = 0;
	
	$('.totalAmount').each(function() {
		salesTotalAmount += Number($(this).val());
	});
	
	
	
	$('#salesTotalAmount').html(korTrans(salesTotalAmount));
	
// 	 여기부터 이벤트리스너
	
	// 정렬 서브밋
	$('#sort').change(function() {
		searchOptionForm.submit();
	});
	
	// 시작날짜 서브밋
	$('#beginDate').change(function() {
		searchOptionForm.submit();
	});
	
	// 종료날짜 서브밋
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
		
		$('#searchOptionForm').submit();
	
	});

});

function korTrans(price){
	
	return price.toLocaleString('ko-KR') + ' 원';
}

// 월을 선택하면 서브밋 하는 함수
function selectMonthFnc(month){
	
	let year = $('#yearSel').val();
	
	if(!year){
		year = new Date().getFullYear();
	}
	
	let beginDate = new Date(year, month-1, 1);
	let endDate = new Date(year, month, 0);
	
	$('#beginDate').val(dateTrans(beginDate));
	
	$('#endDate').attr('max', dateTrans(endDate));
	$('#endDate').val(dateTrans(endDate));
	
	$('#searchOptionForm').submit();
}

// 월과 일이 10보다 작으면 앞에 0을 붙여주는 함수
function dateTrans(date){
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	
	if(month < 10){
		month = '0' + month;
	}
	
	if(day < 10){
		day = '0' + day;
	}
	
	return year + '-' + month + '-' + day;
}

// 선택한 연도에 따라서 화면변경
function yearSelFnc(){
	
	if($('#yearSel').val() != 'custom'){
		$('#customPeriod').css('display', 'none');
		$('#presetPeriod').css('display', 'inline-block');
	}else{
		$('#presetPeriod').css('display', 'none');
		$('#customPeriod').css('display', 'inline-block');
		
		$('#endDate').attr('max', dateTrans(new Date()));
		
		if(new Date($('#endDate').val()) > new Date()){
			$('#endDate').val(dateTrans(new Date()));
		}
	}
	
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
			<!--여기서 작성 -->
			<form id="searchOptionForm" method="post">
				<div id="searchOptionContainer">
					<select id="sort" class="inputBox" name="sort">
						<option value="ORDER_DATE DESC">날짜 ↑</option>
						<option value="ORDER_DATE ASC">날짜 ↓</option>
						<option value="TOTAL_AMOUNT ASC">총액 ↑</option>
						<option value="TOTAL_AMOUNT DESC">총액 ↓</option>
						<option value="PRODUCT_NAME ASC">품명 ↑</option>
						<option value="PRODUCT_NAME DESC">품명 ↓</option>
					</select>
					<div id="period">
						<input type="hidden" id="yearSelVal" value="${yearSel}">
						<select id="yearSel" class="inputBox" name="yearSel" onchange="yearSelFnc();">
							<option value="custom">직접 선택</option>
							<option value="">${today.year}년</option>
							<c:forEach var="i" begin="1" end="${today.year - 2020}">
							
							<option value="${today.year - i}">${today.year - i}년</option>
							
							</c:forEach>
						</select>
					
						<div id="presetPeriod" style="display: none">
							<c:forEach var="month" begin="1" end="12">
						
							<span class="month" onclick="selectMonthFnc(${month})">${month}월</span>
							
							</c:forEach>
						</div>
						
						<div id="customPeriod" style="display: none">
							<div id="beginDateContainer">
								<span>시작일</span>
								<input type="date" name="beginDate" id="beginDate" class="inputBox"
									max="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>"
									value="<fmt:formatDate value="${searchOption.beginDate}" pattern="yyyy-MM-dd"/>">
							</div>
							<div id="endDateContainer">
							 	<span>종료일</span>
								<input type="date" name="endDate" id="endDate" class="inputBox"
									value="<fmt:formatDate value="${searchOption.endDate}" pattern="yyyy-MM-dd"/>">
							</div>
						</div>
						
					</div>
					<div id="searchContainer">
						<select id="searchOption" class="inputBox" name="searchOption">
							<option value="">전체</option>
							<option value="MEMBER_ID">회원</option>
							<option value="NAME">밀키트</option>
						</select>
						<input type="text" name="search" id="search" class="inputBox"
							 value="${searchOption.search}" placeholder="검색어 입력">
						<input type="submit" value="검색">
						
						<input id="searchOptionVal" type="hidden" value="${searchOption.searchOption}">
						<input id="sortVal" type="hidden" value="${searchOption.sort}">
					</div>
				</div>
			</form>
			
			<div id="salesTotalAmountContainer">
				<span id="periodText"></span>
				매출 총 액 <span id="salesTotalAmount"></span>
			</div>
			
			<div id="salesListContainer">
				<table id="salesTable">
					<tr id="firstRow">
						<th id="orderDateTh">주문일자</th>
						<th id="memberIdTh">회원아이디</th>
						<th id="productTh">상품명</th>
						<th id="quantityTh">수 량</th>
						<th id="priceTh">가 격</th>
						<th id="totalAmountTh">금 액</th>
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
								<input class="totalAmount" type="hidden" value="${sales.quantity * sales.price}">
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