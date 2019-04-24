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
	height: 2000px;
	background-color: white;
}
.necessary{
	border: solid 1px;
	border-color: skyblue;
	width: 70%;
	margin-top: 5%;
	height: 1000px;
	float: right;	

}


.content {
	border: solid 1px;
	border-color: skyblue;
	width: 70%;
	margin-top: 5%;
	height: 500px;
	float: right;
}

#menu {
	width: 200px;
	background-color: #f6f6f6;
	float: left;
	height: 162px;
	box-shadow: 4px 4px 3px #666;
	top: 140px;
	position: absolute;
}

.panel-heading {
	font-size: 10px;
	background-color: #a5e3e6;
}
.btn-side {
	border: solid;
	border-color: #ff4646;
	height : 50px;
	width : 201px;
}

#memberinfo {
	padding : 5%;
}

.panel-title {
	padding : 1%;
	padding-left: 2%;
	
}
</style>

<title>마이페이지</title>
</head>	
	<div class="container">
	
		<div class="menu" id="menu">
			<a class="dropdown-item" href="#">프로필 수정</a>
			 <a class="dropdown-item" href="#">나의 후기</a>
			  <a class="dropdown-item" href="#">추천글</a>
			   <div class="dropdown-divider"></div>
				<button type="button" class="btn-side btn-primary btn-lg">프로필 보기</button>
			</div>
			
			
		<div class="necessary">
			<div class="panel-heading">
				<h5 class="panel-title">필수사항</h5>
			</div>
			<form action="" id ="memberinfo">
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control"
							id="name" value="성함을 입력해주세요">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-3 col-form-label">현재 비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="Password"
							placeholder="Password">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-3 col-form-label">변경 비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="new_Password"
							placeholder="New_Password">
					</div>
				</div>
				
				<div class="form-group row" style = "padding-top : 3%">
					<label for="staticEmail" class="col-sm-2 col-form-label" >이메일 주소</label>
					<div class="col-sm-10">
						<input type="text" class="form-control"
							id="staticEmail" value="email@example.com">
					</div>
				</div>
				
				<div class="form-group row" style = "padding-top : 3%">
					<label for="staticEmail" class="col-sm-2 col-form-label" >전화 번호</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control"
							id="tel" placeholder="010-0000-0000">
					</div>
				</div>
				
				<div class="form-group row" style = "padding-top : 3%">
					<label for="staticEmail" class="col-sm-2 col-form-label" >거주 지역</label>
					<div class="col-sm-10">
						<input type="text" class="form-control"
							id="adress" >
					</div>
				</div>
				
			</form>
		</div>
		
		<div class="content">
			<div class="panel-heading">
				<h5 class="panel-title">선택사항</h5>
			</div>
			<form action="" id ="memberinfo">
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="staticEmail" value="email@example.com">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="Password">
					</div>
				</div>
			</form>
		</div>
	</div>
<%@include file="../includes/footer.jsp"%>
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
