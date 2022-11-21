<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
