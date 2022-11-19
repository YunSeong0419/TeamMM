<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style type="text/css">
nav{
	width: 1050px;
	height: 40px;
	margin: 5px auto;
	float: left;
}
nav > ul{
	display: table;
	list-style-type: none;
	overflow: hidden;
	margin: auto;
	padding: 0px;
}

nav > ul > li{
	margin-right: 3px;
	border: 2px solid #FF5E00;
	border-radius: 5px;
	float: left;
}

nav > ul > li > a{
	width: 16px;
	height: 16px;
	display: block;
	color: #FF0000;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	line-height: 14px;
	padding: 10px;
	text-decoration: none;
}

nav > ul > li > a:hover {
	color: #FF00DD;
	background-color: #FF5E00;
	font-size: 16px;
	font-weight: bold;
}

.active {
	color: #000000;
	font-size: 16px;
    background-color: #FF5E00;
    font-weight: bold;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function goPageFnc(pageNumber){

		var curPageObj = $("#curPage");
		curPageObj.val(pageNumber);
	
		$("#pagingForm").submit();
	}
	
	window.onload = function(){
		var curPageDoc = $('#curPage');
		var pageButtonId = '#pageButton' + curPageDoc.val();
		
		$(pageButtonId).addClass('active');
	}
</script>

<nav>
	<ul>
		<c:if test="${pagingMap.memberPaging.prevBlock ne 1}">
			<li>
				<a href="#" onclick="goPageFnc(${pagingMap.memberPaging.prevBlock});">
					<span>«</span>
				</a>
			</li>
		</c:if>
		
		<c:forEach var="num" 
			begin="${pagingMap.memberPaging.blockBegin}" 
			end="${pagingMap.memberPaging.blockEnd}">
			<li id='pageButton${num}'>
				<a href="#" onclick="goPageFnc(${num});">
					<c:out value="${num}"/>
				</a>
			</li>
		</c:forEach>
		
		<c:if test="${pagingMap.memberPaging.curBlock 
			< pagingMap.memberPaging.totBlock}">
			<li>
				<a href="#" onclick="goPageFnc(${pagingMap.memberPaging.nextBlock});">
					<span>»</span>
				</a>
			</li>			
		</c:if>		
	</ul>
</nav>