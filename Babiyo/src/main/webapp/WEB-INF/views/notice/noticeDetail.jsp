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

</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
function backBtn(){
	location.href = './list.do';
}

function deleteBtn(no){
	var url = "./deleteCtr.do?no=" + no;
	location.href = url;
}
function modifytBtn(no) {
	location.href = "./update.do?no=" + no;
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
				<input type="hidden" name="no" value="${noticeDto.no}">
				<div>분류<input type="text" name="categoryName" id="divisionId"
						value="${noticeDto.categoryName}"readonly></div>
				<c:if test="${noticeDto.categoryName eq '이벤트'}">
					<div>
						기간<input type="text" name="eventStartDate" id="eventStartDate"
							value="<fmt:formatDate pattern='yyyy-MM-dd ' value='${noticeDto.eventStartDate}'/>"
							readonly>~
						<input type="text" name="eventEndDate" id="eventEndDate"
							value="<fmt:formatDate pattern='yyyy-MM-dd ' value='${noticeDto.eventEndDate}'/>"
							readonly>
					</div> 
				</c:if> 
				<div>제목<input type="text" name="title" id="title"
						 value="${noticeDto.title}" readonly></div>
				<div>작성일<input type="text" name="createDate" id="createDate"
						 value="<fmt:formatDate pattern='yyyy-MM-dd ' value='${noticeDto.createDate}'/>" readonly></div>
				<div>조회수<input type="text" name="hit" id="hit"
						 value="${noticeDto.hit}" readonly></div>
				<div>내용<input type="text" name="content" id="content"
						 value="${noticeDto.content}" readonly></div>
				<div><img alt="" src="/babiyo/img/${noticeImg.STORED_NAME}"></div>
				<div><input id="backDiv" type="button" value="뒤로가기" onclick="backBtn()"></div>
				<c:if test="${_memberDto_.grade eq 1}">
				<div><input id="modifytId"  type="button" value="수정하기" onclick="modifytBtn(${noticeDto.no})"></div>
				<div><input id="deleteDiv" type="button" value="삭제하기" onclick="deleteBtn(${noticeDto.no})"></div>
				</c:if>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>