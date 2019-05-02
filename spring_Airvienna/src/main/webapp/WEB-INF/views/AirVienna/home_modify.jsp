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
	height: 1000px;
	background-color: white;
}
.necessary{
	border: solid 1px;
	border-color: #cccccc;
	width: 800px;
	margin-top: 5%;
	height: 800px;
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
#uploadIMG {
    padding-left: 0px;
    padding-right: 0px;
    width: 101.988636px;
    padding-bottom: 5px;
    padding-top: 5px;
    margin-left: 570px;
    position : relative;
    bottom: 34px;

    
}


.wen {width:200px; height:200px; border-radius:200px;margin-top:50px; margin: 0 auto; overflow:hidden; border: solid 2px #cccccc;}
.wen img {height:200px; width:200px; display:block; margin:0 auto;}
.navbar {border-bottom: solid 1px #cccccc;}


</style>


<title>나의 집 관리</title>
</head>	
	<div class="container">
	
		<div class="menu" id="menu">
			<a class="dropdown-item" href="mypage" id ="side">프로필 수정</a>
			<a class="dropdown-item" href="password_change" id ="side">비밀번호 변경</a>
			 <a class="dropdown-item" href="home_modify" id ="side">나의 집 관리</a>
			  <a class="dropdown-item" href="#" id ="side">찜목록 관리</a>
				<button type="button" class="btn-side btn-primary btn-lg" onclick="location.href='profile'">프로필 보기</button>
			</div>
			
		<div class="necessary">
			<div class="panel-heading">
				<h5 class="panel-title">집 정보 수정</h5>
			</div>
			
			<form action="" id ="memberinfo" style = "margin-left : 100px">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label for="firstName">집 이름</label> 
				<input type="text" class="form-control" id="firstName" value="${vo.homename}">
			</div>
			<div class="col-md-6 mb-3">
				<label for="lastName">가격</label> 
				<input type="text" class="form-control" id="lastName" value="${vo.price}" style ="width : 200px;">
			</div>
		</div>
		
			
		
		<div class="fome-group">
						<label for="simple_intro"> 간단한 소개 </label>
						 <input type="text" class="form-control" value="${vo.birfcontent}" id="birfcontent" name="birfcontent" placeholder="자신의 집을 간단하게 소개해보세요!" style="width:525px;">
					</div>
					
					<label for="home_intro">상세 설명 </label>
				 <textarea class="form-control" id="content" name ="content" rows="7" style = "margin-bottom: 5%; width:525px;" placeholder ="(편의시설,방 갯수,구조,집의 상태 등등)">${vo.content}</textarea>
			
			</form>
			
			
			<div class="panel-heading">
				<h5 class="panel-title">나의 집 사진</h5>
			</div>
					<div style="margin-left : 150px; margin-top : 20px;">
					<h3 class="text-info">집 사진을 변경하세요</h3>
					<p class="text-muted">여기서 집 사진을 변경할 수 있습니다.</p>
					</div>
					<!--이미지 업로드 구간 시작-->
					<div class="box">
						<!-- 파일업로드 썸네일 부분  -->
							<div class="uploadResult">
						
							</div>
						<!-- 파일 추가 부분 -->
						<div class="row" style="margin-top:10px; width : 500px;">
							<div class="col-sm-10" style ="border : 1px solid #cccccc; background-color: white; border-radius: 5px; left:10px; margin-left: 150px;">
								<span class="control-fileupload">
								<input type="file" name="uploadFile" multiple="multiple" style="margin:3px; right : 12px; position: relative;">
								</span>
							</div>
							<div class="col-sm-2">
						<button type="button" class="btn btn-primary btn-block" id="uploadIMG">
									<i class="icon-upload icon-white"></i> 사진등록 </button>
							</div>
						</div>
					<div style="margin-left: 150px; margin-top: 15x;	">
					<button type="submit" class="btn btn-primary" style ="margin-top: 10px;">수정완료</button>
					<button type="reset" class="btn btn-danger" style ="margin-top: 10px; margin-left: 5px" >취소</button>
					</div>
		</div>
	</div>



	</div>

	
	
	
	<!-- 프로필 사진을 클릭했을때 이미지 업로드 -->
	<script>
	$(document).ready(function(){
		$(".photo").click(function(){
			$(".file").click() ;
			
			})			
		})
	</script>	
		
		
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
