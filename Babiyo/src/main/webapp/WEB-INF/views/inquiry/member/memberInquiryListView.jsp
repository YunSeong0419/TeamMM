<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의</title>

<style type="text/css">

table{
	border: 1px solid black;
	border-collapse: collapse;
	width: 900px;
	height: 350px;
}

th, td{
	height: 31px;
	
}
th{
	border: 1px solid black;
	background: #EAEAEA;	
	font-size: 14px;
	color: #373737;
}
td {
	 border: 1px solid black;
	 text-align: center;
	 font-size: 14px;
}

#division{
	width: 60px;
	height: 30px;
	font-weight: bold;
	text-align: center;
	line-height: 40px;
	margin-left: 80px;
}

#selectId{
	width: 100px;
	height: 40px;
	border-radius: 6px;
	margin: 0px 0px 10px 74px; 
}

#tableId{
	margin: auto;
}

#numTh{
	width: 30px;
};

#categoryTh{
	width: 134px;
};

#titleTh{
	width: 583px;
};

#createTh{
	width: 101px;
};

#answerTh{
	width: 52px;
};

#formDiv{
	float: left;
	margin-left: 10px;
}

#backBtn{
	margin: 35px 500px;
}

#writeBtn{
	float: right;
	margin-right: 70px;
}

</style>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
function backBtn() {
	
	location.href = "#"
}

function writeBtn() {
	
	location.href = "./member/write.do"
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
	<div> <!-- stateForm div 시작-->
		<form id="stateForm" action="get">
			<span id="division">분류</span>
			<select id="selectId">
				<option selected>완료된 답변</option>
				<option>대기중 답변</option>
				<option>충전</option>
				<option>주문</option>
				<option>기타</option>
			</select>
		</form>	
	</div>	<!-- stateForm div 끝-->
	
	<div> <!-- table div 시작 -->
<table id="tableId">
	<tr>
		<th id="numTh">번호</th><th id="categoryTh">분류</th><th id="titleTh">문의제목</th><th id="createTh">작성일</th><th id="answerTh">답변</th>
	</tr>
	
	<c:choose>
		<c:when test="${empty inquiryList}">
		<tr>
			<td colspan="5"
				style="width: 310px; height: 810px;
				font-weight: bold; text-align: center;">
					문의가 존재하지 않습니다
			</td>
		</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="inquiryDto" items="${inquiryList}">
				<tr>
					<td>${inquiryDto.no}</td>
					<td>${inquiryDto.categoryCode}</td>
					<td>${inquiryDto.title}</td>
					<td><fmt:formatDate pattern="yyyy년MM월dd일 " value="${inquiryDto.createDate}"/></td>
					<td></td>
				</tr>
			</c:forEach>	
		</c:otherwise>	
	</c:choose>
</table>
	</div> <!--table div끝 -->
	
	<div id="backBtn">
		<input type="button" value="뒤로가기" onclick="backBtn()">
	</div>
	
	<div id="writeBtn">
		<input type="button" value="문의작성" onclick="writeBtn()">
	</div>
		
	<jsp:include page="/WEB-INF/views/Paging.jsp"/>	
	
	<div id="underPadding"></div> <!--underPadding-->	
		
		</div> <!--middelMain 끝 -->
			
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!--rootDiv 끝 -->

</body>
</html>