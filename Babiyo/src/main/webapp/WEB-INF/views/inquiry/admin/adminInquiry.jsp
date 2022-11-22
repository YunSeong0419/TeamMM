<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 문의</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/basic.css?b"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

table {
	border: 1px solid black;
	border-collapse: collapse;
	width: 900px;
	height: 350px;
}
#tableDiv{
	margin: 70px;
}
th, td{
	height: 31px;
	
}
th {
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
#numTh{
		width: 30px;
};
#classTh{
		width: 134px;
};
#titleTh{
		width: 583px;
};
#dateTh{
		width: 101px;
};
#lookupTh{
		width: 52px;
};

ul{
	list-style: none;
}

li{
	float: left;
	list-style: none;
}

a{
	text-decoration: none;
}

/* #wrapDiv{ */
/* 	min-height: 600px; */
/* 	margin: auto; */
/* 	width: 1200px; */
/* } */
#tableId{
	margin: auto;
}

#divisionId{
	width: 60px;
	height: 30px;
	font-weight: bold;
	float: left;
	text-align: center;
	line-height: 40px;
	margin-left: 580px;
}
#selectId{
	width: 100px;
	height: 40px;
	border-radius: 6px;
	float: left;
}
#backId{
	margin: 35px 550px;
}
#backInput{
	border:#EAEAEA;
	background: #EAEAEA;
	border-radius: 3px;
	cursor: pointer;
}
#nameId{
	width: 90px;
	height: 40px;
	border-radius: 8px;
}
#formId{
	float: left;
	margin-left: 10px;
}

</style>
<script type="text/javascript">
onClick="window.open('http://www.daum.net/','','');"
onClick="window.open('http://www.naver.net/','','');"
onClick="window.open('https://www.google.com/','','');"
</script>
</head>
<body>
<div id="rootDiv">
<jsp:include page="/WEB-INF/views/Header.jsp"/>

<div id="middleDiv">
<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
<div id="middleMainDiv">
<div id="divisionCl">
분류
</div>
<div>
<select id="selectCl">
	<option selected>완료된 답변</option>
	<option>대기중 답변</option>
	<option>충전</option>
	<option>주문</option>
	<option>기타</option>
</select>
</div>
<div>
	<form action="" id="formId">
		<span>작성자</span>
		<input id="nameId" type="text" value="" placeholder="">
		<input id="findId" type="submit" value="검색">
	</form>
</div>
<div id="tableDiv">
<table id="tableId">
<tr>
<th id="numTh">번호</th>
<th id="classTh">분류</th>
<th id="titleTh">문의제목</th>
<th id="dateTh">작성일</th>
<th id="lookupTh">답변</th>
</tr>
<tr>
<td>10</td>
<td>충전</td>
<td align="center" onClick="location.href='http://www.daum.net/'" style="cursor:pointer;">포인트가 충전이 안되여</td>
<td>2022-10-27</td>
<td>N</td>
</tr>
<tr>
<td>2</td>
<td></td>
<td align="center" onClick="location.href='http://www.naver.net/'" style="cursor:pointer;">오픈기념 이벤트 첫 가입시 3000포인트 지급</td>
<td>2022-10-26</td>
<td>0</td>
</tr>
<tr>
<td>1</td>
<td>공지</td>
<td align="center" onClick="location.href='https://www.google.com/'" style="cursor:pointer;">바비요가 오픈되었습니다</td>
<td>2022-10-26</td>
<td>0</td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</table>
</div>


<div id="backId">
	<input id="backInput" type="button" value="뒤로가기" onclick="">
</div>
<jsp:include page="/WEB-INF/views/Paging.jsp"/> 

</div>
</div>
<jsp:include page="/WEB-INF/views/Footer.jsp"/> 
</div>

</body>
</html>