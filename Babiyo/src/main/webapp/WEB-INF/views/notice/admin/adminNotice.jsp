<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.noticeCl{
	font-weight: bold;
}
table {
	border: 1px solid black;
	border-collapse: collapse;
	width: 900px;
	height: 350px;
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
</style>
<script type="text/javascript">
onClick="window.open('http://www.daum.net/','','');"
onClick="window.open('http://www.naver.net/','','');"
onClick="window.open('https://www.google.com/','','');"
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"/>
<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
<div>
<div id="noticeCl">
 공지사항
</div>
<div>
분류
<select>
	<option selected>진행중인 이벤트</option>
	<option>종료된 이벤트</option>
	<option>공지</option>
</select>
</div>
<div>
	<form action="">
		<input type="search"><button><img alt="" src=""></button>
	</form>
</div>
<div>
<table>
<tr>
<th id="numTh">번호</th>
<th id="classTh">분류</th>
<th id="titleTh">제목</th>
<th id="dateTh">날짜</th>
<th id="lookupTh">조회수</th>
</tr>
<tr>
<td>3</td>
<td>이벤트</td>
<td align="center" onClick="location.href='http://www.daum.net/'" style="cursor:pointer;">식당주 님들을 모집합니다!</td>
<td>2022-10-27</td>
<td>0</td>
</tr>
<tr>
<td>2</td>
<td>이벤트</td>
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
</div>

<button>뒤로가기</button>
<button>공지작성</button>

<ul>
<li>
<a href="#" onclick="">
<img alt="" src="">
</a>
</li>
<li>
<a href="#" onclick="">1</a>
</li>
<li>
<a href="#" onclick="">2</a>
</li>
<li>
<a href="#" onclick="">3</a>
</li>
<li>
<a href="#" onclick="">4</a>
</li>
<li>
<a href="#" onclick="">
<img alt="" src="">
</a>
</li>
</ul>


<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>