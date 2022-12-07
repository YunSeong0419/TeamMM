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
span{
	font-weight: bold;
}

#boxDiv{
	margin-left: 50px;
}

#categoryId{
	margin-left: 20px;
	width: 100px;
	height: 35px;
	border-radius: 5px;
}

#titleId{
	margin:10px 0px 0px 20px;
	width: 842px;
	height: 40px;
}

#contentsId{
	margin-top:10px;
	width: 900px;
	height: 350px;
}

#inputBtn{
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
	height: 35px;
    border: 0px;
    border-radius: 5px;
    color: #fff;
    background-color: #FF9436;
	cursor: pointer;
}
</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function backBtn() {
		location.href = "../member.do"
	}
	
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
		<div  id="boxDiv">
			<form name="frm" action="./writeCtr.do" method="post" onsubmit="return formSubmit();">
			<div id="filterDiv">
				<span>분류</span> 
				<select name="categoryCode" id="categoryId">
					<option value="1" selected>주문</option>
					<option value="2">밀키트</option>
					<option value="3">회원</option>
					<option value="4">기타</option>
				</select>
			</div>

			<div>
				<span>제목 </span>
				<input name="title" id="titleId" type="text" placeholder="제목">
			</div>
			<div id="contentsDiv">
				<span>내용 </span><br>
				<textarea name="content" id="contentsId"></textarea>
			</div>
			<input type="hidden" name="memberId" value="${_memberDto_.id}">
			<div id="inputBtn"> 
			<input class="backBtn" type="button" value="뒤로가기" onclick="backBtn()"> 
			<input class="sumbitBtn" type="submit" value="작성">
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