<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<style type="text/css">

#mainPageNoticeAreaDiv{
	margin: 40px auto 20px auto;
	width: 1200px;
	height: 30px;
}

.noticeName{
	width: 100px;
	height: 30px;
	margin-left: 150px;
	font-size: 16px;
	float: left;
	text-align: center;
	line-height: 30px;
/* 	border: 1px solid black; */
}

.noticeTitle{
	width: 550px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
/* 	border: 1px solid black; */
}

.noticeDate{
	width: 80px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
/* 	border: 1px solid black; */
}

.goToNotice{
	width: 80px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
	text-decoration: none;
/* 	border: 1px solid black; */
}

.goToNotice > a{
	text-decoration: none;
	color: #666666;
}

#eventBannerDiv{
	width: 1200px;
	height: 300px;
	margin: 0px auto 30px auto;
  	border: 1px solid black;  
	text-align: center;
	line-height: 300px;
}

#recommendMealKitDiv{
	width: 900px;
	height: 300px;
	margin: auto;
	border: 1px solid black;
}

.recommendMealKitTitle{
	height: 50px;
	font-size: 16px;
	font-weight: bold;
}

.recommendMealKitContent{
	height: 50px;
	font-size: 16px;
	float: left;
}

.recommendMealKitContentImage{
	width: 200px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	float: left;
}

.recommendMealKitContentImage > a{
	width: 200px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	float: left;
}

.recommendMealKitContentName{
	width: 200px;
	height: 20px;
	font-weight: bold;
	text-align: center;
	float: left;
}

.recommendMealKitContentPrice{
	width: 200px;
	height: 20px;
	text-align: center;
	clear: both;
}

</style>

</head>
<body>
	<jsp:include page="../Header.jsp"/>
	
	<div id='mainPageNoticeAreaDiv'>
		<div class='noticeName'>
			<span><strong>공지사항</strong></span>
		</div>
		<div class='noticeTitle'>
		</div>
		<div class='noticeDate'>
		</div>
		<div class='goToNotice'>
			<a href="#"><strong>더보기</strong></a>
		</div>
	</div>
	
	<div id='eventBannerDiv'>
		<a href="#"><img alt="이벤트 이미지" src=""></a>
	</div>
	
	<div id='recommendMealKitDiv'>
		<div class='recommendMealKitTitle'>
			<span>추천 밀키트</span>
		</div>
		<div class='recommendMealKitContent'>
			<div>
				<div class='recommendMealKitContentImage'>
					<a href="#"><img alt="추천 밀키트 이미지 1" src=""></a>					
				</div>
				<div class='recommendMealKitContentName'>(상품명 1)</div>
				<div class='recommendMealKitContentPrice'>(가격 1)</div>
			</div>

			<div>
				<div class='recommendMealKitContentImage'>
					<a href="#"><img alt="추천 밀키트 이미지 2" src=""></a>					
				</div>
				<div class='recommendMealKitContentName'>(상품명 2)</div>
				<div class='recommendMealKitContentPrice'>(가격 2)</div>
			</div>

			<div>
				<div class='recommendMealKitContentImage'>
					<a href="#"><img alt="추천 밀키트 이미지 3" src=""></a>					
				</div>
				<div class='recommendMealKitContentName'>(상품명 3)</div>
				<div class='recommendMealKitContentPrice'>(가격 3)</div>
			</div>

			<div>
				<div class='recommendMealKitContentImage'>
					<a href="#"><img alt="추천 밀키트 이미지 4" src=""></a>					
				</div>
				<div class='recommendMealKitContentName'>(상품명 4)</div>
				<div class='recommendMealKitContentPrice'>(가격 4)</div>
			</div>
		</div>
		
	</div>
	<div id='newMealKitDiv'>
		<div class='newMealKitName'></div>
		<div class='newMealKitContent'>
		</div>
	</div>
	
	<jsp:include page="../Footer.jsp"/>
</body>
</html>