<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 등록</title>

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
	float: left;
}

#imageContainer{
	width: 200px;
	height: 200px;
}

#imageContainer > a{
	margin-left: 220px;
}

#imageContainer > img{
	width: 250px;
	height: 250px;
}

#upperInsertDataDiv{
	margin-top: 20px;
	margin-left: 40px;
	width: 680px;
	height: 230px;	
	float: left;
}

#fileContent{
	height: 250px;
}

.insertDataDiv{
	margin-bottom: 20px;
	width: 680px;
	height: 60px;
}

.categoryCodeDiv , .stockDiv{
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
	margin-top: 50px;
	margin-left: 80px;
	width: 970px;
	height: 280px;
	float: left;
}

.contentTextBox{
 	margin-top: 2px; 
	width: 900px;
	height: 200px;
	font-size: 16px;
	font-family: inherit;
	text-align: left;
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
	margin-top: 10px;
	margin-left: 10px;
	width: 150px;
	height: 35px;
	border: 0px;
	border-radius: 5px;
	color: #fff;
	background-color: #FF9436;
	font-size: 16px;
	font-weight: bold;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function pageMoveListFnc() {
		var pagingFormObj = document.getElementById('pagingForm');
		
		pagingFormObj.submit();
	}

	function setThumbnail(event) {
	        var reader = new FileReader();

	        reader.onload = function(event) {
	          var img = document.createElement("img");
	          img.setAttribute("src", event.target.result);
	          $('#imageContainer').html(img);
	        };

	        reader.readAsDataURL(event.target.files[0]);
	}
	 
	function formSubmit() {	
		if (frm.name.value == "") {
			alert("제목을 입력하세요.");
			frm.name.focus();
			
			return false;
		}
		
		if (frm.price.value == "") {
			alert("가격을 입력하세요.");
			frm.price.focus();
			
			return false;
		}
		
		if (frm.stock.value == "") {
			alert("재고를 입력하세요.");
			frm.stock.focus();
			
			return false;
		}
		
		if (frm.content.value == "") {
			alert("내용을 입력하세요.");
			frm.content.focus();
			
			return false;
		}
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
			<div id='productRegistrationDiv'>
			<form action='./adminRegistrationCtr.do' method='post' name='frm'
					enctype="multipart/form-data" onsubmit="return formSubmit();">
				<div id='imageDiv'>
					<div id='fileContent'>
						<div id="imageContainer">
						</div>
					</div>
						<input type="file" name="file" id="imageId" 
						 	accept="image/*" onchange="setThumbnail(event);"/>								
				</div>
		
				<div id='upperInsertDataDiv'>
					<div class='insertDataDiv'>
						<p class='pTagName'>밀키트명</p>
						<input type='text' name='name' class='inputBox'>
					</div>
					<div class='insertDataDiv'>
						<p class='pTagName'>가격</p>
						<input type='text' name='price' class='inputBox'>
					</div>
					<div class='categoryCodeDiv'>
						<p class='sidePTagName'>분류</p>
						<input type="hidden" id='hiddenCategoryCode'>
						<select id='categoryCode' name='categoryCode' class='smallInputBox'>
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
						<input type='text' name='stock' class='smallInputBox'>
					</div>
				</div>
				<div id='contentDiv'>
					<p class='pTagName'>설명</p>
					<textarea name="content" class='contentTextBox'></textarea>
				</div>
				<div id='lowerButtonDiv'>
					<input type="submit" value="등록" class='lowerButton'>
					<input type="button" value="취소" class='lowerButton' onclick="pageMoveListFnc();">		
				</div>
				</form>
			</div>
			<form id="pagingForm" action="./adminList.do" method="get">
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