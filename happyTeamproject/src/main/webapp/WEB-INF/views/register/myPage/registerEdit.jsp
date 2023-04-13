<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	#registerEditForm ul{
		overflow:auto;
	}
	#registerEditForm li{
		float:left;
		width:20%;
		padding:10px 0;
		border-bottom:1px solid #ddd;
		line-height:40px;
	}
	#registerEditForm li:nth-child(2n){
		width:80%;
	}
	#registerEditForm li:last-child{
		width:100%;
	}
	#addr{width:80%;}
</style>
<script>
	$(function(){
		//유효성검사
		$("#registerEditForm").submit(function(){
			
			// 비밀번호
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하셔야 회원정보수정이 가능합니다.");
				return false;
			}
			// 닉네임
			if($("#nickname").val()==""){
				alert("닉네임은 필수 입력 사항입니다.");
				return false;
			}
			// 생년월일
			$(document).ready(function(){            
			    var now = new Date();
			    var year = now.getFullYear();
			    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
			    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
			    //년도 selectbox만들기               
			    for(var i = 1900 ; i <= year ; i++) {
			        $('#birth-Year').append('<option value="' + i + '">' + i + '년</option>');    
			    }
			
			    // 월별 selectbox 만들기            
			    for(var i=1; i <= 12; i++) {
			        var mm = i > 9 ? i : "0"+i ;            
			        $('#birth-Month').append('<option value="' + mm + '">' + mm + '월</option>');    
			    }
			    
			    // 일별 selectbox 만들기
			    for(var i=1; i <= 31; i++) {
			        var dd = i > 9 ? i : "0"+i ;            
			        $('#birth-Day').append('<option value="' + dd + '">' + dd+ '일</option>');    
			    }
			    $("#birth-Year  > option[value="+year+"]").attr("selected", "true");        
			    $("#birth-Month  > option[value="+mon+"]").attr("selected", "true");    
			    $("#birth-Day  > option[value="+day+"]").attr("selected", "true");       
			})
			// 성별
			var genderCount = 0;
			$("input[name=genderArr]").each(function(){
				if(this.checked==true)  genderCount++;
			});
			
			if(genderCount<1){
				alert("성별은 반드시 선택하여야 합니다.");
				return false;
			}
			//이메일검사
			//아이디는 6~15글자, @필수
			reg = /^\w{6,15}@[a-zA-Z]{2,8}.[a-z]{2,5}(.[a-z]{2,5})?$/
			if(!reg.test($("#email").val())){
				alert("이메일을 잘못입력하였습니다.");
				return false;
			}
			// 질병 정보 1개 이상 반드시 선택
			var diseaseCount = 0;
			$("input[name=diseaseArr]").each(function(){
				if(this.checked == true) diseaseCount++;
			});
			
			if(diseaseCount < 1){
				alert("질병 정보는 1개이상 선택하여야 합니다. 없을 경우 '해당사항 없음'을 선택하세요.");
				return false;
			}
			
			//form태그의 action속성 설정
			$("#registerEditForm").attr("action","registerEditOk");
		});
	});
</script>
<div class="container">
	<h1>개인 정보 수정</h1><hr><br/>
	<form method="post" id="registerEditForm">
		<ul>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" minlength="8" maxlength="15" value="${dto.userid}" readonly/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" minlength="2" maxlength="10" value="${dto.username}" readonly/></li>
			<li>닉네임</li>
			<li><input type="text" name="nickname" id="nickname" minlength="2" maxlength="10" value="${dto.nickname}"/></li>
			<li>생년월일</li>
			<li><input type="date" name="birthday" id="birthday"/></li>
			<li>성별</li>
			<li>
				<input type="radio" name="genderArr" value="남성" <c:forEach var="h" items="${dto.genderArr}"><c:if test="${h=='남성'}">checked</c:if></c:forEach>/>남성
				<input type="radio" name="genderArr" value="여성" <c:forEach var="h" items="${dto.genderArr}"><c:if test="${h=='여성'}">checked</c:if></c:forEach>/>여성
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" value="${dto.email}"/></li>
			<li>질병 정보</li>
			<li>
				<input type="checkbox" name="diseaseArr" value="고혈압" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='고혈압'}">checked</c:if></c:forEach>/>고혈압
				<input type="checkbox" name="diseaseArr" value="당뇨" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='당뇨'}">checked</c:if></c:forEach>/>당뇨
				<input type="checkbox" name="diseaseArr" value="통풍" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='통풍'}">checked</c:if></c:forEach>/>통풍
				<input type="checkbox" name="diseaseArr" value="류마티스" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='류마티스'}">checked</c:if></c:forEach>/>류마티스
				<input type="checkbox" name="diseaseArr" value="해당사항 없음" <c:forEach var="h" items="${dto.diseaseArr}"><c:if test="${h=='해당사항 없음'}">checked</c:if></c:forEach>/>해당사항 없음
			</li>
			<li>
				<input type="submit" value="회원정보 수정하기"/>
			</li>
		</ul>
	</form>
</div>
