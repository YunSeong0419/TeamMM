<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>네이버 : 회원가입</title>
		
		<style type="text/css">
		body{
			margin: 0 auto;
		}
		
		h4{
			margin-bottom: 300px;
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
		
		#goLogin{
			width: 200px;
			padding-bottom: 20px;
			padding-top: 20px;
			padding-right: 10px;
			border: none;
			border-radius: 8px;
			background: orange;
			color: white;
			font-size: 20px;
			text-align: center;
			margin: auto 0;
		}
		</style>
		
		<script type="text/javascript">
		function moveLoginFnc() {
			location.href='../login.do';
		};
			
		</script>
		
	</head>
	
	<body>
		<div id='wrap'>
			<div id='header'>
				<h1>
					<a href="../login.do">
						<img style="width: 150px; height: 60px;"  src="/babiyo/resources/img/logo.png">
					</a>
				</h1>
			</div>	
			<h1 style="text-align: center;">가입 완료!</h1>
			<h4 style="text-align: center;">환영 합니다!</h4>
			<div style="text-align: center;">
				<input id='goLogin' type="button" value='로그인하러가기' onclick="moveLoginFnc();">
			</div>	
		</div>	
	</body>
</html>