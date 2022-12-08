 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
#productManagementDiv{
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

#productListShortbutton{
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

.productListbutton{
	margin-top: 10px;
	margin-left: 10px;
	width: 100px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
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

#productManagementTable{
	width: 900px;
	margin-left: 75px;
	margin-bottom: 5px;
	border-collapse: collapse;
}

#productManagementTable > tr, td{
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
						
#numberTh, #checkBoxTh{ 
 	width: 60px; 
} 

#classificationTh, #priceTh{
	width: 100px;
}

#productNameTh{
	width: 450px;
}

.stock, .stockBox{
	width: 60px;
	text-align: center;
}

.productNameBox{
	text-align: left;
}

.productNameBox > a{
	margin-left: 10px;
	color: #000000;
	text-decoration: none;
}

.productPriceBox{
	text-align: right;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function pageMoveProductAdminDetailFnc(no) {
		
		var pagingFormObj = $('#pagingForm');
		
		var htmlStr = pagingFormObj.html();
		
		// 상품번호를 input태그에 담음
		htmlStr += '<input type="hidden" name="no" value="' + no + '">';
		
		pagingFormObj.html(htmlStr);
		pagingFormObj.attr('action', './adminDetail.do');
		pagingFormObj.submit();
	}
	
	$(function(){ //document.ready랑 같음
		
		if($('#sortValue').val()){
			$('#sort').val($('#sortValue').val());
		}
		
		$('#searchOption').val($('#searchOptionVal').val());
		
		$('#allCheck').change(function() { // 전체선택 기능
			var checked = $(this).is(':checked');
			$('.check').prop('checked', checked);
		});	
	});
	
//		선택 재고 일괄 수정 기능
// 		function stockBatchModificationFnc() {

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
			<div id='productManagementDiv'>
				<div id='filterAndSearch'>
					<form method='post'>
						<div id='sortBox'>
							<span id='sortBoxName'><strong>정렬</strong></span> 
							<select name='sort' id="sort">
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='STOCK ASC'>재고 ↑</option>
								<option value='P.NAME DESC'>이름 ↓</option>
								<option value='P.NAME ASC'>이름 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='REGISTRATION_DATE DESC'>등록 ↓</option>
								<option value='REGISTRATION_DATE ASC'>등록 ↑</option>
							</select>
						</div>
						<div id='searchBox'>
							<select name='searchOption' id='searchOption'>
								<option value=''>전체</option>
								<option value='PRODUCT_NAME'>이름</option>
								<option value='CATEGORY_NAME'>분류</option>
							</select>
							<input type='text' id='inputBox' name='search' value="${searchOption.search}">
							<input type='submit' value="검색" id='productListShortbutton'>
						</div>
					</form>
				</div>
				<div id='tableDiv'>
					<table id='productManagementTable'>
						<tr id='tableHeadTr'>
							<th id='numberTh'>번호</th>
							<th id='classificationTh'>분류</th>
							<th id='productNameTh'>밀키트 품명</th>
							<th id='priceTh'>가격</th>
							<th id='stockTh'>재고</th>
							<th id='checkBoxTh'><input type="checkbox" id='allCheck'></th>
						</tr>
							<c:choose>
							<c:when test="${empty productList}">
								<tr>
									<td colspan="6" 
										style="width: 500px; height: 350px; border: 0px;
										font-size: 25px; font-weight: bold; text-align: center;">
										밀키트를 등록해주세요.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="productDto" varStatus="count" items="${productList}"> 
									<tr>			
										<td>${count.count + (paging.curPage-1) *10}</td>
										<td>${productDto.categoryName}</td>
										<td class='productNameBox'>
											<a href='#' onclick="pageMoveProductAdminDetailFnc(${productDto.no});">
												${productDto.name}
											</a>
										</td>
										<td class='productPriceBox'>
											<fmt:formatNumber value="${productDto.price}" pattern="#,###"/> 원&nbsp;
										</td>
										<td><input type="text" value='${productDto.stock}'
												 class='stockBox'></td>
										<td><input type="checkbox" class='check'></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div id='tableLowerButtonDiv'>
						<input type="button" value="밀키트 등록" class='productListbutton' 
							onclick="location.href='./adminRegistration.do'">
						<input type="button" value="재고 수정" class='productListbutton' 
							onclick="stockBatchModificationFnc();">
					</div>
				</div>
				
				<jsp:include page="/WEB-INF/views/Paging.jsp" />
			</div>

			<form id="pagingForm" method="get">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" id='searchVal' name="search" value="${searchOption.search}">
				<input type="hidden" id='searchOptionVal' name="searchOption" value="${searchOption.searchOption}">
				<input type="hidden" id='sortValue' name="sort" value="${searchOption.sort}">
			</form>	
				
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>