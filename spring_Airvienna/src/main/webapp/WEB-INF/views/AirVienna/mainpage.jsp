<!-- 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
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


<!-- 제이쿼리를 CDN으로 불러옴  -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>


<!-- ajax를 CDN으로 불러옴 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
	
	
<style>
/* 이미지 바꾸세요~ */
body {
background-image : url("/resources/img/trip.jpg");
background-size : cover;
}
.navvar {
float: left;
}

</style>
	
<title>메인페이지</title>
</head>
<body>


<!-- 헤더부분,검색창,로고이미지 -->
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

</body>
</html>
=======
<%@include file="../includes/header.jsp" %>
<div class="backimg">
	<form>
		<div class="datacover">
			<div class="covereddata">
				<div class="coverdata" style="background-color:transparant">
					<div class="datainput">
						<div>
								<h1>편안하고 아늑한</h1>
								<h1>숙소를 예약하세요.</h1>
							</div>
							<div class="form-group">
						    	<label for="inputregion">지역</label>
						   		<input type="text" class="form-control" id="inputregion" placeholder="모든 위치">
						  	</div>
						  <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputcheckin">체크인</label>
						      <input type="date" class="form-control" id="inputcheckin" placeholder="년/월/일">
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputcheckout">체크아웃</label>
						      <input type="date" class="form-control" id="inputcheckout" placeholder="년/월/일">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputnumber">인원</label>
						    <input type="number" class="form-control" id="inputnumber" placeholder="인원">
						  </div>
						<div class="range">
						  <button type="submit" class="btn btn-primary">검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<%@include file="../includes/footer.jsp" %>  
>>>>>>> refs/remotes/origin/master
