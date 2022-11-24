<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 수정</title>		

<style type="text/css">

</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
function backBtn(no){
	location.href = '../member/detail.do?no=' + no;
}

function deleteBtn(no){
	var url = "../member/deleteCtr.do?no=" + no;
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
			<form action="./updateCtr.do" method="post">
			<input type="hidden" name="no" value="${inquiryDto.no}">
			<input type="hidden" name="categoryCode" value="${inquiryDto.categoryCode}">
			<div>
				분류<input type="text" name="name" id="divisionId"
				 value="${inquiryDto.name}" >
			</div>
			<div>
				제목 <input type="text" name="title" id="title"
				 value="${inquiryDto.title}" >
			</div>
			<div>
				내용<br><input type="text" name="content" id="content"
				 value="${inquiryDto.content}" >
			</div>
				<input id="backDiv" type="button" value="뒤로가기" onclick="backBtn(${inquiryDto.no})"> 
				<input type="submit" value="수정하기">
			</form>
			<input id="deleteDiv" type="button" value="삭제하기" onclick="deleteBtn(${inquiryDto.no})">	 
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>