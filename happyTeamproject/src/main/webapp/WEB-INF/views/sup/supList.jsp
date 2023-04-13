<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.container{
	padding:30px;
	overflow:auto;
	}
	.board_header{
		clear:both;
				
	}
	
	.pHeader>div{
		background:#FCF9F9;
		color:black;
	}
	.pHeader>div:last-child{
		text-align:right;
	}
	.board_list{
		clear:both;
		overflow:auto;
		
	}
	
	.board_list li{
		float:left;
		width:10%;
		height:50px;
		line-height:50px;
		border-bottom:1px solid #ddd;
		
	}
	.board_list li:nth-child(5n+2){
		width:55%;
		/*밑줄임표시하기*/
		white-space:nowrap;/*줄바꾸지 않는다.*/
		overflow:hidden;/*넘치는 문자 숨기기*/
		text-overflow:ellipsis;/*넘친데이터가 있을때 말줄임 표시*/
	}
	.board_list li:nth-child(5n){
		width:15%;
	}
	.pagingDiv li{
		float:left;
		padding:10px 20px;
	}
	.pagingDiv a:link, .pagingDiv a:hover, .pagingDiv a:visited,
	 .board_list a:link,.board_list a:hover,.board_list a:visited{
		color:#000;
	}
	.searchDiv{
		clear:left;
		padding:10px;
		text-align:center;
	}
</style>
<script>
	$(function(){
	
	});
</script>
 <!-- banner -->
 <div class="banner">
 	<img src="../img/banner.png" width="100%" height="150px"/>
 </div>
 <!-- 고객센터 1:1 문의 페이지 -->
<div class="container">
	<h1>고객센터</h1>
	<hr style="border: solid 2px black;">
	<p><h4>&nbsp;&nbsp;&nbsp;1:1 문의 </h4></p>

	<!-- 자주하는질문이동, 글작성 버튼 -->
	<button type="button" class="btn btn-outline-success" style="float:right"><div class="board_header"><a href="supWrite">문의하기</a></div></button>
	<button type="button" class="btn btn-outline-success" style="float:right"><div class="board_header"><a href="commonSupList">자주하는질문</a></div></button>
	<div class="pHeader">
	
		<!--  <div>문의글리스트 : ${totalRecord}</div>-->
		
	</div>
	<!-- 게시판리스트목록 -->
	<ul class="board_list">
		
		<li>글번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>작성일</li>
		
		<!-- jstl로 변수를 만들어 총레코드수를 보관 -->
		<c:set var="noNum" value="${totalRecord}"/>
		<c:forEach var="supDTO" items="${list}">
			<li>${noNum}</li>
			<li>
				<!-- 공백이 있을때 lvl : 0, 1, 2.... -->
			<c:if test="${supDTO.lvl>0}">
				<!-- 공백처리 -->
				<c:forEach var="i" begin="${1}" end="${supDTO.lvl}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<!-- ↳ 표시 -->
				↳RE: 
			</c:if>
			<a href="supView?no=${supDTO.no}">${supDTO.title}</a>
			</li>
			
			<li>${supDTO.userid}</li>
			<li>${supDTO.hit}</li>
			<li>${supDTO.writedate}</li>
			
			<c:set var="noNum" value="${noNum-1}"/>
		</c:forEach>
	</ul>

	<!-- 페이징 디자인 -->
<div class="container mt-3" style="margin:0; padding:0;">
  <ul class="pagination" style="margin:0; padding:0; clear:both; float:right;">
    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
  </div>
</div>

