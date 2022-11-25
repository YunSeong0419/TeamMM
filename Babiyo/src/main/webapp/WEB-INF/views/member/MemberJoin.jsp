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
body {
	margin: 0 auto;
}

form {
	width: 400px;
	margin: 0 auto;
}

#wrap {
	margin: 0 auto;
}

#header {
	text-align: center;
}

.chk_plz {
	color: red;
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
	border: solid 1px #dadada;
	outline: 0;
	background-color: white;
	padding: 10px;
	margin: 3px;
}

.birth {
	width: 130px;
	height: 40px;
	margin: 7px;
	border: solid 1px #dadada;
}

#all_chk {
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
	
$(document).ready(function(){
	
	$('.birth').change(function() {
		var birthday = '';
		
		var year = $('#myYear').val();
		var month = $('#myMonth').val();
		var day = $('#myDay').val();
		
		birthday = year+month+day;

		$('#birthDate').val(birthday);
	});
	

	
});	



</script>

</head>

<body>
	<div id='wrap'>
		<div id='header'>
			<h1>
				<a href="../auth/LoginForm"> <img
					style="width: 300px; height: 100px;"
					src="/babiyo/resources/img/logo.png">
				</a>
			</h1>
		</div>
		<form action='./addCtr.do' method='post' enctype="multipart/form-data">
			<div>
				<h3>아이디</h3>
				<span> <input class="input_box" type='text' id='mid'
					name='id' style="padding-right: 250px;" maxlength="20">
				</span>
			</div>
			<p id='id_plz' class="chk_plz"></p>
			<div>
				<h3>비밀번호</h3>
				<span> <input style="padding-right: 250px;" class="input_box"
					type='password' id='pwd' name='password' maxlength="16">
				</span>
			</div>
			<p id='pwd_plz' class="chk_plz"></p>
			<div>
				<h3>비밀번호 재확인</h3>
				<span> <input style="padding-right: 250px;" class="input_box"
					type='password' id='chkPwd'>
				</span>
			</div>
			<p id='chkPwd_plz' class="chk_plz"></p>

			<div>
				<h3>이름</h3>
				<span> <input style="padding-right: 250px;" class="input_box"
					type='text' id='mname' name='name'>
				</span>
			</div>
			<p id='name_plz' class="chk_plz"></p>
			<div>
				<h3>이메일</h3>
				<div>
					<span> <input style="padding-right: 250px;"
						class="input_box" type='text' id='email' name='email'
						placeholder="선택입력">
					</span>
				</div>
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
					성별 <input type="radio" name="gender" value='남'>남 <input
						type="radio" name="gender" value='여'>여
				</h3>
			</div>
			<div>
				<h3>휴대폰번호</h3>
				<input type="text" style="padding-right: 250px;" class="input_box"
					name="phone">
			</div>
			<div>
				<h3>닉네임</h3>
				<input type="text" style="padding-right: 250px;" class="input_box"
					name="nickname">
			</div>
			<input id='all_chk' type="submit" value='가입하기'>
		</form>
	</div>
</body>
</html>