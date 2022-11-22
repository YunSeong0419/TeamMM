<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
		<c:if test="${paging.prevBlock ne 1}">
			<li>
				<a href="#" onclick="goPageFnc(${paging.prevBlock});">
					<span>«</span>
				</a>
			</li>
		</c:if>
		
		<c:forEach var="num" 
			begin="${paging.blockBegin}" 
			end="${paging.blockEnd}">
			<li id='pageButton${num}'>
				<a href="#" onclick="goPageFnc(${num});">
					<c:out value="${num}"/>
				</a>
			</li>
		</c:forEach>
		
		<c:if test="${paging.curBlock < paging.totBlock}">
			<li>
				<a href="#" onclick="goPageFnc(${paging.nextBlock});">
					<span>»</span>
				</a>
			</li>			
		</c:if>		
	</ul>
</nav>