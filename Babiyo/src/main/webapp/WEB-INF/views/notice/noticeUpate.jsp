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
input{
	border-radius: 5px;
}

#boxDiv{
	margin-left: 50px;
}

span{
	font-weight: bold;
	margin-right: 15px;
}

#categoryId{
	margin-left: 15px;
	width: 100px;
	height: 35px;
	border-radius: 5px;
}

#daySpan{
	margin-left: 27px;
}

#titleId{
	margin:10px 0px 0px 15px;
	width: 838px;
	height: 40px;
}

#contentsId{
	margin-top:10px;
	width: 900px;
	height: 350px;
}

#eventStartDateId, #eventEndDateId{
	margin-left: 4px;
	width: 100px;
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

#imageDiv{
	margin-top: 10px;
}

#imageDiv{
	display: none;
}

#btnDiv{
	width: 870px;
	height:20px; 
	margin: 30px 0px 50px 50px;
}

.backBtn{
	margin-left: 390px;
}

.modifytBtn{
	float: right;
	margin-right: 20px;
}

.deleteBtn{
	margin-right: 20px;
	float: right;
}

.backBtn, .modifytBtn, .deleteBtn{
	border-radius: 3px;
	border-color: #E0E0E0;
	height: 25px;
	background-color: #E0E0E0;
	cursor: pointer;
}
</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	  $('#categoryId').change(function() {
		    var result = $("select[name=categoryCode]").val();
		    if (result == 2) {
		      $('.eventCl').show();
		      $('#imageDiv').show();
		    } else {
		      $('.eventCl').hide();
		      $('#imageDiv').hide();
		    }
		  }); 
	
	$("#delete").on('click', function(e){ // 삭제 버튼
		e.preventDefault();
	
		deleteFileFnc();
	});
	
	$('#divisionId').val($('#categoryCode').val());
});

function formSubmit() {
	var today = new Date();  
	var todayCut = new Date(today.getFullYear(),today.getMonth(),today.getDate());
	var eventStart = new Date(frm.eventStartDate.value);
	 var target = document.getElementById("categoryId");
	
	if (target.value == 2) {
		
			if (frm.eventStartDate.value == "") {
				alert("시작일을 선택하세요.");
				frm.eventStartDate.focus();
				
				return false;
			}
			
		 	if (eventStart <= todayCut) {
				alert("시작일을 오늘이상으로 하세요.");
				frm.eventStartDate.focus();
				
				return false;
			} 
			
			if (frm.eventEndDate.value == "") {
				alert("종료일을 선택하세요.");
				frm.eventEndDate.focus();
				
				return false;
			}
	 
			 if (frm.eventEndDate.value < frm.eventStartDate.value) {
				alert("종료일을 시작일 이상으로 하세요.");
				frm.eventEndDate.focus();
				
				return false;
			}	
			
		}
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

function deleteFileFnc() {
	var obj = $('#fileContent');
	
	var htmlStr = "";
	
	htmlStr += '<sapn>이미지</sapn><br>사진 <input name="file" id="imageId" type="file">';
	htmlStr += '<a href="#this" id="" onclick="deleteFileFnc();">삭제</a>';
	
	obj.html(htmlStr);
}

function pageMoveBeforeFnc(no){
	history.back();
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
				<div id="boxDiv">
			<!--여기서 작성 -->
			
			<form name="frm" action="./updateCtr.do" method="post" enctype="multipart/form-data"
			onsubmit="return formSubmit();">
			
				<input type="hidden" name="no" value="${noticeDto.no}">
				<input type="hidden" id="categoryCode" value="${noticeDto.categoryCode}">
				<div>
				<span>분류</span>
					<select name="categoryCode" id="categoryId">
						<option value="1">공지</option>
						<option value="2">이벤트</option>
					</select>
						
				 <c:if test="${noticeDto.categoryName eq '이벤트'}"> 
						<span id="daySpan" class="eventCl">기간</span>
						<input type="date" name="eventStartDate" id="eventStartDateId" class="eventCl" 
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${noticeDto.eventStartDate}'/>">
						<span id="daySpan" class="eventCl">&nbsp~</span>
						<input type="date" name="eventEndDateId" id="eventEndDateId" class="eventCl" 
						value="<fmt:formatDate pattern='yyyy-MM-dd' value='${noticeDto.eventEndDate}'/>">
				 </c:if> 
					</div> 
				
				<div id="SecondDiv">
				<span>작성일</span>
				<input type="text" id="createDateId"
					value="<fmt:formatDate pattern='yyyy-MM-dd' value='${noticeDto.createDate}'/>"  readonly="readonly">
					<span id="lookSpan">조회수</span>
					<input type="text" id="hitId" value="${noticeDto.hit}" readonly="readonly">
				</div>
				<div>
				<span>제목</span>
				<input type="text" name="title" id="titleId" value="${noticeDto.title}">
				</div>
				<div>
					<span>내용</span><br>
					<input type="text" name="content" id="contentsId" value="${noticeDto.content}">
				</div>
				
				<div>
					<div id='fileContent'>
						<span>이미지</span><br>
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
				
				<div id="btnDiv">
					<input class="backBtn" type="button" value="뒤로가기" onclick="pageMoveBeforeFnc(${noticeDto.no});">
				<c:if test="${_memberDto_.grade eq 1}">
					<input class="modifytBtn"  type="submit" value="수정하기">
					<input class="deleteBtn" type="button" value="삭제하기" onclick="pageMoveDeleteFnc(${noticeDto.no});">
				</c:if>
				</div>
			</form>
			</div>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>