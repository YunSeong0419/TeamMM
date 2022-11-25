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
	function modifytBtn(no) {
		location.href = "./update.do?no=" + no;
	}
	function deleteBtn(no){
		if (confirm('삭제하시겠습니까?')) {
			var url = "./deleteCtr.do?no=" + no;
			location.href = url;	
		}
		
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
				분류<input type="text" name="categoryCode" id="divisionId"
				 value="${inquiryDto.name}" readonly>
			</div>
			
			<div>
				작성일<input type="text" name="createDate" id=""
				 value="<fmt:formatDate pattern='yyyy년MM월dd일 ' value='${inquiryDto.createDate}'/>" readonly>
			</div>
			
			<div>
				제목 <input type="text" name="title" id=""
				 value="${inquiryDto.title}" readonly>
			</div>

			<div>
				내용<br><input type="text" name="content" id=""
				 value="${inquiryDto.content}" readonly>
			</div>

			<c:if test="${!empty inquiryDto.answer}">
			<div>
				답변<br><input type="text" name="answer" id=""
				 value="${inquiryDto.answer}" readonly>
			</div>	
			</c:if>
			
			<input id="backId" type="button" value="뒤로가기" onclick="backBtn()"> 
			<input id="deleteId" type="button" value="삭제하기" onclick="deleteBtn(${inquiryDto.no})">
			
			<c:if test="${empty inquiryDto.answer}">
			<input id="modifytId"  type="button" value="수정하기" onclick="modifytBtn(${inquiryDto.no})">
			</c:if>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>