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

$(function(){
	
	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : './salesChart.do',           // 요청할 서버url
	    async : true,            // 비동기화 여부 (default : true)
	    success : function(data) { // 결과 성공 콜백함수
	    	
	    	console.log(data.weekList);
	    	console.log(data.amountList);
	    	
	    	const weekSales = document.getElementById('salse').getContext('2d');

	    	const weekSalesChart = new Chart(weekSales, {
	    	    type: 'bar',
	    	    data: {
	    	        labels: data.weekList,
	    	        datasets: [{
	    	            label: '일일 매출',
	    	            data: data.amountList,
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
	
	$.ajax({
	    type : 'post',           // 타입 (get, post, put 등등)
	    url : './productChart.do',           // 요청할 서버url
	    async : true,            // 비동기화 여부 (default : true)
	    success : function(data) { // 결과 성공 콜백함수
	    	
	    	console.log(data.nameList);
	    	console.log(data.countList);
	
			const productSales = document.getElementById('salseVolume').getContext('2d');
			
			const productSalesChart = new Chart(productSales, {
			    type: 'bar',
			    data: {
			        labels: data.nameList,
			        datasets: [{
			        	label: '판매량',
				       	data: data.countList
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
						<span><strong>대기 주문</strong></span>
					</div>
					<div class="stateContent">
						<span class="stateCount"><a href="./orderList.do">${countMap.orderCount}</a></span>
						<span>건</span>
					</div>
				</div>
				<div id="inquiryState">
					<div class="stateTitle">
						<span><strong>대기 문의</strong></span>
					</div>
					<div class="stateContent">
						<span class="stateCount"><a href="../inquiry/admin.do">${countMap.inquiryCount}</a></span>
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