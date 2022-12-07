<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">

html, body{
	margin: 0;
	padding: 0;
}

body{
	background-color: #FFF2E6;
}

form {
	width: 400px;
	margin: 0 auto;
}

#wrap {
	width: 400px;
	margin: 0 auto;
	min-height: 100%;
	margin: 0px auto;
}

#header {
	height: 120px;
	padding-top: 30px;
	margin: 0;
	text-align: center;
}

.chk_plz {
	color: orange;
}

.bir_yy {
	display: table-cell;
	width: 25%;
}

.bir_mm {
	display: table-cell;
	width: 25%;
}

.bir_dd {
	display: table-cell;
	width: 25%;
}

.user_input {
	border: none;
	outline: 0;
}

.input_box {
	box-sizing: border-box;
	border: solid 1px #dadada;
	width: 400px;
	outline: 0;
	background-color: white;
	padding: 10px 0 10px 10px;
}

.birth {
	width: 133px;
	height: 40px;
	border: solid 1px #dadada;
}

#all_chk {
	width: 400px;
	margin-top: 20px;
	margin-right: 0;
	padding-bottom: 20px;
	padding-top: 20px;
	padding-right: 0;
	border: none;
	background: grey;
	color: white;
	font-size: 30px;
	text-align: center;
}
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>

<script type="text/javascript">

var chk1 = false; //유효성검사를 위한 변수들
var chk2 = false;
var chk3 = false;
var chk4 = false;
var chk5 = false;
var chk6 = false;
var chk7 = false;
var chk8 = false;
var chk9 = false;

