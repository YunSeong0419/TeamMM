<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id='verticalSideMenuBarArea'>
 	<c:choose>
		<c:when test="${_memberDto_.grade eq 1}">
			<div id='verticalSideManagerMenuBar'>
				<div><a id='managerInfo' href="#">관리자</a></div>
				<div><a id='memberManagement' href="#">회원 관리</a></div>
				<div><a id='mealkitManagement' href="/babiyo/product/list.do">밀키트 관리</a></div>
				<div><a id='orderManagement' href="/babiyo/admin/orderList.do">주문 관리</a></div>
				<div><a id='salesManagement' href="#">매출 관리</a></div>
				<div><a id='reviewManagement' href="#">리뷰 관리</a></div>
				<div><a id='noticeManagement' href="/babiyo/notice/list.do">공지 관리</a></div>
				<div><a id='inquiryManagement' href="/babiyo/inquiry/admin.do">문의 관리</a></div>
				</div>
			</c:when>
			
			<c:otherwise>
				<div id='verticalSideMemberMenuBar'>
					<div><a id='memberInfo' href="#">내 정보</a></div>
					<div><a id='memberOrderList' href="/babiyo/member/orderList.do">주문내역</a></div>
					<div><a id='memberReviewList' href="#">내 리뷰</a></div>
					<div><a id='memberInquiryList' href="/babiyo/inquiry/member.do">내 문의</a></div>
					<div><a id='memberShoppingCart' href="/babiyo/cart/cartView.do">장바구니</a></div>
					<div><a id='memberBookmark' href="/babiyo/favorite/favoriteView.do">즐겨찾기</a></div>
					<div><a id='memberCash' href="#">밀캐시</a></div>
				</div>
 			</c:otherwise>
 	</c:choose>
</div>
