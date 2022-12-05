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
	background: orange;
}

.option {
	border-collapse: collapse;
	border-right: 2px solid grey;
	text-align: left;
	width: 25%;
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

$(function(){
	
	$('input[id^="listNo"]').each(function(i, element) {
		var no = $(this).val();
		var code = $('#interestCode' + no).val();
		
		$('#category' + no).val(code);
	});
	
});

	function updateFnc() {
		var form = document.forms;

		form[0].submit();
	};
	
	function moveBackFnc() {
		location.href = './memberInfo.do';
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
									<td><select id='myYear' class='birth'>
											<option disabled selected>
												<fmt:formatDate value="${_memberDto_.birthDate}"
													pattern="yyyy" />
											</option>
											<%
												for (int i = 1940; i < 2023; i++) {
											%><option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
									</select>년 <select id='myMonth' class='birth'>
											<option disabled selected>
												<fmt:formatDate value="${_memberDto_.birthDate}"
													pattern="MM" />
											</option>
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
									</select>월 <select id='myDay' class='birth'>
											<option disabled selected><fmt:formatDate
													value="${_memberDto_.birthDate}" pattern="dd" />
											</option>

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
									</select>일</td>
								</tr>
								<tr>
									<td class="option">성별</td>
									<td><select id="gender" name="gender">
											<option disabled="disabled">${_memberDto_.gender}</option>
											<option value="남">남</option>
											<option value="여">여</option>
									</select></td>
								</tr>
								<tr>
									<td class="option">아이디</td>
									<td><input class="input_box" type='text' id='id' name='id'
										readonly="readonly" value="${_memberDto_.id}"></td>
								</tr>
								<tr>
									<td class="option">비밀번호</td>
									<td><input class="input_box" type='password' id='pwd'
										name='password' maxlength="16"></td>
								</tr>
								<tr>
									<td class="option">이름</td>
									<td><input class="input_box" type='text' id='mname'
										name='name' value="${_memberDto_.name}"></td>
								</tr>
								<tr>
									<td class="option">이메일</td>
									<td><input class="input_box" type='text' id='email'
										name='email' value="${_memberDto_.email}"></td>
								</tr>
								
								
								<tr>
									<td class="option">전화번호</td>
									<td><input type="text" id="phone" class="input_box"
										name="phone" maxlength="11" value="${_memberDto_.phone}"></td>
								</tr>
								<tr>
									<td class="option">닉네임</td>
									<td><input type="text" id="nickname" class="input_box"
										name="nickname" value="${_memberDto_.nickname}"></td>
								</tr>
								
								<c:forEach varStatus="i" begin="0" end="1">
									<tr>
										<td class="option">
											관심사${i.count}
										</td>
										<td>
											<select id='category${i.count}' class='birth'
												 name='interestList[${i.index}].categoryCode'>
												 
												<option disabled selected>선택</option>
												
												<c:forEach items="${categoryCodeList}" var="interest">
													<option value="${interest.CODE}">${interest.NAME}</option>
												</c:forEach>
												
											</select>
										</td>
									</tr>
								</c:forEach>
								
								<c:forEach items="${interestList}" var="interest" varStatus="i">
									<input id="listNo${interest.LIST_NO}" type="hidden" name="interestList[${i.index}].listNo"
											 value="${interest.LIST_NO}">
									<input type="hidden" id="interestCode${interest.LIST_NO}" value="${interest.CODE}">
								</c:forEach>
								
								
<!-- 								<tr> -->
<!-- 									<td class="option">관심사1</td> -->
<!-- 									<input type="hidden" name="interestList[0].listNo" value="1"> -->
<!-- 									<td><select id='myYear' class='birth' -->
<!-- 										name='interestList[0].categoryCode'> -->
<!-- 											<option disabled selected>선택</option> -->
<%-- 											<c:forEach items="${categoryCodeList}" var="interest"> --%>
<%-- 												<option value="${interest.CODE}">${interest.NAME}</option> --%>
<%-- 											</c:forEach> --%>
<!-- 									</select></td> -->
<!-- 								</tr> -->
								
<!-- 								<tr> -->
<!-- 									<td class="option">관심사2</td> -->
<!-- 									<input type="hidden" name="interestList[1].listNo" value="2"> -->
<!-- 									<td><select id='myYear' class='birth' -->
<!-- 										name='interestList[1].categoryCode'> -->
<%-- 											<option disabled selected>${interestList. }</option> --%>
<%-- 											<c:forEach items="${categoryCodeList}" var="interest"> --%>
<%-- 												<option value="${interest.CODE}">${interest.NAME}</option> --%>
<%-- 											</c:forEach> --%>
<!-- 									</select></td> -->
<!-- 								</tr> -->
								
								
								
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