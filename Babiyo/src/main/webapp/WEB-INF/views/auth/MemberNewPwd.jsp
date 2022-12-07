<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 </title>
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
	height: 400px;
	text-align: center;
	margin: auto;
	margin-top: 100px;
}

form{
	height: 200px;
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
	.name {
	text-align: left;
	margin-bottom: 0px;
	margin-top: 40px;
}
.pwd {
	width: 298px;
	padding: 0px;
	margin: 0px;
	border: 1px solid grey;
	border-radius: 5px;
	height: 30px;
}

.check{
	text-align: left;

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

#infoDiv{
	height: 250px;
}
#lowerButtonDiv{
	
}
</style>

<script type="text/javascript">
	function goFindPwdFnc() {
		location.href = './findPwd.do';
	};
	function goFindIdFnc() {
		location.href = './findId.do';
	};
window.onload = function () {
	var pwdObj = document.getElementById('password');
	var pwdChkObj = document.getElementById('Pwd');
	var findBtnObj = document.getElementById('findBtn');
	var pwdSameObj = document.getElementById('chkPwd');
	var pwdDoubleObj = document.getElementById('checkPwd');
	var chk1 = false;
	var chk2 = false;
	var chk3 = false;
	
	findBtnObj.addEventListener('click', function(e) {
		var form = document.forms;
		if (chk1 == true && chk2 == true && chk3 == true) {
			form[0].submit();
		}else {
			event.preventDefault();
		}
			
	});
	
	function clear() {
		if (pwdObj.value == pwdSameObj.value && pwdObj.value != '' && pwdSameObj.value != ''
			 && chk1 == true && chk2 == true) {
			chk3 = true;
			findBtnObj.style.background = 'orange';
		}else{
			chk3 = false;
			findBtnObj.style.background = 'grey';
		};
	}
	pwdObj.addEventListener('keyup', function() {
		var spObj = /[`~!@#$%^&*|\\\";:\/?]/;
		var check_eng = /[a-zA-Z]/;
		if (pwdObj.value == '') {
			chk1 = false;
			pwdChkObj.style.color = 'orange';
			pwdChkObj.innerHTML = '새로운 비밀번호를 입력해주세요';
			findBtnObj.style.background = 'grey';
		}else if (pwdObj.value.length < 8 || 
				 !spObj.test(pwdObj.value) || !check_eng.test(pwdObj.value)) {
			chk1 = false;
			pwdChkObj.style.color = 'orange';
			pwdChkObj.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
			findBtnObj.style.background = 'grey';
		}else {
			chk1 = true;
			pwdChkObj.innerHTML = '';
			clear();
		}
		
	});
	
	pwdSameObj.addEventListener('keyup', function() {
		if (pwdObj.value == '') {
			chk2 = false;
			pwdDoubleObj.style.color = 'orange';
			pwdDoubleObj.innerHTML = '비밀번호를 입력해주세요';
			findBtnObj.style.background = 'grey';
		}else if (pwdObj.value !== pwdSameObj.value) {
			chk2 = false;
			pwdDoubleObj.style.color = 'orange';
			pwdDoubleObj.innerHTML = '비밀번호가 일치하지 않습니다';
			findBtnObj.style.background = 'grey';
		}else{
			chk2 = true;
			pwdDoubleObj.innerHTML = '';
			clear();
		}
		
	});
}



</script>

</head>

<body>
	<div id='wrap'>
		<jsp:include page="/WEB-INF/views/LoginHeader.jsp"/>
		<h2>비밀번호 찾기</h2>
		<div id='bodyDiv'>

			<input id='findId' type="button" value='아이디 찾기' onclick='goFindIdFnc();'> <input
				id='findPwd' type="button" value='비밀번호 찾기' onclick="goFindPwdFnc();">
			<p>새로운 비밀번호 설정</p>
			<form action="./newPwdCtr.do" method="post">
				<div id='infoDiv'>
					<p class="name">비밀번호</p>
					<input type="hidden" name='id' value="${memberId}">
					<input type="password" id="password" class='pwd' name='password' placeholder="PW">
					<p id="Pwd" class="check"></p>
					<p class="name">비밀번호 확인</p>
					<input type="password" id="chkPwd" class="pwd" placeholder="PW-CK">
					<p id="checkPwd" class="check"></p>
				</div>
				<div id='lowerButtonDiv'>
					<input id="findBtn" type="button" value="변경하기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>