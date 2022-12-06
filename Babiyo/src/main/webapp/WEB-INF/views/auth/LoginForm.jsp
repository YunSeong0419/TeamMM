<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

html, body{
	margin: 0;
	padding: 0;
}

body{
}

#wrapper {
	width: 400px;
	min-height: 100%;
	margin: 0px auto;
	background-color: #fff;
}

#titleContainer{
	margin-top: 50px;
	text-align: center;
}

#titleForm {
	text-align: center;
	width: 300px;
	margin: 40px auto 0px;
}


#loginMethodList {
	font-size: 10px;
	text-align: right;
}

#loginMethodList>li {
	display: inline-block;
}

#loginMethodList>li>a {
	text-decoration: none;
	color: #333333;
}

#otherLoginMethodList {
	display: inline-block;
	font-size: 14px;
	color: #888;
	text-decoration: none;
	text-align: center;
}

#otherLoginMethodList>li {
	display: inline-block;
	font-size: 14px;
	color: #888;
	text-decoration: none;
	text-align: center;
}

#otherLoginMethodList>li>a {
	display: inline-block;
	font-size: 14px;
	color: #888;
	text-decoration: none;
}

#verticalLine {
	display: inline-block;
	border-left: 1px solid #A0A0A0;
	height: 10px;
}

#idBox {
	width: 300px;
	height: 40px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 20px;
}

#pwdBox {
	width: 300px;
	height: 40px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 40px;
}



#loginBtn,#memberAddBtn {
	width: 120px;
	height: 40px;
	font-size: 17px;
	font-weight: bold;
	background-color: #FF9436;
	color: #fff;
	border: none;
	border-radius: 8px;
}

#alertMessage {
	font-size: 14px;
	color: #FF003E;
	text-align: left;
}

</style>

</head>

<body>

	<div id='wrapper'>
		
		<jsp:include page="/WEB-INF/views/LoginHeader.jsp"/>

		<div id="titleContainer">
			<h1>로그인</h1>
		</div>
		
		<div id='titleForm'>
			<div>
				<ul id='loginMethodList'>
					<li><a style="border-right: 1px; border-right-color: grey;"
						href="./findId.do">아이디 찾기</a></li>
					<li id='verticalLine'></li>
					<li><a href="./findPwd.do">비밀번호 찾기</a></li>
				</ul>
			</div>

			<div>
				<form action="./loginCtr.do" method="post">
				
					<input type="text" name="id" id="idBox" placeholder="아이디">
					<br> 
					<input type="password" name="password" id="pwdBox" placeholder="비밀번호">
						
					<div>
						<input type="submit" id="loginBtn" value="로그인">
						<input type="button" id="memberAddBtn" value="회원가입"
							onclick="location.href='./member/add.do'">
					</div>
					
				</form>
			</div>
		</div>
		
	</div>

</body>
</html>