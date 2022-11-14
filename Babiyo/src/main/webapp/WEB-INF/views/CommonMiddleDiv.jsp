<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">

#middleSideDiv{
	padding: 0px;
	margin: 0px auto;
	width: 1200px;
	min-height: 650px;
/* 	background-color: lightgreen; */
}

hr{
	margin: 0px;
	border: 0px;
	background-color: #FF5E00;
	height: 2px;
}

#verticalSideMenuBarArea{
	width: 148px;
	padding-top: 28px;
 	min-height: 620px;
 	border-right: 2px solid #FF5E00;
/* 	background-color: lightblue; */
	float: left;
}

#verticalSideManagerMenuBar, #verticalSideMemberMenuBar > div{
	height: 50px; 
	text-align: center; 
}

#verticalSideManagerMenuBar, #verticalSideMemberMenuBar > div > a{
	color: #4A4A4A;
	font-size: 18px;
	font-weight: bold;
	line-height: 50px;
	text-decoration: none;
}

#contentTitle{
	width: 1050px;
 	height: 72px;
	margin: 0px;
	padding-top: 28px;
	line-height: 50px;
 	float: left;
/* 	background-color: lightgray;	 */
}

#contentTitle > p{
	padding-left: 40px;
	margin: 0px;
	font-size: 22px;
	font-weight: bold;
	text-align: left;
}

</style>

<!-- 밑 div를 닫으면 컨텐츠가 몸통 밑으로 들어가게 됨. 푸터 시작에서 닫음. -->
<div id='middleSideDiv'>
<hr />
	<div id='verticalSideMenuBarArea'>
	 	<c:choose>
			<c:when test="${mname eq admin}">
				<div id='verticalSideManagerMenuBar'>
					<div><a id='managerInfo' href="#">관리자</a></div>
					<div><a id='memberManagement' href="#">회원 관리</a></div>
					<div><a id='mealkitManagement' href="#">밀키트 관리</a></div>
					<div><a id='orderManagement' href="#">주문 관리</a></div>
					<div><a id='salesManagement' href="#">매출 관리</a></div>
					<div><a id='reviewManagement' href="#">리뷰 관리</a></div>
					<div><a id='noticeManagement' href="#">공지 관리</a></div>
					<div><a id='inquiryManagement' href="#">문의 관리</a></div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div id='verticalSideMemberMenuBar'>
						<div><a id='memberInfo' href="#">내 정보</a></div>
						<div><a id='memberOrderList' href="#">주문내역</a></div>
						<div><a id='memberReviewList' href="#">내 리뷰</a></div>
						<div><a id='memberInquiryList' href="#">내 문의</a></div>
						<div><a id='memberShoppingBasket' href="#">장바구니</a></div>
						<div><a id='memberBookmark' href="#">즐겨찾기</a></div>
						<div><a id='memberCash' href="#">밀캐시</a></div>
					</div>
	 			</c:otherwise>
	 	</c:choose>
	</div>
	
	<div id='contentTitle'></div>
