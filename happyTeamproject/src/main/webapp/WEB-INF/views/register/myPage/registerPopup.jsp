<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<head>
<style>
	
</style>
<script>
	$(function(){
		//유효성검사
		var userpwd = "12341234";
		$("#registerEditPopupForm").click(function(){
			var pwd = document.getElementById('pwd'); 
				if(pwd.value == userpwd) { 
					return "register/myPage/registerEdit"; 
				}else { 
				alert('비밀번호가 일치하지 않습니다.'); 
					return false;
			 } 
				/*
				 const checkPassword = $('#password').val();
		         if(!checkPassword || checkPassword.trim() === ""){
		             alert("비밀번호를 입력하세요.");
		        } else{
		            $.ajax({
		                type: 'GET',
		                url: '/rest/checkPwd',
		                data: {'checkPassword': checkPassword},
		                datatype: "text"
		            }).done(function(result){
		                console.log(result);
		                if(result){
		                    console.log("비밀번호 일치");
		                    window.location.href="/settings/update";
		                } else if(!result){
		                    console.log("비밀번호 틀림");
		                    // 비밀번호가 일치하지 않으면
		                    alert("비밀번호가 맞지 않습니다.");
		                    window.location.reload();
		                }
		            }).fail(function(error){
		                alert(JSON.stringify(error));
		            })
		            */
		        }
	    });
	});
</script>
</head>
<body>
<div class="container">
	<h1>비밀번호 확인</h1><br/>
	<form method="post" id="registerEditPopupForm">
		<ul>
			<li>아이디 : ${dto.userid}<br/></li>
			
			<li>비밀번호 : <input type="password" name="userpwd" id="userpwd" minlength="8" maxlength="15"/></li>
			<li>
				
			</li>
			
			<li>
				<input type="submit" value="확인"/>
			</li>
		</ul>
	</form>
</div>
</body>
<footer>
</footer>