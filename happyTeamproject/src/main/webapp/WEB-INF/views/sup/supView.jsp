<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#view li{
		border-bottom:1px solid #ddd;
		padding:10px 0;
	}
	
</style>
<script>
	var supDelCheck = ()=>{
		if(confirm('삭제하시겠습니까?')){
			location.href = "/happy/sup/supDelete?no=${dto.no}";
		}
	}
</script>
 <!-- banner -->
 <div class="banner">
 	<img src="../img/banner.png" width="100%" height="150px"/>
 </div>
 <!-- 문의내역 페이지 -->
<div class="container" style="padding:30px">
	<h1>문의내역</h1>
	<hr style="border: solid 2px black;">
	 <!-- 목록으로가는 홈버튼 -->
  <button type="button" class="btn btn-outline-success" style="float:right" ><a href="supList">목록으로</a></button>
<br/>
	<br/>
	<!-- 내역목록 -->
	<ul id="view">
		<li>글번호 : ${dto.no}</li>
		<li>작성자 : ${dto.userid}</li>
		<li>작성일 : ${dto.writedate}</li>
		<li>조회수 : ${dto.hit}</li>
		<li>제목 : <b>${dto.title}</b></li>
		<li>내용 : ${dto.content}</li>
	</ul>
	<br/>
	<p id="s">
		<!-- 로그인이 된경우 답변글쓰기 가능 -->
		<c:if test="${logStatus=='Y'}">
		<button type="button" class="btn btn-outline-info"><a href="supAnswer/${dto.no}">답변작성</a></button>
		</c:if>
		<!-- 본인이 쓴 글일때 -->
		<c:if test="${dto.userid==logId}">
		<!-- 수정,삭제버튼 -->
			 <button type="button" class="btn btn-outline-warning"><a href="supEdit/${dto.no}">수정</a></button>
			<button type="button" class="btn btn-outline-danger"><a href="javascript:supDelCheck()">삭제</a></button>
		</c:if>
	</p>
</div>