<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작화면</title>
</head>
<body>


현재 세션 id: 
<c:choose>
	<c:when test="${empty _memberDto_}">
		세션없음
	</c:when>
	<c:otherwise>
	 	${_memberDto_.id}
	</c:otherwise>
</c:choose>

<form action="./testLogin.do" method="post">
<input type="text" name="memberId">
</form>

<c:choose>
<c:when test="${empty _memberDto_}">
	<a href="./testLogin.do?memberId=admin">admin</a>
	<a href="./testLogin.do?memberId=dong">dong</a>
</c:when>
<c:otherwise>
<ol>
	<c:choose>
	<c:when test="${_memberDto_.grade eq 1}">
	<li><a href="./product/list.do">관리자 상품목록</a></li>
	
	<li><a href="./admin/orderList.do">관리자 주문 목록</a></li>
	
	<li><a href="./inquiry/admin.do">관리자 문의 목록</a></li>
	
	<li><a href="./notice/list.do">관리자 공지 목록</a></li>
	</c:when>

	<c:otherwise>
	<li><a href="./cart/cartView.do">장바구니</a></li>
	
	<li><a href="./favorite/favoriteView.do">즐겨찾기</a></li>
	
	<li><a href="./member/orderList.do">회원 주문 목록</a></li>
	
	<li><a href="./inquiry/member.do">회원 문의 목록</a></li>
	
	<li><a href="./notice/list.do">회원 공지 목록</a></li>
	</c:otherwise>

	</c:choose>
</ol>
</c:otherwise>

</c:choose>






</body>
</html>