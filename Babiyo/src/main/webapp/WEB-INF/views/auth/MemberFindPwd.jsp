<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>네이버 : 회원가입</title>
		
		<style type="text/css">
		body{
			margin: 0 auto;
		}
		
		h4{
			margin-bottom: 300px;
		}
		
		#wrap{
			margin: 0 auto;
		}
		
		#header{
			 text-align: center;
		}
		
		
		.chk_plz{
			color: red;
		}
		
		.bir_yy{
			display: table-cell;
			width: 25%;
		}
		.bir_mm{
			display: table-cell;
			width: 25%;
		}
		.bir_dd{
			display: table-cell;
			width: 25%;
		}
		.user_input{
			border: none;
			outline: 0;
		}
		.input_box{
			border: solid 1px #dadada;
			outline: 0;
			background-color: white;
			padding: 10px;
			margin: 3px;
		}
		
		.birth{
			width: 130px; height: 40px;
			margin: 7px;
			border: solid 1px #dadada;
		}
		
		
		</style>
		
		<script type="text/javascript">
		
			window.onload = function () {
				var midObj = document.getElementById('mid');
				var idChkObj = document.getElementById('id_plz');
				var pwdObj = document.getElementById('pwd');
				var pwdChkObj = document.getElementById('pwd_plz');
				var chkPwdObj = document.getElementById('chkPwd');
				var chkPwdChkObj = document.getElementById('chkPwd_plz');
				var mnameObj = document.getElementById('mname');
				var nameChkObj = document.getElementById('name_plz');
				var birthChkObj = document.getElementById('birthchk_plz');
				var emailObj = document.getElementById('email');
				var allchk = document.getElementById('all_chk');
				var yearObj = document.getElementById('myYear');
				var monthObj = document.getElementById('myMonth');
				var dayObj = document.getElementById('myDay');
				
				
				var chk1 = chk2 = chk3 = chk4 = chk5 = false;
				
				chk1 = <%=request.getAttribute("addCheck")%>;
				
				allchk.addEventListener('click', function(e) {
					console.log(chk1);
					console.log(chk2);
					console.log(chk3);
					console.log(chk4);
					console.log(chk5);
					if (!chk1 || !chk2 || !chk3 || !chk4 || !chk5 
							|| yearObj.value == '년도' || monthObj.value == '월'
							|| dayObj.value == '일') {
						e.preventDefault();
					}
				});
				
				midObj.addEventListener('blur', function() {
					var spObj = /[`~!@#$%^&*|\\\";:\/?]/;
					var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
					var check_eng = /[A-Z]/;
					if (midObj.value == '') {
						idChkObj.innerHTML = '필수정보입니다';
					}else if (midObj.value.length < 5 || check_kor.test(midObj.value)
							|| spObj.test(midObj.value) || check_eng.test(midObj.value)) {
						idChkObj.innerHTML = '5~20자의 영문 소문자,'
						+ '숫자와 특수기호(_),(-)만 사용 가능합니다.';
					}else {
						location.href = './check?mid=' + midObj.value;
						
					}
						
					
				});
				
				pwdObj.addEventListener('blur', function() {
					var spObj = /[`~!@#$%^&*|\\\";:\/?]/;
					var check_eng = /[a-zA-Z]/;
					if (pwdObj.value == '') {
						pwdChkObj.innerHTML = '필수정보입니다';
					}else if (pwdObj.value.length < 8 || 
							 !spObj.test(pwdObj.value) || !check_eng.test(pwdObj.value)) {
						pwdChkObj.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
					}else {
						chk2 = true;
						pwdChkObj.innerHTML = '';
					}
				});
				
				chkPwdObj.addEventListener('blur', function() {
					if (chkPwdObj.value == '') {
						chkPwdChkObj.innerHTML = '필수정보입니다';
					}else if (pwdObj.value != chkPwdObj.value) {
						chkPwdChkObj.innerHTML = '비밀번호가 일치하지 않습니다.';
					}else if (pwdObj.value = chkPwdObj.value) {
						chk3 = true;
						chkPwdChkObj.innerHTML = '';
					}	
				});
				
				mnameObj.addEventListener('blur', function() {
					if (mnameObj.value == '') {
						nameChkObj.innerHTML = '필수정보입니다';
					}else {
						nameChkObj.innerHTML = '';
						chk4 = true;
					} 
				});
				
				emailObj.addEventListener('blur', function() {
					if (emailObj.value == '') {
					}else {
						chk5 = true;
					} 
				});
				
				
				
			}
			
		</script>
		
	</head>
	
	<body>
		<div id='wrap'>
			<div id='header'>
				<h1>
					<a href="../auth/login">
						<img style="width: 150px; height: 60px;"  src="../auth/mmLogo.png">
					</a>
				</h1>
			</div>	
			<h1 style="text-align: center;">비밀번호 찾기</h1>
			<div style="text-align: center; ">
				<input id='findId'  type="button" style="border: none;" value='아이디 찾기' >
				<input id='findPwd'  type="button" style="border: none; background-color: orange; " value='비밀번호 찾기'>
				<h3>이메일</h3>
				<input type="text" placeholder="이메일을 입력"><br>
				<p></p>
				<input type="button" value="찾기">
			</div>	
		</div>	
	</body>
</html>