<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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

$(document).ready(function(){
	
	console.log($('#searchMapId').val());
	
	$('#searchId').val($('#searchMapId').val());
	
});
	$(function() {

		$('#stateSelect').val($('#stateCode').val());

	});

	function stateSelectFnc() {

		$('#stateForm').submit();

	}
	function backBtn() {

		location.href = "#"
	}

	function writeBtn() {

		location.href = "./write.do"
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
				<div id="searchOption">
					<!-- searchOption div 시작-->
					<form id="stateForm" action=./list.do method="get">
						<span>분류</span> <select id="stateSelect" name="stateCode"
							onchange="stateSelectFnc();">
							<option value="0">전체</option>
							<option value="1">공지</option>
							<option value="2">진행중인 이벤트</option>
							<option value="3">끝난 이벤트</option>
						</select>
					</form>
				</div>
				
				<form action="./list.do" method="get">
			<input type="hidden" id="searchMapId" value="${searchMap.search}"> 
			<select name="searchOption" id="searchId">
				<c:choose>
					<c:when test="${searchMap.search =='all'}">
						<option value="all" selected>전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</c:when>
						<c:when test="${searchMap.search =='title'}">
						<option value="all">전체</option>
						<option value="title" selected="selected">제목</option>
						<option value="content">내용</option>
					</c:when>
						<c:when test="${searchMap.search =='content'}">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content" selected="selected">내용</option>
					</c:when>
				</c:choose> 
				</select>
	
		
		<input type="text" name="search" value="${searchMap.search}">
			
		<input type="submit" value="검색">
	
	</form>
				<!-- searchOption div 끝-->

				<div>
					<!-- table div 시작 -->
					<table id="tableId">
						<tr>
							<th id="numTh">번호</th>
							<th id="categoryNameTh">분류</th>
							<th id="titleTh">제목</th>
							<th id="createTh">날짜</th>
							<th id="hitTh">조회수</th>
						</tr>

						<c:choose>
							<c:when test="${empty noticeList}">
								<tr>
									<td colspan="5"
										style="width: 900px; height: 350px; font-weight: bold; text-align: center;">
										공지가 존재하지 않습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="noticeDto" items="${noticeList}">
									<tr>
										<td>${noticeDto.no}</td>
										
										<c:choose>
											<c:when test="${noticeDto.categoryCode eq 1}">
 												<td> 공지</td> 
											</c:when>
											<c:otherwise>
												<td>이벤트</td> 
											</c:otherwise>
										</c:choose>
										<td><a href="./detail.do?no=${noticeDto.no}">${noticeDto.title}</a></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd "
												value="${noticeDto.createDate}" /></td>
										<td>${noticeDto.hit}</td>		
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<!--table div끝 -->
				<c:if test="${_memberDto_.grade eq 1}">
					<div id="inputBtn">
						<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn()">
						<input class="writeBtn" type="button" value="공지작성" onclick="writeBtn()">
					</div>
				</c:if>

				<jsp:include page="/WEB-INF/views/Paging.jsp" />
				
			<form id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" id="stateCode" name="stateCode" value="${searchOption.stateCode}">
				<input type="hidden" name="search" value="${searchOption.search}">
				<input type="hidden" name="searchOption" value="${searchOption.searchOption}">
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