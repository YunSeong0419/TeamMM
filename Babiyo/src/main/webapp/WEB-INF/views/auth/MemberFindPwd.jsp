<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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

h3 {
	text-align: left;
	margin-bottom: 0px;
	margin-top: 40px;
}

#email {
	width: 300px;
	padding: 0px;
	margin: 0px;
	border: 1px solid grey;
	border-radius: 5px;
	height: 30px;
}

#findBtn {
	width: 100%;
	height: 35px; border : none;
	border-radius: 5px; background : grey;
	color: white;
	background: grey;
	border: none;
}

#emailChk {
	margin-bottom: 100px;
}
</style>

<script type="text/javascript">
	function findPwdFnc() {
		location.href = './findPwd.do';
	};
	function findIdFnc() {
		location.href = './findId.do';
	};
window.onload = function () {
	var emailObj = document.getElementById('email');
	var emailChkObj = document.getElementById('emailChk');
	
	emailObj.addEventListener('keyup',function(e) {
			let emailRull = RegExp(/^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/);
			if (emailObj.value == '') {
				emailChkObj.innerHTML = '이메일을 입력해주세요';
				emailChkObj.style.color = 'orange';
			} else if (emailRull.test(emailObj.value) == false) {
				emailChkObj.innerHTML = '이메일 형식이 올바르지 않습니다';
				emailChkObj.style.color = 'orange';
			} else {var email = $('#email').val(); //id값이 "email"인 입력란의 값을 저장
					$.ajax({
						url : './member/emailCheckCtr.do', //Controller에서 요청 받을 주소
						type : 'post', //POST 방식으로 전달
						data : {email : email},
						success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
							if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 이메일
								emailChkObj.innerHTML = '탈퇴했거나 가입하지 않은 이메일 입니다';
								emailChkObj.style.color = 'orange';
							} else { // cnt가 1일 경우 -> 이미 가입된 이메일
								emailChkObj.innerHTML = '';
								}
							},
							error : function() {
							console.log(email);
										}
									});
						}
					});
};
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

			<input id='findId' type="button" value='아이디 찾기' onclick='findIdFnc();'> <input
				id='findPwd' type="button" value='비밀번호 찾기' onclick="findPwdFnc();">
			<h3>이메일</h3>
			<input type="text" id="email" name='email' placeholder="이메일을 입력하세요">
			<p id="emailChk"></p>
			<input id="findBtn" type="button" value="찾기">
		</div>
	</div>
</body>
</html>