<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
		<tr>
			<th>번호</th><th>날짜</th><th>충전캐시</th><th>잔여캐시</th><th></th>
		</tr>
			
		<c:forEach var="memberDto" items="${memberList}"> 
		<tr>			
			<td>${memberDto.no}</td>
			<td>
				<form id='memberDetailForm' action="./one.do" method="get">
					<a href='#' onclick="pageMoveMemberDetailFnc();">
						${memberDto.name}
					</a>
					<input type="hidden" name="no" value="${memberDto.no}">
					<input type="hidden" id="memberDetailCurPage" 
						name="curPage" value="">
					<input type="hidden" name="keyword" 
						value="${searchMap.keyword}">
					<input type="hidden" name="searchOption" 
						value="${searchMap.searchOption}">
				</form>
			</td>
			<td>${memberDto.email}</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
				value="${memberDto.createDate}"/>
			</td>
			<td>
				<a href='./deleteCtr.do?no=${memberDto.no}'>[삭제]</a>
			</td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>