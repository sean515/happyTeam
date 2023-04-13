<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#joinEditForm ul{
		overflow:auto;
	}
	#joinEditForm li{
		text-align:left;
		float:left;
		width:20%;
		padding:10px 0;
		display:block;
		border-bottom:2px solid #ddd;
		line-height:40px;
	}
	#joinEditForm3 li{
		text-align:right;
	}
	#joinEditForm1 li{
		text-align:left;
		display:flex;
	}
	#joinEditForm2 li{
		text-align:right;
		border-bottom:2px solid #ddd;
	}
	#joinEditForm li:nth-child(2n){
		width:80%;
	}
	#joinEditForm li:last-child{
		width:100%;
	}
	#addr{width:80%;}
	.hr1{
		border:0;
		height:2px;
		background:black;
	}
	.hr2{
		border:0;
		height:1.5px;
		background:#ddd;
	}
	.hr3{
		border:0;
		height:0.5px;
		background:#ddd;
	}
	h1 { font-size:20px; float:center; margin:0 auto; }
	.clear:after {content:""; display:block; clear:both; margin:0 auto;}
	.fr { float:right; }
	.fl { float:left; }
	
	.box { padding:10px; width:1000px; margin:0 auto; }
	.fbox{ width:449px; height:300px; border:1px solid white; margin:0 auto;}
	
	.il_box { padding:20px; font-size:1; }
	.il_box > div { display:inline-block; width:33.333%; margin:0 auto; }
	.il_box > div > p { height:200px; border:1px solid #bbb; margin:0 auto; }
</style>
<script>
	
</script>
<div class="container">
	<h2>마이페이지</h2><br/>
	<h3>개인정보</h3><hr class="hr1"/>
	<form method="post" id="joinEditForm1">
		<ul>
			<li>
				<img src="img/user_icon.png" width="15%" height="15%"/>&emsp;&emsp;&emsp;
				${dto.username}님 | ${dto.userid}<br/>&emsp;&emsp;&emsp;
				${dto.gender}<br/>&emsp;&emsp;&emsp;
				${dto.birthday}<br/>&emsp;&emsp;&emsp;
				${dto.email}<br/>&emsp;&emsp;&emsp;
				${dto.diseaseArr}<br/>&emsp;&emsp;&emsp;
			</li>
		</ul>
	</form>
	<form method="post" id="joinEditForm2">
		<ul>
			<li>
				<a href="/happy/myPage/registerEditPopup" onclick="window.open(this.href, '_blank', 'width=450, height=430'); return false;">수정</a> / 
				<a href="/happy/myPage/registerEdit">개인정보 수정</a><br/><br/>
			</li>
		</ul>
	</form>
</div>
<div class="container">
	<br/><br/><h3>즐겨찾기</h3><hr class="hr1">
	<form method="post" id="joinEditForm">
		<ul>
			<li>
				<img src="img/restaurant_sample.jpg" width="200" height="200" align="left"/>
				<button class="btn" id="btn" type="button" style="padding:0px; display: block; margin-left: auto;"><img class="img_btn" src="img/heart_icon.png" width="30" height="30" align="right"></button><br/>
				&emsp;&emsp;&emsp;
				식당 이름 : 행복 샐러드
				식당 위치 : 서울특별시 강남구 OO로<br/>&emsp;&emsp;&emsp;
				대표 메뉴 : 단호박 샐러드<br/>&emsp;&emsp;&emsp;
				운영 시간 : 11:00~21:00<br/>
				<div style="text-align:right"><a href="/happy/myPage/userLikeRes">식당 즐겨찾기 더보기</a><hr class="hr2"/></div>
				
				<img src="img/menu_sample.jpg" width="200" height="200" align="left"/>
				&emsp;&emsp;&emsp;
				식단 이름 : 겨울 당뇨 식단<br/>&emsp;&emsp;&emsp;
				아침 식단 : 흑미밥, 채접 맑은국, 꽈리고추찜 등<br/>&emsp;&emsp;&emsp;
				점심 식단 : 현미밥, 소고기 샤브샤브, 박고지 묵은 김치 만두 등<br/>&emsp;&emsp;&emsp;
				저녁 식단 : 수수밥, 비지찌개, 갈치구이 등<br/>
				<div style="text-align:right"><a href="/happy/myPage/userLikeMenu">식단 즐겨찾기 더보기</a><hr class="hr2"/></div>
				
				<img src="img/recipe_sample.jpg" width="200" height="200" align="left"/>
				&emsp;&emsp;&emsp;
				레시피 이름 : 칼륨 듬뿍 고구마죽<br/>&emsp;&emsp;&emsp;
				조리방법 : 끓이기<br/>&emsp;&emsp;&emsp;
				요리 종류 : 후식<br/>&emsp;&emsp;&emsp;
				열량 : 205cal<br/>
				<div style="text-align:right"><a href="/happy/myPage/userLikeRecipe">레시피 즐겨찾기 더보기</a></div>
			</li>
		</ul>
	</form>
</div>

<!-- 
<div class="container">
	<h3>모아보기</h3><hr class="hr1"> 
</div>
-->

<div class="clear box">
	<br/><br/>
	<div class="fl fbox" >
		<p>내가 작성한 글<hr class="hr1"/><br/>
		   커뮤니티 | &nbsp;관리자님 힘내세요.<hr class="hr3"/>
		   식단&emsp;&ensp;&nbsp; | &nbsp;봄 당뇨 식단<hr class="hr3"/>
		   레시피&ensp;&nbsp; | &nbsp;누룽지 두부 계란죽
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:1em 0.5em; margin-right: 0.1em;"><a href="/happy/myPage/userWrite">내가 작성한 글 더보기</a><hr class="hr2"/></div>
			</li>
		</ul>
	</div>
	<div class="fr fbox">
		<p>내가 작성한 댓글<hr class="hr1"/><br/>
		   커뮤니티 | &nbsp;이거 먹고 건강해졌어요.<hr class="hr3"/>
		   식단&emsp;&ensp;&nbsp; | &nbsp;고혈압 환자도 먹어도 되나요?<hr class="hr3"/>
		   레시피&emsp; | &nbsp;오늘은 이거 먹어야겠어요.
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:1em 0.5em; margin-right: 0.1em;"><a href="/happy/myPage/userWriteReply">내가 작성한 댓글 더보기</a><hr class="hr2"/></div>
			</li>
		</ul>
	</div>
</div>
<!-- --------------------------------------------------------------------------------------- -->
<div class="clear box">
	<div class="fl fbox" >
		<p>식당 업데이트 요청<hr class="hr1"/><br/>
		   추가 | &nbsp;서울 관악구 | &nbsp;할랄푸드 전문점<hr class="hr3"/>
		   수정 | &nbsp;서울 강남구 | &nbsp;샐러드 전문점
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:1em 0.5em; margin-right: 0.1em;"><a href="/happy/myPage/userResUpdate">내가 요청한 식당 더보기</a><hr class="hr2"/></div>
			</li>
		</ul>
	</div>
	<div class="fr fbox">
		<p>문의사항<hr class="hr1"/><br/>
		   커뮤니티 | &nbsp;질문 있습니다.<hr class="hr3"/>
		   레시피&emsp; | &nbsp;이 정보 확실한가요?
		</p>
		<ul>
			<li>
				<div style="text-align:right; padding:1em 0.5em; margin-right: 0.1em;"><a href="/happy/myPage/userSupView">내가 문의한 내용 더보기</a><hr class="hr2"/></div>
			</li>
		</ul>
	</div>
</div>