<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#logFrm input{
		margin-bottom:50px;
		width:60%;
	}
	.mb-3>input{
		width:440px;
	}
	
</style>
<div class="logContainer">
	
	<form method="post" action="loginOk" id="logFrm">
		<h1>로그인</h1>
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid"/></li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd"/></li>
			<li><input type="submit" value="LOGIN"/></li>
		</ul>
	</form>
	<div style="background:#FFF8B5;margin:50px;padding:50px;text-align:center;">
		<a href="join">회원가입</a>
		<a href="idSearchForm">아이디찾기</a>
		<a href="">비밀번호찾기</a>	
	</div>
</div>