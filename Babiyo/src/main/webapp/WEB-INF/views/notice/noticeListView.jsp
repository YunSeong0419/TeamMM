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

th {
    background-color: #FF9436;
    color: #fff;
    height: 30px;
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

p{
	margin-top: 30px;
}
span{
	font-weight: bold;
	margin-right: 20px;
}

#filterDiv{
	margin: auto;
	width: 970px;
}

#stateForm{
	float: left;
	margin-left: 45px;
}

#stateSelect{
	width: 100px;
	height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 10px;
}

 #searchSelect{
	width: 100px;
	height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 40px;
}

#searchFrom{
	margin-left: 540px;
}

.searchCl{
	width: 150px;
	height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 10px;
}

#searchId{
	float: right;
}

#divisionId{
	margin-left: 10px;
}

#noticeList{
	margin-top: 10px;
	min-height: 400px;
}

#noticeListTable{
	margin: auto;
}

#firstRow{
	background-color: #E0E0E0;
}

#noticeNoTh {
	width: 50px;
}

#noticeCategoryTh {
	width: 153px;
}

#titleTh {
	width: 503px;
}

#createTh {
	width: 161px;
}

#hitTh{
	width: 100px;
}

.noticeCategoryTd, .hitTd, .createTd{
	text-align: center;
}

#searchBoxBtn {
    margin-left: 5px;
    padding-bottom: 3px;
    width: 60px;
    height: 35px;
    border: 0px;
    border-radius: 5px;
    color: #fff;
    background-color: #FF9436;
    font-size: 16px;
}

</style>

<link rel="stylesheet" type="text/css"
	href="/babiyo/resources/css/common.css" />
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#stateSelect').val($('#stateCode').val());
	$('#searchSelect').val($('#searchOption').val());
	$('.searchCl').val($('#hiddenSearch').val());
	
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

			<%-- <jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" /> --%>

			<!-- <div id="middleMainDiv"> -->
				<div id="centerTitle"></div>
				<div id="boxDiv">
				<!--여기서 작성 -->
				<div id="filterDiv">
					<!--  filterDiv 시작-->
					<form id="stateForm" action=./list.do method="post">
						<span>분류</span> 
							<select id="stateSelect" name="stateCode"
								onchange="stateSelectFnc();">
								<option value="0">전체</option>
								<option value="1">공지</option>
								<option value="2">진행중인 이벤트</option>
								<option value="3">끝난 이벤트</option>
							</select>
					</form>
				
					<form action="./list.do" method="post" id="searchFrom">
					<select name="searchOption" id="searchSelect">
						<option value="">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input id="hiddenSearch" type="hidden" value="${searchOption.search}">
					<input class="searchCl" type="text" name="search">
					<input id="searchBoxBtn" type="submit" value="검색">
					</form>
				</div>
						<!-- filterDiv 끝-->

				<div id="noticeList">
					<!-- table div 시작 -->
					<table id="noticeListTable">
						<tr id="firstRow">
							<th id="noticeNoTh">번호</th>
							<th id="noticeCategoryNameTh">분류</th>
							<th id="titleTh">공지제목</th>
							<th id="createTh">날짜</th>
							<th id="hitTh">조회수</th>
						</tr>

						<c:choose>
							<c:when test="${empty noticeList}">
								<tr>
									<td colspan="5"
										style="width: 858px; height: 350px; font-weight: bold; text-align: center;">
										공지가 존재하지 않습니다</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="noticeDto" items="${noticeList}">
									<tr>
										<td>${noticeDto.no}</td>
										
										<c:choose>
											<c:when test="${noticeDto.categoryCode eq 1}">
 												<td class="noticeCategoryTd">공지</td> 
											</c:when>
											<c:otherwise>
												<td class="noticeCategoryTd">이벤트</td> 
											</c:otherwise>
										</c:choose>
										<td><a href="./detail.do?no=${noticeDto.no}">${noticeDto.title}</a></td>
										<td class="createTd"><fmt:formatDate pattern="yyyy-MM-dd "
												value="${noticeDto.createDate}" /></td>
										<td class="hitTd">${noticeDto.hit}</td>		
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<!--table div끝 -->
				<jsp:include page="/WEB-INF/views/Paging.jsp" />
				
			<form id="pagingForm" method="post">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" id="stateCode" name="stateCode" value="${searchOption.stateCode}">
				<input type="hidden" id="searchOption" name="searchOption" value="${searchOption.searchOption}">
				<input type="hidden" name="search" value="${searchOption.search}">
			</form>
		</div>
				<div id="underPadding"></div>
				<!--underPadding-->

		</div>
		<!--middleDiv 끝 -->

		<jsp:include page="/WEB-INF/views/Footer.jsp" />

	</div>
	<!--rootDiv 끝 -->

</body>
</html>