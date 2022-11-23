<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 관리</title>

<style type="text/css">
#productManagementDiv{
	margin: 0px auto;
	width: 1050px;
	min-height: 550px;
	text-align: center;
	/* 	background-color: #EAEAEA; */
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

.filterBoxName{
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

.inputBox{
	margin-top: 10px;
	width: 200px;
	height: 30px;
	float: left;
}

#tableLowerButtonDiv{
	margin-right: 70px;
	width: 980px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

.productListbutton{
	margin-top: 10px;
	margin-left: 10px;
	width: 80px;
	height: 28px;
	font-size: 12px;
	float: right;
}

#tableDiv{
	float: left;
}

#productManagementTable{
	width: 900px;
	margin-left: 80px;
	margin-bottom: 5px;
	border: 1px solid black;
	border-collapse: collapse;
}

#productManagementTable > th, tr, td{
	border: 1px solid black;
	height: 25px;
	font-size: 14px;
}

.tableHeadTr > th{
	border: 1px solid black;
	background: #EAEAEA;
	color: #373737;
	font-weight: bold;
}

.numberTh, .checkBoxTh{ 
 	width: 60px; 
} 

.classificationTh, .priceTh{
	width: 100px;
}

.productNameTh{
	width: 450px;
}

.stock, .stockVariationBox{
	width: 50px;
	text-align: center;
	float: right;
}

</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function pageMoveProductDetailFnc() {
		var productDetailCurPageInputObj = document.getElementById('productDetailCurPage');		
		productDetailCurPageInputObj.value = document.getElementById('curPage').value;
		
		var productDetailFormObj = document.getElementById('productDetailForm');
		productDetailFormObj.submit();
	}
	
// 	function stockBatchModificationFnc() {
		
// 	}					틀 다 잡아놓고 나중에 하자
	
// 	function productBatchDeleteFnc() {
// 		var wholePageCheckObj = document.getElementById('wholePageCheck');
		
// 		wholePageCheckObj.addEventListener('change', () )
		
// 		var url = "./deleteCtr.do?no=" + no;
// 			if(wholePageCheckObj.checked == 'checked') {
// 				//
// 				location.href = url;
// 			}
			
// 		var checkSelectDeleteObj = document.getElementsByClassName('checkboxes');
// 			if(checkSelectDeleteObj.checked == 'checked')
				
// 				location.href = url;
// 			}		
// 	}

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
					<div id='sortBox'>
						<p class='filterBoxName'>정렬</p> 
						<form action='./list.do' method='post' class='filterBoxClassificationForm'>
							<select name='sortOption' class='filterBoxClassification'>
								<c:choose>
									<c:when test="${sortMap.sortOption == 'STOCK ASC'}">
										<option value='STOCK ASC' selected='selected'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'STOCK DESC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC' selected='selected'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'NAME ASC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC' selected='selected'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'NAME ASC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC' selected='selected'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'PRICE ASC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC' selected='selected'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'PRICE DESC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC' selected='selected'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'REGISTRATION ASC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC' selected='selected'>등록 ↑</option>
										<option value='REGISTRATION DESC'>등록 ↓</option>
									</c:when>
									<c:when test="${sortMap.sortOption == 'REGISTRATION DESC'}">
										<option value='STOCK ASC'>재고 ↑</option>
										<option value='STOCK DESC'>재고 ↓</option>
										<option value='NAME ASC'>이름 ↑</option>
										<option value='NAME DESC'>이름 ↓</option>
										<option value='PRICE ASC'>가격 ↑</option>
										<option value='PRICE DESC'>가격 ↓</option>
										<option value='REGISTRATION ASC'>등록 ↑</option>
										<option value='REGISTRATION DESC' selected='selected'>등록 ↓</option>
									</c:when>
								</c:choose>
							</select>
						</form>
					</div>
					<div id='searchBox'>
						<p class='filterBoxName'>검색</p> 
						<form action='./list.do' method='post' class='filterBoxClassificationForm'>
							<select name='searchOption' class='filterBoxClassification'>
								<c:choose>
									<c:when test="${searchMap.searchOption == 'all'}">
										<option value='all' selected='selected'>전체</option>
										<option value='name'>이름</option>
										<option value='${categoryCode.name}'>분류</option>
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
							<input type='text' class='inputBox' name='keyword' value="${searchMap.keyword}">
							<input type='submit' value="검색" class='productListbutton'>
						</form>
					</div>
				</div>
				<div id='tableDiv'>
					<table id='productManagementTable'>
						<tr class='tableHeadTr'>
							<th class='numberTh'>번호</th>
							<th class='classificationTh'>분류</th>
							<th class='productNameTh'>밀키트 품명</th>
							<th class='priceTh'>가격</th>
							<th class='stockTh'>재고</th>
							<th class='checkBoxTh'><input type="checkbox" id='wholePageCheckObj'></th>
						</tr>
							<c:choose>
							<c:when test="${empty productList}">
								<tr>
									<td colspan="6" 
										style="width: 500px; height: 350px; 
										font-size:32px; font-weight: bold; text-align: center;">
										밀키트를 등록해주세요.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="productDto" items="${productList}"> 
									<tr>			
										<td>${productDto.no}</td>
										<td>${productDto.categoryCode}</td>
										<td>
											<form id='productDetailForm' action="./detail.do" method="get">
												<a href='./detail.do' onclick="pageMoveProductDetailFnc();">
													${productDto.name}
												</a>
												<input type="hidden" name="no" value="${productDto.no}">
												<input type="hidden" id="productDetailCurPage" name="curPage" value="">
												<input type="hidden" name="keyword" value="${searchMap.keyword}">
												<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
												<input type="hidden" name="sortOption" value="${searchMap.sortOption}">
											</form>
										</td>
										<td>${productDto.price}</td>
										<td>${productDto.stock}<input type="text" name='stockVariation' 
											value='' class='stockVariationBox'></td>
										<td><input type="checkbox" class='checkboxes'></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<div id='tableLowerButtonDiv'>
						<input type="button" value="밀키트 등록" class='productListbutton' 
							onclick="location.href='./registration.do'">
						<input type="button" value="재고 수정" class='productListbutton' 
							onclick="stockBatchModificationFnc();">
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/Paging.jsp" />
			</div>
			<form id="pagingForm" method="post">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" name="keyword" value="${searchMap.keyword}">
				<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" name="sortOption" value="${sortMap.sortOption}">
			</form>		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>