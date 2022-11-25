<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">

#middleDiv{
	min-height: 650px;
}

#mainPageNoticeAreaDiv{
	margin: 40px auto 20px auto;
	width: 1200px;
	height: 30px;
/* 	background-color: lightgray; */
}

.noticeName{
	width: 100px;
	height: 30px;
	margin-left: 150px;
	font-size: 18px;
	float: left;
	text-align: center;
	line-height: 30px;
}

.noticeTitle{
	width: 550px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
}

.noticeDate{
	width: 150px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	text-align: center;
	float: left;
}

.goToNotice{
	width: 80px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
	text-decoration: none;
}

.goToNotice > a{
	text-decoration: none;
	color: #666666;
}

#eventBannerDiv{
	width: 1200px;
	height: 300px;
	margin: 0px auto 30px auto;
	text-align: center;
	line-height: 300px;
/* 	background-color: lightgray; */
}

#emptyEventList{
	font-size: 32px;
	font-weight: bold;
	text-align: center;"
}

#recommendProductDiv{
	width: 900px;
	height: 300px;
	margin: 0px auto 30px auto;
/* 	background-color: lightgray; */
}

.recommendProductTitle{
	height: 50px;
	font-size: 18px;
	font-weight: bold;
/* 	background-color: gray; */
}

#emptyProductList{
	margin: 0px;
	width: 900px;
	height: 250px;
	font-size: 32px;
	font-weight: bold;
	text-align: center;
	line-height: 300px;
}

.recommendProductContent{
	width: 225px;
	height: 250px;
	font-size: 16px;
	float: left;
}

.recommendProductContentImage > a{
	width: 225px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	float: left;
}

.recommendProductContentImage > a > img{
	width: 200px;
	height: 200px;
	text-align: center;
}
.recommendProductContentName{
	width: 225px;
	height: 20px;
	font-weight: bold;
	text-align: center;
	float: left;
}

.recommendProductContentPrice{
	width: 225px;
	height: 20px;
	text-align: center;
	float: left;
}

#newProductDiv{
	width: 900px;
	height: 300px;
	margin: 0px auto 30px auto;
/* 	background-color: lightgray; */
	float: left;
}

.newProductTitle{
	height: 50px;
	font-size: 18px;
	font-weight: bold;
/* 	background-color: gray; */
}

.newProductContent{
	width: 225px;
	height: 250px;
	font-size: 16px;
	float: left;
}

.newProductContentImage > a{
	width: 225px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	float: left;
}

.newProductContentImage > a > img{
	width: 200px;
	height: 200px;
	text-align: center;
}

.newProductContentName{
	margin-top: 10px;
	width: 225px;
	height: 20px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	float: left;
}

.newProductContentPrice{
	width: 225px;
	height: 20px;
	font-size: 12px;
	text-align: center;
	float: left;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
<div id='mainPageNoticeAreaDiv'>
			<div class='noticeName'>
				<span><strong>공지사항</strong></span>
			</div>
			<div class='noticeTitle'>
				바비요 오픈!
			</div>
			<div class='noticeDate'>
				2022-12-07
			</div>
			<div class='goToNotice'>
				<a href="#"><strong>더보기</strong></a>
			</div>
		</div>
		<div id='eventBannerDiv'>
			<c:choose>
				<c:when test="${empty eventList}">
					<p id='emptyEventList'>
						이벤트가 존재하지 않습니다. 빠른 시일 내로 준비하겠습니다!
					</p>
				</c:when>
				<c:otherwise>
					<a href="#"><img alt="이벤트 이미지" src=""></a>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id='recommendProductDiv'>
			<div class='recommendProductTitle'>
				<span>추천 밀키트</span>
			</div>
			<div class='recommendProductContent'>
			<div>
				<c:choose>
					<c:when test="${empty productList}">
						<p id='emptyProductList'>
							등록된 밀키트가 없습니다.
						</p>
					</c:when>
					<c:otherwise>
						<c:forEach var="productDto" items="${productList}"> 
							<div class='recommendProductContent'>
								<div class='recommendProductContentImage'>
								
									<a href="#"><img alt="추천 밀키트 이미지 " src=""></a>					
								</div>
								<div class='recommendProductContentName'>
									${productDto.name}
								</div>
								<div class='recommendProductContentPrice'>>
									<fmt:formatNumber value="${productDto.price}" pattern="###,###,###" />
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div id='newProductDiv'>
			<div class='newProductTitle'>
				<span>신상 밀키트</span>
			</div>
			<c:choose>
				<c:when test="${empty newProductList}">
					<p id='emptyProductList'>
						등록된 밀키트가 없습니다.
					</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="product" items="${newProductList}"> 
						<div class='newProductContent'>
							<div class='newProductContentImage'>
								<a href="#"><img alt="${product.productDto.name}" 
									src="/babiyo/img/${product.imgMap.STORED_NAME}"></a>					
							</div>
							<div class='newProductContentName'>
								${product.productDto.name}
							</div>
							<div class='newProductContentPrice'>
								<fmt:formatNumber value="${product.productDto.price}" pattern="#,###"/> 원
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>		

		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>