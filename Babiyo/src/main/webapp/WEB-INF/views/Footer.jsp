<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
html, body {
	padding: 0px;
	margin: 0px;
}

footer {
	height: 85px;
	font-size: 12px;
	background-color: #E0E0E0;
	padding: 5px 50px 10px 50px;
}

#footerSmallPTag {
	font-size: 10px;
	margin: 10px;
	color: #666666;
}

.footerPTag {
	margin: 10px;
	color: #A0A0A0;
}

</style>

<!-- 여기서 몸통 닫음 -->
</div>

<footer>
	<p class='footerPTag'>(주)바비요&nbsp;&nbsp;주소: 인천 남동구 인주대로 593 엔타스빌딩 16층&nbsp;&nbsp;대표이사: 이동현</p>
	<p class='footerPTag'>사업자 등록번호: 123-45-67890&nbsp;&nbsp;통신판매업 신고번호: 2022-인천남동-12345</p>
	<p id='footerSmallPTag' class='footerPTag'>copyright &copy; MM Co.,Ltd. All Rights Reserved.</p>
</footer>
	
<script type="text/javascript">
	window.onload = function () {
		var contentTitleObj = document.getElementById('contentTitle');
		contentTitleObj.innerHTML = '<p>' + document.title + '</p>';
	}
</script>	
	
	
	
	
	
	