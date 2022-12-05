 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
#reviewManagementDiv{
	margin: 0px auto;
	width: 1050px;
	min-height: 550px;
	text-align: center;
	float: left;
}

#filterAndSearch{
	width: 900px;
	height: 50px;
	margin-left: 80px;
}

#sortBox{
	height: 50px;
	float: left;
}

#searchBox{
	height: 50px;
	float: right;
}

#filterBoxName{
	margin: auto 20px auto 0px;	
	line-height: 50px;
	font-size: 18px;
	font-weight: bold;
	float: left;
}

.filterBoxClassificationForm{
 	line-height: 50px; 
	float: left;
}

.filterBoxClassification{
	margin-top: 10px;
	margin-right: 10px;	
	width: 80px;
	height: 30px;
	float: left;
}

#inputBox{
	margin-top: 10px;
	width: 200px;
	height: 30px;
	float: left;
}

#tableDiv{
	height: 450px;
	min-height: 300px;
	float: left;
}

#reviewManagementTable{
	width: 900px;
	margin-left: 80px;
	margin-bottom: 5px;
	border-collapse: collapse;
}

#reviewManagementTable > th, tr, td{
	height: 25px;
	font-size: 14px;
}

#reviewManagementTable > tr, td{
	border-bottom: 1px solid black;
	height: 25px;
	font-size: 14px;
}

#tableHeadTr > th{
	background: #EAEAEA;
	color: #373737;
	font-weight: bold;
}

#numberTh{ 
 	width: 60px; 
} 

#classificationTh, #evaluationTh, #quantityTh{
	width: 150px;
}

#productNameTh{
	width: 450px;
}

#quantityTh{
	text-align: center;
}

</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">
	function pageMoveAdminReviewDetailFnc(no) {
		
		var pagingFormObj = $('#pagingForm');
		
		var htmlStr = pagingFormObj.html();
		
		// 상품번호를 input태그에 담음
		htmlStr += '<input type="hidden" name="no" value="' + no + '">';
		
		pagingFormObj.html(htmlStr);
		pagingFormObj.attr('action', './adminDetail.do');
		pagingFormObj.submit();
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
			<div id='reviewManagementDiv'>
				<div id='filterAndSearch'>
					<div id='sortBox'>
						<p id='filterBoxName'>정렬</p> 
						<form action='./adminList.do' method='post' class='filterBoxClassificationForm'>
							<select name='sortOption' class='filterBoxClassification'>
								<option value='STOCK ASC'>재고 ↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</select>
						</form>
					</div>
					<div id='searchBox'>
						<p id='filterBoxName'>검색</p> 
						<form action='./adminList.do' method='post' class='filterBoxClassificationForm'>
							<select name='searchOption' class='filterBoxClassification'>
								<c:choose>
									<c:when test="${searchMap.searchOption == 'all'}">
										<option value='all' selected='selected'>전체</option>
										<option value='name'>이름</option>
										<option value='${productNo.name}'>분류</option>
									</c:when>
									<c:when test="${searchMap.searchOption == 'name'}">
										<option value='all'>전체</option>
										<option value='name' selected='selected'>이름</option>
										<option value='${categoryCode.name}'>분류</option>
									</c:when>
									<c:when test="${searchMap.searchOption == 'classification'}">
										<option value='all'>전체</option>
										<option value='name'>이름</option>
										<option value='${categoryCode.name}' selected='selected'>분류</option>
									</c:when>
								</c:choose>
							</select>
							<input type='text' id='inputBox' name='keyword' value="${searchMap.keyword}">
							<input type='submit' value="검색" id='reviewListbutton'>
						</form>
					</div>
				</div>
				<div id='tableDiv'>
					<table id='reviewManagementTable'>
						<tr id='tableHeadTr'>
							<th id='numberTh'>번호</th>
							<th id='classificationTh'>분류</th>
							<th id='productNameTh'>밀키트 품명</th>
							<th id='evaluationTh'>평점</th>
							<th id='quantityTh'>리뷰 수</th>
						</tr>
							<c:choose>
							<c:when test="${empty reviewList}">
								<tr>
									<td colspan="5" 
										style="width: 500px; height: 350px; 
 										font-size:32px; font-weight: bold; text-align: center;">
										리뷰가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="review" items="${reviewList}"> 
									<tr>			
										<td>${review.reviewDto.no}</td>
										<td>${review.reviewDto.categoryName}</td>
										<td>
											<a href='#' onclick="pageMoveAdminReviewDetailFnc(${reviewDto.no});">
												${review.reviewDto.productName}</a>
										</td>
										<td>
											<fmt:formatNumber value="${review.reviewDto.starRating}" pattern="#.#" />
										</td>
										<td>${review.reviewQuantity}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				<jsp:include page="/WEB-INF/views/Paging.jsp" />
				</div>
			</div>

			<form id="pagingForm" method="get">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" name="search" value="${searchMap.search}">
				<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" name="sort" value="${searchMap.sort}">
			</form>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>