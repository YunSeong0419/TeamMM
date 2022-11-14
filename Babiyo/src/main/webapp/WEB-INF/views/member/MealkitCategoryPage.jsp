<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트</title>

<style type="text/css">

#middleSideDiv{
	min-height: 650px;
}

hr{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF5E00;
	height: 2px;
}

#mealkitCategoryName{
	width: 900px;
 	height: 68px;
	margin: auto;
	line-height: 68px;
}

#mealkitCategoryName > a{
	color: #4A4A4A;
	padding: 10px 30px;
	margin: 0px auto;
	font-size: 22px;
	font-weight: bold;
	text-align: left;
	text-decoration: none;
}

#searchBox{
	width: 900px;
	height: 50px;
	margin: 20px auto;
	text-align: right;
}

#mealkitDiv{
	width: 900px;
	height: 650px;
	margin: 0px auto 0px auto;
}

.mealkitContent{
	width: 225px;
	height: 280px;
	font-size: 16px;
	float: left;
}

.mealkitContentImage > a{
	width: 225px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	background-color: lightgray;
	float: left;
}

.mealkitContentName{
	width: 225px;
	height: 20px;
	font-weight: bold;
	text-align: center;
	float: left;
}

.mealkitContentPrice{
	width: 225px;
	height: 20px;
	text-align: center;
	clear: both;
}

</style>

</head>
<body>
	<jsp:include page="../Header.jsp"/>
	
<!-- 밑 div를 닫으면 컨텐츠가 몸통 밑으로 들어가게 됨. 푸터 시작에서 닫음. -->	
	<div id='middleSideDiv'>
		<div id='mealkitCategoryName'>
			<a href="#">한식</a>
			<a href="#">중식</a>
			<a href="#">양식</a>
			<a href="#">일식</a>
			<a href="#">동남아</a>
		</div>
		
		<hr />
		
		<div id='searchBox'>
			<input type="text" style="width: 150px; height: 36px;">
			<input type="button" value='검색' style="width: 50px; height: 36px;">
		</div>
		
		<div id='mealkitDiv'>
			<div id='firstRow'>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 1" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 1)</div>
					<div class='mealkitContentPrice'>(가격 1)</div>
				</div>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 2" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 2)</div>
					<div class='mealkitContentPrice'>(가격 2)</div>
				</div>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 3" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 3)</div>
					<div class='mealkitContentPrice'>(가격 3)</div>
				</div>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 4" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 4)</div>
					<div class='mealkitContentPrice'>(가격 4)</div>
				</div>
			</div>
			<div id='secondRow'>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 5" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 5)</div>
					<div class='mealkitContentPrice'>(가격 5)</div>
				</div>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 6" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 6)</div>
					<div class='mealkitContentPrice'>(가격 6)</div>
				</div>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 7" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 7)</div>
					<div class='mealkitContentPrice'>(가격 7)</div>
				</div>
				<div class='mealkitContent'>
					<div class='mealkitContentImage'>
						<a href="#"><img alt="밀키트 이미지 8" src=""></a>					
					</div>
					<div class='mealkitContentName'>(상품명 8)</div>
					<div class='mealkitContentPrice'>(가격 8)</div>
				</div>
			</div>
			
			<jsp:include page="../Paging.jsp"/>
		</div>

	<jsp:include page="../Footer.jsp"/>
</body>
</html>