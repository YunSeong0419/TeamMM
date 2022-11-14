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
}

#wrapDiv {
	min-height: 650px;
	margin: auto;
	width: 1200px;
}

#boxDiv {
	margin-left: 200px;
	margin-top: 70px;
}



#rankDiv {
	float: left;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Header.jsp"/>
<div id="wrapDiv">
		<!--wrap Div 시작-->
		<div id="boxDiv">
			<div class="topCl">
				<div id="rankDiv">
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

				<div id="rankDiv">
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
				<div id="rankDiv">
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
					<table id="rankDiv">
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
	<!--wrap Div 끝-->

<jsp:include page="/WEB-INF/views/Footer.jsp"/>
</body>
</html>