$(document).ready(function(){
	
		midObj = document.getElementById('id');
		idChkObj = document.getElementById('id_plz');
		pwdObj = document.getElementById('pwd');
		pwdChkObj = document.getElementById('pwd_plz');
		chkPwdObj = document.getElementById('chkPwd');
		chkPwdChkObj = document.getElementById('chkPwd_plz');
		mnameObj = document.getElementById('mname');
		nameChkObj = document.getElementById('name_plz');
		birthChkObj = document.getElementById('birthchk_plz');
		emailObj = document.getElementById('email');
		emailChkObj = document.getElementById('mail_plz');
		phoneObj = document.getElementById('phone');
		phoneChkObj = document.getElementById('phone_plz');
		nicknameObj = document.getElementById('nickname');
		nicknameChkObj = document.getElementById('nickname_plz');
		allchk = document.getElementById('all_chk');
		yearObj = document.getElementById('myYear');
		monthObj = document.getElementById('myMonth');
		dayObj = document.getElementById('myDay');
		genderObjList = document.getElementsByClassName('gender');
		
		allchk.addEventListener('click', function(e) {
			var form = document.forms;
			
			if (chk1 == true && chk2 == true && chk3 == true && chk4 == true
					&& chk5 == true && chk6 == true && chk7 == true && chk8 == true
					&& chk9 == true) {
				form[0].submit();
			}
		});
		
		
		$('.birth').change(function() {
			var birthday = '';
			
			if($('#myYear').val() != null && $('#myMonth').val() != null
					&& $('#myDay').val() != null){
				chk8 = true;
			}
			
			var year = $('#myYear').val();
			var month = $('#myMonth').val();
			var day = $('#myDay').val();
			
			birthday = year+month+day;
			$('#birthDate').val(birthday);
			
		});
		
		
		for (let obj of genderObjList) {
			obj.addEventListener('change', function(e) {
				chk9 = true;
				allChkColor();
			});
		};
		
		
		midObj.addEventListener('keyup', function() {
			var spObj = /[`~!@#$%^&*|\\\";:\/?]/;
			var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var check_eng = /[A-Z]/;
			
			if (midObj.value == '') {
				idChkObj.innerHTML = '필수정보입니다';
				chk1 = false;
			}else if (midObj.value.length < 5 || check_kor.test(midObj.value)
					|| spObj.test(midObj.value) || check_eng.test(midObj.value)) {
				idChkObj.innerHTML = '5~20자의 영문 소문자,'
				+ '숫자와 특수기호(_),(-)만 사용 가능합니다.';
				chk1 = false;
			}else {
				var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
				
				$.ajax({
			        url:'./idCheckCtr.do', //Controller에서 요청 받을 주소
			        type:'post', //POST 방식으로 전달
			        data:{id:id},
			        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
			        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
			        		idChkObj.innerHTML = '사용가능한 아이디 입니다';
			        		idChkObj.style.color = 'green';
				        	chk1 = true;
			            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
			            	idChkObj.innerHTML = '이미 존재하는 아이디 입니다';
			            	idChkObj.style.color = 'orange';
			            	chk1 = false;
			            }
			        },
			        error:function(){
			        	console.log(id);
			        }
			    });
			}
			allChkColor();
		});
		
		
		
		pwdObj.addEventListener('keyup', function() {
			var spObj = /[`~!@#$%^&*|\\\";:\/?]/;
			var check_eng = /[a-zA-Z]/;
			if (pwdObj.value == '') {
				pwdChkObj.innerHTML = '필수정보입니다';
			}else if (pwdObj.value.length < 8 || 
					 !spObj.test(pwdObj.value) || !check_eng.test(pwdObj.value)) {
				pwdChkObj.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
			}else {
				pwdChkObj.innerHTML = '';
				chk2 = true;
			}
			allChkColor();
			
		});
		
		chkPwdObj.addEventListener('keyup', function() {
			if (chkPwdObj.value == '') {
				chkPwdChkObj.innerHTML = '필수정보입니다';
			}else if (pwdObj.value != chkPwdObj.value) {
				chkPwdChkObj.innerHTML = '비밀번호가 일치하지 않습니다.';
			}else if (pwdObj.value = chkPwdObj.value) {
				chkPwdChkObj.innerHTML = '';
				chk3 = true;
			}
			allChkColor();
		});
		
		mnameObj.addEventListener('keyup', function() {
			var spObj = /[`~!@#$%^&*|\\\";:\/? ]/;
			var check_lang = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-zA-Z]/;
			var check_mix = /[a-zA-Z]+[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			var check_mixTwo = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+[a-zA-Z]/;
			var check_num = /[0-9]/;
			if (mnameObj.value == '') {
				nameChkObj.innerHTML = '필수정보입니다';
			}else if(!check_lang.test(mnameObj.value) || check_num.test(mnameObj.value)
					|| spObj.test(mnameObj.value) || check_mix.test(mnameObj.value)
					|| check_mixTwo.test(mnameObj.value)){
				nameChkObj.innerHTML = '한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)';
			}else {
				nameChkObj.innerHTML = '';
				chk4 = true;
			} 
			allChkColor();
		});
		
		emailObj.addEventListener('keyup', function() {
			let emailRull = RegExp(/^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/);
			if (emailObj.value == '') {
				emailChkObj.innerHTML = '필수정보입니다';
				emailChkObj.style.color = 'orange';
			}else if(emailRull.test(emailObj.value)==false){
				emailChkObj.innerHTML = '이메일 형식이 올바르지 않습니다';
				emailChkObj.style.color = 'orange';
			}else{
					var email = $('#email').val(); //id값이 "email"인 입력란의 값을 저장
				
				$.ajax({
			        url:'./emailCheckCtr.do', //Controller에서 요청 받을 주소
			        type:'post', //POST 방식으로 전달
			        data:{email:email},
			        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
			        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 이메일
			        		emailChkObj.innerHTML = '사용가능한 이메일 입니다';
			        		emailChkObj.style.color = 'green';
				        	chk5 = true;
			            } else { // cnt가 1일 경우 -> 이미 가입된 이메일
			            	emailChkObj.innerHTML = '이미 가입된 이메일 입니다';
			            	emailChkObj.style.color = 'orange';
			            	chk5 = false;
			            }
			        },
			        error:function(){
			        	console.log(email);
			        }
			    });
			}
			allChkColor();
			
		});
		
		phoneObj.addEventListener('keyup', function() {
			var check_num = /^[0-9,-]{4}[0-9,-]{5}[0-9]{4}/;
			if (phoneObj.value == '') {
				phoneChkObj.innerHTML = '필수정보입니다';
				phoneChkObj.style.color = 'orange';
			}else if (!check_num.test(phoneObj.value)){
				phoneChkObj.innerHTML = '핸드폰번호 11자리를 입력해주세요';
				phoneChkObj.style.color = 'orange';
			}else {
				var phone = $('#phone').val(); //id값이 "phone"인 입력란의 값을 저장
				
				$.ajax({
			        url:'./phoneCheckCtr.do', //Controller에서 요청 받을 주소
			        type:'post', //POST 방식으로 전달
			        data:{phone:phone},
			        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
			        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 번호
			        		phoneChkObj.innerHTML = '사용가능한 번호 입니다';
			        		phoneChkObj.style.color = 'green';
				        	chk6 = true;
			            } else { // cnt가 1일 경우 -> 이미 가입된 번호
			            	phoneChkObj.innerHTML = '이미 가입된 번호 입니다';
			            	phoneChkObj.style.color = 'orange';
			            	chk6 = false;
			            }
			        },
			        error:function(){
			        	console.log(email);
			        }
			    });
			}
			allChkColor();
		});
		
		nicknameObj.addEventListener('keyup', function() {
			if (nicknameObj.value == '') {
				nicknameChkObj.innerHTML = '필수정보입니다';
				nicknameChkObj.style.color = 'orange';
			}else{
				var nickname = $('#nickname').val(); //id값이 "phone"인 입력란의 값을 저장
				
				$.ajax({
			        url:'./nicknameCheckCtr.do', //Controller에서 요청 받을 주소
			        type:'post', //POST 방식으로 전달
			        data:{nickname:nickname},
			        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
			        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 번호
			        		nicknameChkObj.innerHTML = '사용가능한 닉네임 입니다';
			        		nicknameChkObj.style.color = 'green';
				        	chk7 = true;
			            } else { // cnt가 1일 경우 -> 이미 가입된 번호
			            	nicknameChkObj.innerHTML = '이미 가입된 닉네임 입니다';
			            	nicknameChkObj.style.color = 'orange';
			            	chk7 = false;
			            }
			        },
			        error:function(){
			        	console.log(nickname);
			        }
			    });
			}
			allChkColor();
		});
	
});	

function allChkColor() {
	
	if (chk1 == true && chk2 == true && chk3 == true && chk4 == true
			&& chk5 == true && chk6 == true && chk7 == true && chk8 == true
			&& chk9 == true) {
		allchk.style.background = 'orange';
	}else {
		allchk.style.background = 'grey';
	}
	
};

const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}

</script>

</head>

<body>
	<div id='wrap'>
	
		<jsp:include page="/WEB-INF/views/LoginHeader.jsp"/>
		
		<form id="addForm" action='./addCtr.do' method='post'>
			<div>
				<h3>아이디</h3>
				<span> 
					<input class="input_box" type='text' id='id'
						name='id' maxlength="20">
				</span>
			</div>
			<p id='id_plz' class="chk_plz"></p>
			<div>
				<h3>비밀번호</h3>
				<span> 
					<input class="input_box" type='password' id='pwd'
						 name='password' maxlength="16">
				</span>
			</div>
			<p id='pwd_plz' class="chk_plz"></p>
			<div>
				<h3>비밀번호 재확인</h3>
				<span> 
					<input class="input_box" type='password' id='chkPwd'>
				</span>
			</div>
			<p id='chkPwd_plz' class="chk_plz"></p>

			<div>
				<h3>이름</h3>
				<span> 
					<input class="input_box" type='text' id='mname' name='name'>
				</span>
			</div>
			<p id='name_plz' class="chk_plz"></p>
			<div>
				<h3>이메일</h3>
				<div>
					<span> 
						<input class="input_box" type='text' id='email' name='email'>
					</span>
				</div>
				<p id='mail_plz' class="chk_plz"></p>
			</div>
			<div class="bir_wrap">
				<h3>생년월일</h3>
				<input type="hidden" id="birthDate" name="birthDate">
				<div class="bir_yy">
					<span> <select id='myYear' class='birth'>
							<option disabled selected>년도</option>
							<%
								for (int i = 1940; i < 2023; i++) {
							%><option value="<%=i%>"><%=i%></option>
							<%
								}
							%>
					</select>
					</span>
				</div>
				<div class="bir_mm">
					<span> <select id='myMonth' class='birth'>
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
					<span> <select id='myDay' class='birth'>
						<option disabled selected>일</option>
						
						<c:forEach begin="1" end="31" var="num">
							<c:choose>
								<c:when test="${num < 10}">
									<option value="0${num}">${num}</option>
								</c:when>
								<c:otherwise>
									<option value="${num}">${num}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
					</select>
					</span>
				</div>
			</div>
			<p id='birthchk_plz' class='chk_plz'></p>
			<div>
				<h3>
					성별  <input type="radio" class="gender" name="gender" value='남'>남 
						<input type="radio" class="gender" name="gender" value='여'>여
				</h3>
			</div>
			<div>
				<h3>휴대폰번호</h3>
				<input type="text" id="phone" class="input_box" oninput="autoHyphen(this)"
					name="phone" maxlength="13">
			</div>
			<p id='phone_plz' class="chk_plz"></p>
			<div>
				<h3>닉네임</h3>
				<input type="text" id="nickname"class="input_box"
					name="nickname">
			</div>
			<p id='nickname_plz' class="chk_plz"></p>
			<input id='all_chk' type="button" value='가입하기'>
		</form>
	</div>
</body>
</html>