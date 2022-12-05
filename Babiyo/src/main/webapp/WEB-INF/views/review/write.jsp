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
	background-color: lightgrey;
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
	margin-left: 10px;
	width: 450px;
	height: 100px;
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
	padding-left: 10px;
	width: 700px;
	height: 100px;
	float: left;
}

#uploadButton{
	width: 100px;
	height: 100px;
	float: left;
}

.userUploadImage{
	height: 100px;
}

.userUploadImage > img{
	margin: 0px 20px;
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
	height: 300px;
}

#contentDiv > input{
	width: 900px;
	height: 300px;
}

#lowerButtonDiv{
	margin-top: 20px;
	width: 900px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

.lowerButton{
	margin: 0px 15px;
	width: 200px;
	height: 40px;
	font-size: 16px;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	const drawStar = (target) => {
		var widthVal = $(target).val() * 10 + '%';
		
		$('.star span').css({width: widthVal});
	}

	function pageMoveBeforeFnc(no){
		var url = '/babiyo/product/detail.do?no=' + no;
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
			<div id='writeDiv'>
				<div id='upperInfoDiv'>
					<div id='productInfoDiv'>
						<div id='productImage'>
							<img alt="밀키트 이미지" src="#">
						</div>
						<div id='productSelectBox'>
							<span>*</span>
							<select id='selectBox'>
								<option>봉골레파스타</option>
								<option>닭갈비</option>
								<option>떡볶이</option>
							</select>
						</div>
					</div>
					<div id='guideDiv'>
						<p id='firstRowGuide'>밀키트에 대한 리뷰를 작성해주세요.</p>
						<p id='secondRowGuide'>사진이 포함된 리뷰 1개당 100 원의 밀캐시를 드려요.</p>
					</div>
					<div id='evaluationDiv'>
						<span id='evaluationTitle'>평가</span>
						<span class='star'>★★★★★
							<span>★★★★★</span>
							<input type="range" oninput="drawStar(this)" value='1' step='1' min='0' max='10'>
						</span>
					</div>
					<div id='uploadImageDiv'>
						<input type="button" value='사진 올리기' id='uploadButton'>
						<div class='userUploadImage'>
							<img alt="밀키트 이미지 " src="">
							<img alt="밀키트 이미지 " src="">
							<img alt="밀키트 이미지 " src="">
							<img alt="밀키트 이미지 " src="">
						</div>
					</div>
				</div>
				<hr class='lowerDivisionLine'/>		
						
				<div id='contentDiv'>
					<input type="text">
				</div>
				<div id='lowerButtonDiv'>
  					<input type='button' value='이전'  class='lowerButton' 
  						onclick='pageMoveBeforeFnc(${productDto.no});'>	  
					<input type="submit" value='리뷰 등록' class='lowerButton'> 
				</div>
				
			</div>
		
		
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>