<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의</title>

<style type="text/css">
table {
	border-collapse: collapse;
}

td{
	height: 30px;
	border-bottom: 1px solid gray;
	padding: 0px 10px;
}

a{
	text-decoration: none;
	color: black;
}

span{
	font-weight: bold;
	margin-right: 20px;
}

#filterDiv{
	margin: auto;
	width: 920px;
}

#divisionId{
	margin-left: 10px;
}

#YesNo{
	line-height: 35px;
}

 #YesNo,#answerSelect{
 float: right;
} 
 
#answerSelect{
	margin-right: 80px;
} 

#categorySelect, #answerSelect{
	width: 100px;
	height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 10px;
}

#inquiryList{
	margin-top: 5px;
	min-height: 400px;
}

#inquiryListTable{
	margin: auto;
}

#firstRow{
	background-color: #E0E0E0;
}

#inquiryNoTh {
	width: 50px;
}

#inquiryCategoryTh {
	width: 134px;
}

#titleTh {
	width: 503px;
}

#createTh {
	width: 161px;
}

#answerTh {
	width: 52px;
}

.inquiryCategoryTd, .answerTd{
	text-align: center;
}

#inputBtn{
	width: 920px;
	height:20px; 
	margin: 0px 0px 50px 50px;
}

.backBtn {
	margin-left: 410px;
}

.writeBtn {
	float: right;
}

.backBtn, .writeBtn{
	border-radius: 3px;
	border-color: #E0E0E0;
	height: 25px;
	background-color: #E0E0E0;
	cursor: pointer;
}
</style>

<link rel="stylesheet" type="text/css"
	href="/babiyo/resources/css/common.css" />
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
$(function() {

	$('#answerSelect').val($('#answerState').val());
	$('#categorySelect').val($('#categoryCode').val());
	});

function categorySelectFnc() {

	$('#filterForm').submit();

	}

function answerSelectFnc() {

	$('#filterForm').submit();

	}
function backBtn() {

	location.href = "#"
	}
function writeBtn() {

	location.href = "./member/write.do"
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
				<div id="filterDiv">
					<!-- searchOption div 시작-->
					<form id="filterForm" action="./member.do" method="get">
						<span id="divisionId">분류</span>
						<select id="categorySelect" name="categoryCode"
							onchange="categorySelectFnc();">
						<option value="0">전체</option>
						<c:forEach items="${categoryCodeList}" var="category">
							<option value="${category.CODE}">${category.NAME}</option>
						</c:forEach>
						</select>
						
						<select id="answerSelect" name="answerState"
							onchange="answerSelectFnc();">
							<option value="0">전체</option>
							<option value="1">완료된 답변</option>
							<option value="2">대기중 답변</option>
						</select>
						<span id="YesNo">답변여부</span> 						
					</form>
				</div>

				<div id="inquiryList">
					<!-- table div 시작 -->
					<table id="inquiryListTable">
						<tr id="firstRow">
							<th id="inquiryNoTh">번호</th>
							<th id="inquiryCategoryTh">분류</th>
							<th id="titleTh">문의제목</th>
							<th id="createTh">작성일</th>
							<th id="answerTh">답변</th>
						</tr>
						
						<c:choose>
							<c:when test="${empty memberList}">
								<tr>
									<td colspan="5"
										style="width: 900px; height: 350px; font-weight: bold; text-align: center;">
										문의가 존재하지 않습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="inquiryDto" items="${memberList}">
									<tr>
										<td>${inquiryDto.no}</td>
										<c:choose>
											<c:when test="${inquiryDto.categoryCode eq 1}">
 												<td class="inquiryCategoryTd">주문</td> 
											</c:when>
											<c:when test="${inquiryDto.categoryCode eq 2}">
												<td class="inquiryCategoryTd">밀키트</td> 
											</c:when>
											<c:when test="${inquiryDto.categoryCode eq 3}">
 												<td class="inquiryCategoryTd">회원</td> 
											</c:when>
											<c:otherwise>
												<td class="inquiryCategoryTd">기타</td> 
											</c:otherwise>
										</c:choose> 
										<td><a href="./member/detail.do?no=${inquiryDto.no}">${inquiryDto.title}</a></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm "
												value="${inquiryDto.createDate}" /></td>
										<c:choose>
											<c:when test="${empty inquiryDto.answer}">
												<td class="answerTd">N</td>
											</c:when>
											<c:otherwise>
												<td class="answerTd">Y</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<!--table div끝 -->

				<div id="inputBtn">
					<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn()">
					<input class="writeBtn" type="button" value="문의작성" onclick="writeBtn()">
				</div>

				<jsp:include page="/WEB-INF/views/Paging.jsp" />
				
			<form id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" id="answerState" name="answerState" value="${searchMap.answerState}">
				<input type="hidden" id="categoryCode" name="categoryCode" value="${searchMap.categoryCode}">
				<input type="hidden" id="memberId" name="memberId" value="${searchMap.memberId}">
			</form>

				<div id="underPadding"></div>
				<!--underPadding-->

			</div>
			<!--middelMain 끝 -->

		</div>
		<!--middleDiv 끝 -->

		<jsp:include page="/WEB-INF/views/Footer.jsp" />

	</div>
	<!--rootDiv 끝 -->

</body>
</html>