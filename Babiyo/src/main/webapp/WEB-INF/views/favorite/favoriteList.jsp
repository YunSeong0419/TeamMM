<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>

<style type="text/css">
#middleDiv hr{
	margin: 10px 0px;
	height: 3px;
}

#allCheckContainer{
	width: 900px;
	margin: auto;
}


#favoriteContainer{
	width: 900px;
	height: 460px;
	border-top: 3px solid #FF9436;
	margin: 10px auto;
	font-size: 0;
}

.favorite{
	display: inline-block;
	margin: 20px 5px;
	font-size: 16px;
}

.productImgContainer{
	width: 170px;
	height: 170px;
}

.productImg{
	width: 170px;
	height: 170px;
}

.productName{
	display: inline-block;
	width: 170px;
	text-align: center;
}

.productName > a{
	text-decoration: none;
	color: #000;
}

#btnContainer{
	width: 900px;
	text-align: center;
	margin: 20px auto 40px auto;
	clear: both;
}

#cartAdd, #selectDelete{
	width: 100px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background-color: #FF9436;
	font-weight: bold;
	color: white;
}

#emptyFavorit{
	display: block;
	margin-top: 200px;
	text-align: center;
	font-size: 25px;
	font-weight: bold;
}


</style>

<script type="text/javascript">
$(function(){

	$('#allCheck').change(function() { // 전체선택 기능
		var checked = $(this).is(':checked');
		$('.check').prop('checked', checked);
	});
	
	$('#cartAdd').click(function() { // 선택한 품목만 장바구니 담기
		var checked = $('.check').is(':checked');
		
		if(checked == false){ // 하나라도 체크가 되어야지 수행
			alert('선택한 항목이 없습니다');
			return;
		}
		
		var productList = [];
		
		$('.check:checked').each(function() {
			var no = $('.check').index(this); // 체크가 되어있는 인덱스의 번호
			productList.push($('.productNo').eq(no).val());
		});
		
		$.ajax({
		    type : 'post',           // 타입 (get, post, put 등등)
		    url : '../cart/cartListAdd.do',        // 요청할 서버url
		    async : true,            // 비동기화 여부 (default : true)
		    data : {productList : productList},
		    success : function() { // 결과 성공 콜백함수
				alert('장바구니에 추가되었습니다');
		    }
		}); // ajax 종료
	});
	
	$('#selectDelete').click(function() { // 선택한 품목만 삭제
		
		var checked = $('.check').is(':checked');
		
		if(checked == false){ // 하나라도 체크가 되어야지 수행
			alert('선택한 항목이 없습니다');
			return;
		}
		
		if(confirm('선택한 품목을 삭제하시겠습니까?') == false){ // 삭제를 할 것인지 확인
			return;
		}
		
		$('.check:checked').each(function(index) {
			var no = $('.check').index(this); // 체크가 되어있는 인덱스의 번호
			var name = 'favoriteList[' + index + '].productNo'; 
			$('.productNo').eq(no).attr('name', name); // 체크가 된 제품번호에만 name 태그를 달아줌
		});
		
		alert('즐겨찾기가 삭제되었습니다');
			
		$('#favoriteForm').attr('action', './favoriteDelete.do');
		$('#favoriteForm').submit();
	});
	
	
});


</script>

</head>
<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
	
		<jsp:include page="/WEB-INF/views/CommonMiddleDiv.jsp" />
		
		<div id="middleMainDiv">
			<div id="sideTitle"></div>
				
			<div id="allCheckContainer">
				<input type="checkbox" id="allCheck">
				<label for="allCheck">전체선택</label>
			</div>
				
			<form id="favoriteForm" method="post">
				<div id="favoriteContainer">
						<c:choose>
							<c:when test="${!empty favoriteList}">
								<c:forEach items="${favoriteList}" var="list" varStatus="status">
									<div class="favorite">
										<div class="productImgContainer">
											<label for="check${status.index}">
												<img class="productImg" onerror="this.onerror=null; this.src='/babiyo/resources/img/logo.png'"
														src="/babiyo/img/${list.imgMap.STORED_NAME}">
											</label>
										</div>
										<span class="productName">
											<input type="checkbox" class="check" id="check${status.index}"> 
											<a href="/babiyo/product/detail.do?productNo=${list.favoriteDto.productNo}">
												${list.favoriteDto.productName}
											</a>
										</span>
										<input type="hidden" class="productNo" value="${list.favoriteDto.productNo}">
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div id="emptyFavorit">즐겨찾기가 없습니다</div>
							</c:otherwise>
						</c:choose>
				</div>
				
				<div id="btnContainer">
					<input type="button" value="장바구니 담기" id="cartAdd">
					<input type="button" value="선택 삭제" id="selectDelete">
				</div>
				
				<input type="hidden" name="backPage" value="favorite">
			</form>
			
			<form id="pagingForm">
				<input type="hidden" id="curPage" name="curPage" value="${paging.curPage}">
			</form>
			
			<jsp:include page="/WEB-INF/views/Paging.jsp"/>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>