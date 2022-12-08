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
	text-align: center;
}

#orderState, #inquiryState{
	display: inline-block;
	width: 200px;
	height: 80px;
}

#inquiryState{
	margin-left: 10px;
}

.stateTitle{
	height: 30px;
	line-height: 30px;
	text-align: center;
	background-color: #FF9436;
	color: #fff;
}

.stateContent{
	height: 50px;
	line-height: 50px;
	text-align: center;
}

.stateCount{
	display: inline-block;
	margin-right: 10px;
	text-align: right;
	width: 80px;
}

.stateCount a{
	text-decoration: none;
	color: black;
}

#orderTitle{
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

#inquiryTitle{
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
}

#orderContent{
	border: 2px solid #FF9436;
	border-top: 0;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

#inquiryContent{
	border: 2px solid #FF9436;
	border-top: 0;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
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
					<div id="orderTitle" class="stateTitle">
						<span><strong>대기중인 주문</strong></span>
					</div>
					<div id="orderContent" class="stateContent">
						<span class="stateCount"><a href="./orderList.do">${countMap.orderCount}</a></span>
						<span>건</span>
					</div>
				</div>
				<div id="inquiryState">
					<div id="inquiryTitle" class="stateTitle">
						<span><strong>답변하지 않은문의</strong></span>
					</div>
					<div id="inquiryContent" class="stateContent">
						<span class="stateCount"><a href="../inquiry/admin.do">${countMap.inquiryCount}</a></span>
						<span>건</span>
					</div>
				</div>
			</div>
			
			
			<h1 style="text-align: center;">일일 매출</h1>
			<canvas id="salse" style="width: 800px; height: 200px; margin: 50px auto"></canvas>
			
			
			<h1 style="text-align: center;">제품별 판매량</h1>
			<canvas id="salseVolume" style="width: 800px; height: 200px; margin: 50px auto"></canvas>
		
			<div id="underPadding"></div>
			
		</div> <!--middelMain 끝 -->
	
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div> <!-- rootDiv 끝 -->


</body>
</html>