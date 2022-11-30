<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>

<style type="text/css">
#wrapper {
	height: 680px;
	min-height: 100%;
}

#titleForm {
	text-align: center;
	width: 300px;
	margin: 0 auto;
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

#boxSizeAjdust1 {
	width: 300px;
	height: 40px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 20px;
}

#boxSizeAjdust2 {
	width: 300px;
	height: 40px;
	font-size: 16px;
	cursor: pointer;
	margin-bottom: 20px;
}

#loginBtnSizeAjdust {
	width: 150px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	background-color: orange;
	color: #fff;
	border: none;
	border-radius: 8px;
	margin-bottom: 5px;
}

#memberAddBtn {
	width: 150px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	background-color: orange;
	color: #fff;
	border: none;
	border-radius: 8px;
	margin-bottom: 5px;
}

#alertMessage {
	font-size: 14px;
	color: #FF003E;
	text-align: left;
}

.categoryVerticalLine {
	display: inline-block;
	border-left: 1px solid #A0A0A0;
	height: 10px;
}
</style>

</head>

<body>

	<jsp:include page="../LoginHeader.jsp" />

	<div id='wrapper'>

		<div>
			<h3
				style="text-align: center; margin-bottom: 200px; border-top: 10px; border-top-color: gray;">로그인</h3>
		</div>
		<div id='titleForm'>

			<div>
				<ul id='loginMethodList'>
					<li><a style="border-right: 1px; border-right-color: grey;"
						href="./findId">아이디 찾기</a></li>
					<div class='categoryVerticalLine'></div>
					<li><a href="./singleUsePwd.jsp">비밀번호 찾기</a></li>
				</ul>
			</div>

			<div>
				<form action="./loginCtr.do" method="post">
					<input type="text" name="id" id="boxSizeAjdust1" placeholder="아이디">
					<br> <input type="password" name="password"
						id="boxSizeAjdust2" placeholder="비밀번호">
					<div>
						<input type="submit" id="loginBtnSizeAjdust" value="로그인"
							style="float: left">
						<a href = "./member/add.do">
							<input type="button" id="memberAddBtn" value="회원가입">
						</a>
					</div>
				</form>
			</div>

			<div style="margin-top: 5px; text-align: left;">
				<label for="together"
					style="font-size: 14px; color: #888; cursor: pointer;"> <input
					type="checkbox" id="together">아이디 저장
				</label>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<br> <br>


		</div>
	</div>

	<jsp:include page="../Footer.jsp" />

</body>
</html>