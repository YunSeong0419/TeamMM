<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">




</script>

<div id='verticalSideMenuBarArea'>
 	<c:choose>
		<c:when test="${_memberDto_.grade eq 1}">
			<div id='verticalSideManagerMenuBar'>
				<div><a id='managerInfo' href="/babiyo/admin/adminHome.do">관리자</a></div>
				<div><a id='memberManagement' href="#">회원 관리</a></div>
				<div><a id='mealkitManagement' href="/babiyo/product/adminList.do">밀키트 관리</a></div>
				<div><a id='orderManagement' href="/babiyo/admin/orderList.do">주문 관리</a></div>
				<div><a id='salesManagement' href="/babiyo/admin/sales.do">매출 관리</a></div>
				<div><a id='reviewManagement' href="/babiyo/admin/review/adminList.do">리뷰 관리</a></div>
				<div><a id='noticeManagement' href="/babiyo/notice/list.do">공지 관리</a></div>
				<div><a id='inquiryManagement' href="/babiyo/inquiry/admin.do">문의 관리</a></div>
				</div>
			</c:when>
			
			<c:otherwise>
				<div id='verticalSideMemberMenuBar'>
					<div><a id='memberInfo' href="/babiyo/member/memberInfo.do">내 정보</a></div>
					<div><a id='memberOrderList' href="/babiyo/member/orderList.do">주문내역</a></div>
					<div><a id='memberReviewList' href="/babiyo/review/myReview.do">내 리뷰</a></div>
					<div><a id='memberInquiryList' href="/babiyo/inquiry/member.do">내 문의</a></div>
					<div><a id='memberShoppingCart' href="/babiyo/cart/cartView.do">장바구니</a></div>
					<div><a id='memberBookmark' href="/babiyo/favorite/favoriteView.do">즐겨찾기</a></div>
				</div>
 			</c:otherwise>
 	</c:choose>
</div>
