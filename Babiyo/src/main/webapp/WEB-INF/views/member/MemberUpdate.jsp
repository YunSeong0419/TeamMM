<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style type="text/css">
	#infoBox {
		text-align: center;
		width: 950px;
	}
	
	table {
	border: 1px solid black;
	border-radius: 12px;
	margin: auto;
	}
	
	th {
	border-collapse: collapse;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	}
	
	td {
	margin-top: 20px;
	}
	


</style>
<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>


<script type="text/javascript">

function updateFnc() {
	var form = document.forms;
	
		form[0].submit();
};
function moveBackFnc() {
	location.href ='./memberInfo.do';
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
				<form id="addForm" action='./memberUpdateCtr.do' method='post'>
			<div>
				<h3>아이디</h3>
				<span> <input class="input_box" type='text' id='id'
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
						class="input_box" type='text' id='email' name='email'>
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
				<input type="text" id="phone" style="padding-right: 250px;" class="input_box"
					name="phone" maxlength="11">
			</div>
			<p id='phone_plz' class="chk_plz"></p>
			<div>
				<h3>닉네임</h3>
				<input type="text" id="nickname" style="padding-right: 250px;" class="input_box"
					name="nickname">
			</div>
			<p id='nickname_plz' class="chk_plz"></p>
			<h3>관심사1</h3>
					<div class="bir_yy">
							<input type="hidden" name="interestList[0].listNo" value="1">
 							<select id='myYear' class='birth' name='interestList[0].categoryCode'>
 								<option disabled selected>선택해주세요</option>
 								<c:forEach items="${categoryCodeList}" var="interest">
								<option value="${interest.CODE}">${interest.NAME}</option>
							</c:forEach>
 							</select>
					</div>
			<h3>관심사2</h3>
					<div class="bir_yy">
							<input type="hidden" name="interestList[0].listNo" value="1">
 							<select id='myYear' class='birth' name='interestList[0].categoryCode'>
 								<option disabled selected>선택해주세요</option>
 								<c:forEach items="${categoryCodeList}" var="interest">
								<option value="${interest.CODE}">${interest.NAME}</option>
							</c:forEach>
 							</select>
					</div>
			<input id='update' type="button" value='수정' onclick="updateFnc();">
			<input id='moveback' type="button" value='취소' onclick="moveBackFnc();">
		</form>
					
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>