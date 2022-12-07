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

#titleDiv, #contentDiv{
	margin-top: 13px;
}

#divisionId{
	width: 120px;
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

#btnDiv{
	width: 900px;
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
}
</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$('#divisionId').val($('#categoryCode').val());
});


function formSubmit() {
	
	if (frm.title.value == "") {
		alert("제목을 입력하세요.");
		frm.title.focus();
		
		return false;
	}
	
	if (frm.content.value == "") {
		alert("내용을 입력하세요.");
		frm.content.focus();
		
		return false;
	}
	
};


function backBtn(no){
	location.href = '../member/detail.do?no=' + no;
}

function deleteBtn(no){
	if (confirm('삭제하시겠습니까?')) {
		var url = "../member/deleteCtr.do?no=" + no;
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
			<div id="boxDiv">
			<!--여기서 작성 -->
			<input type="hidden" id="categoryCode" name="categoryCode" value="${inquiryDto.categoryCode}">
			<form name="frm" action="./updateCtr.do" method="post" onsubmit="return formSubmit();">
			<input type="hidden" name="no" value="${inquiryDto.no}">
			<div>
				<span>분류</span>
				<select name="categoryCode" id="divisionId">
					<option value="1">주문</option>
					<option value="2">밀키트</option>
					<option value="3">회원</option>
					<option value="4">기타</option>
				</select>
				<%-- <span>분류</span>
				<input type="text" name="name" id="divisionId"
				 value="${inquiryDto.name}" > --%>
			</div>
			<div id="titleDiv">
				<span>제목</span> 
				<input type="text" name="title" id="titleId"
				 value="${inquiryDto.title}" >
			</div>
			<div id="contentDiv">
				<span>내용</span><br>
				<input type="text" name="content" id="contentId"
				 value="${inquiryDto.content}" >
			</div>
			<div id="btnDiv">
				<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn(${inquiryDto.no})"> 
				<input class="deleteBtn" type="button" value="삭제하기" onclick="deleteBtn(${inquiryDto.no})">
				<input  class="modifytBtn" type="submit" value="수정하기">
			</div>
			</form>
			</div> <!-- 박스div 끝 --> 
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>