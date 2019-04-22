<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 js를 CDN으로 불러옴 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<!-- 부트스트랩css을 CDN으로 불러왓음  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">


<!-- 제이쿼리를 CDN 으로 불러옴  -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>


<!-- ajax를 CDN으로 불러옴 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
	
<style>
.container {
	width: 950px;
	margin: auto;
	height: 1000px;
	background-color: white;
}

.content {
	width: 800px;
	padding: 5%;
	margin: auto;
	height: 1000px;
	float: center;
	
}
</style>
	
	
<title>마이페이지</title>
</head>
<body>
<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"><img src='/resources/img/sosiji.png'
			width="100" height="50" onclick="location.href='/airvienna/mainpage'"></a>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search"
				placeholder="당신이 가는 여행지는 어디죠?" aria-label="Search" id=searchif style ="width : 500px">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
				id=search>검색</button>
		</form>
	</nav>
	
	
	<div class="container">
		<div class="content">
			<form action="">
				<label for="name">이름</label>
				<p> <input type="text" id = "name" /></p>
				<label for="gender">성별</label>
				<p> <input type="checkbox" name="genger" id="gender" />남자
				<input type="checkbox" name="genger" id="gender" />여자</p>
				<label for="email">이메일</label>
				<p><input type="email" name="email" id="email" /></p>
				<label for="email">전화번호</label>
				<p><input type="tel" name ="tel" id="tel" /></p>
				<input type="submit" value="수정" class ="myButton" />
				
				<input type="reset" value="초기화" class ="myButton" />
				<button class ="myButton" style ="float:right" onclick="location.href='/'">돌아가기</button>
				
			</form>
			
				
		</div>
	</div>
</body>
</html>