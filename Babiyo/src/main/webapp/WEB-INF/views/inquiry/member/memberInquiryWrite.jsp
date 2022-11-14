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
.divisionCl {
	width: 150px;
	height: 40px;
	margin-left: 20px;
}

.titleCl {
	width: 840px;
	height: 40px;
	margin: 20px 0px 0px 20px;
}

.contentsCl {
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
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"/>
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
				제목 <input class="titleCl" type="text" value="제목">
			</div>
			<div id="contentsDiv">
				내용<br> <input class="contentsCl" type="text">
			</div>
			<input id="backDiv" type="button" value="뒤로가기" onclick=""> 
			<input id="submitDiv"  type="submit" value="작성">

		</form>
		</div>
	</div>


<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>