<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

<style type="text/css">
table {
	border-collapse: collapse;
}

th {
	height: 30px;
    background-color: #FF9436;
    color: #fff;
}

td{
	height: 35px;
	border-bottom: 2px solid #FF9436;
	padding: 0px 10px;
}

a{
	text-decoration: none;
	color: black;
}

span{
	font-weight: bold;
	margin-right: 20px;
}

#filterDiv{
	margin: auto;
	width: 900px;
}

#stateForm{    
	padding-top: 1px;
	float: left;
}

#stateSelect{
	width: 130px;
	height: 35px;
	line-height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 10px;
}

 #searchSelect{
	width: 100px;
	height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 40px;
}

#searchFrom{
	margin-left: 510px;
}

 .searchCl{
	width: 150px;
	height: 35px;
	border-radius: 5px;
	margin: 0px 5px 10px 10px;
} 

#searchId{
	float: right;
}

#divisionId{
	margin-left: 10px;
}

#noticeList{
	margin-top: 10px;
	min-height: 400px;
}

#noticeListTable{
	margin: auto;
}

#firstRow{
	background-color: #E0E0E0;
}

#noticeNoTh {
	width: 100px;
}

#noticeCategoryNameTh {
	width: 150px;
}

#titleTh {
	width: 200px;
}

#createTh {
	width: 250px;
}

#hitTh{
	width: 200px;
}

.noticeCategoryTd, .hitTd, .createTd{
	text-align: center;
}

#inputBtn{
	width: 925px;
	height:20px; 
	margin: 0px 0px 50px 50px;
}

.writeBtn{
	float: right;
 	width: 80px;
    height: 35px;
    border: 0px;
    border-radius: 5px;
    color: #fff;
    background-color: #FF9436;
    font-size: 16px;
	cursor: pointer;
}

#searchBoxBtn {
    margin-left: 5px;
    padding-bottom: 3px;
    width: 60px;
    height: 35px;
    border: 0px;
    border-radius: 5px;
    color: #fff;
    background-color: #FF9436;
    font-size: 16px;
}
</style>

<link rel="stylesheet" type="text/css"
	href="/babiyo/resources/css/common.css" />
<script type="text/javascript"
	src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$('#searchSelect').val($('#searchOption').val());
	$('.searchCl').val($('#hiddenSearch').val());
	
	});

	
	

	function writeBtn() {

		location.href = "../adminHome.do";
	}
</script>
</head>
<body>

	<div id="rootDiv">

		<jsp:include page="/WEB-INF/views/Header.jsp" />

		<div id="middleDiv">

			 <jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />

			 <div id="middleMainDiv"> 
				<div id="sideTitle"></div>
				<!--여기서 작성 -->
				<div id="filterDiv">
						<!--  filterDiv 시작-->
						<form id="stateForm" method="post">
							
						</form>
					
<!-- 						<form method="post" id="searchFrom"> -->
<!-- 						<select name="searchOption" id="searchSelect"> -->
<!-- 								<option value="">전체</option> -->
<!-- 								<option value="title">아이디</option> -->
<!-- 								<option value="content">이름</option> -->
<!-- 						</select> -->
<%-- 						<input type="hidden" id="hiddenSearch" value="${searchOption.search}"> --%>
<!-- 						<input class="searchCl" type="text" name="search"> -->
<!-- 						<input id="searchBoxBtn" type="submit" value="검색"> -->
<!-- 						</form> -->
				</div>
				<!-- filterDiv 끝-->

				<div id="noticeList">
					<!-- table div 시작 -->
					<table id="noticeListTable">
						<tr id="firstRow">
							<th id="noticeNoTh">아이디</th>
							<th id="noticeCategoryNameTh">이름</th>
							<th id="titleTh">닉네임</th>
							<th id="createTh">이메일</th>
							<th id="hitTh">가입일</th>
						</tr>

						<c:choose>
							<c:when test="${empty memberList}">
								<tr>
									<td colspan="5"
										style="width: 900px; height: 350px; font-weight: bold; text-align: center;">
										회원이 존재하지 않습니다</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach var="memberDto" items="${memberList}">
									<tr>
										<td>${memberDto.id}</td>
										
 												<td class="noticeCategoryTd"> ${memberDto.name}</td> 
<%-- 										미구현..	<a href="/babiyo/member/memberinfo.do?id=${memberDto.id}"/> --%>
										<td>${memberDto.nickname}</td>
										<td class="createTd">${memberDto.email}</td>
										<td class="hitTd"><fmt:formatDate pattern="yyyy-MM-dd "
												value="${memberDto.createDate}" /></td>		
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<!--table div끝 -->
					<div id="inputBtn">
						<input class="writeBtn" type="button" value="뒤로가기" onclick="writeBtn();">
					</div>

				<jsp:include page="/WEB-INF/views/Paging.jsp" />
				
			<form id="pagingForm" method="post">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
				<input type="hidden" id="searchOption" name="searchOption" value="${searchOption.searchOption}">
				<input type="hidden" name="search" value="${searchOption.search}">
			</form>

				<div id="underPadding"></div>
				<!--underPadding-->

			</div> 
				<!--middelMain 끝 -->

		</div>
		<!--middleDiv 끝 -->

		<jsp:include page="/WEB-INF/views/Footer.jsp" />

	</div>
	<!--rootDiv 끝 -->

</body>
</html>