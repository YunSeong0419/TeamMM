<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세</title>	
	
<style type="text/css">
input{
	border-radius: 5px;
}

#boxDiv{
	margin-left: 50px;
}

span{
	font-weight: bold;
	margin-right: 10px;
}

#divisionId{
	margin-left: 13px;
	width: 100px;
	height: 35px;
	border-radius: 5px;
}

#daySpan{
	margin-left: 27px; 
}

#eventStartDateId, #eventEndDateId{
	margin-left: 4px;
	width: 150px;
	height: 35px;
	border-radius: 5px;
}

#SecondDiv{
	margin-top: 10px;
}

#createDateId{
	width: 100px;
	height: 35px;
	border-radius: 5px;
}

#lookSpan{
	margin-left: 10px;
}

#hitId{
	margin-left: 4px;
	width: 100px;
	height: 35px;
	border-radius: 5px;
}

#titleId{
	margin:10px 0px 0px 12px;
	width: 842px;
	height: 40px;
}

#contentsId{
	margin-top:10px;
	width: 900px;
	height: 350px;
}

#imageDiv{
	margin-top: 10px;
}

#btnDiv{
	width: 920px;
	margin-top: 25px;
}

.backBtn, .modifytBtn, .deleteBtn{
	border-radius: 3px;
	border-color: #E0E0E0;
	height: 25px;
	background-color: #E0E0E0;
	cursor: pointer;
}

.backBtn{
	margin-left: 390px;
}

.modifytBtn{
	float: right;
	margin-right: 20px;
}

.deleteBtn{
	float: right;
	margin-right: 20px;
}
.clear{
	clear: both;
}

</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
function backBtn(){
	location.href = './admin/list.do';
}

function deleteBtn(no){
	if (confirm('삭제하시겠습니까?')) {
		var url = "./deleteCtr.do?no=" + no;
		location.href = url;
	}
}
function modifytBtn(no) {
	location.href = "../update.do?no=" + no;
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
			<div id="boxDiv">
				<input type="hidden" name="no" value="${noticeDto.no}">
				<div>
				<span>분류</span>
				<input type="text" name="categoryName" id="divisionId"
						value="${noticeDto.categoryName}"readonly>
				<c:if test="${noticeDto.categoryName eq '이벤트'}">
						<span id="daySpan">기간</span>
						<input type="text" name="eventStartDate" id="eventStartDateId"
							value="<fmt:formatDate pattern='yyyy-MM-dd ' value='${noticeDto.eventStartDate}'/>"
							readonly>~
						<input type="text" name="eventEndDate" id="eventEndDateId"
							value="<fmt:formatDate pattern='yyyy-MM-dd ' value='${noticeDto.eventEndDate}'/>"
							readonly>
				</c:if> 
					</div> 
					<div id="SecondDiv">			 
					<span>작성일</span>
					<input type="text" name="createDate" id="createDateId"
							 value="<fmt:formatDate pattern='yyyy-MM-dd ' value='${noticeDto.createDate}'/>" readonly>
					<span id="lookSpan">조회수</span>
					<input type="text" name="hit" id="hitId"
							 value="${noticeDto.hit}" readonly>
				 </div>
				<div>
					<span>제목</span>
					<input type="text" name="title" id="titleId"
							 value="${noticeDto.title}" readonly>
				</div>
				<span>내용</span>	<br> 
				<input type="text" name="content" id="contentsId"
						 value="${noticeDto.content}" readonly>
				<div id="btnDiv">
				<img alt="" src="/babiyo/img/${noticeImg.STORED_NAME}">
				<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn()">
				<c:if test="${_memberDto_.grade eq 1}">
				<input class="modifytBtn"  type="button" value="수정하기" onclick="modifytBtn(${noticeDto.no})">
				<input class="deleteBtn" type="button" value="삭제하기" onclick="deleteBtn(${noticeDto.no})">
				</c:if>
				</div>
				
		</div>
		<div class="clear"></div>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>