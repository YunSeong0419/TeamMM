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

#categoryId{
	margin-left: 4px;
	width: 100px;
	height: 35px;
	border-radius: 5px;
}
#daySpan{
	margin-left: 10px;
}

#titleId{
	margin:10px 0px 0px 8px;
	width: 842px;
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

#imageDiv{
	margin-top: 10px;
}

.eventCl, #imageDiv{
	display: none;
}

#btnDiv{
	width: 850px;
	height:20px; 
	margin: 30px 0px 50px 50px;
}

.backBtn {
	margin-left: 390px;
}

.sumbitBtn {
	float: right;
}

.backBtn, .sumbitBtn{
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

function backBtn(){
	location.href = '../list.do';
}

$(document).ready(function() {
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
			<div id="boxDiv">
			
		
			<form name="frm" action="./writeCtr.do" method="post" enctype="multipart/form-data"
			onsubmit="return formSubmit();">
			<div>
				<span>분류</span> 
				<select name="categoryCode" id="categoryId">
					<option value="1">공지</option>
					<option value="2">이벤트</option>
				</select>
				
				<span id="daySpan" class="eventCl">기간</span>
				<input name="eventStartDate" id="eventStartDateId" class="eventCl" type="date">
				<span id="daySpan" class="eventCl">&nbsp~</span><input name="eventEndDateId" id="eventEndDateId" class="eventCl" type="date">
			</div>
			<div>      
				<span>제목</span><input name="title" id="titleId" type="text">
			</div>
			<div id="imageDiv">
				<span>사진</span> <input name="originalName" class="imageId" type="file">
			</div>
			<div id="contentsDiv">
				<span>내용</span><br> 
				<textarea name="content" id="contentsId"></textarea>
			</div>
			<div id="btnDiv">
				<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn()"> 
				<input class="sumbitBtn" type="submit" value="작성">
			</div>
		
			</form>
			</div><!--  boxDivEnd -->
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>