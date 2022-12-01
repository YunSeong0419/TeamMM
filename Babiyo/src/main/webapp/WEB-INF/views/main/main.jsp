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
#mainPageNoticeAreaDiv{
	margin: 40px auto 20px auto;
	width: 1200px;
	height: 30px;
}

#emptyMainNoticeList{
	font-size: 32px;
	font-weight: bold;
	text-align: center;
}

#noticeName{
	width: 100px;
	height: 30px;
	margin-left: 150px;
	font-size: 18px;
	float: left;
	text-align: center;
	line-height: 30px;
}

#noticeTitle{
	width: 550px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
}

#noticeDate{
	width: 150px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	text-align: center;
	float: left;
}

#goToNotice{
	width: 80px;
	height: 30px;
	padding-left: 30px;
	line-height: 30px;
	font-size: 14px;
	float: left;
	text-decoration: none;
}

#goToNotice > a{
	text-decoration: none;
	color: #666666;
}

#eventBannerDiv{
	width: 1200px;
	height: 300px;
	margin: 0px auto 30px auto;
	text-align: center;
	line-height: 300px;
}

#emptyEventList{
	font-size: 32px;
	font-weight: bold;
	text-align: center;
}

#emptyProductList{
	margin: 0px;
	width: 900px;
	height: 250px;
	font-size: 32px;
	font-weight: bold;
	text-align: center;
	line-height: 250px;
}

#emptyInterestList{
	margin-top: 50px;
	width: 900px;
	height: 250px;
	font-size: 32px;
	font-weight: bold;
	text-align: center;
	line-height: 50px;
}

#emptyInterestList > p > input{
	border: 0px;
	font-size: 20px;
	color: #FF5E00;  
	background-color: transparent;
	cursor: pointer;
}

.productDiv{
	width: 900px;
	height: 300px;
	margin: 0px auto 30px 150px;
	float: left;
}

.productTitle{
	margin-left: 15px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;

}

.productContentDiv{
	width: 900px;
	height: 250px;
	margin: 0px auto 30px auto;
		float: left;
}

.productContent{
	width: 225px;
	height: 250px;
	font-size: 16px;
	float: left;
}

.productContentImage > a{
	width: 225px;
	height: 200px;
	text-align: center;
	line-height: 200px;
	float: left;
}

.productContentImage > a > img{
	width: 200px;
	height: 200px;
	text-align: center;
}

.productContentName{
	margin-top: 10px;
	width: 225px;
	height: 20px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	float: left;
}

.productContentPrice{
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
			<div id='noticeName'>
				<span><strong>공지사항</strong></span>
			</div>
			<c:choose>
				<c:when test="${empty noticeDto}">
					<p id='emptyMainNoticeList'>
						공지가 없습니다.
					</p>
				</c:when>
				<c:otherwise>
					<div id='noticeTitle'>
						<a href="/babiyo/notice/detail.do?no=${noticeDto.no}">
							${noticeDto.title}</a>
					</div>
					<div id='noticeDate'>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${noticeDto.createDate}" />
					</div>
				</c:otherwise>
			</c:choose>
			<div id='goToNotice'>
				<a href="/babiyo/notice/list.do"><strong>더보기</strong></a>
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
		
		<div class='productDiv'>
			<div class='productTitle'>
				<span>추천 밀키트</span>
			</div>
			<div class='productContentDiv'>
				<c:choose>
					<c:when test="${empty recommendProductList}">
						<form action='/babiyo/auth/member/addInterest.do' method='get'>
							<div id='emptyInterestList'>
								<p>
									관심사를 등록해 주시면 밀키트를 추천해 드려요!<br />
									<input type="submit" value='관심사 등록하러 가기'>
								</p>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<c:forEach var="recommend" items="${recommendProductList}"> 
							<div class='productContent'>
								<div class='productContentImage'>
									<a href="/babiyo/product/memberDetail.do?productNo=${recommend.productDto.no}">
									<img alt="${recommend.productDto.name}" 
										src="/babiyo/img/${recommend.imgMap.STORED_NAME}"></a>
								</div>
								<div class='productContentName'>
									${recommend.productDto.name}
								</div>
								<div class='productContentPrice'>
									<fmt:formatNumber value="${recommend.productDto.price}" 
										pattern="#,###"/> 원
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class='productDiv'>
			<div class='productTitle'>
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
						<div class='productContent'>
							<div class='productContentImage'>
								<a href="/babiyo/product/memberDetail.do?productNo=${product.productDto.no}">
								<img alt="${product.productDto.name}" src="/babiyo/img/${product.imgMap.STORED_NAME}"></a>
							</div>
							<div class='productContentName'>
								${product.productDto.name}
							</div>
							<div class='productContentPrice'>
								<fmt:formatNumber value="${product.productDto.price}" pattern="#,###"/> 원
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>