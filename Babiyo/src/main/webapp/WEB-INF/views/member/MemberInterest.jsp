<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>네이버 : 회원가입</title>
		<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
		
		<style type="text/css">
		body{
			margin: 0 auto;
		}
		
		form{
			width: 400px;
			margin: 0 auto;
		}
		
		#wrap{
			margin: 0 auto;
		}
		
		#header{
			 text-align: center;
		}
		
		
		.chk_plz{
			color: red;
		}
		
		.bir_yy{
			display: table-cell;
			width: 25%;
		}
		.bir_mm{
			display: table-cell;
			width: 25%;
		}
		.bir_dd{
			display: table-cell;
			width: 25%;
		}
		.user_input{
			border: none;
			outline: 0;
		}
		.input_box{
			border: solid 1px #dadada;
			outline: 0;
			background-color: white;
			padding: 10px;
			margin: 3px;
		}
		
		.birth{
			width: 130px; height: 40px;
			margin: 7px;
			border: solid 1px #dadada;
		}
		
		#all_chk{
			width: 200px;
			margin-top: 20px;
			padding-bottom: 20px;
			padding-top: 20px;
			padding-right: 10px;
			border: none;
			border-radius: 12px;
			background: orange;
			color: white;
			font-size: 30px;
			text-align: center;
			float: left;
		}
		#jump{
			width: 200px;
			margin-top: 20px;
			padding-bottom: 20px;
			padding-top: 20px;
			padding-right: 10px;
			border: none;
			border-radius: 12px;
			background: orange;
			color: white;
			font-size: 30px;
			text-align: center;
			float: left;
		}
		</style>
		
		<script type="text/javascript">
		
			function skipInterestFnc() {
				location.href = './addComplete.do';
			}
		</script>
		
	</head>
	
	<body>
		<div id='wrap'>
			<div id='header'>
				<h1>
					<a href="../auth/login">
						<img style="width: 150px; height: 60px;"  src="/babiyo/resources/img/logo.png">
					</a>
				</h1>
			</div>	
			<h3 style="text-align: center;">관심사 선택</h3>
			<h4 style="text-align: center;">관심사는 고객님께서 원하시는 밀키트를 추천해 드리기 위해서 사용됩니다.</h4>
			<form  action='./addInterestCtr.do' method='post'>
			<input type="hidden" name="memberId" value="${memberId}">
				<div class="bir_wrap">
					<h3>관심사</h3>
					<div class="bir_yy">
							<input type="hidden" name="interestList[0].listNo" value="1">
 							<select id='myYear' class='birth' name='interestList[0].categoryCode'>
 								<option disabled selected>선택해주세요</option>
 								<c:forEach items="${categoryCodeList}" var="interest">
								<option value="${interest.CODE}">${interest.NAME}</option>
<!-- 							<option value="01">한식</option> -->
<!-- 							<option value="02">중식</option> -->
<!-- 							<option value="03">일식</option> -->
<!-- 							<option value="04">양식</option> -->
<!-- 							<option value="05">동남아</option> -->
							</c:forEach>
 							</select>
					</div>
					<h3>관심사</h3>
					<div class="bir_yy">
						<input type="hidden" name="interestList[1].listNo" value="2">
						<select id='myYear' class='birth' name='interestList[1].categoryCode'>
							<option disabled selected>선택해주세요</option>
							<c:forEach items="${categoryCodeList}" var="interest">
								<option value="${interest.CODE}">${interest.NAME}</option>
<!-- 							<option value="01">한식</option> -->
<!-- 							<option value="02">중식</option> -->
<!-- 							<option value="03">일식</option> -->
<!-- 							<option value="04">양식</option> -->
<!-- 							<option value="05">동남아</option> -->
							</c:forEach>
						</select>
					</div>
				</div>	
				<input id='all_chk' type="submit" value='결정'>
				<input id='jump' type="button"  value='건너뛰기' onclick="skipInterestFnc();">
			</form>	
		</div>	
	</body>
</html>