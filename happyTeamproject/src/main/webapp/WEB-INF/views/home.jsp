<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	/*커밋용 수정*/
	ul{
		padding: 0;
		margin: 0;
	}
	/*메인영역 배경색*/
	.main1{
		width: 100%;
		height:500px;
		background-color: #DCE775;
	}
	/*메인영역 하루한끼 텍스트*/
	.container>h1{
		position:absolute;
		top:100px;
		margin:0;
		padding: 50px 0 0 0;
		color: white;
	}
	/*메인영역 추가 텍스트*/
	.container>h3{
		position:absolute;
		top:200px;
		margin:0;
		padding: 50px 0 0 0;
		color: white;
	}
	
	/*메인영역 더알아보기 텍스트*/
	.container>a{
		position:absolute;
		top:400px;
		text-decoration: none;
	}
	
	/*메인이미지*/
	#mainimg{
		position:absolute;
		top: 155px;
		right:200px;
		width: 600px;
	}
	/*메인 인기레시피*/
	.main2{
		margin-top:50px;
		height: 250px;
	}
	.main2>ul>li{
		float:left;
		list-style:none;
		margin:50px 25px;
		color: gray;
	}
	.main2>ul>li:nth-child(2n+1){
		margin: 25px 0;
	}
	.main2>ul>li>img{
		width: 180px;
	}
	
	/*메인 맞춤식단*/
	.main3{
		height:750px;
		width: 100%;
	}
	
	#card1,#card2,#card3,#card4{
	 margin: 30px 15px 0px 15px;
	}
	#card5{
	  position: absolute;
	  left: 50%;
	  transform: translateX(-50%);
	   margin-top: 30px;
	}
	
	
	.main3 h4{
		text-align: center;
		padding: 50px 0;
	}
	
	/*메인 인기식당 리스트*/
	.main4{
		margin-top:50px;
		height: 500px;
	}
	.main4 h4{
		padding-top:50px;
		text-align: center;
		margin: 0;
	}
	.main4>ul>li>img{
		width: 280px;
	}
	.main4>ul{
	  display: table;
	  margin-left: auto;
	  margin-right: auto;
	}
	.main4>ul>li{
		float:left;
		color: gray;
		margin: 40px 20px 0;
	}
	.main4>ul>li>h5{
		margin-left:0px;
		margin-right: 0px;
		padding-left:0px;
		padding-right:0px;
		width: 200px;
	}
	
	#heart{
		width: 30px;
	}
	
	.main5{
		height: 500px;
	}
	.main5 h4{
		text-align: center;
		margin: 0;
	}
	.main5>ul>li>img{
		width: 280px;
	}
	.main5>ul{
	  display: table;
	  margin-left: auto;
	  margin-right: auto;
	}
	.main5>ul>li{
		float:left;
		color: gray;
		margin: 40px 20px 0;
	}
	
</style>
<div class="main1">
</div>
<div class="container">
<h1>행 복 한 끼</h1>
	<h3>맞춤 건강식 식당 정보 제공<br/>
	기호에 맞는 레시피 추천<br/>
	안심하고 즐길 수 있는 좋은 음식</h3>
	<a href="">더 알아보기</a>
<!-- 메인이미지 슬라이드 시작-->
<!-- Carousel -->
<div id="mainimg" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/mainimg.PNG" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="img/mainimg.PNG" alt="Chicago" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="img/mainimg.PNG" alt="New York" class="d-block" style="width:100%">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<!-- 메인이미지 슬라이드 끝-->
<div class="main2">
	<ul>
	<li>
		<h5>인기레시피</h5>
		제철음식부터 모든 채식을 한자리에 모았습니다.<br/>
		제철음식부터 모든 채식을 한자리에 모았습니다.
	</li>
	<li><img src="img/mainimg2.PNG"/></li>
	<li>
		<h5>인기레시피</h5>
		제철음식부터 모든 채식을 한자리에 모았습니다.<br/>
		제철음식부터 모든 채식을 한자리에 모았습니다.
	</li>
	<li><img src="img/mainimg2.PNG"/></li>
	</ul>
</div>
<!-- 맞춤식단 영역 -->
<div class="main3">
	<h4>맞춤 건강 식단</h4>
	<div class="row row-cols-1 row-cols-md-2 g-4">
	<!-- 카드 부트스트랩 1-->
	<div id="card1" class="card mb-3" style="max-width: 540px;">
  	<div class="row g-0">
    <div class="col-md-4">
      <img src="img/menuimg1.PNG" class="img-fluid rounded-start">
    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
 	 </div>
	</div>
	<!-- 카드부트스트랩 끝 -->
	<!-- 카드 부트스트랩 2-->
	<div id="card2" class="card mb-3" style="max-width: 540px;">
  	<div class="row g-0">
    <div class="col-md-4">
      <img src="img/menuimg1.PNG" class="img-fluid rounded-start">
    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
 	 </div>
	</div>
	<!-- 카드부트스트랩 끝 -->
	<!-- 카드 부트스트랩 3-->
	<div id="card3" class="card mb-3" style="max-width: 540px;">
  	<div class="row g-0">
    <div class="col-md-4">
      <img src="img/menuimg1.PNG" class="img-fluid rounded-start">
    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
 	 </div>
	</div>
	<!-- 카드부트스트랩 끝 -->
	<!-- 카드 부트스트랩 4-->
	<div id="card4" class="card mb-3" style="max-width: 540px;">
  	<div class="row g-0">
    <div class="col-md-4">
      <img src="img/menuimg1.PNG" class="img-fluid rounded-start">
    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
 	 </div>
	</div>
	</div>
	<!-- 카드부트스트랩 끝 -->
	<!-- 카드 부트스트랩 5-->
	<div id="card5" class="card mb-3" style="max-width: 540px;">
  	<div class="row g-0">
    <div class="col-md-4">
      <img src="img/menuimg1.PNG" class="img-fluid rounded-start">
    </div>
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title">Card title</h5>
	        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
	        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
	      </div>
	    </div>
 	 </div>
	</div>
</div>	
	

<!-- 인기레시피 영역 -->
<div class="main4">
	<h4>인기레시피</h4>
	<ul>
		<li>
			<img src="img/recipe1.PNG" >
			<br/>레시피&nbsp;&nbsp;&nbsp;&nbsp;
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
 			<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			</svg>
			
		</li>
		<li>
			<img src="img/recipe1.PNG" >
			<h5>레시피</h5><img id="heart"src="img/heart.PNG">
		</li>
		<li>
			<img src="img/recipe1.PNG" >
			<h5>레시피</h5><img id="heart"src="img/heart.PNG">
		</li>
		
	</ul>
    
</div>

<!-- 인기레시피 영역 -->
<div class="main5">
	<h4>인기레시피</h4>
	<ul>
		<li>
			<img src="img/recipe1.PNG" >
			<h5>레시피</h5>
		</li>
		<li>
			<img src="img/recipe1.PNG" >
			<h5>레시피</h5>
		</li>
		<li>
			<img src="img/recipe1.PNG" >
			<h5>레시피</h5>
		</li>
		
	</ul>
    
</div>

</div>

<div>
	<img src="img/mainsample.png" width="100%"/>
</div>



