<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<footer>
	<div>
		<p class='footerPTag'>(주)바비요&nbsp;&nbsp;주소: 인천 남동구 인주대로 593 엔타스빌딩 16층&nbsp;&nbsp;대표이사: 이동현</p>
		<p class='footerPTag'>사업자 등록번호: 123-45-67890&nbsp;&nbsp;통신판매업 신고번호: 2022-인천남동-12345</p>
		<p id='footerSmallPTag' class='footerPTag'>copyright &copy; MM Co.,Ltd. All Rights Reserved.</p>
	</div>
</footer>
	
<script type="text/javascript">
$(function(){
	if(document.getElementById('sideTitle')){
		var side = $('#verticalSideMenuBarArea').text();
		var titleObj = document.getElementById('sideTitle');
		titleObj.innerHTML = '<p>' + document.title + '</p>';
	}
});
</script>
	