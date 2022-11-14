<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.noticeCl{
	font-weight: bold;
}

.divisionCl{
	width: 120px;
	height: 30px;
}

.periodCl{
	width: 200px;
	height: 30px;

}

.titleCl{
	width: 400px;
	height: 30px;
}

.dateCl{
	width: 150px;
	height: 30px;
}

.viewCl{
	width: 100px;
	height: 30px;
}
.contentsCl{
	width: 900px;
	height: 400px;
}


</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"/>
<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
<div>
<div class="noticeCl">공지사항</div>

<div>분류<input class="divisionCl" type="text"></div>

<div>기간 <input class="periodCl" type="text"></div>

<div>제목 <input class="titleCl" type="text"></div>

<div>작성일 <input class="dateCl" type="text"></div>

<div>조회수<input class="viewCl" type="text"></div>

<div>내용<br>
<input class="contentsCl" type="text"></div>

<div><input type="image"></div>

<button>뒤로가기</button>

</div>
<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>