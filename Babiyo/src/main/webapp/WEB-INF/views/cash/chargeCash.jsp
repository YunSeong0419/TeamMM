<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목입력해주세요</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">

function inputMoney() {
	
	$('#selfInput').val($('#selfIn').val());
	
};


</script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			<!--여기서 작성 -->
		
			
			
			<form id='memberDetailForm' action="./chargeCashCtr.do" method="post">
					<input type="hidden" name="id" value="${_memberDto_.id}">
					<table>
						<tr>
							<th>충전금액</th><th>상세설명</th><th>가입일</th><th></th>
						</tr>
						<tr>
							<td>
							<input type="radio" name="cash" value="5000">5000원
							</td>
						</tr>
						<tr>
							<td>
							<input type="radio" name="cash" value="10000">10000원
							</td>
						</tr>
						<tr>
							<td>
							<input type="radio" name="cash" value="20000">20000원
							</td>
						</tr>
						<tr>
							<td>
							<input type="radio" name="cash" value="50000">50000원
							</td>
						</tr>
						<tr>
							<td>
							<input type="radio" name="cash" value="100000">100000원
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="selfInput" name="cash" value="">
								<input type="number" id="selfIn" min="1" max="1000000"
								 onchange="inputMoney();">
							</td>
						</tr>
						<tr>
							<td>
							<input type="submit" value="충전하기">
							<input type="button" value="뒤로가기">
							</td>
						</tr>
					</table>
				</form>
		
		
		
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>