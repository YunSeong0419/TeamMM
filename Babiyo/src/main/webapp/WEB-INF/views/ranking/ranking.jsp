<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<style type="text/css">
ul{
	list-style: none;
}

#boxDiv {
	margin: auto;
}

#rankingDiv {
	margin-top: 10px;
	float: left;
}

#ulId {
	text-align:center;
	margin: auto;
	height: 300px;
	width: 600px;
}

#rankIi{
	font-size: 30px;
	font-weight: bold;
}

ul > .listCl{
	margin-top: 30px;
	margin-left: 150px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
}

</style>
</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<div id='centerTitle'></div>
		<!--여기서 작성 -->
		     <div id="boxDiv">
		       	<div id="rankingDiv">
				<ul id="ulId">
					<li id="rankIi">오늘 판매량 순위</li>
					<c:forEach items="${toDayList}" var="ranking" varStatus="status">
						<li class="listCl">${status.count}위&nbsp;&nbsp;&nbsp;${ranking}</li>
					</c:forEach>
				</ul>
		     	 </div>
			
				<div id="rankingDiv">
				<ul id="ulId">
					<li id="rankIi">주간 판매량 순위</li>
					<c:forEach items="${weeklyList}" var="ranking" varStatus="status">
						<li class="listCl">${status.count}위&nbsp;&nbsp;&nbsp;${ranking}</li>
					</c:forEach>
				</ul>
		     	 </div>

			<div id="rankingDiv">
				<ul id="ulId">
					<li id="rankIi">남성 판매량 순위</li>
					<c:forEach items="${manList}" var="ranking" varStatus="status">
						<li class="listCl">${status.count}위&nbsp;&nbsp;&nbsp;${ranking}</li>
					</c:forEach>
				</ul>
		     	 </div>

			<div id="rankingDiv">
				<ul id="ulId">
					<li id="rankIi">여성 판매량 순위</li>
					<c:forEach items="${womanList}" var="ranking" varStatus="status">
						<li class="listCl">${status.index}위&nbsp;&nbsp;&nbsp;${ranking}</li>
					</c:forEach>
				</ul>
		     	 </div>
		      </div>
	
		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>