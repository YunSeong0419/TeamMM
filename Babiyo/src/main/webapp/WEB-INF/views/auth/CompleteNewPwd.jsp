<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">
#header {
	margin: auto;
	width: 400px;
	border-bottom: 1px solid grey;
	text-align: center;
}

h2 {
	text-align: center;
}

#bodyDiv {
	width: 300px;
	text-align: center;
	margin: auto;
	margin-top: 100px;
}

#findId {
	width: 50%;
	margin-top: 20px;
	padding: 10px; border : none;
	border-top-left-radius: 10px;
	background: grey;
	color: white;
	font-size: 20px;
	text-align: center;
	float: left;
	border: none;
}

#findPwd {
	width: 50%;
	margin-top: 20px;
	padding: 10px; border : none;
	border-top-right-radius: 10px;
	background: orange;
	color: white;
	font-size: 20px;
	text-align: center;
	border: none;
}

a{
	color: orange;
}

h3 {
	text-align: left;
	margin-bottom: 0px;
	margin-top: 65px;
}





#infoDiv{
	height: 150px;
}
#yourId{
	text-align: center;
}

#loginBtn{
	width: 100%;
	height: 35px; border : none;
	border-radius: 5px; background : grey;
	color: white;
	background: orange;
	border: none;

}


</style>

<script type="text/javascript">

	function goFindIdFnc() {
		location.href = './findId.do';
	}
	function goFindPwdFnc() {
		location.href = './findPwd.do';
	};
	function goLoginFnc() {
		location.href = './login.do';
	}
</script>

</head>

<body>
	<div id='wrap'>
		<div id='header'>
			<h1>
				<a href="../auth/login"> <img
					style="width: 150px; height: 60px;"
					src="/babiyo/resources/img/logo.png">
				</a>
			</h1>
		</div>
		<h2>아이디 찾기</h2>
		<div id='bodyDiv'>

			<input id='findId' type="button" value='아이디 찾기' onclick='goFindIdFnc();'> <input
				id='findPwd' type="button" value='비밀번호 찾기' onclick="goFindPwdFnc();">
				<h3></h3>
				<div id='infoDiv'>
					<p id="yourId">비밀번호가 변경되었습니다</p>
				</div>
				<div id='lowerButtonDiv'>
					<input id="loginBtn" type="button" value="로그인" onclick="goLoginFnc();">
				</div>
		</div>
	</div>
</body>
</html>