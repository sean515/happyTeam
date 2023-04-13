<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <!-- banner -->
 <div class="banner">
 	<img src="../img/banner.png" width="100%" height="150px"/>
 </div>
	<div class="container mt-3" style="padding:30px" >
	<!-- 고객센터 자주하는질문 -->
  <h1>자주하는 질문</h1>
  <hr style="border: solid 2px black;">
  <br/>
  <!-- 고객센터로가는 홈버튼 -->
  <button type="button" class="btn btn-outline-success" style="float:right" ><div class="board_header"><a href="supList">고객센터</a></div></button>
<br/>
  <br/>
  <!-- 질문리스트 -->
  
  <!-- 질문 1 -->
  <div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="btn" data-bs-toggle="collapse" href="#collapseOne">
         Q1. SNS회원가입은 어떤게 있나요?
        </a>
      </div>
      <div id="collapseOne" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
       A1. 구글 , 카카오, 네이버로 회원가입하실 수 있습니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 2 -->
    <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseTwo">
        Q2. 식당 추가는 어떻게 하나요?
      </a>
      </div>
      <div id="collapseTwo" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		A2. 추가하고 싶은 식당이 있으시면 식당 업데이트 폼을 작성하시면 됩니다. 관리자의 승인 후 업데이트 됩니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 3 -->
    <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseThree">
          Q3. 프로필을 수정하고 싶어요! 
        </a>
      </div>
      <div id="collapseThree" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		 A3. 마이페이지에서 프로필을 수정할 수 있습니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 4 -->
     <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseFour">
          Q4. 프로필을 수정하고 싶어요! 
        </a>
      </div>
      <div id="collapseFour" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		 A4. 마이페이지에서 프로필을 수정할 수 있습니다.
        </div>
      </div>
    </div>
    
    <!-- 질문 5 -->
     <div class="card">
      <div class="card-header">
        <a class="collapsed btn" data-bs-toggle="collapse" href="#collapseFive">
          Q5. 프로필을 수정하고 싶어요! 
        </a>
      </div>
      <div id="collapseFive" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
		 A5. 마이페이지에서 프로필을 수정할 수 있습니다.
        </div>
      </div>
    </div>
    
  </div>
</div>
	
	