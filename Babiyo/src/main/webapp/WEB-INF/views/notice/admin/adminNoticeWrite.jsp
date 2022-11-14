<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
	<div>
		<div>공지작성</div>
		<form action="" method="get">
			<div>
				공지작성 <select>
					<option selected>공지</option>
					<option>이벤트</option>
				</select>
			</div>
			<div>
				기간 <input type="date"> ~ <input type="date">
			</div>

			<div>
				제목 <input type="text">
			</div>
			<div>
				사진 <a><img alt="" src=""></a><input type="image">
			</div>
			<div>
				내용<input type="text">
			</div>
			<input type="button" value="뒤로가기" onclick="">
			<input type="submit" value="작성">
		</form>
	</div>


	<jsp:include page="/WEB-INF/views/Footer.jsp" />
</body>
</html>