<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>

<style type="text/css">

#mainPageNoticeArea{
	margin: 40px 0px 20px 0px;
	width: 1200px;
	height: 30px;
}

.noticeName{
	width: 100px;
	height: 30px;
	margin: 5px;
	font-size: 14px;
}

</style>

</head>
<body>
<jsp:include page="../Header.jsp"/>

<div id='mainPageNoticeArea'>
	<div class='noticeName'><span><strong>공지사항</strong></span></div>
	<div class='noticeTitle'></div>
	<div class='noticeDate'></div>
	<div class='goToNotice'></div>
</div>

<jsp:include page="../Footer.jsp"/>
</body>
</html>