<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style type="text/css">
	#infoBox {
		text-align: center;
		width: 950px;
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
	


</style>
<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">

		
function checkInfoFnc() {
	var chkPwd = document.getElementById('chkPwd').value;
	var memberPwd = document.getElementById('memberPwd').value;
	console.log(chkPwd);
	console.log(memberPwd);
	if (chkPwd == ''){
		alert("비밀번호를 입력해주세요");
	}else if(chkPwd !== memberPwd) {
		alert("비밀번호를 확인해주세요");
	}else {
		location.href ='./memberUpdate.do';
	};
	
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
				<p>개인정보 변경을 하시려면 비밀번호를 입력해주세요</p>
				<p><input id='memberPwd' name="password" type="hidden" value="${_memberDto_.password}"></p>
				<p><input id='chkPwd'  type="password" placeholder="비밀번호 입력"></p>
				<p>
					<input type="button" value="입력" onclick="checkInfoFnc();">
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