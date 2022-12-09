<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐시 충전</title>

<style type="text/css">
#selfIn {
	width: 70%;
}

#btnWrap {
	text-align: center;
}

.choice {
	width: 10%;
}

.button{
	width: 120px;
	height: 40px;
	font-size: 17px;
	font-weight: bold;
	background-color: #FF9436;
	color: #fff;
	border: none;
	border-radius: 8px;
}

form {
	width: 900px;
	height: 200px;
	margin: auto;
}

table {
	text-align: center;
	width: 100%;
	height: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	border: 1px solid black;
	color: white;
	background: orange;
}

td {
	border: 1px solid black;
}

span {
	width: 30%;
}
</style>

<link rel="stylesheet" type="text/css"
	href="/babiyo/resources/css/common.css" />
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">

function inputMoney() {
	
	$('#selfInput').val($('#selfIn').val());
	
	choiceCash(event);
};

function choiceCash(event) {
	const point = parseInt(event.target.value); 
	
	if(!!point){
		document.getElementById('choicePoint').innerHTML = 
		    '충전 : ' + point + '원';
		document.getElementById('afterPoint').innerHTML =
			'충전 후 : ' + (point + ${_memberDto_.cash}) + '원';
	}else {
		document.getElementById('choicePoint').innerHTML = '';
		document.getElementById('afterPoint').innerHTML = '';
	}
	};
	
function moveBackFnc() {
	location.href = '../member/memberCash.do';
}


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



				<form id='memberDetailForm' action="./chargeCashCtr.do"
					method="post">
					<input type="hidden" name="id" value="${_memberDto_.id}">
					<table>
						<tr>
							<th></th>
							<th>충전금액</th>
							<th>상세설명</th>
						</tr>
						<tr>
							<td class="choice"><input id='fiveThousand' type="radio" name="cash"
								value="5000" onclick="choiceCash(event)"></td>
							<td><label for="fiveThousand">5000원</label></td>
							<td></td>
						</tr>
						<tr>
							<td class="choice"><input  id='tenThousand' type="radio" name="cash"
								value="10000" onclick="choiceCash(event)"></td>
							<td><label for="tenThousand">10000원</label></td>
							<td></td>
						</tr>
						<tr>
							<td class="choice"><input  id='twentyThousand' type="radio" name="cash"
								value="20000" onclick="choiceCash(event)"></td>
							<td><label for="twentyThousand">20000원</label></td>
							<td></td>
						</tr>
						<tr>
							<td class="choice"><input  id='fifthThousand' type="radio" name="cash"
								value="50000" onclick="choiceCash(event)"></td>
							<td><label for="fifthThousand">50000원</label></td>
							<td></td>
						</tr>
						<tr>
							<td class="choice"><input  id='hundredThousand' type="radio" name="cash"
								value="100000" onclick="choiceCash(event)"></td>
							<td><label for="hundredThousand">100000원</label></td>
							<td></td>
						</tr>
						<tr>
							<td class="choice"><input  type="radio" id="selfInput"
								name="cash" value="" onclick="choiceCash(event)"></td>
							<td><label for="self">직접입력</label></td>
							<td><input type="number" id="selfIn" min="1" max="1000000"
								placeholder="충전금액을 입력해주세요" onkeyup="inputMoney();"></td>
						</tr>
					</table>
					<div id="pointView">
						<span id='choicePoint'></span>
						<span>보유 포인트 : ${_memberDto_.cash}원</span>
						<span id='afterPoint'></span>
					</div>
					<div id='btnWrap'>
						<input class="button" type="submit" value="충전하기">
						 <input class="button" type="button" value="뒤로가기" onclick="moveBackFnc();">
					</div>
				</form>




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