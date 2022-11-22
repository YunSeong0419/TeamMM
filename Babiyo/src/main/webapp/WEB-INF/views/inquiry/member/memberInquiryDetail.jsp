<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 한 문의</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function backBtn() {
		location.href = "../member.do"
	}
	function modifytBtn() {
		location.href = "./update.do"
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
			
			<div>
				작성자<input type="text" name="memberId" id=""
				 value="${_memberDto_.id}">
			</div>
			
			<div>
				분류<input type="text" name="categoryCode" id="divisionId"
				 value="${_memberDto_.categoryCode}">
			</div>
			
			<div>
				작성일<input type="text" name="createDate" id=""
				 value="${_memberDto_.createDate}">
			</div>
			
			<div>
				제목 <input type="text" name="title" id=""
				 value="${_memberDto_.title}">
			</div>

			<div>
				내용<br><input type="text" name="content" id=""
				 value="${_memberDto_.content}">
			</div>
		<c:choose>
			<c:when test="${empty a}">
				답변<br><input type="text" name="answer" id=""
				 value="답변이 존재하지 않습니다.">
			</c:when>
			<c:otherwise>
			<div>
				답변<br><input type="text" name="answer" id=""
				 value="${_memberDto_.answer}">
			</div>	
			</c:otherwise>
		</c:choose>	
			<input id="backDiv" type="button" value="뒤로가기" onclick="backBtn()"> 
			<input id="modifytDiv"  type="button" value="수정하기" onclick="modifytBtn()">
			
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>