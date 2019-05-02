<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">

<style>
.navbar {
border-bottom: solid 1px #cccccc;
}

.container {
	width: 80%;
	height: 800px;
	background-color: white;
}
.necessary{
	border: solid 1px;
	border-color: #cccccc;
	width: 800px;
	margin-top: 5%;
	height: 430px;
	float: right;	

}

.content {
	border: solid 1px;
	border-color: #cccccc;
	width: 70%;
	margin-top: 5%;
	height: 500px;
	float: right;
}

#menu {
	border: solid 1px;
	border-color: #cccccc;
	width: 200px;
	background-color: #f6f6f6;
	float: right;
	height: 265px;
	top: 152px;
	position: absolute;
}

.panel-heading {
	font-size: 10px;
	background-color: #cccccc;
}
.btn-side {
	border: solid;
	border : skyblue;
	height : 50px;
	width : 201px;
	position: relative;
	top: 20px;
}

#memberinfo {
	padding : 5%;
}

.panel-title {
	padding : 1%;
	padding-left: 2%;
	
}

#side {
	padding : 18px;
	text-align: center;
	font-size: 18px;
	
}


.wen {width:200px; height:200px; border-radius:200px;margin-top:50px; margin: 0 auto; overflow:hidden; border: solid 2px #cccccc;}
.wen img {height:200px; width:200px; display:block; margin:0 auto;}
.navbar {border-bottom: solid 1px #cccccc;}


</style>

<title>마이페이지</title>
</head>	

	<div class="container">
	
		<div class="menu" id="menu">
			<a class="dropdown-item" href="mypage" id ="side">프로필 수정</a>
			<a class="dropdown-item" href="password_change" id ="side">비밀번호 변경</a>
			 <a class="dropdown-item" href="home_modify" id ="side">나의 집 관리</a>
			  <a class="dropdown-item" href="#" id ="side">찜목록 관리</a>
				<button type="button" class="btn-side btn-primary btn-lg">프로필 보기</button>
			</div>
			
		<div class="necessary">
			<div class="panel-heading">
				<h5 class="panel-title">비밀번호 변경</h5>
			</div>
			<form action="" id ="memberinfo" style = "margin-left : 100px">
		<div class="form-group">
			<label for="text">현재 비밀번호</label>
			<input type="text" class="form-control" name="password" id="password" style ="width : 346px;"/> 
		</div>
		<div class="form-group">
			<label for="birth">변경 비밀번호</label> 
			<input type="text" class="form-control" name="curruent_password" id="curruent_password" style ="width : 346px;" />
		</div>
		<div class="form-group">
			<label for="birth">변경 비밀번호(확인)</label> 
			<input type="text" class="form-control" name="check_password" id="check_password" style ="width : 346px;" />
		</div>
		
		<button type="submit" class="btn btn-primary" style ="margin-top: 10px;">수정완료</button>
		<button type="reset" class="btn btn-danger" style ="margin-top: 10px; margin-left: 5px" >취소</button>
		
	</form>
   </div>
 </div>
			
		
	<script>
	$(document).ready(function() {

		// 기존 css에서 박스 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#menu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			 
			 $("#menu").stop();
			 $("#menu").animate({
				"top" : newPosition
			}); 

		})

	});
	</script>
