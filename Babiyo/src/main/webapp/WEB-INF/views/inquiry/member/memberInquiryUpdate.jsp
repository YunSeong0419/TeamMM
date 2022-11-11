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
	width: 150px;
	height: 40px;
	border-radius: 6px;
}

.titleCl{
	width: 800px;
	height: 40px;
	border-radius: 6px;
}

.contentsCl{
	width: 900px;
	height: 350px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div>
<div><h2 class="sizeCl">문의 수정</h2></div>
<form action="" method="get">
<div>분류 
<select class="divisionCl">
	<option selected>주문</option>
	<option>충전</option>
	<option>기타</option>
</select>
</div>

<div>제목 <input class="titleCl" type="text" value="제목"></div>
<div>내용<br>
<input class="contentsCl" type="text"></div>
<input type="button" value="뒤로가기" onclick="">
<input type="button" value="삭제" onclick="">
<input type="submit" value="수정">

</form>
</div>



</body>
</html>