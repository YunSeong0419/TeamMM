<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>
<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>

<style type="text/css">
#stateContainer{
	width: 400px;
	margin: auto;
	border: 2px solid black;
	border-radius: 20px;
}

#orderState, #inquiryState{
	width: 200px;
	height: 150px;
}
#orderState{
	float: left;
}

#inquiryState{
	margin-left: 200px;
}

</style>

<script type="text/javascript">
$(function(){
	
	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : './salesChart.do',           // 요청할 서버url
	    async : true,            // 비동기화 여부 (default : true)
	    success : function(data) { // 결과 성공 콜백함수
	    	
	    	const ctx = document.getElementById('salse').getContext('2d');

	    	const myChart = new Chart(ctx, {
	    	    type: 'bar',
	    	    data: {
	    	        labels: ['6일전', '5일전', '4일전', '3일전', '2일전', '1일전', '오늘'],
	    	        datasets: [{
	    	            label: '일일 매출',
	    	            data: data,
	    	            backgroundColor: [
	    	                'rgba(255, 99, 132, 0.2)',
	    	                'rgba(54, 162, 235, 0.2)',
	    	                'rgba(255, 206, 86, 0.2)',
	    	                'rgba(75, 192, 192, 0.2)',
	    	                'rgba(153, 102, 255, 0.2)',
	    	                'rgba(255, 159, 64, 0.2)'
	    	            ],
	    	            borderColor: [
	    	                'rgba(255, 99, 132, 1)',
	    	                'rgba(54, 162, 235, 1)',
	    	                'rgba(255, 206, 86, 1)',
	    	                'rgba(75, 192, 192, 1)',
	    	                'rgba(153, 102, 255, 1)',
	    	                'rgba(255, 159, 64, 1)'
	    	            ],
	    	            borderWidth: 1
	    	        }]
	    	    },
	    	    options: {
	    	    	responsive: false,
	    	    	plugins: {
	    	    		legend: {
	    	    			display: false
	    	    		}
	    	    	},
	    	        scales: {
	    	            y: {
	    	                beginAtZero: true
	    	            }
	    	        }
	    	    }
	    	});
	    	
	    	
	    	
	    }
	}); // ajax 종료
	
const ctx3 = document.getElementById('salseVolume').getContext('2d');
	
	const myChart3 = new Chart(ctx3, {
	    type: 'line',
	    data: {
	        labels: ['6일전', '5일전', '4일전', '3일전', '2일전', '1일전', '오늘'],
	        datasets: [{
	            label: '봉골레파스타',
	            data: [12, 19, 3, 5, 2, 3, 2],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        },{
	            label: '까르보나라',
	            data: [1, 22, 3, 14, 12, 18],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        },{
	            label: '로제파스타',
	            data: [30, 12, 24, 10, 2, 18],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
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
			<!--여기서 작성 -->
			
			
			<div id="stateContainer">
				<div id="orderState">
					<span>
					밀키트주문
					</span>
					<span>
					건
					</span>
				</div>
				<div id="inquiryState">
					<span>
					문의
					</span>
					<span>
					건
					</span>
				</div>
			</div>
			
			
			
			<canvas id="salse" style="width: 1000px; height: 200px; float: left;"></canvas>
			<canvas id="salseVolume" style="width: 1000px; height: 200px;"></canvas>
		
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>