<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#joinForm{
		width:60%;
	}
	#sideimg{
		width:635px;
		height:794px;
	}
	#joinForm ul{
		overflow:auto;
		margin:auto;
	}
	#joinForm li{
		float:left;
		width:20%;
		padding:10px 0;
		border-bottom:1px solid #ddd;
		line-height:40px;
	}
	#joinForm li:nth-child(2n){
		width:80%;
	}
	#joinForm li:last-child{
		width:100%;
	}
	#addr{width:80%;}
	.signUpBtn{
		width:100%;
		text-align:center;
		margin-top:20px;
	}
	#signUpBtn{
		width:40%;
		height:60px;
		font-size:1.2em;
		background-color:#F7CE46;
		border:none;
		border-radius:30px;
	}
</style>
<script>
	$(function(){
		//아이디 중복검사
		$("input[value=아이디중복검사]").click(function(){
			if($("#userid").val()!=""){
				//          주소, 창이름, 옵션
				window.open("idCheck?userid="+$("#userid").val(),"chk","width=400,height=300");
			}else{
				alert("아이디를 입력후 중복검사하세요.");
			}
		});
		
		//아이디 입력란에 키보드를 입력하면 아이디중복검사 초기화
		$("#userid").keyup(function(){
			$("#idStatus").val("N");
		});
		
		//우편번호 검색
		$("#zipSearch").on('click',function(){
			window.open("zipcodeSearch","zipcode","width=500, height=600");
		});
		
		//유효성검사
		$("#joinForm").submit(function(){
			//아이디검사
			if($("#userid").val()==""){
				alert("아이디를 입력하세요..");
				return false;
			}
			//아이디검사
			//첫번째문자 영대소문자
			//영어대소문자, 숫자, _가능
			//글자길이 5~12글자
			//var reg = /^[A-Za-z]{1}[A-Za-z_]{7,14}$/
			var reg = /^[A-Za-z]{1}\w{4,11}$/
			
			if(!reg.test($("#userid").val()) ){//   유효한 값이면 true, 잘못된 데이터면 false
				alert("아이디는 첫번째문자는 영어대소문자로 시작하여야 하며, \n영어대소문자, 숫자, _가능, 아이디길이는 5~12글자까지 가능");
				return false;
			}
			if($("#idStatus").val()=="N"){
				alert("아이디 중복검사를 하세요.");
				return false;
			}
			//비밀번호
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if($("#userpwd").val()!=$("#userpwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			//이름검사
			reg = /^[가-힣]{2,10}$/
			if(!reg.test($("#username").val())){
				alert("이름은 2~10글자까지 한글만 가능합니다.");
				return false;
			}
			//전화번호
			var tel = $("#tel1").val()+"-"+$("#tel2").val()+"-"+$("#tel3").val();
			reg = /^(010|02|031|051|041)-[0-9]{3,4}-[0-9]{4}$/
			if(!reg.test(tel)){
				alert("전화번호를 잘못입력하였습니다.");
				return false;
			}
			//이메일검사
			//아이디는 5~12글자, @필수
			reg = /^\w{6,15}@[a-zA-Z]{2,8}.[a-z]{2,5}(.[a-z]{2,5})?$/
			if(!reg.test($("#email").val())){
				alert("이메일을 잘못입력하였습니다.");
				return false;
			}
			//질병 1개이상 반드시 선택
			var hobbyCount = 0;
			$("input[name=hobbyArr]").each(function(){
				if(this.checked==true)  hobbyCount++;
			});
			
			if(hobbyCount<1){
				alert("질병정보는 1개이상 선택하여야 합니다. 없을경우 '해당없음'을 선택하세요.");
				return false;
			}
			
			//form태그의 action속성 설정
			$("#joinForm").attr("action","joinOk");
		});
	});
</script>
<div class="container">
	<img src="img/loginImg.png" id="sideimg">
	<h1>회원가입 폼</h1>
	<form method="post" id="joinForm">
		<ul>
			<li>이름</li>
			<li><input type="text" name="username" id="username" minlength="2" maxlength="10"/></li>
			<li>생년월일</li>
			<li><input type="date" name="birthday" id="birthday"/></li>
			<li>성별</li>
			<li>
				<input type="radio" name="gender" value="F" checked/>여
				<input type="radio" name="gender" value="M"/>남
			</li>
			<li>닉네임</li>
			<li><input type="text" name="nickname" id="nickname"/></li>
			<li>이메일</li>
			<li>
				<input type="text" name="email" id="email" value=""/> @
				<select name="domain" id="domain">
					<option value="naver.com">naver</option>
					<option value="gmail.com">gmail</option>
					<option value="daum.com">daum</option>
					<option value="nate.com">nate</option>
				</select>
			</li>
			<li>아이디</li>
			<li>
				<input type="text" name="userid" id="userid" minlength="5" maxlength="12" value="" placeholder="5~12자의 영문,숫자만 사용가능"/>
				<input type="button" value="아이디중복검사"/>
				<input type="hidden" id="idStatus" value="N"/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15"/></li>
			<li>비밀번호확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2"/></li>
			<li>연락처</li>
			<li>
				<select name="tel1" id="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="041">041</option>
					<option value="051">051</option>
				</select> -
				<input type="text" name="tel2" id="tel2" maxlength="4"/> -
				<input type="text" name="tel3" id="tel3" maxlength="4"/>
			</li>
			<li>우편번호</li>
			<li>
				<input type="text" name="zipcode" id="zipcode"/>
				<input type="button" value="우편번호찾기" id="zipSearch"/>
			</li>
			<li>주소</li>
			<li><input type="text" name="addr" id="addr"/></li>
			<li>상세주소</li>
			<li><input type="text" name="addrdetail" id="addrdetail"/></li>
			<li>질병정보</li>
			<li>
				<input type="checkbox" name="hobbyArr" value="당뇨"/>당뇨
				<input type="checkbox" name="hobbyArr" value="고혈압"/>고혈압
				<input type="checkbox" name="hobbyArr" value="통풍"/>통풍
				<input type="checkbox" name="hobbyArr" value="류마티스"/>류마티스
				<input type="checkbox" name="hobbyArr" value="해당없음"/>해당없음
			</li>
		</ul>
		<div class="signUpBtn">
			<input type="submit" value="Sign up" id="signUpBtn"/>
		</div>
	</form>
</div>
