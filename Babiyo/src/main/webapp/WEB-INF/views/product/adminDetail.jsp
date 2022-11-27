<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 상세</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
#productModificationDiv{
	margin: 0px auto;
	width: 1050px;
	min-height: 550px;
	float: left;
}

#imageDiv{
	width: 250px;
	height: 250px;
	margin-left: 80px;
  	background-color: #EAEAEA; 
	float: left;
}

.insertFileButton{
	width: 200px;
	float: left;
}

#upperInsertDataDiv{
	margin-top: 20px;
	margin-left: 40px;
	width: 680px;
	height: 230px;	
	float: left;
}

.insertDataDiv{
	margin-bottom: 20px;
	width: 680px;
	height: 60px;
}

.classificationDiv ,.stockDiv{
	margin-top: 10px;
	width: 220px;
	height: 60px;
	float: left;
}

.pTagName{
	margin: 0px auto 5px auto;	
	line-height: 20px;
	font-size: 18px;
	font-weight: bold;
}

.sidePTagName{
	margin: 0px auto 5px auto;	
	line-height: 30px;
	font-size: 18px;
	font-weight: bold;
	float: left;
}

.smallpTagName{
	margin: 0px auto 10px auto;	
	line-height: 18px;
	font-size: 16px;
	font-weight: bold;
}

.inputBox{
	width: 250px;
	height: 30px;
}

.smallInputBox{
	margin-left: 20px;
	width: 120px;
	height: 30px;
	float: left;
}

#contentDiv{
	margin-top: 30px;
	margin-left: 80px;
	width: 970px;
	height: 280px;
	float: left;
}

.contentTextBox{
	width: 900px;
	height: 244px;
	text-align: left;
	vertical-align: top;
}

#lowerButtonDiv{
	margin-top: 10px;
	width: 1050px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

.lowerButton{
	margin: 0px 15px;
	width: 100px;
	height: 40px;
	font-size: 16px;
}

.dataSpace{
	line-height: 30px;
	font-size: 16px;
}

.horizonDataSpace{
	line-height: 30px;
	font-size: 16px;
	margin-left: 25px;
}

</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function pageMoveListFnc() {
		var pagingFormObj = document.getElementById('pagingForm');
		
		pagingFormObj.submit();
	}

	function pageMoveDeleteFnc(no){
		var url = "./deleteCtr.do?no=" + no;
		location.href = url;
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
			<div id='productModificationDiv'>
				<form action='./modification.do' method='get'>
 					<input type="hidden" name='no' value='${productDto.no}'>
				<div id='imageDiv'>
					<div>
						<p class='smallpTagName'>밀키트 사진</p>
					</div>
					<div>
						<input type="file" name='file' class='insertFileButton'>
					</div>
				</div>
				<div id='upperInsertDataDiv'>
					<div class='insertDataDiv'>
						<p class='pTagName'>밀키트명</p>
						<span class='dataSpace'>${productDto.name}</span>
					</div>
					<div class='insertDataDiv'>
						<p class='pTagName'>가격</p>
						<span class='dataSpace'>${productDto.price}</span>
					</div>
					<div class='classificationDiv'>
						<p class='sidePTagName'>분류</p>
						<span id='classification' class='horizonDataSpace'>
							${productDto.categoryCode}</span>
					</div>
					<div class='stockDiv'>
						<p class='sidePTagName'>재고</p>
						<span class='horizonDataSpace'>${productDto.stock}</span>
					</div>
				</div>
				<div id='contentDiv'>
					<p class='pTagName'>설명</p>
					<span class='dataSpace'>${productDto.content}</span>
				</div>
				<div id='lowerButtonDiv'>
					<input type="submit" value="수정" class='lowerButton'>
					 <input type='button' value='삭제' class='lowerButton' 
  						onclick='pageMoveDeleteFnc(${productDto.no});'>  
					<input type="button" value="뒤로가기" class='lowerButton' onclick="pageMoveListFnc();">		
				</div>
				</form>
			</div>
			<form id="pagingForm" action="./list.do" method="get">
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