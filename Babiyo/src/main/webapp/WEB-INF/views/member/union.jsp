<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원관리</title>

<style type="text/css">
#contents{
	float: left;
	width: 1050px;
	height: 500px;
	background-color: lightgrey;
}
</style>


</head>

<body>
	<jsp:include page="../Header.jsp"/>
   	<jsp:include page="../CommonMiddleDiv.jsp"/>
<%--   	<jsp:include page="../TitleCenterMiddleDiv.jsp"/> --%>

 	<div>
 		<div id='contents'></div>
 		<jsp:include page="../Paging.jsp"/>
 	</div>

	<jsp:include page="../Footer.jsp"/>
</body>

</html>