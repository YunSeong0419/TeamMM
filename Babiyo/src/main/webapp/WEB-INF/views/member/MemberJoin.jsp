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
			background: #f5f6f7;
			margin: 0 auto;
		}
		
		form{
			width: 400px;
			margin: 0 auto;
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
		
		#all_chk{
			width: 435px;
			margin-top: 20px;
			margin-right: 0;
			padding-bottom: 20px;
			padding-top: 20px;
			padding-right: 0;
			border: none;
			background: green;
			color: white;
			font-size: 30px;
			text-align: center;
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
						<img style="width: 300px; height: 100px;"  src="../auth/naver.png">
					</a>
				</h1>
			</div>	
			<form  action='./join' method='post'>
				<div>
					<h3>아이디</h3>
					<span>
					 <input class="input_box" type='text' id='mid' name='mid'
					  value="<%=request.getAttribute("userId")%>"
					 	style="padding-right: 250px;" maxlength="20">
				 	</span>
				 </div>	
				 <p id ='id_plz' class="chk_plz"><%=request.getAttribute("msg")%></p>
				 <div>
				 	<h3>비밀번호</h3>
				 	<span>
				 		<input style="padding-right: 250px;" class="input_box" type='password'
				 		 id='pwd' name='pwd' maxlength="16">
				 	</span>
				</div>
			 	<p id ='pwd_plz' class="chk_plz"></p>
			 	<div>
			 		<h3>비밀번호 재확인</h3>
			 		<span>
			 			<input style="padding-right: 250px;" class="input_box"
			 			 type='password' id='chkPwd' name='chkPwd'>
			 		</span>
				</div>
				<p id ='chkPwd_plz' class="chk_plz"></p>
				
				<div>
					<h3>이름</h3>
					<span>
				 		<input style="padding-right: 250px;" class="input_box"
				 		 type='text' id='mname' name='mname'>
					</span>
				</div>
				<p id ='name_plz' class="chk_plz"></p>
				<div>
					<h3>이메일</h3>
					<div>
						<span>
						 	<input style="padding-right: 250px;" class="input_box"
						 	 type='text' id='email' name='email'
						 		placeholder="선택입력">
						</span>
					</div>	
				</div>
				<div class="bir_wrap">
					<h3>생년월일</h3>
					<div class="bir_yy">
						<span>
 							<select id='myYear' class='birth' name='yy'>
 								<option disabled selected>년도</option>
 								<%
 									for(int i = 1940; i < 2023; i++){
 										%><option value="<%=i%>"><%=i%></option>
 									<%}%>
 							</select>
						</span>
					</div>
					<div class="bir_mm">
						<span>
							<select id='myMonth' class='birth' name='mm'>
								<option disabled selected>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</span>
					</div>
					<div class="bir_dd">
						<span>
							<select id='myDay' class='birth' name='dd'>
								<option disabled selected>일</option>
 								<%
 									for(int i = 1; i < 32; i++){
 										%><option value="<%=i%>"><%=i%></option>
 									<%}%>
 							</select>
						</span>
					</div>
				</div>
				<p id='birthchk_plz' class='chk_plz'></p>
				<div>
					<h3>성별
						<input type="radio" name="sex" value ='남'>남
						<input type="radio" name="sex" value ='여'>여
					</h3>
				</div>
				<div>
					<h3 >휴대폰번호</h3>
					<input type="text" style="padding-right: 250px;" class="input_box">
				</div>
				<div>
					<h3>닉네임</h3>
					<input type="text" style="padding-right: 250px;" class="input_box">
				</div>
				<input id='all_chk' type="submit" value='가입하기'>
			</form>	
		</div>	
	</body>
</html>