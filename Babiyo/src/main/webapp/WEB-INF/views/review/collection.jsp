<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 모음</title>

<link rel="stylesheet" type="text/css" href="/babiyo/resources/css/common.css"/>

<style type="text/css">
.reviewCollectionTitle{
	width: 900px;
 	height: 68px;
	margin: auto;
	line-height: 68px;
}

.reviewCollectionTitle > p{
	color: #4A4A4A;
	padding: 10px 10px;
	margin: 0px auto;
	font-size: 22px;
	font-weight: bold;
	text-align: left;
	text-decoration: none;
}

.lowerDivisionLine{
	width: 900px;
	margin: 0px auto;
	border: 0px;
	background-color: #FF9436;
	height: 2px;
}

.reviewCollectionList{
	width: 900px;
	height: 250px;
	margin: 0px auto;
}

.productInfo{
	width: 150px;
	height: 250px;
	float: left;
}

.productImage{
	margin-top: 20px;
	width: 150px;
	height: 150px;
	text-align: center;
}

.productImage > a{
	margin: auto;
	width: 100px;
	height: 100px;
	text-align: center;
}

.productName{
	margin-top: 20px;
	width: 150px;
	height: 20px;
	font-weight: bold;
	text-align: center;
}

.userEvaluation{
	padding-top: 20px;
	width: 750px;
	height: 150px;
	float: left;
}

.nickname{
	margin-left: 20px;
	height: 30px;
	font-size: 16px;
	font-weight: bold;
	line-height: 30px;
	float: left;	
}

.starRating{
	margin-top: 4px;
	margin-left: 30px;
	width: 120px;
}

.starRating, .starRating > span{
	display: inline-block;
	height: 21px;
	overflow: hidden;
	background: url("/babiyo/resources/img/star.png")no-repeat;
	background-size: 120px 42px;
}

.starRating > span{
	width: 120px;
	height: 21px;
	background-position: left bottom;
	line-height: 0px;
	vertical-align: top;
}

.reviewContent{
	margin-left: 20px;
	font-size: 14px;
	width: 700px;
	height: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	line-height: 1.4;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
}

.userUploadImage{
	padding-left: 20px;
	width: 750px;
	height: 100px;
	float: left;
}

.userUploadImage > a{
	width: 100px;
	height: 100px;
	margin-right: 20px;
	float: left;
}
.userUploadImage > a > img{
	width: 100px;
	height: 100px;
}

#lowerButtonDiv{
	margin-top: 10px;
	width: 1200px;
	height: 50px;	
	line-height: 50px;
	text-align: center;
	float: left;
}

#lowerButton{
	margin: 0px;
	border: 0px;
	width: 100px;
	height: 40px;
	background-color: #FF9436;
	border-radius: 5px;
	font-size: 16px;
}

.reviewCollectionList {
    display: none;
}

.reviewCollectionList.active {
    display: block;
}
</style>

<script type="text/javascript" src="/babiyo/resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript" src="js/js-load.js"></script>
<script type="text/javascript">
	$(window).on('load', function () {
		load('.reviewCollectionList', '4');
	    $('#lowerButton').on('click', function () {
	        load('.reviewCollectionList', '4', '#lowerButtonDiv');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var reviewList = id + ".reviewCollectionList:not(.active)";
	    var reviewLength = $(reviewList).length;
	    var reviewTotalCount;
	    
	    if (cnt < reviewLength) {
	    	reviewTotalCount = cnt;
	    } else {
	    	reviewTotalCount = reviewLength;
	        $('#lowerButton').hide();
	    }
	    $(reviewList + ":lt(" + reviewTotalCount + ")").addClass("active");
	}
</script>
</head>

<body>

<div id="rootDiv">

	<jsp:include page="/WEB-INF/views/Header.jsp" />

	<div id="middleDiv">
		<!--여기서 작성 -->
		<div class='reviewCollectionTitle'>
			<p>따끈따끈한 최신 리뷰를 확인해 보아요.</p>
		</div>
		
		<hr class='lowerDivisionLine' />		
		
		<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
		
		
				<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
		
				<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
		
				<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
		
				<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>

				<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
						<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
						<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
						<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>
						<div class='reviewCollectionList'>
			<div class='productInfo'>
				<div class='productImage'>
					<a href="#"><img alt="밀키트 이미지 " src=""></a>
				</div>				
				<div class='productName'>태극전사 레드불</div>
			</div>
			<div class='userEvaluation'>
				<div class='nickname'>조윤성</div>
					<div class='starRating'>
						<span style="width: 80%"></span>
					</div>
				<div class='reportingDate'></div>
				<div class='reviewContent'>
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
					오늘은팬더차이나에가서사천식소고기볶음밥을먹었다.윤성씨가쏴서먹었는데칠리탕수육도그렇고정말맛있었다.매워서땀이났지만맛있게매워서좋았다.사장님도예쁘시고가게도멀지않고맛도좋으니가끔가야겠다.보답으로에너지가득한New취향탄생태극전사레드불에너지를사드렸다.근데맛이레드불에그냥음료탄맛이다.이걸4천원받고팔다니양심이있는건지모르겠다.음료수라고생각하면나쁘지않기는하다.내일까지이력서랑자소서써야되니까저녁에안잘용도로는괜찮을것같다.
				</div>
			</div>
			<div class='userUploadImage'>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
				<a href="#"><img alt="밀키트 이미지 " src=""></a>
			</div>
			<hr class='lowerDivisionLine'/>	
		</div>		
		<div id='lowerButtonDiv'>
			<input type="button" value="더보기" id='lowerButton'>
		</div>

		<div id="underPadding"></div>
		
	</div> <!--middleDiv 끝 -->

	<jsp:include page="/WEB-INF/views/Footer.jsp" />

</div>  <!--rootDiv 끝 -->

</body>
</html>