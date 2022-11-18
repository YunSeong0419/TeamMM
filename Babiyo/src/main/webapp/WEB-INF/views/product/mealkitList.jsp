<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리</title>

<style type="text/css">
#mealkitManagementDiv{
	margin: 0px auto;
	width: 1050px;
	min-height: 550px;
	/* 	background-color: #EAEAEA; */
	float: left;
}

#mealkitManagementTable{
	border: 1px solid black;
	border-collapse: collapse;
	width: 900px;
	height: 350px;
}

#mealkitManagementTable > th, tr, td{
	border: 1px solid black;
	height: 25px;
}

.tableHeadTr{
	background: #EAEAEA;
	font-size: 14px;
	color: #373737;
}

.tableHeadTr > th{
	height: 30px;
	text-align: center;
	font-size: 14px;
}

.numTh {
	width: 30px;
}

;
.classTh {
	width: 134px;
}

;
.titleTh {
	width: 583px;
}

;
.dateTh {
	width: 101px;
}

;
.lookupTh {
	width: 52px;
}

;
ul {
	list-style: none;
}

li {
	float: left;
	list-style: none;
}

a {
	text-decoration: none;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div id='mealkitManagementDiv'>
		<div id='mealkitManagementFilterAndSearch'>
			<div id='searchBox'>
				<span class='searchBoxName'>검색</span> 
				<form action="">
					<select class='searchBoxClassification'>
						<option selected>이름</option>
						<option>분류</option>
					</select>
					<input type="search">
					<input type="button" value="검색">
				</form>
			</div>
			<div id='sortBox'>
				<select class='sortBoxClassification'>
					<option selected>재고순</option>
					<option>이름순</option>
					<option>가격순</option>
					<option>등록순</option>
				</select>
			</div>
		</div>
		<div id='tableDiv'>
			<div id='tableUpperButtons'>
				<input type="button" value="수정">
				<input type="button" value="밀키트 등록">
			</div>
			<div id='tableDiv'>
				<table id='mealkitManagementTable'>
					<tr class='tableHeadTr'>
						<th class='numberTh'>번호</th>
						<th class='classificationTh'>분류</th>
						<th class='productNameTh'>밀키트 품명</th>
						<th class='PriceTh'>가격</th>
						<th class='stockTh'>재고</th>
						<th class='checkBoxTh'></th>
					</tr>
					<tr class='tableContentsTr'>
						<td>3</td>
						<td>한식</td>
						<td>김치전골</td>
						<td>12,000</td>
						<td><input type="text"></td>
						<td></td>
					</tr>
					<tr>
						<td>2</td>
						<td>이벤트</td>
						<td align="center" onClick="location.href='http://www.naver.net/'"
							style="cursor: pointer;">오픈기념 이벤트 첫 가입시 3000포인트 지급</td>
						<td>2022-10-26</td>
						<td>0</td>
					</tr>
					<tr>
						<td>1</td>
						<td>공지</td>
						<td align="center"
							onClick="location.href='https://www.google.com/'"
							style="cursor: pointer;">바비요가 오픈되었습니다</td>
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
	</div>
	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>