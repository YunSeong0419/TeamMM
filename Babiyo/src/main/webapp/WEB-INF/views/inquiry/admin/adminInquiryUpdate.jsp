<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.divisionCl{
	width: 120px;
	height: 30px;
}

.writerCl{
	width: 120px;
	height: 30px;
}

.dateCl{
	width: 150px;
	height: 30px;
}

.titleCl{
	width: 600px;
	height: 30px;
}

.myContentsCl{
	width: 900px;
	height: 180px;
}

.contentsCl{
	width: 900px;
	height: 180px;
}


</style>
<script type="text/javascript">

</script>
</head>
<body>
<div>

<div>문의</div>

<form action="" method="get">
<div>분류
	<input class="divisionCl" type="text" value="">
</div>

<div>작성자
	<input class="writerCl" type="text" value="">
</div>

<div>작성일
	<input class="dateCl" type="text" value="">
</div>

<div>문의 제목
	<input class="titleCl" type="text" value="">
</div>

<div>문의 내용
	<input class="myContentsCl" type="text" value="">
</div>

<div>답변 내용
	<input class="contentsCl" type="text" value="">
</div>

<div>
	<input type="button" value="뒤로가기">
</div>

<div>
	<input type="submit" value="답변하기">
</div>


</form>

</div>
</body>
</html>