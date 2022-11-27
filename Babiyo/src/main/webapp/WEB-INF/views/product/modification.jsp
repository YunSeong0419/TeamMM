<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 수정</title>

<style type="text/css">
#productRegistrationDiv{
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
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("a[id^='delete']").on('click', function(e){ // 삭제 버튼
			e.preventDefault();
			deleteFileFnc($(this));
		});
	});
	
	function deleteFileFnc(obj){
		obj.parent().remove();
	}
	
	function addFileFnc() {
		var obj = $('#fileContent');
		
		var htmlStr = "";
		
		htmlStr += '<div>';
		htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx"';
		htmlStr += ' value="">';
		htmlStr += '<input type="file" id="file0" name="file0">';
		htmlStr += '<a href="#this" id="delete0">삭제</a><br>';
		htmlStr += '</div>';
		
		obj.html(htmlStr);
		
		$('a[id^="delete"]').on('click', function(e) {
			e.preventDefault();
			deleteFileFnc($(this));
		});		
	}

	function pageMoveBeforeFnc(no){
		var url = './adminDetail.do?no=' + no;
		location.href = url;
	}
	
// 	var classificationSelectedObj = document.getElementById('classification');
// 	if(classificationSelectedObj.option.value == {ProductDto.categoryCode}){
// 		this option.selected = selected;
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
			<div id='productRegistrationDiv'>
				<form action='./modificationCtr.do' method='post' enctype="multipart/form-data">
  					<input type="hidden" name='no' value='${productDto.no}'> 
				<div id='imageDiv'>
					<div>
						<p class='smallpTagName'>밀키트 사진</p>
					</div>
					<div id='fileContent'>
						<div>
			
						<c:choose>
							<c:when test="${empty fileList}">
								<input type="hidden" id='fileIdx' name='fileIdx' value="">
								<input type="file" id='file0' name="file0" class='insertFileButton'>
								<a href="#this" id="delete0" class='deleteFileButton' 
									onclick="addFileFnc();">삭제</a><br>
							</c:when>
							<c:otherwise>
								<c:forEach var="row" items="${fileList}" varStatus="obj">
								<input type="hidden" id="fileIdx_${obj.index}" 
								name="fileIdx" value="${row.IDX}">
								<img alt="image not found" 
								src="<c:url value='/img/${row.STORED_NAME}'/>"/><br>
								${row.ORIGINAL_NAME} 
								<input type="file" id='file_${obj.index}' 
									name="file_${obj.index}">
									(${row.FILE_SIZE}kb) 
									<a href="#this" id="delete_${obj.index}">삭제</a><br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
			
						</div>
					</div>
				</div>
		
				<div id='upperInsertDataDiv'>
					<div class='insertDataDiv'>
						<p class='pTagName'>밀키트명</p>
						<input type='text' name='name' class='inputBox' value='${productDto.name}'>
					</div>
					<div class='insertDataDiv'>
						<p class='pTagName'>가격</p>
						<input type='text' name='price' class='inputBox' value='${productDto.price}'>
					</div>
					<div class='classificationDiv'>
						<p class='sidePTagName'>분류</p>
						<select id='classification' name='categoryCode' class='smallInputBox'>
							<option value=1>한식</option>
							<option value=2>중식</option>
							<option value=3>일식</option>
							<option value=4>양식</option>
							<option value=5>분식</option>
							<option value=6>아시안</option>
						</select>
					</div>
					<div class='stockDiv'>
						<p class='sidePTagName'>재고</p>
						<input type='text' name='stock' class='smallInputBox' value='${productDto.stock}'>
					</div>
				</div>
				<div id='contentDiv'>
					<p class='pTagName'>설명</p>
					<input type='text' name='content' class='contentTextBox' value='${productDto.content}'>
				</div>
				<div id='lowerButtonDiv'>
					<input type="submit" value='수정' class='lowerButton'> 
  					<input type='button' value='뒤로가기'  class='lowerButton' 
  						onclick='pageMoveBeforeFnc(${productDto.no});'>	  
				</div>
				</form>
			</div>
			<form id="pagingForm" action="./adminDetail.do" method="get">
				<input type="hidden" id="no" name="no" value="${productDto.no}">
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