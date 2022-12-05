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
		width: 800px;
		text-align: center;
	}
	#btnWrap{
	margin: auto;
	}
	table {
	text-align: center;
	margin-left: 300px;
	border: 1px solid black;
	border-radius: 12px;
	padding: 50px;
}
	input{
	width: 10%;
	}
	


</style>
<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">

function moveChargeFnc() {
	location.href ='../cash/chargeCash.do';
}

function moveBackFnc() {
	location.href ='../member/memberInfo.do';
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
							<th>${_memberDto_.id}님의 보유 밀캐시</th>
						</tr>
						<tr>
							<td>${_memberDto_.cash}원</td>
						</tr>
					</table>
					<div id='btnWrap'>	
						<p>
						<input type="button" id="charge" value="충전" onclick='moveChargeFnc();'>
						<input type="button" value="뒤로 가기" onclick="moveBackFnc();">	
						</p>
					</div>	
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