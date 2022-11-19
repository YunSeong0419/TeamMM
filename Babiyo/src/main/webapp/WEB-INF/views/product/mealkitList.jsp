<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	text-align: center;
	/* 	background-color: #EAEAEA; */
	float: left;
}

#filterAndSearch{
	width: 485px;
	height: 100px;
	margin-left: 80px;
	margin-bottom: 10px;
	float: left;
}

#searchBox, #sortBox{
	height: 50px;
}

.filterBoxName{
	margin: auto 40px auto 0px;	
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
	margin-right: 10px;	
	width: 80px;
	height: 30px;
}

.inputBox{
	width: 200px;
	height: 24px;
	margin-right: 10px;	
}

#tableUpperButtons{
	margin: 50px 80px 10px 0px;
	width: 405px;
	height: 50px;	
	line-height: 50px;
	text-align: right;
	float: left;
}

.mealkitListbutton{
	width: 60px;
	height: 28px;
	font-size: 12px;
}

.mealkitListLongbutton{
	margin-left: 10px;
	width: 80px;
	height: 28px;
	font-size: 12px;
}

#tableDiv{
	float: left;
}

#mealkitManagementTable{
	width: 890px;
	height: 350px;
	margin-left: 80px;
	margin-bottom: 5px;
	border: 1px solid black;
	border-collapse: collapse;
}

#mealkitManagementTable > th, tr, td{
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

.stock{
	width: 60px;
	text-align: center;
}

</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div id='mealkitManagementDiv'>
		<div id='filterAndSearch'>
			<div id='searchBox'>
				<p class='filterBoxName'>검색</p> 
				<form action='/mealkitList.do' method='post' class='filterBoxClassificationForm'>
					<select name='searchOption' class='filterBoxClassification'>
						<c:choose>
							<c:when test="${searchMap.searchOption == 'all'}">
								<option value='all' selected='selected'>전체</option>
								<option value='name'>이름</option>
								<option value='classification'>분류</option>
							</c:when>
							<c:when test="${searchMap.searchOption == 'name'}">
								<option value='all'>전체</option>
								<option value='name' selected='selected'>이름</option>
								<option value='classification'>분류</option>
							</c:when>
							<c:when test="${searchMap.searchOption == 'classification'}">
								<option value='all'>전체</option>
								<option value='name'>이름</option>
								<option value='classification' selected='selected'>분류</option>
							</c:when>
						</c:choose>
					</select>
					<input type='text' class='inputBox' name='keyword' value="${searchMap.keyword}">
					<input type='submit' value="검색" class='mealkitListbutton'>
				</form>
			</div>
			<div id='sortBox'>
				<p class='filterBoxName'>정렬</p> 
				<form action='/mealkitList.do' method='post' class='filterBoxClassificationForm'>
					<select name='sortOption' class='filterBoxClassification'>
						<c:choose>
							<c:when test="${sortMap.sortOption == 'stockASC'}">
								<option value='STOCK ASC' selected='selected'>재고↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'stockDESC'}">
								<option value='STOCK ASC'>재고↑</option>
								<option value='STOCK DESC' selected='selected'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'nameASC'}">
								<option value='STOCK ASC'>재고↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC' selected='selected'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'nameDESC'}">
								<option value='STOCK ASC'>재고↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC' selected='selected'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'priceASC'}">
								<option value='STOCK ASC'>재고↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC' selected='selected'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'priceDESC'}">
								<option value='STOCK ASC'>재고↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC' selected='selected'>가격 ↓</option>
								<option value='REGISTRATION ASC'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'registrationASC'}">
								<option value='STOCK ASC'>재고↑</option>
								<option value='STOCK DESC'>재고 ↓</option>
								<option value='NAME ASC'>이름 ↑</option>
								<option value='NAME DESC'>이름 ↓</option>
								<option value='PRICE ASC'>가격 ↑</option>
								<option value='PRICE DESC'>가격 ↓</option>
								<option value='REGISTRATION ASC' selected='selected'>등록 ↑</option>
								<option value='REGISTRATION DESC'>등록 ↓</option>
							</c:when>
							<c:when test="${sortMap.sortOption == 'registrationDESC'}">
								<option value='STOCK ASC'>재고↑</option>
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
		</div>
		<div id='tableUpperButtons'>
			<input type="button" value="수정" class='mealkitListbutton' 
				onclick="location.href='./modification.do'">
			<input type="button" value="밀키트 등록" class='mealkitListLongbutton' 
				onclick="location.href='./registration.do'">
		</div>
		<div id='tableDiv'>
			<table id='mealkitManagementTable'>
				<tr class='tableHeadTr'>
					<th class='numberTh'>번호</th>
					<th class='classificationTh'>분류</th>
					<th class='productNameTh'>밀키트 품명</th>
					<th class='priceTh'>가격</th>
					<th class='stockTh'>재고</th>
					<th class='checkBoxTh'><input type="checkbox"></th>
				</tr>
			<c:choose>
				<c:when test="${empty mealkitList}">
					<tr>
						<td colspan="6" 
							style="width: 500px; height: 350px; 
							font-size:32px; font-weight: bold; text-align: center;">
							밀키트를 등록해주세요.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="mealkitDto" items="${mealkitList}"> 
						<tr>			
							<td>${mealkitDto.no}</td>
							<td>${mealkitDto.categoryCode}</td>
							<td>
								<form id='mealkitDtoDetailForm' action="./detail.do" method="get">
									<a href='./mealkitDetail.do' onclick="pageMoveMealkitDetailFnc();">
										${mealkitDto.name}
									</a>
									<input type="hidden" name="no" value="${mealkitDto.no}">
									<input type="hidden" id="mealkitDetailCurPage" name="curPage" value="">
									<input type="hidden" name="keyword" value="${searchMap.keyword}">
									<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
									<input type="hidden" name="sortOption" value="${searchMap.sortOption}">
								</form>
							</td>
							<td>${mealkitDto.price}</td>
							<td>${mealkitDto.stock}<input type="text" name='stockVariation' value=''></td>
							<td><input type="checkbox"></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			</table>
		</div>
		<jsp:include page="/WEB-INF/views/Paging.jsp" />
	
		<form action="./list.do" id="pagingForm" method="post">
			<input type="hidden" id="curPage" name="curPage" value="${pagingMap.memberPaging.curPage}">
			<input type="hidden" name="keyword" value="${searchMap.keyword}">
			<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
		</form>
	
	</div>
	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>