<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
#writeDiv{
	margin-left: 40px;	
	width: 900px;
	min-height: 600px; 
}

#upperInfoDiv{
	margin-bottom: 10px;
	height: 200px;
}

#productInfoDiv{
	width: 150px;
	height: 200px;
	text-align: center;
	float: left;
}

#productImage{
	width: 150px;
	height: 150px;
}

#productImage > img{
	width: 150px;
	height: 150px;
}

#productSelectBox{
	height: 50px;
	line-height: 50px;
}

#productSelectBox > span{
	margin-top: 5px;
	margin-left: 3px;
	height: 40px;
	font-size: 30px;
	font-weight: bold;
	color: red;
	float: left;
}

#selectBox{
	width: 120px;
	height: 35px;
	border-radius: 5px;
}

#guideDiv{
	margin-left: 20px;
	width: 450px;
	height: 60px;
	float: left;
}

#firstRowGuide{
	margin: 0px;
	font-size: 16px;
	font-weight: bold;	
}

#secondRowGuide{
	margin: 5px 0px;
	font-size: 14px;
}

#evaluationDiv{
	width: 250px;
	height: 60px;
	border: 1px solid black;
	float: right;
}

#evaluationTitle{
	margin: 0px 18px;
	height: 21px;
	font-size: 16px;
	font-weight: bold;
	line-height: 30px;
}

#uploadImageDiv{
	padding-left: 20px;
	width: 750px;
	height: 150px;
	float: left;
}

#imageContainer > img{
	margin: 10px 10px;
	width: 100px;
	height: 100px;
	float: left;
}

.star{
	position: relative;
	font-size: 2rem;
	color: #ddd;
}

.star input{
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
  	opacity: 0;  
	cursor: pointer;
}

.star span{
	width: 0;
	position: absolute; 
	left: 0;
	color: blue;
	overflow: hidden;
	pointer-events: none;
}

.lowerDivisionLine{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF9436;
	height: 2px;
}

#contentDiv{
	margin-top: 20px;
	width: 900px;
	height: 250px;
	float: left;
}

#contentTextBox{
 	margin-top: 2px; 
	width: 900px;
	height: 250px;
	font-size: 16px;
	font-family: inherit;
	resize: none;
	text-align: left;
}

#lowerButtonDiv{
	width: 900px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

.lowerButton{
	margin: 30px;
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
	const drawStar = (target) => {
		var widthVal = $(target).val() * 20 + '%';
		
		$('.star span').css({width: widthVal});
	}
	
	function pageMoveBeforeFnc(){
		var url = '/babiyo/member/orderList.do';
		location.href = url;
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
		
		if(!$('#selectBox').val()){
			alert("밀키트를 선택하세요.");
			frm.productNo.focus();
			
			return false;
		}
		
		
		if (frm.content.value == "") {
			alert("내용을 입력하세요.");
			frm.content.focus();
			
			return false;
		}
		
		if (frm.file.value == "") {
			alert("사진을 넣어주세요.");
			frm.file.focus();
			
			return false;
		}
	}
	
	function selectProductChangeImg(obj){
		let productNo = $(obj).val();
		
		let src = '/babiyo/img/' + $('#productImg' + productNo).val();
		
		$('#productImg').attr('src', src);
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
			<div id='writeDiv'>
				<form action='./writeCtr.do' method='post' name='frm'
					enctype="multipart/form-data" onsubmit="return formSubmit();">
					<div id='upperInfoDiv'>
						<div id='productInfoDiv'>
							<div id='productImage'>
								<img id="productImg" src="/babiyo/img/${productImg.STORED_NAME}"
									onerror="this.onerror=null; this.src='/babiyo/resources/img/logo.png'">
							</div>
							<div id='productSelectBox'>
								<span>*</span>
								<select id='selectBox' name="productNo" onchange="selectProductChangeImg(this);">
									<option disabled selected>밀키트 선택</option>
									<c:forEach items="${productList}" var="product">
										<c:if test="${product.COUNT > 0}">
											<option value="${product.PRODUCT_NO}">${product.PRODUCT_NAME}</option>
										</c:if>
									</c:forEach>
								</select>
								<c:forEach items="${productList}" var="product">
									<input id="productImg${product.PRODUCT_NO}" type="hidden" 
										value="${product.imgMap.STORED_NAME}">
								</c:forEach>
							</div>
						</div>
						<div id='guideDiv'>
							<p id='firstRowGuide'>밀키트에 대한 리뷰를 작성해주세요.</p>
						</div>
						<div id='evaluationDiv'>
							<span id='evaluationTitle'>평가</span>
							<span class='star'>★★★★★
								<span>★★★★★</span>
								<input type="range" name="starRating" oninput="drawStar(this)" value='1' step='1' min='0' max='5'>
							</span>
						</div>
						
						<div id='uploadImageDiv'>
							<input type="file" name="file" id="imageId" 
							 	accept="image/*" onchange="setThumbnail(event);"/>
							<div id='userUploadImage'>
								<div id="imageContainer"></div>
							</div>
						</div>
					</div>
					
					<hr class='lowerDivisionLine'/>	
						
					<div id='contentDiv'>
						<textarea name="content" id='contentTextBox'></textarea>
					</div>
					<div id='lowerButtonDiv'>
	  					<input type='button' value='이전'  class='lowerButton' 
	  						onclick='pageMoveBeforeFnc();'>
						<input type="submit" value='리뷰 등록' onclick="submitBtn();" class='lowerButton'>
					</div>
				</form> 
			</div>
		
			<div id="underPadding"></div>
					
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->

</body>
</html>