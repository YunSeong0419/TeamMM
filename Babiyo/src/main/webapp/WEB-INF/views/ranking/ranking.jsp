<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	height: 300px;
	width: 400px;
	border: 1px solid black;
}

#wrapDiv{
	min-height: 600px;
	margin: auto;
	width: 1200px;
}

.boxCl{
	margin-left: 200px;
	
}
.topCl{
	margin: auto;
	
}
.toDayCl{
	float: left;
}

.weeklyCl{

}

.underCl{
	margin: auto;	
}

.ManCl{
	float: left;
}

.woManCl{
	clear: both;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"/>
<div id="wrapDiv">
<div class="boxCl">
<div class="topCl">
<div class="toDayCl">
<table>
<tr>
<th colspan="2">오늘 판매량 순위</th>
<th></th>
</tr>
<tr>
<td>1위</td>
<td>국밥</td>
</tr>
<tr>
<td>2위</td>
<td>치킨</td>
</tr>
<tr>
<td>3위</td>
<td>닭갈비</td>
</tr>
<tr>
<td>4위</td>
<td>돈까스</td>
</tr>
<tr>
<td>5위</td>
<td>한식</td>
</tr>
</table>
</div>

<div class="weeklyCl">
<table>
<tr>
<th colspan="2">주간 판매량 순위</th>
<td></td>
</tr>
<tr>
<td>1위</td>
<td></td>
</tr>
<tr>
<td>2위</td>
<td></td>
</tr>
<tr>
<td>3위</td>
<td></td>
</tr>
<tr>
<td>4위</td>
<td></td>
</tr>
<tr>
<td>5위</td>
<td></td>
</tr>
</table>
</div>
</div>
<div class="underCl">
<div class="manCl">
<table>
<tr>
<th colspan="2">남성 판매량 순위</th>
<td></td>
</tr>
<tr>
<td>1위</td>
<td></td>
</tr>
<tr>
<td>2위</td>
<td></td>
</tr>
<tr>
<td>3위</td>
<td></td>
</tr>
<tr>
<td>4위</td>
<td></td>
</tr>
<tr>
<td>5위</td>
<td></td>
</tr>
</table>
</div>

<div>
<table class="woManCl">
<tr>
<th colspan="2">여성 판매량 순위</th>
<td></td>
</tr>
<tr>
<td>1위</td>
<td></td>
</tr>
<tr>
<td>2위</td>
<td></td>
</tr>
<tr>
<td>3위</td>
<td></td>
</tr>
<tr>
<td>4위</td>
<td></td>
</tr>
<tr>
<td>5위</td>
<td></td>
</tr>
</table>
</div>
</div>
</div>
</div>

<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>