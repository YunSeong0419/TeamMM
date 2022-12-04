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

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			<!--여기서 작성 -->
				<form id="searchOption" method="get">
				<div id="searchOptionContainer">
					<span>
						<strong>정렬</strong>
						<select id="stateCodeSel" class="inputBox" name="stateCode" onchange="stateSelectFnc();">
							<option value='STOCK ASC'>총액 ↑</option>
							<option value='STOCK DESC'>총액 ↓</option>
							<option value='NAME ASC'>날짜 ↑</option>
							<option value='NAME DESC'>날짜 ↓</option>
							<option value='PRICE ASC'>품명 ↑</option>
							<option value='PRICE DESC'>품명 ↓</option>
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
						<select>
							<option value="">회원</option>
							<option value="">밀키트</option>
						</select>
						<strong>회원 검색</strong>
						<input type="text" name="search" id="search" class="inputBox" value="${searchOption.search}">
						<input type="submit" value="검색">
					</span>
				</div>
			</form>
			
			<div>
			
			<table>
				<tr>
					<th>회 원</th>
					<th>날 짜</th>
					<th>물 품</th>
					<th>개 수</th>
					<th>가 격</th>
					<th>합 계</th>
				</tr>
				<c:forEach items="${salesList}" var="sales">
				<tr>
					<td>${sales.memberId}</td>
					<td>${sales.orderDate}</td>
					<td>${sales.productName}</td>
					<td>${sales.quantity}</td>
					<td>${sales.price}</td>
					<td>${sales.quantity * sales.price}</td>
				</tr>
				</c:forEach>
			</table>
			
			
			</div>
			
			
				
				
				
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>