<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
#infoWrap {
	width: 950px;
	border: 1px solid black;
	text-align: center;
}

#border {
	margin: auto; border : 1px solid black;
	border-radius: 10px;
	width: 425px;
	border: 1px solid black;
}

#btnWrap {
	width: 425px;
	text-align: center;
	margin: auto;
	margin-top: 20px;
}

#btnWrap>input {
	width: 35%;
	height: 40px;
	margin: auto;
	border: none;
	border-radius: 10px;
	color: white;
	background: #FF9436;
}

.option {
	width: 25%;
	height: 10px;
	border-collapse: collapse;
	border-right: 2px solid grey;
	text-align: left;
	color: white;
	background: #FF9436;
	
}

.check {
	padding: 0 0 0 15px;
	font-size: 10px;
	color: red;
}

.input_box {
	width: 100%;
}

table {
	width: 425px;
	margin: auto;
	border-radius: 10px;
	border-collapse: collapse;
}

td {
	padding: 15px;
}

table>input {
	height: 30px;
	width: 100%;
}

select {
	width: 25%;
}
</style>
<link rel="stylesheet" type="text/css"
	href="/babiyo/resources/css/common.css" />
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">

//유효성 검증 변수
var chk1 = true;
var chk2 = true;
var chk3 = true;
var chk4 = true;
var chk5 = true;
var chk6 = true;



$(function(){
	
	$('#gender').val($('#memberGender').val());
	
	pwdObj = document.getElementById('pwd');
	nameObj = document.getElementById('mname');
	emailObj = document.getElementById('email');
	phoneObj = document.getElementById('phone');
	nickObj = document.getElementById('nickname');
	pwdChk = document.getElementById('pwdChk');
	nameChk = document.getElementById('nameChk');
	emailChk = document.getElementById('emailChk');
	phoneChk = document.getElementById('phoneChk');
	nickChk = document.getElementById('nickChk');
	myEmail = document.getElementById('myEmail');
	myPhone = document.getElementById('myPhone');
	myNick = document.getElementById('myNick');
	updateBtn = document.getElementById('update');
	
// 	비밀번호 유효성
	pwdObj.addEventListener('keyup', function() {
		var spObj = /[`~!@#$%^&*|\\\";:\/? ]/;
		var check_eng = /[a-zA-Z]/;
		if (pwdObj.value == '') {
			pwdChk.innerHTML = '';
			chk1 = true;
		}else if (pwdObj.value.length < 8 || 
				 !spObj.test(pwdObj.value) || !check_eng.test(pwdObj.value)) {
			pwdChk.innerHTML = '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
			chk1 = false;
		}else {
			chk1 = true;
			pwdChk.innerHTML = '';
		}
		allChkColor();
	});
	
// 	이름 유효성
	nameObj.addEventListener('keyup', function() {
		var spObj = /[`~!@#$%^&*|\\\";:\/? ]/;
		var check_lang = /[ㄱ-ㅎ|ㅏ-ㅣ]/;
		var check_mix = /[a-zA-Z]+[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var check_mixTwo = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+[a-zA-Z]/;
		var check_num = /[0-9]/;
		
		if (check_lang.test(nameObj.value) || check_num.test(nameObj.value)
				|| spObj.test(nameObj.value) || check_mix.test(nameObj.value)
				|| check_mixTwo.test(nameObj.value) || nameObj.value == ''){
			nameChk.innerHTML = '한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)';
			chk2 = false;
		}else {
			nameChk.innerHTML = '';
			chk2 = true;
		} 
		
		allChkColor();
		
	});
// 	이메일 유효성
	emailObj.addEventListener('keyup', function() {
		let emailRull = RegExp(/^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/);
		
		if(emailRull.test(emailObj.value)==false){
			emailChk.innerHTML = '이메일 형식이 올바르지 않습니다';
			emailChk.style.color = 'orange';
			chk3 = false;
		}else if(emailObj.value == myEmail.value){
			chk3 = true;
			emailChk.innerHTML = '';
		}else{		
			var email = $('#email').val(); //id값이 "email"인 입력란의 값을 저장
			
			$.ajax({
		        url:'../auth/member/emailCheckCtr.do', //Controller에서 요청 받을 주소
		        type:'post', //POST 방식으로 전달
		        data:{email:email},
		        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 이메일
		        		emailChk.innerHTML = '사용가능한 이메일 입니다';
		        		emailChk.style.color = 'green';
			        	chk3 = true;
		            } else { // cnt가 1일 경우 -> 이미 가입된 이메일
		            	emailChk.innerHTML = '이미 가입된 이메일 입니다';
		            	emailChk.style.color = 'orange';
		            	chk3 = false;
		            }
		        },
		        error:function(){
		        	console.log(email);
		        }
		    });
		}
		allChkColor();
		
	});
// 	핸드폰번호 유효성
	phoneObj.addEventListener('keyup', function() {
		var check_num = /^[0-9,-]{4}[0-9,-]{5}[0-9]{4}/;
		
		if (!check_num.test(phoneObj.value)){
			phoneChk.innerHTML = '핸드폰번호 11자리를 입력해주세요';
			phoneChk.style.color = 'orange';
			chk4 = false;
		}else if(phoneObj.value == myPhone.value){
			phoneChk.innerHTML = '';
			chk4 = true;
		}else{
			var phone = $('#phone').val(); //id값이 "phone"인 입력란의 값을 저장
			
			$.ajax({
		        url:'../auth/member/phoneCheckCtr.do', //Controller에서 요청 받을 주소
		        type:'post', //POST 방식으로 전달
		        data:{phone:phone},
		        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 번호
		        		phoneChk.innerHTML = '사용가능한 번호 입니다';
		        		phoneChk.style.color = 'green';
			        	chk4 = true;
		            } else { // cnt가 1일 경우 -> 이미 가입된 번호
		            	phoneChk.innerHTML = '이미 가입된 번호 입니다';
		            	phoneChk.style.color = 'orange';
		            	chk4 = false;
		            }
		        },
		        error:function(){
		        	console.log(email);
		        }
		    });
		}
		allChkColor();
	});
