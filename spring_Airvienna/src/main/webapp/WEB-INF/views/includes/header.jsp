<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style>
/* 이미지 바꾸세요~ */
.navvar {
float: left;
}

</style>
<title>메인페이지</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mainpage.css"/>
<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/album/">
    <!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
<!-- 헤더부분,검색창,로고이미지 -->
	<nav class="navbar navbar-light bg-white">
		<a class="navbar-brand"><img src='/resources/img/sosiji.png'
			width="100" height="50" onclick="location.href='/airvienna/mainpage'"></a>
		<form class="form-inline">
			<input class="form-control mr-sm-2" type="search"
				placeholder="당신이 가는 여행지는 어디죠?" aria-label="Search" id=searchif style ="width : 500px">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
				id=search>검색</button>
		</form>
	</nav>

