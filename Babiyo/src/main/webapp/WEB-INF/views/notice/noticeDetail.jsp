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
	border: 1px solid black;
}

#boxDiv{
	width: 900px;
	margin: auto;
}

span{
	font-weight: bold;
	margin-right: 10px;
}

#divisionId{
	margin-left: 16px;
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
	margin: 10px 0px 0px 17px;
    width: 835px;
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
	height: 35px;
    border: 0px;
    border-radius: 5px;
    color: #fff;
    background-color: #FF9436;
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

#imgSize{
	width: 800px;
}

#imgDiv{
	width: 900px;
	border: 1px solid black;
}

</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
function backBtn(){
	location.href = './list.do';
}

</script>
</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">

		<div id="centerTitle"></div>
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
							readonly><span id="daySpan" class="eventCl">~</span>
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
			<br>
			<c:if test="${!empty noticeImg}">
			<div id="imgDiv">
				<img id="imgSize" alt="" src="/babiyo/img/${noticeImg.STORED_NAME}"><br>
			</div>
			</c:if>
			<br>
			<span>내용</span><br> 
			
			<textarea name="content" id="contentsId" readonly>${noticeDto.content}</textarea>
					 
			<div id="btnDiv">
				<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn()">
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div id="underPadding"></div>
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>