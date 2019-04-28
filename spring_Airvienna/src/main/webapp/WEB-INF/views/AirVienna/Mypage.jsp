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
	border-color: #cccccc;
	width: 800px;
	margin-top: 5%;
	height: 1000px;
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
</style>


<title>마이페이지</title>
</head>	
	<div class="container">
	
		<div class="menu" id="menu">
			<a class="dropdown-item" href="#" id ="side">프로필 수정</a>
			<a class="dropdown-item" href="#" id ="side">비밀번호 변경</a>
			 <a class="dropdown-item" href="#" id ="side">나의 후기관리</a>
			  <a class="dropdown-item" href="#" id ="side">추천글 관리</a>
				<button type="button" class="btn-side btn-primary btn-lg">프로필 보기</button>
			</div>
			
		<div class="necessary">
			<div class="panel-heading">
				<h5 class="panel-title">필수사항</h5>
			</div>
			
			<form action="" id ="memberinfo" style = "margin-left : 100px">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label for="firstName">이메일</label> 
				<input type="text" class="form-control" id="firstName" value="" readonly>
			</div>
			<div class="col-md-6 mb-3">
				<label for="lastName">이름</label> 
				<input type="text" class="form-control" id="lastName" value="" readonly style ="width : 200px;">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="tel">전화번호</label>
			<input type="text" class="form-control" name="tel" id="tel" placeholder="ex)010-xxxx-xxxx" style ="width : 346px;"/> 
			<small id="tel" class="text-info"></small>
		</div>
		
		<div class="form-group">
			<label for="birth">생년월일</label> 
			<input type="text" class="form-control" name="birth" id="birth" placeholder="ex)yymmdd" style ="width : 346px;" />
			<small id="birth" class="text-info"></small>
		</div>
			
			
			</form>
			<div class="panel-heading">
				<h5 class="panel-title">프로필 사진</h5>
			</div>
			
			
			<div class="panel-body photos-section">
    <div class="row">
      <div class="col-lg-4 text-center">
        <div class="profile_pic_container picture-main space-sm-2 space-md-2" data-picture-id="733626316">
          <div class="media-photo profile-pic-background">
            <img alt="진구" height="225" src="https://a0.muscache.com/im/pictures/user/a90870f4-0134-4d79-911e-4d96973d8fef.jpg?aki_policy=profile_x_medium" title="진구" width="225">
          </div>
          <div class="media-photo media-round" aria-hidden="true">
            <img alt="진구" height="225" src="https://a0.muscache.com/im/pictures/user/a90870f4-0134-4d79-911e-4d96973d8fef.jpg?aki_policy=profile_x_medium" title="진구" width="225">
          </div>
          <button class="picture-tile-delete overlay-btn" aria-label="삭제">
            <i class="icon icon-trash"></i>
          </button>
        </div>
      </div>
      <div class="col-lg-8">
        <ul class="list-layout picture-tiles clearfix ui-sortable"></ul>

        <p>
          호스트와 게스트가 서로를 알 수 있도록 선명하게 나온 얼굴 정면 사진을 사용하는 것이 중요합니다. 풍경 사진을 올리면 호스트가 알아보기 힘들겠죠?
          회원님의 얼굴이 선명하게 보이며 호스트나 게스트에게 공개하고 싶지 않은 개인 정보나 민감한 정보가 나타나지 않은 사진을 사용하세요.
        </p>

        <div class="row row-condensed">
          <div class="">
            <span class="file-input-container">
              <form accept-charset="UTF-8" action="https://www.airbnb.co.kr/users/ajax_image_upload" enctype="multipart/form-data" id="ajax_upload_form" method="post" name="ajax_upload_form" target="upload_frame"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="V4$.airbnb.co.kr$XmW_6Esd7k0$_AQvK5dPT6Ss-YHo5gedmeFyw0Bvc1VfJO8rPD4zQEM="></div>
                <input id="user_id" name="user_id" type="hidden" value="257293482">
                <input id="callback" name="callback" type="hidden" value="EditProfile">
                <button type="button" class="btn btn-block btn-large" id="profile_pic_upload">
               		   파일 업로드하기
                </button>
                <input name="user_profile_pic" accept="image/*" type="file" id="user_profile_pic" hidden="">
			</form>
              <iframe id="upload_frame" name="upload_frame" style="display:none;"></iframe>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
			
			
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
