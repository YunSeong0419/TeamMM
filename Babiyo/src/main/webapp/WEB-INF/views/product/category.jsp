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
.lowerDivisionLine{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF9436;
	height: 2px;
}

#emptyProductCategory{
	margin: 0px;
	width: 900px;
	height: 350px;
	font-size: 25px;
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

#productCategoryName > span:hover{
	color: #FF0000;
}

#productCategoryName > .curCategory{
	color: #FF9436;
}

#searchBox{
	margin: 20px auto;
	border-radius: 5px;
	width: 900px;
	height: 35px;
	text-align: right;
}

#searchBoxInput{
	border: 1px solid #000000;
	border-radius: 5px;
	width: 200px;
	height: 35px;
	padding-top: 2px;
}

#searchBoxBtn{
	margin-left: 5px;
	padding-bottom: 3px;
	width: 60px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	color: #fff;
	background-color: #FF9436;
	font-size: 16px;
	float: right;
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
	border-radius: 10px;
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

<script type="text/javascript">
$(function(){
	let no = $('#categoryCodeVal').val();
	
	$('#productCategoryName' + no).attr('class', 'curCategory');
});

function categorySelect(code){
	$('#categoryCode').val(code);
	
	$('#categoryForm').submit();
}
</script>

</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
		<div id='productCategoryName'>
			<span id='productCategoryName0' onclick="categorySelect(0);">전체</span>
			<c:forEach var="productCategory" items="${productCategory}">
				<span id='productCategoryName${productCategory.CODE}' onclick="categorySelect(${productCategory.CODE});">
				${productCategory.NAME}
				</span>
			</c:forEach>
		</div>
		
		<form id="categoryForm" method="get">
			<input type="hidden" id="categoryCode" name="categoryCode">
		</form>
		
		<hr class='lowerDivisionLine' />
		
		<div id='searchBox'>
			<form id="searchForm" action="./category.do" method="get">
				<input type="hidden" name="categoryCode" value="${searchOption.categoryCode}">
				<input type="text" id='searchBoxInput' name="search" value="${searchOption.search}">
				<input type="submit" value='검색' name="searchBoxBtn" id='searchBoxBtn'>
			</form>
		</div>
		<div id='productDiv'>
			<c:choose>
				<c:when test="${empty categoryList}">
					<div id='emptyProductCategory'>
						<p>등록된 밀키트가 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="category" items="${categoryList}"> 
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
		
		<form id="pagingForm">
			<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
			<input type="hidden" id="categoryCodeVal" name="categoryCode" value="${searchOption.categoryCode}">
			<input type="hidden" name="search" value="${searchOption.search}">
		</form>
		
		<div id="underPadding"></div>
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>