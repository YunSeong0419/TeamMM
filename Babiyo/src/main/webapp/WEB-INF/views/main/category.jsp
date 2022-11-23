<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">

#middleSideDiv{
	min-height: 650px;
}

#middleDiv > hr{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF5E00;
	height: 2px;
}

#productCategoryName{
	width: 900px;
 	height: 68px;
	margin: auto;
	line-height: 68px;
}

#productCategoryName > a{
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

#productDiv{
	width: 900px;
	height: 600px;
	margin: 0px auto 0px auto;
}

#firstRow, #secondRow{
	height: 300px;
}
.productContent{
	width: 225px;
	height: 280px;
	font-size: 16px;
	float: left;
}

.productContentImage > a{
	width: 225px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	background-color: lightgray;
	float: left;
}

.productContentName{
	width: 225px;
	height: 20px;
	font-weight: bold;
	text-align: center;
	float: left;
}

.productContentPrice{
	width: 225px;
	height: 20px;
	text-align: center;
	clear: both;
}

</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
		<div id='productCategoryName'>
			<a href="#">한식</a>
			<a href="#">중식</a>
			<a href="#">일식</a>
			<a href="#">양식</a>
			<a href="#">분식</a>
			<a href="#">아시안</a>
		</div>
		
		<hr />
		
		<div id='searchBox'>
			<input type="text" style="width: 150px; height: 36px;">
			<input type="button" value='검색' style="width: 50px; height: 36px;">
		</div>
		
		<div id='productDiv'>
			<div id='firstRow'>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 1" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 1)</div>
					<div class='productContentPrice'>(가격 1)</div>
				</div>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 2" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 2)</div>
					<div class='productContentPrice'>(가격 2)</div>
				</div>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 3" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 3)</div>
					<div class='productContentPrice'>(가격 3)</div>
				</div>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 4" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 4)</div>
					<div class='productContentPrice'>(가격 4)</div>
				</div>
			</div>
			<div id='secondRow'>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 5" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 5)</div>
					<div class='productContentPrice'>(가격 5)</div>
				</div>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 6" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 6)</div>
					<div class='productContentPrice'>(가격 6)</div>
				</div>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 7" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 7)</div>
					<div class='productContentPrice'>(가격 7)</div>
				</div>
				<div class='productContent'>
					<div class='productContentImage'>
						<a href="#"><img alt="밀키트 이미지 8" src=""></a>					
					</div>
					<div class='productContentName'>(상품명 8)</div>
					<div class='productContentPrice'>(가격 8)</div>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/Paging.jsp" />		
		<div id="underPadding"></div>
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>