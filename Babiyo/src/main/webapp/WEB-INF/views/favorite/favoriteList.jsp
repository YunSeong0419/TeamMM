<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
				
			<div>
				<input type="checkbox">전체선택	
			</div>
				
			<div>
			<c:choose>
				<c:when test="${!empty productList}">
					<c:forEach items="${productList}">
						<div>
							<img alt="사진을 찾을 수 없습니다" src="./a.jpg">
							
							<span></span>
							<input type="checkbox">
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					즐겨찾기가 없습니다
				</c:otherwise>
			</c:choose>
			</div>
			<div>
				<input type="button" value="장바구니 담기">
				<input type="button" value="선택 삭제">
			</div>
				
			<jsp:include page="/WEB-INF/views/Paging.jsp"/>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>