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
	border: 1px solid black;
	border-collapse: collapse;
	width: 900px;
	height: 350px;
}

th, td {
	height: 31px;
}

th {
	border: 1px solid black;
	background: #EAEAEA;
	font-size: 14px;
	color: #373737;
}

td {
	border: 1px solid black;
	text-align: center;
	font-size: 14px;
}

#stateSelect {
	width: 100px;
	height: 40px;
	border-radius: 6px;
	margin: 0px 0px 10px 74px;
}

#tableId {
	margin: auto;
}

#numTh {
	width: 30px;
}

;
#categoryNameTh {
	width: 134px;
}

;
#titleTh {
	width: 583px;
}

;
#createTh {
	width: 101px;
}

;
#hitTh {
	width: 52px;
}

;
#formDiv {
	float: left;
	margin-left: 10px;
}

#backBtn {
	margin: 35px 500px;
}

#writeBtn {
	float: right;
	margin-right: 70px;
}
</style>

<link rel="stylesheet" type="text/css"
	href="/babiyo/resources/css/common.css" />
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
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
					<form id="stateForm" action="get">
						<span>분류</span> <select id="stateSelect" name="stateCode"
							onchange="stateSelectFnc();">
							<option value="0">전체</option>
							<option>진행중인 이벤트</option>
							<option>끝난 이벤트</option>
							<option>공지</option>
						</select>
					</form>
				</div>
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
										<td>${noticeDto.categoryName}</td>
										<td><a href="./detail.do?no=${noticeDto.no}">${noticeDto.title}</a></td>
										<td><fmt:formatDate pattern="yyyy년MM월dd일 "
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
					<div id="backBtn">
						<input type="button" value="뒤로가기" onclick="backBtn()">
					</div>
					<div id="writeBtn">
						<input type="button" value="공지작성" onclick="writeBtn()">
					</div>
				</c:if>

				<jsp:include page="/WEB-INF/views/Paging.jsp" />

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