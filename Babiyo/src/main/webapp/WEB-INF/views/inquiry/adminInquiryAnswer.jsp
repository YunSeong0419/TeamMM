<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 문의 상세</title>		

<style type="text/css">
input{
	border-radius: 5px;
}

#boxDiv{
	margin-left: 50px;
}

span{
	font-weight: bold;
	margin-right: 20px;
}

#titleDiv, #contentDiv, #answerDiv{
	margin-top: 13px;
}

#divisionId{
	width: 120px;
	height: 32px;
}

#createDateSpan{
	margin-left: 20px;
}

#createDateId{
	width: 145px;
	height: 32px;
}

#titleId{
	width: 600px;
	height: 32px;
}

#contentId{
	margin-top:10px;
	width: 900px;
	height: 180px;
}

#answerId{
	margin-top:10px;
	width: 900px;
	height: 180px;
}

#btnDiv{
	width: 900px;
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
}
</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
function backBtn() {
	location.href = "../admin.do"
}
function deleteBtn(no){
	if (confirm('삭제하시겠습니까?')) {
		var url = "../admin/deleteCtr.do?no=" + no;
		location.href = url;	
	}
	
}

function formSubmit() {
	
	var correction = document.getElementById('correctionId');
	var answer = document.getElementById('answerId');
	
	if (answer) {
		alert('등록되었습니다');
	}else {
		alert('변경되었습니다');
	}
	
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
			<form onsubmit="formSubmit();" action="./answerCtr.do" method="post">
				<input type="hidden" name="no" value="${inquiryDto.no}">
				<input type="hidden" name="categoryCode" value="${inquiryDto.categoryCode}">
				<div>
					<span>작성자</span>
					<input type="text" name="memberId" id="memberId"
					 value="${inquiryDto.memberId}" readonly>
				</div>
				<div>
					<span>작성일</span>
					<input type="text" name="createDate" id="createDateId"
					 value="<fmt:formatDate pattern='yyyy년MM월dd일 ' value='${inquiryDto.createDate}'/>"readonly>
				</div>
				<div>
					<span>분류</span>
					<input type="text" name="name" id="divisionId"
					 value="${inquiryDto.name}" readonly>
				</div>
				<div>
					<span>제목</span>
					<input type="text" name="title" id="title"
					 value="${inquiryDto.title}" readonly>
				</div>
				<div>
					<span>내용</span><br>
					<input type="text" name="content" id="content"
					 value="${inquiryDto.content}" readonly>
				</div>
				
				<div>
					<span>답변</span><br>
					<input type="text" name="answer" id="answer"
					 value="${inquiryDto.answer}" >
				</div>
				<div id="btnDiv">
				<input id="backDiv" type="button" value="뒤로가기" onclick="backBtn()"> 
				<c:choose>
					<c:when test="${!empty inquiryDto.answer}">
						<input id="correctionId" type="submit" value="수정하기">
						<input id="deleteDiv" type="button" value="삭제하기" onclick="deleteBtn(${inquiryDto.no})">	
					</c:when>
					<c:otherwise>
						<input id="answerId" type="submit" value="답변하기">
					</c:otherwise>
				</c:choose>	
				</div>
			</form>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>