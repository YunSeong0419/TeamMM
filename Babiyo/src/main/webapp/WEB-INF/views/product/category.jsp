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
#middleDiv > hr{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF5E00;
	height: 2px;
}

#emptyProductCategory{
	margin: 0px;
	width: 900px;
	height: 300px;
	font-size: 32px;
	font-weight: bold;
	text-align: center;
	line-height: 300px;
}

#productCategoryName{
	width: 900px;
 	height: 68px;
	margin: auto;
	line-height: 68px;
}

#productCategoryName > span{
	color: #4A4A4A;
	padding: 10px 30px;
	margin: 0px auto;
	font-size: 22px;
	font-weight: bold;
	text-align: left;
	text-decoration: none;
	cursor: pointer;
}

#searchBox{
	width: 900px;
	height: 50px;
	margin: 20px auto;
	text-align: right;
}

#productDiv{
	width: 900px;
	height: 560px;
	margin: 0px auto;
}

.category{
	height: 280px;
	float: left;
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
	float: left;
}

.productContentImage > a > img{
	width: 200px;
	height: 200px;
	text-align: center;
}

.productContentName{
	margin-top: 10px;
	width: 225px;
	height: 20px;
	font-weight: bold;
	font-size: 14px;
	text-align: center;
	float: left;
}

.productContentPrice{
	width: 225px;
	height: 20px;
	text-align: center;
	font-size: 12px;
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
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${classificationAndSearchMap.classification == 'all'}"> --%>
			<span onclick="allClassificationFnc">전체</span>
			<span onclick="allClassificationFnc">한식</span>
			<span onclick="allClassificationFnc">중식</span>
			<span onclick="allClassificationFnc">일식</span>
			<span onclick="allClassificationFnc">양식</span>
			<span onclick="allClassificationFnc">분식</span>
			<span onclick="allClassificationFnc">아시안</span>
		</div>
		
		<hr />
		
		<div id='searchBox'>
			<input type="text" style="width: 150px; height: 36px;">
			<input type="button" value='검색' style="width: 50px; height: 36px;">
		</div>

		<div id='productDiv'>
			<c:choose>
				<c:when test="${empty productCategory}">
					<div id='emptyProductCategory'>
						<p>등록된 밀키트가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="category" items="${productCategory}"> 
						<div class='category'>
							<div class='productContent'>
								<div class='productContentImage'>
									<a href="/babiyo/product/detail.do?productNo=${category.productDto.no}">
										<img alt="${category.productDto.name}" 
											src="/babiyo/img/${category.imgMap.STORED_NAME}"></a>				
								</div>
								<div class='productContentName'>
									${category.productDto.name}
								</div>
								<div class='productContentPrice'>	
									<fmt:formatNumber value="${category.productDto.price}" pattern="#,###"/> 원
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>	
		</div>
		<jsp:include page="/WEB-INF/views/Paging.jsp" />		
		<div id="underPadding"></div>
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>