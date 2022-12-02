<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>	

<style type="text/css">

</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#delete").on('click', function(e){ // 삭제 버튼
		e.preventDefault();
	
		deleteFileFnc();
	});
	
	console.log($('#categoryCode').val());
	
	$('#divisionId').val($('#categoryCode').val());
});

function deleteFileFnc() {
	var obj = $('#fileContent');
	
	var htmlStr = "";
	
	htmlStr += '사진 <input name="file" id="imageId" type="file">';
	htmlStr += '<a href="#this" id="" onclick="deleteFileFnc();">삭제</a>';
	
	obj.html(htmlStr);
}

function pageMoveBeforeFnc(no){
	location.href = './detail.do?no=' + no;
}


function pageMoveDeleteFnc(no){
	var url = "./deleteCtr.do?no=" + no;
	location.href = url;
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
			
			<form action="./updateCtr.do" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="no" value="${noticeDto.no}">
				<input type="hidden" id="categoryCode" value="${noticeDto.categoryCode}">
				<div>분류
					<select name="categoryCode" id="divisionId">
						<option value="1">공지</option>
						<option value="2">이벤트</option>
					</select>
				</div>
						
				 <c:if test="${noticeDto.categoryName eq '이벤트'}"> 
					<div>
						기간<input type="date" name="eventStartDate" id="eventStartDate" 
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${noticeDto.eventStartDate}'/>">
						~ <input type="date" name="eventEndDate" id="eventEndDate" 
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${noticeDto.eventEndDate}'/>">
					</div> 
				 </c:if> 
				<div>제목<input type="text" name="title" id="title"
					value="${noticeDto.title}">
				</div>
				<div>작성일<input type="text" id="createDate"
					value="<fmt:formatDate pattern='yyyy년MM월dd일' value='${noticeDto.createDate}'/>"  readonly="readonly"></div>
				<div>
					조회수<input type="text" id="hit" value="${noticeDto.hit}" readonly="readonly">
				</div>
				<div>
					내용<input type="text" name="content" id="content" value="${noticeDto.content}">
				</div>
				
				<div>
					<div id='fileContent'>
						이미지<br>
						<c:choose>		
						<c:when test="${!empty noticeImg}">
						<div>
							<input type="hidden" name="imgNo" value="${noticeImg.NO}">
							<img alt="image not found" src="/babiyo/img/${noticeImg.STORED_NAME}">
								${noticeImg.ORIGINAL_NAME}
							<a href="#this" id="delete">삭제</a>
						</div>
						</c:when>
						<c:otherwise>
							사진 <input name="file" id="imageId" type="file">
							<a href="#this" id="delete">삭제</a>
						</c:otherwise>  
						</c:choose>
					</div>	
				</div>
				
				<div>
					<input id="backDiv" type="button" value="뒤로가기" onclick="pageMoveBeforeFnc(${noticeDto.no});">
				</div>
				<c:if test="${_memberDto_.grade eq 1}">
					<div><input id="modifytId"  type="submit" value="수정하기"></div>
					<div><input id="deleteDiv" type="button" value="삭제하기" onclick="pageMoveDeleteFnc(${noticeDto.no});"></div>
				</c:if>
				
			</form>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>