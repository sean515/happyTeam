<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style>
	ul{
	margin-bottom:0;
	}
	.boardSubMenu{
		background:gray;
		padding:50px 0;
	}
	#coment{
		width:100%;
		height:auto;
		border: none;
		outline: none;
		
	}
	#commentList>li{
		padding:10px 0;
		border-bottom:1px solid #ddd;
	}
	#menu > li > ul {
		display:none;
		position: absolute;
		font-size:14px;
		float: left;
	}
	#menu > li:hover > ul {
		display:block;
	}
	#menu > li > ul > li {
		float:left;
		display:block;
		width: 305px; 
		white-space:nowrap;
	}	
	
</style>
<script>
	function commDel(){
		if(confirm("정말 삭제하시겠습니다?")){
			location.href= "commDel?no=${dto.no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null}">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>";
		}
	}
	$(function(){
		//댓글목록 - ajax로 해당 게시물에 대한 모든 댓글을 선택하여 뷰에 표시하는 함수 ---------------------------------------
		function commentList(){
			$.ajax({
				url:"/happy/commentList",
				data:{no:${dto.no}},
				type:"GET",
				dataType:"json",
				success:function(comment){
					//원래있는댓글은 목록 지운다.
					$("#commentList").html("");
					var tag = "";
					$(comment).each(function(i, cDTO){
						tag +="<li><div><b>"+cDTO.userid+" ("+cDTO.writedate+")</b>";
						
						//본인이 쓴 댓글일때 수정, 삭제 버튼 표시
						if(cDTO.userid == '${logId}'){ // 'goguma' == 'goguma'
							tag += "<input type='button' value='수정' style='float:right'/>";
							tag += "<input type='button' style='float:right;' value='삭제' title='"+cDTO.c_no+"'/>";
							
							tag += "<p>"+cDTO.coment+"</p></div>"; 
							
							//댓글 수정폼을 만들기 - 기본 댓글과 댓글번호(c_no)가 폼에 있어야 한다.
							tag += "<div style='display:none'>";
							tag += "<form method='post'>";
							tag += "<input type='hidden' name='c_no' value='"+cDTO.c_no+"'/>"; //댓글일련번호
							tag += "<textarea name='coment' style='width:400px; height:80px;'>"+cDTO.coment+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기'>"
							tag += "</form>";
							tag += "</div>";
						}else{
							tag += "<p>"+cDTO.coment+"</p></div>"; //댓글내용
						}
						
						tag += "</li>";
					});
					$("#commentList").html(tag);
				},error:function(e){
					console.log(e.responseText)
				}
			});
		}
		
		
		//댓글 쓰기 -------------------------------------
		$("#commentForm").submit(function(){
			//코멘트가 있을때 ajax실행
			if($("#coment").val()==""){
				alert("댓글을 입력후 등록하세요.");
				return false;
			}
			//코멘트가 있을때
			//폼의 값을 쿼리문으로 만들기
			//폼의 컴퍼넌트의 데이터를 name속성의 값과 value 속성의 값을 이용하여 쿼리문을 만들어준다.
			//$("#commentForm")
			var query = $(this).serialize(); // no 45&coment=fdkfdf
			console.log(query);
			$.ajax({
				url:"/happy/commentSend",
				data: query,
				type: "POST",
				success:function(result){
					console.log(result);
					//기존에 입력한 댓글 지우기
					$("#coment").val("");
					
					//댓글목록을 다시 뿌려준다.
					commentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});
			
			return false; // form의 기본이벤트때문에 다음실행이 있고 그것을 중단한다.
		});
		//댓글 수정폼 보여주기 : 본인이 쓴 글일때 Edit 버튼을 클릭하면 글내용은 숨기고, 폼을 보여준다.
		$(document).on('click','#commentList input[value=수정]', function(){
			//기존의 열어 놓은 폼이나, 숨겨놓은 댓글 내용을 처리하고
		//	$("#commentList>li>div:nth-first").css('display','block');
		//	$("#commentList>li>div:nth-last").css('display','none');
			
			
			$(this).parent().css("display","none"); //댓글숨기고
			$(this).parent().next().css("display","block"); //폼 보여주고
		});
		//댓글수정-DB
		$(document).on('click','#commentList input[value=댓글수정하기]',function(){
			//데이터준비
			var params = $(this).parent().serialize(); // c_no=34&coment=test
			var url = "/happy/commentEdit";
			
			$.ajax({
				url:url,
				data:params,
				type:"POST",
				success:function(result){
					console.log(result);
					//댓글목록 다시뿌려주기
					commentList();
				},error:function(e){
					console.log(e.responseText);
				}
			});
			
			return false;
		});
		//댓글 삭제
		$(document).on('click','#commentList input[value=삭제]', function(){
			if(confirm("댓글을 삭제할까요?")){
				var params = "c_no="+$(this).attr("title");
				console.log(params);
				var url = "/happy/commentDelete";
				
				$.ajax({
					url:url,
					data:params,
					success:function(result){
						console.log(result);
						//댓글목록 다시 뿌려주기
						commentList();
					},error:function(error){
						console.log(error.responseText);
					}
				});
			}
		});
		//댓글목록 뿌려주기 --처음에 글내용보기로 오면 댓글 보여주기
		commentList();
	});
</script>

<!-- 배너 -->
<div class= "banner">
	<img src="img/banner.png" width="100%" height="150px"/>
</div>

<div class="container">
	<ul id="view"  style="margin-top: 30px; padding:0;">
		<li style="display: inline;"> [말머리/공지]</li>
		<a href="comm_List?nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>" style="float:right; color: black;">전체 글 보기</a>
		
		<!-- 제목 -->
		<li style="margin: 30px 0"><h1>${dto.subject }</h1></li>
		
		<li style="display: inline;float :left; font-size: 1.2em"><img src="img/loginImg.png" width="60px" height="60px"/></li>
		<li style="display: inline; font-size: 24px; position: relative; left:10px;">
		${dto.username}</li>

		<br/>
		<div style= "width: 30%; float: left;">
		<li style="display: inline; position: relative; left:10px;">${dto.writedate }</li>
		<li style="display: inline; position: relative; left:10px;">조회 </li>
		<li style="display: inline; position: relative; left:10px;">${dto.hit } </li>
		</div>
		<div id="menu" style="clear:right;text-align:right; width: 30%; float: right;">
		<li style=" display: inline;width: auto; white-space:nowrap;">댓글 0  </li>
		<c:if test="${logId==dto.userid }">
		<li style=" display: inline;width: auto; white-space:nowrap;"><a href="#">...</a>
			<ul>	
			<li><a href="boardEdit?no=${dto.no }&nowPage=${vo.nowPage}<c:if test="${vo.searchWord!=null }">&searchKey=${vo.searchKey }&searchWord=${vo.searchWord }</c:if>">수정</a></li>
			<li><a href="javascript:commDel()">삭제</a></li>
			</ul>
		</c:if>		
		</div>
		<div>
		<br/><br/>
		
		<hr style="height: 3px; background: black"/>	
		<li>${dto.content }</li>
		<div style="overflow: hidden; margin-top: 50px;">
		<li style="display: inline;float :left;"><img src="img/loginImg.png" width="50px" height="50px"/></li>
		<li style="display: inline; font-size: 24px; position: relative; left:10px;">
		${dto.username} 님의 게시글 더보기</li>
		</div>
			<div style= "overflow: hidden">
				<div style= "width: 30%; float: left; overflow: hidden">
					<li style="display: inline;">좋아요</li>
					<li style="display: inline;">0</li>
					<li style="display: inline;">댓글</li>
					<li style="display: inline;">0</li>
				</div>
				<div style="clear:right;text-align:right; width: 30%; float: right;">
					<li>신고</li>
				</div>
			</div>
		</div>
	</ul>
	<hr style = "height: 1px; background-color: black;"/>
	
	
	<!-- 댓글 -->
	<h4>댓글</h4>
	<div>
	<c:if test="${logStatus=='Y'}"><!-- 로그인한 경우 댓글쓰기 폼 보여주기 -->
	<div style="border: 1px solid gray;border-radius: 10px;padding : 10px 10px;
		margin-bottom: 30px; "><!-- 댓글 입력 테두리 -->
			<form method="post" id="commentForm">
				<p>		${dto.username }님</p>
				<input type="hidden" name="no" value="${dto.no}"/><!-- 원글 글번호 -->
				<textarea name="coment" id="coment"  placeholder="댓글을 남겨보세요"
					style="padding: 10px;
					width: 100%;
					box-sizing: border-box;
					border: none;
					border-radius: 5px;
					font-size: 16px;
					resize : none;"
			></textarea>
				<!-- 댓글 등록 버튼 -->
					<div class="commHeader" style="margin-bottom: 20px; margin-top: 10px; overflow: hidden;">
					<button type="submit" class="btn btn-outline-dark"
					style=" float: right"><img  src="img/filler-g9a7890a31_640.png" width="15px" height="15px"> 댓글등록</button>
					</div>
			</form>
	</div>
		</c:if>

		<ul id ="commentList">

		</ul>
	</div>
</div>