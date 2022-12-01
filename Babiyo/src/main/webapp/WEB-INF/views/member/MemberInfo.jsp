<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${_memberDto_.id}님 어서오세요</title>
<style type="text/css">
	#infoBox {
		text-align: center;
		width: 950px;
	}
	
	table {
	border: 1px solid black;
	border-radius: 12px;
	margin: auto;
	}
	
	th {
	border-collapse: collapse;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	}
	
	td {
	margin-top: 20px;
	}
	


</style>
<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">

function moveChargeFnc() {
	location.href ='../cash/chargeCash.do';
}



</script>


</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
			<div id="middleDiv">
				<!--여기서 작성 -->
				<div id='infoBox'>
					<table>
						<tr>
							<th>주문횟수</th><th>문의</th><th>내가 쓴 리뷰</th><th>즐겨찾기</th><th>캐쉬</th>
						</tr>
						<tr>
							<td>건</td><td>건</td><td>건</td><td>개</td><td><a href="./memberCash.do">${_memberDto_.cash}원</a></td>
						</tr>
					</table>	
				
				<p>
					<input type="button" value="내 정보 수정" onclick="updateInfoFnc();">
					<input type="button" value="회원 탈퇴" onclick="deleteInfoFnc();">
				</p>
				</div>
				<div id="underPadding"></div>
				
			</div>
		
		
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>