<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.sizeCl{
	font-size: 1.3em;
}


.divisionCl{
	width: 120px;
	height: 30px;
	border-radius: 6px;
}

.writerCl{
	width: 120px;
	height: 30px;
	border-radius: 6px;
}

.dateCl{
	width: 150px;
	height: 30px;
	border-radius: 6px;
}

.titleCl{
	width: 600px;
	height: 30px;
	border-radius: 6px;
}

.myContentsCl{
	width: 900px;
	height: 180px;
	border-radius: 6px;
}

.contentsCl{
	width: 900px;
	height: 180px;
	border-radius: 6px;
}


</style>
<script type="text/javascript">

</script>
</head>
<body>
<div>

<div><h2 class="sizeCl">내가 한 문의</h2></div>

<form action="" method="get">
<div class="">분류
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

<div>문의 내용<br>
	<input class="myContentsCl" type="text" value="">
</div>

<div>답변 내용<br>
	<input class="contentsCl" type="text" value="">
</div>

<div>
	<input type="submit" value="수정">
</div>

<div>
	<input type="button" value="뒤로가기">
</div>
</form>

</div>
</body>
</html>