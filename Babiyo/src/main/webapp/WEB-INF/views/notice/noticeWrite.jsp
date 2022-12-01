<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성</title>

<style type="text/css">
#contentsId{
	width: 900px;
	height: 350px;
}
</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function backBtn() {
		location.href = "../list.do"
	};
	
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
			<form action="./writeCtr.do" method="post" enctype="multipart/form-data">
			<div>
				분류 
				<select name="categoryCode" id="divisionId">
					<option value="1">공지</option>
					<option value="2">이벤트</option>
				</select>
			</div>
			
			<div id="eventDateId">
				기간<input name="eventStartDate" id="eventStartDateId" type="date">
				 ~ <input name="eventEndDate" id="eventEndDateId" type="date">
			</div>
			<div>      
				제목 <input name="title" id="titleId" type="text">
			</div>
			<div>
				사진 <input name="originalName" id="imageId" type="file">
			</div>
			<div id="contentsDiv">
				내용<br> 
				<textarea name="content" id="contentsId"></textarea>
			</div>
			<input id="backDiv" type="button" value="뒤로가기" onclick="backBtn()"> 
			<input id="submitDiv"  type="submit" value="작성">

			</form>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>