// 	닉네임 유효성
	nickObj.addEventListener('keyup', function() {
		var spObj = /[`~!@#$%^&*|\\\";:\/? ]/;
		var check_lang = /[ㄱ-ㅎ|ㅏ-ㅣ]/;
		var check_mix = /[a-zA-Z]+[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		var check_mixTwo = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]+[a-zA-Z]/;
		var check_num = /[0-9]/;
		
		if (check_lang.test(nameObj.value) || check_num.test(nameObj.value)
				|| spObj.test(nameObj.value) || check_mix.test(nameObj.value)
				|| check_mixTwo.test(nameObj.value) || nameObj.value == ''){
			nameChk.innerHTML = '한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)';
			chk5 = false;
		}else if(nickObj.value == ''){
			nickChk.innerHTML = '닉네임이 비어있습니다';
			nickChk.focus();
			chk5 = false;
		}else if(nickObj.value == myNick.value){
			nickChk.innerHTML = '';
			chk5 = true;
		}else{	
			var nickname = $('#nickname').val(); //id값이 "phone"인 입력란의 값을 저장
			
			$.ajax({
		        url:'../auth/member/nicknameCheckCtr.do', //Controller에서 요청 받을 주소
		        type:'post', //POST 방식으로 전달
		        data:{nickname:nickname},
		        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
		        	if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 번호
		        		nickChk.innerHTML = '사용가능한 닉네임 입니다';
		        		nickChk.style.color = 'green';
			        	chk5 = true;
		            } else { // cnt가 1일 경우 -> 이미 가입된 번호
		            	nickChk.innerHTML = '이미 가입된 닉네임 입니다';
		            	nickChk.style.color = 'orange';
		            	chk5 = false;
		            }
		        },
		        error:function(){
		        	console.log(nickname);
		        }
		    });
		}
		
		allChkColor();
	});
	
	
	$('input[id^="listNo"]').each(function(i, element) {
		var no = $(this).val();
		var code = $('#interestCode' + no).val();
		
		if(code != 0){
			$('#category' + no).val(code);
		}
		
		$(this).change(function() {
			if($('catogory1').val() != 0 && $('category2').val() != 0
					&& $('catogory1').val() == $('category2').val()){
				chk6 == false;
			}else{
				chk6 == true;
			}
		});
	});
	
});

function allChkColor() {
	if (chk1 == true && chk2 == true && chk3 == true && chk4 == true
			&& chk5 == true && chk6 == true) {
		updateBtn.style.background = '#FF9436';
	}else {
		updateBtn.style.background = '#FFBA85';
	}
};

// 	전송 중 관심사 유효성 검사
function updateFnc() {
	var form = document.forms;
	
	form[0].submit();
};

//뒤로가기
function moveBackFnc() {
	location.href = './memberInfo.do';
};

//핸드폰번호 하이픈
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
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
				<!--여기서 작성 -->
				<div id='inforWrap'>
					<form id="addForm" action='./memberUpdateCtr.do' method='post'>
						<div id='border'>
							<table>
								<tr class="bir_wrap">
									<td class="option">
										생년월일
										<input type="hidden" id="birthDate" name="birthDate">
									</td>
									<td>
										<fmt:formatDate value="${_memberDto_.birthDate}" pattern="yyyy년 MM월 dd일"/>
									</td>
								</tr>
								<tr>
									<td class="option"></td><td class="check"></td>
								</tr>
								<tr>
									<td class="option">성별</td>
									<td>
										<select id="gender" name="gender">
											<option value="남">남</option>
											<option value="여">여</option>
										</select>
										<input id="memberGender" type="hidden" value="${_memberDto_.gender}">
									</td>
								</tr>
								<tr>
									<td class="option"></td><td class="check"></td>
								</tr>
								<tr>
									<td class="option">아이디</td>
									<td><input id='myId' type="hidden" value="${_memberDto_.id}">
									<input class="input_box" type='text' id='id' name='id'
										readonly="readonly" value="${_memberDto_.id}"></td>
								</tr>
								<tr>
									<td class="option"></td><td class="check"></td>
								</tr>
								<tr>
									<td class="option">비밀번호</td>
									<td><input class="input_box" type='password' id='pwd'
										name='password' maxlength="16"></td>
								</tr>
								<tr>
									<td class="option"></td><td id="pwdChk" class="check"></td>
								</tr>
								<tr>
									<td class="option">이름</td>
									<td ><input class="input_box" type='text' id='mname'
										name='name' value="${_memberDto_.name}"></td>
								</tr>
								<tr>
									<td class="option"></td><td id="nameChk" class="check"></td>
								</tr>
								<tr>
									<td class="option">이메일</td>
									<td><input id='myEmail' type="hidden" value="${_memberDto_.email}">
									<input class="input_box" type='text' id='email'
										name='email' value="${_memberDto_.email}"></td>
								</tr>
								<tr>
									<td class="option"></td><td id="emailChk" class="check"></td>
								</tr>
								<tr>
									<td class="option">전화번호</td>
									<td><input id='myPhone' type="hidden" value="${_memberDto_.phone}">
									<input type="text" id="phone" class="input_box" oninput="autoHyphen(this)"
										name="phone" maxlength="13" value="${_memberDto_.phone}"></td>
								</tr>
								<tr>
									<td class="option"></td><td id="phoneChk" class="check"></td>
								</tr>
								<tr>
									<td class="option">닉네임</td>
									<td><input id='myNick' type="hidden" value="${_memberDto_.nickname}">
									<input type="text" id="nickname" class="input_box"
										name="nickname" value="${_memberDto_.nickname}"></td>
								</tr>
								<tr>
									<td class="option"></td><td id="nickChk" class="check"></td>
								</tr>
								<c:forEach varStatus="i" begin="0" end="1">
									<tr>
										<td class="option">
											관심사${i.count}
										</td>
										<td>
											<select id='category${i.count}' class='birth'
												 name='interestList[${i.index}].categoryCode'>
												 
												<option value="0">없음</option>
												
												<c:forEach items="${categoryCodeList}" var="interest">
													<option value="${interest.CODE}">${interest.NAME}</option>
												</c:forEach>
												
											</select>
										</td>
									</tr>
								</c:forEach>
								
								<c:forEach items="${interestList}" var="interest" varStatus="i">
									<input id="listNo${interest.LIST_NO}" type="hidden"
									 name="interestList[${i.index}].listNo"	 value="${interest.LIST_NO}">
									<input type="hidden" id="interestCode${interest.LIST_NO}" value="${interest.CODE}">
								</c:forEach>
							</table>
						</div>
					</form>
					<div id="btnWrap">
						<input id='update' type="button" value='수정' onclick="updateFnc();">
						<input id='moveback' type="button" value='취소'
							onclick="moveBackFnc();">
					</div>

				</div>
				<!--infoWrap 끝 -->
				<div id="underPadding"></div>

			</div>
			<!--middelMain 끝 -->

		</div>
		<!--middleDiv 끝 -->

		<jsp:include page="/WEB-INF/views/Footer.jsp" />

	</div>
	<!-- rootDiv 끝 -->


</body>
</html>