<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<style type="text/css">
input {
	border-radius: 6px;
}

#wrapDiv {
	min-height: 650px;
	margin: auto;
	width: 1200px;
	margin-left: 40px;
}

#fromDiv {
 	margin-top: 50px;
	margin-left:150px;
	height: 200px;
}

#leftDiv {
	float: left;
}

.leftCl {
	margin-left: 30px;
}

#writerInput {
	width: 120px;
	height: 30px;
	margin-left: 20px;
}

#divisionInput {
	width: 120px;
	height: 30px;
	margin-left: 20px;
}

#dateInput {
	width: 150px;
	height: 30px;
	margin-left: 20px;
}

#titleInput {
	width: 600px;
	height: 30px;
	margin-left: 35px;
	margin-top: 20px;
}

#contentsDiv{
	margin-top: 10px;
}

#contentsDiv{
	margin-top: 10px;
}

#contentsDiv{
	margin-top: 10px;
	float: left;
}

#answerId{
	margin-top: 10px;
	float: left;
}

#ContentsInput {
	width: 900px;
	height: 180px;
	margin-top: 10px;
}

#contentsInput {
	width: 900px;
	height: 180px;
	margin-top: 10px;
}

#backDiv {
 	margin: 15px auto 0px 410px; 
	width: 100px;
	float: left;
	text-align: center;
}

#answerDiv {
 	margin: 15px auto 0px 300px; 
	width: 100px;
	float: left;
	text-align: right;	
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div id="wrapDiv">
		<div id="fromDiv">
			<form action="" method="get">
				<div id="leftDiv">
					작성자 <input id="writerInput" type="text" value="">
				</div>

				<div id="leftDiv" class="leftCl">
					분류 <input id="divisionInput" type="text" value="">
				</div>

				<div id="leftDiv" class="leftCl">
					작성일 <input id="dateInput" type="text" value="">
				</div>
				<div id="leftDiv">
					제목 <input id="titleInput" type="text" value="">
				</div>

				<div id="contentsDiv">
					내용<br> <input id="ContentsInput" type="text" value="">
				</div>

				<div id="answerId">
					답변<br> <input id="contentsInput" type="text" value="">
				</div>

				<div id="backDiv">
					<input type="button" value="뒤로가기">
				</div>

				<div id="answerDiv">
					<input type="submit" value="답변하기">
				</div>

				<div id="clearBlock"></div><!--float 정리-->
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>