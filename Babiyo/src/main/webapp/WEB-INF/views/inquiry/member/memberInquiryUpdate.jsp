<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>

<style type="text/css">
#contentsId{
	width: 900px;
	height: 350px;
}
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
		
			<form action="./writeCtr.do" method="post">
			<div>
				분류 
				<select name="categoryCode" id="divisionId">
					<option value="1" selected>주문</option>
					<option value="2">밀키트</option>
					<option value="3">회원</option>
					<option value="4">기타</option>
				</select>
			</div>

			<div>
				제목 <input name="title" id="titleId" type="text" placeholder="제목">
			</div>
			<div id="contentsDiv">
				내용<br> 
				<textarea name="content" id="contentsId"></textarea>
			</div>
			<input type="hidden" name="memberId" value="${_memberDto_.id}"> 
			<input id="backDiv" type="button" value="뒤로가기" onclick="backBtn(${inquiryDto.no});"> 
			<input id="submitDiv"  type="submit" value="수정하기">
			<input id="deleteDiv"  type="button" value="삭제하기" onclick="deleteBtn(${inquiryDto.no});">

		</form>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>