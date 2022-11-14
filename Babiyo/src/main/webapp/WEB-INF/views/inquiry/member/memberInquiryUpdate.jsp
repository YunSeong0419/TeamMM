<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의수정</title>
<style type="text/css">
input, select {
	border-radius: 8px;
}

#leftDiv {
	margin-left: 200px;
}

.divisionCl {
	width: 150px;
	height: 40px;
	margin-left: 20px;
}

#titleId {
	width: 840px;
	height: 40px;
	margin: 20px 0px 0px 20px;
}

.contentsCl {
	width: 900px;
	height: 350px;
	margin-top: 10px;
}

#contentsDiv {
	margin-top: 20px;
	width: 908px;
}

#submitDiv {
	float: right;
	margin: 20px 87px 0px 0px;
}

#backDiv {
	margin: 20px 0px 0px 420px;
}

.cursorCl {
	cursor: pointer;
}

#deletId {
	margin-top: 20px;
	float: right;
}
#clearDiv{
	clear: both;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div>
		<div id="leftDiv">
			<form action="" method="get">
				<div>
					분류 <select class="divisionCl">
						<option selected>주문</option>
						<option>충전</option>
						<option>기타</option>
					</select>
				</div>

				<div>
				
					제목 <input id="titleId" type="text" value="제목">
				</div>
				<div id="contentsDiv">
					내용<br> <input class="contentsCl" type="text">
				</div>
				<input id="backDiv" class="cursorCl" type="button" value="뒤로가기"onclick="">
				<input id="submitDiv" class="cursorCl"type="submit" value="수정하기">
				<input id="deletId"type="button" class="cursorCl" value="삭제하기" onclick="">
			</form>
		</div>
	</div>
<div id="clearDiv"></div><!--float 정리div-->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>