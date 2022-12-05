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
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">
	const drawStar = (target) => {
		var widthVal = $(target).val() * 10 + '%';
		
		$('.star span').css({width: widthVal});
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
					<span id='firstRowGuide'>밀키트 에 대한 리뷰를 작성해주세요.</span>
					<span id='secondRowGuide'>사진이 포함된 리뷰 1개당 100 원의 밀캐시를 드려요.</span>
				</div>
					<span id='evaluationTitle'>평가</span>
				<div id='evaluationDiv'>
					<span class='star'>★★★★★
						<span>★★★★★</span>
						<input type="range" oninput="drawStar(this)" value='1' step='1' min='0' max='10'>
					</span>
				</div>
				<div id='uploadImageDiv'>
				
				</div>
				
				<hr class='lowerDivisionLine'/>		
						
				<div id='contentDiv'>
					<input type="text">
				</div>
				<div id='lowerButtonDiv'></div>
				
			</div>
		
		
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>