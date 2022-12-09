<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 모음</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
.reviewCollectionTitle{
	width: 900px;
 	height: 68px;
	margin: auto;
	line-height: 68px;
}

.reviewCollectionTitle > p{
	color: #4A4A4A;
	padding: 10px 10px;
	margin: 0px auto;
	font-size: 22px;
	font-weight: bold;
	text-align: left;
	text-decoration: none;
}

.lowerDivisionLine{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF9436;
	height: 2px;
}

.reviewCollectionList{
	width: 900px;
	height: 250px;
	margin: 0px auto;
}

.productInfo{
	width: 150px;
	height: 250px;
	float: left;
}

.productImage{
	margin-top: 20px;
	width: 150px;
	height: 150px;
	text-align: center;
}

.productImage img{
	width: 150px;
	height: 150px;
	border-radius: 10px;
}

.productImage > a{
	margin: auto;
	width: 100px;
	height: 100px;
	text-align: center;
}

.productName{
	margin-top: 20px;
	width: 150px;
	height: 20px;
	font-weight: bold;
	text-align: center;
}

.userEvaluation{
	padding-top: 20px;
	width: 700px;
	height: 150px;
	margin-left: 10px;
	float: left;
}

.nickname{
	margin-left: 20px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
	line-height: 30px;
	float: left;	
}

.starRating{
	display: inline-block;
	margin-top: 4px;
	margin-left: 30px;
	width: 100px;
}

.starRating, .starRating > span{
	display: inline-block;
	height: 20px;
/* 	overflow: hidden; */
/* 	background: url("/babiyo/resources/img/star.png")no-repeat; */
/* 	background-size: 120px 42px; */
}

.starRating > span{
	width: 20px;
	vertical-align: top;
}

.reportingDate{
	display: inline-block;
	width: 200px;
}

.reviewContent{
	margin-top: 10px;
	margin-left: 20px;
	font-size: 14px;
	width: 700px;
	min-height: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	line-height: 1.4;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
}

.userUploadImage{
	margin: 10px 0px 10px 30px;
	width: 700px;
	height: 100px;
	float: left;
}

.userUploadImage > a{
	width: 100px;
	height: 100px;
	margin-right: 20px;
	float: left;
}
.userUploadImage > a > img{
	width: 100px;
	height: 100px;
}

#lowerButtonDiv{
	margin-top: 10px;
	width: 1200px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}


#lowerButton{
	margin: 0px;
	border: 0px;
	width: 100px;
	height: 40px;
	background-color: #FF9436;
	border-radius: 5px;
	font-size: 16px;
}

.reviewCollectionList {
    display: none;
}

.reviewCollectionList.active {
    display: block;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<script type="text/javascript">
	$(window).on('load', function () {
		load('.reviewCollectionList', '4');
	    $('#lowerButton').on('click', function () {
	        load('.reviewCollectionList', '4', '#lowerButtonDiv');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var reviewList = id + ".reviewCollectionList:not(.active)";
	    var reviewLength = $(reviewList).length;
	    var reviewTotalCount;
	    
	    if (cnt < reviewLength) {
	    	reviewTotalCount = cnt;
	    } else {
	    	reviewTotalCount = reviewLength;
	        $('#lowerButton').hide();
	    }
	    $(reviewList + ":lt(" + reviewTotalCount + ")").addClass("active");
	}
</script>
</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
		<div class='reviewCollectionTitle'>
			<p>따끈따끈한 최신 리뷰를 확인해 보아요.</p>
		</div>
		
		<hr class='lowerDivisionLine' />		
		
		<c:forEach items="${reviewCollectionList}" var="review">
		<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src="/babiyo/img/${review.productImg}"></a>
				</div>				
				<div class='productName'>${review.productName}</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>${review.nickname}</div>
				<div class='starRating'>평점 <span>${review.starRating}</span> 점</div>
				<div class='reportingDate'>
				<fmt:formatDate value="${review.createDate}" pattern="yyyy-MM-dd a hh:mm:ss"/> 
				</div>
				<div class='reviewContent'>${review.content}</div>
			</div>
			<div class='userUploadImage'>
				<c:if test="${!empty review.reviewImg}">
					<a href="#"><img alt="밀키트 이미지 " src="/babiyo/img/${review.reviewImg}"></a>
				</c:if>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
		</c:forEach>
		
		
		
		<div id='lowerButtonDiv'>
			<input type="button" value="더보기" id='lowerButton'>
		</div>

		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>