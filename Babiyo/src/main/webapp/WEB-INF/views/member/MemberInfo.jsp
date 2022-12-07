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
	#modifyDate{
	margin-top: 100px;
	margin-bottom: 100px;
	
	}
	
	table {
	width: 500px;
	margin: auto;
	border-collapse: collapse;
	}
	
	tr {
		border: 1px solid black;
	}
	
	th {
	border: 1px solid black;
	background: orange;
	color: white;
	padding: 10px;
	margin: auto;
	}
	
	
	td {
	border: 1px solid black;
	padding: 10px;
	margin: auto;
	}
	
	.button{
	width: 120px;
	height: 40px;
	font-size: 17px;
	font-weight: bold;
	background-color: #FF9436;
	color: #fff;
	border: none;
	border-radius: 8px;
	}


</style>
<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">

function moveChargeFnc() {
	location.href ='../cash/chargeCash.do';
};

function updateInfoFnc() {
	location.href ='./checkInfo.do';
};

function deleteInfoFnc() {
	location.href ='./delete.do';
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
			<div id="middleDiv">
				<!--여기서 작성 -->
				<div id='infoBox'>
					<table>
						<tr>
							<th>주문횟수</th><th>문의</th><th>내가 쓴 리뷰</th><th>캐쉬</th>
						</tr>
						<tr>
							<td>건</td><td>건</td><td>건</td><td><a href="./memberCash.do">${_memberDto_.cash}원</a></td>
						</tr>
					</table>
				<div id="modifyDate">		
					<p>최근 정보 수정일</p>
					<p><fmt:formatDate value="${_memberDto_.modifyDate}" pattern="yyyy년MM월dd일  a hh:mm"  /></p>
				</div>
				<p>
					<input type="button" class="button" value="내 정보 수정" onclick="updateInfoFnc();">
					<input type="button" class="button" value="회원 탈퇴" onclick="deleteInfoFnc();">
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