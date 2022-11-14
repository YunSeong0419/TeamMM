<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">

#middleSideDiv{
	padding: 0px;
	margin: 0px auto;
	width: 1200px;
	min-height: 650px;
/* 	background-color: lightgreen; */
}

#contentTitle{
	width: 1200px;
 	height: 72px;
	margin: 0px;
	padding-top: 28px;
	line-height: 50px;
 	float: left;
/*  	background-color: lightgray; */
}

#contentTitle > p{
	padding-left: 40px;
	margin: 0px;
	font-size: 22px;
	font-weight: bold;
	text-align: center;
}

#content{
	float: left;
}

</style>

<!-- 밑 div를 닫으면 컨텐츠가 몸통 밑으로 들어가게 됨. 푸터 시작에서 닫음. -->
<div id='middleSideDiv'>
	<div id='contentTitle'></div>
	
	<div id='content'>
		여기부터 작성해주세요.
	</div>
