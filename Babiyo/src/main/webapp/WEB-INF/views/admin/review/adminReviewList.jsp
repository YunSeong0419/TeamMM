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
	height: 35px;
	margin-left: 75px;
}

#sortBox{
	width: 120px;
	height: 35px;
	float: left;
}

#sortBoxName{
	margin: auto 0px;	
	font-size: 16px;
}

#sort, #searchOption{
	border: 1px solid #000000;
	border-radius: 5px;	
	width: 80px;
	height: 35px;
}

#searchBox{
	width: 352px;
	height: 35px;
	float: right;
}

#inputBox{
	border: 1px solid #000000;
	border-radius: 5px;
	width: 200px;
	height: 35px;
	line-height: 35px;
}

#tableLowerButtonDiv{
	margin-right: 70px;
	width: 980px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

#reviewListButton{
	margin-left: 5px;
	border: 0px;
	border-radius: 5px;
	width: 60px;
	height: 35px;
	color: #fff;
	background-color: #FF9436;
	font-size: 16px;
	float: right;
}

#tableDiv{
	margin-top: 10px;
	margin-bottom: 80px;
	height: 380px;
	float: left;
}

#reviewManagementTable{
	width: 900px;
	margin-left: 75px;
	margin-bottom: 5px;
	border-collapse: collapse;
}

#reviewManagementTable > tr, td{
	border-bottom: 2px solid #FF9436;
	height: 35px;
	font-size: 14px;
}

#tableHeadTr > th{
	height: 30px;
	background: #FF9436;
	color: #fff;
	font-size: 16px;
	font-weight: bold;
}

#numberTh{ 
 	width: 60px; 
} 

#evaluationTh, #quantityTh{
	width: 145px;
	text-align: center;
}

#productNameTh{
	width: 450px;
}

#classificationTh{
	width: 100px;
}

.productNameBox{
	text-align: left;
}

.productNameBox > a{
	margin-left: 10px;
	color: #000000;
	text-decoration: none;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">
	function pageMoveAdminReviewDetailFnc(no) {
		var pagingFormObj = $('#pagingForm');
		$('#pagingFormNo').val(no);
		
		pagingFormObj.attr('action', './adminDetail.do');
		pagingFormObj.submit();
	}
	$(function(){ //document.ready랑 같음
		
		if($('#sortValue').val()){
			$('#sort').val($('#sortValue').val());
		}
	
		$('#searchOption').val($('#searchOptionValue').val());
	});
	
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
					<form action='./adminList.do' method='post'>
						<div id='sortBox'>
							<span id='sortBoxName'><strong>정렬</strong></span> 
							<select name='sort' id="sort">
								<option value='RATING_AVG DESC'>평점 ↓</option>
								<option value='RATING_AVG ASC'>평점 ↑</option>
								<option value='PRODUCT_NAME DESC'>이름 ↓</option>
								<option value='PRODUCT_NAME ASC'>이름 ↑</option>
								<option value='REVIEW_COUNT DESC'>리뷰 ↓</option>
								<option value='REVIEW_COUNT ASC'>리뷰 ↑</option>
							</select>
						</div>
						<div id='searchBox'>
							<select name='searchOption' id='searchOption'>
								<option value=''>전체</option>
								<option value='PRODUCT_NAME'>이름</option>
								<option value='CATEGORY_NAME'>분류</option>
							</select>
							<input type='text' id='inputBox' name='search' value="${searchOption.search}">
							<input type='submit' value="검색" id='reviewListButton'>
						</div>
					</form>
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
										<td>${review.RNUM}</td>
										<td>${review.CATEGORY_NAME}</td>
										<td class='productNameBox'>
											<a href='#' onclick="pageMoveAdminReviewDetailFnc(${review.NO});">
												${review.PRODUCT_NAME}</a>
										</td>
										<td>
											<fmt:formatNumber value="${review.RATING_AVG}" pattern="#.#" />
										</td>
										<td>${review.REVIEW_COUNT}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				<jsp:include page="/WEB-INF/views/Paging.jsp" />
				</div>
			</div>
			<form action="./adminList.do" id="pagingForm" method="get">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" name="search" value="${searchOption.search}">
				<input type="hidden" id="searchOptionValue" name="searchOption" value="${searchOption.searchOption}">
				<input type="hidden" id='sortValue' name="sort" value="${searchOption.sort}">
				<input type="hidden" id="pagingFormNo" name="no">
			</form>
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>