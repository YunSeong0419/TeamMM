<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의작성</title>
<style type="text/css">
input, select{
	border-radius: 8px;
}

#leftDiv{
	margin-left: 200px;
}
#divisionId {
	width: 150px;
	height: 40px;
	margin-left: 20px;
}

#titleId {
	width: 840px;
	height: 40px;
	margin: 20px 0px 0px 20px;
}

.contentsId {
	width: 900px;
	height: 350px;
	margin-top: 10px;
}

#contentsDiv{
	margin-top: 20px;
	width: 908px;
}

#submitDiv{
	float: right;
	margin: 20px 87px 0px 0px;
}

#backDiv{
	margin: 20px 0px 0px 420px;
} 
</style>
<script type="text/javascript">
function backBtn() {
	location.href = '.do';
}	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"/>
<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div>
	<div id="leftDiv">
		<form action="./writeCtr.do" method="post">
			<div>
				분류 
				<select name="categoryCode" id="divisionId">
					<option value="1" selected>주문</option>
					<option value="2">밀키트</option>
					<option value="3">회원</option>
					<option value="4">기타</option>
				</select>
			</div>

			<div>
				제목 <input name="title" id="titleId" type="text" placeholder="제목">
			</div>
			<div id="contentsDiv">
				내용<br> 
				<textarea name="content" id="contentsId"></textarea>
			</div>
			<input type="hidden" name="memberId" value="${memberDto.id}"> 
			<input id="backDiv" type="button" value="뒤로가기" onclick="backBtn()"> 
			<input id="submitDiv"  type="submit" value="작성">

		</form>
		</div>
	</div>


<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>