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
	border-radius: 10px;
}

#orderState, #inquiryState{
	width: 200px;
	height: 80px;
}
#orderState{
	float: left;
	border-right: 1px solid black;
}

#inquiryState{
	margin-left: 198px;
	border-left: 1px solid black;
}

.stateTitle{
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-bottom: 2px solid black;
}

.stateContent{
	height: 50px;
	line-height: 50px;
	text-align: center;
}

.stateCount{
	display: inline-block;
	width: 120px;
}

a{
	text-decoration: none;
	color: black;
}

</style>

<script type="text/javascript">

var today = new Date();

let year = today.getFullYear();
let month = today.getMonth();
let day = today.getDate();

var dateList = [];

for (var i = 0; i < 7; i++) {
	
	var week = new Date(year, month, day + (i - 6));
	
	let weekDay = week.getDate();
	
	if(weekDay < 10){
		weekDay = '0' + weekDay;
	}
	
	var str = week.getFullYear() + '-' + (week.getMonth()+1) + '-' + weekDay;
	
	dateList.push(str);
}

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
	    	        labels: dateList,
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
	        labels: dateList,
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
					<div class="stateTitle">
						<span><strong>밀키트주문</strong></span>
					</div>
					<div class="stateContent">
						<span class="stateCount"><a href="#">${countMap.orderCount}</a></span>
						<span>건</span>
					</div>
				</div>
				<div id="inquiryState">
					<div class="stateTitle">
						<span><strong>문의</strong></span>
					</div>
					<div class="stateContent">
						<span class="stateCount"><a>${countMap.inquiryCount}</a></span>
						<span>건</span>
					</div>
				</div>
			</div>
			
			
			
			<canvas id="salse" style="width: 800px; height: 200px; margin: 50px auto"></canvas>
			<canvas id="salseVolume" style="width: 800px; height: 200px; margin: 50px auto"></canvas>
		
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>