<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	height: 700px;
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
				<button type="button" class="btn-side btn-primary btn-lg" onclick="location.href='profile'">프로필 보기</button>
			</div>
			
		<div class="necessary">
			<div class="panel-heading">
				<h5 class="panel-title">필수사항</h5>
			</div>
			
			<form action="" id ="memberinfo" style = "margin-left : 100px">
		<div class="row">
			<div class="col-md-6 mb-3">
				<label for="firstName">이메일</label> 
				<input type="text" class="form-control" id="firstName" value="${info.email}" readonly >
			</div>
			<div class="col-md-6 mb-3">
				<label for="lastName">이름</label> 
				<input type="text" class="form-control" id="lastName" value="${info.username}" readonly style ="width : 200px;">
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
		
			<button type="submit" class="btn btn-primary" style ="margin-top: 10px;">수정완료</button>
			<button type="reset" class="btn btn-danger" style ="margin-top: 10px; margin-left: 5px" >취소</button>
			
			</form>
			
			
			<div class="panel-heading">
				<h5 class="panel-title">프로필 사진</h5>
			</div>



<div class="panel-body photos-section">
    <div class="row">
      <div class="col-lg-4 text-center" style = "margin-top : 10px;">
 			<div class="wen">
				<div>
					<c:choose>
						<c:when test="${empty info.uploadPath}">
							<img alt=" " height="28" src="/resources/img/vienna.PNG" width="28" class="photo" onclick="location.href='/AirVienna/mypage'">
						</c:when>
						<c:when test="${!empty info.uploadPath }">
							<%
								String filePath = null;
								AirUserVO vo = (AirUserVO)request.getAttribute("info");
								filePath= vo.getUploadPath()+"\\"+vo.getUuid()+"_"+vo.getFileName();
								filePath = filePath.replaceAll("\\\\", "/");
								System.out.print("filePath"+filePath);
							%>
							<img alt=" " height="28" src="/display?fileName=<%=filePath%>" width="28" class="photo" onclick="location.href='/AirVienna/mypage'">
						</c:when>
					</c:choose>
					 	<input	type="file" name="uploadFile" class="file" /> 
					<!-- <img src="/resources/img/vienna.PNG" class="photo"/>-->
				</div>

        </div>

      </div>
      <div class="col-lg-8" style ="padding-right : 55px;">
        <ul class="list-layout picture-tiles clearfix ui-sortable"></ul>
        <h3 style = "margin-top : 10px;">프로필사진을 변경 할 수 있습니다.</h3>
        
		<hr />
        <p>
      	    호스트와 게스트가 서로를 알 수 있도록 선명하게 나온 얼굴 정면 사진을 사용하는 것이 중요합니다. 풍경 사진을 올리면 호스트가 알아보기 힘들겠죠?
      	    회원님의 얼굴이 선명하게 보이며 호스트나 게스트에게 공개하고 싶지 않은 개인 정보나 민감한 정보가 나타나지 않은 사진을 사용하세요.
        </p>
        <div class="row row-condensed">
          <div class="">
            <span class="file-input-container">
              <iframe id="upload_frame" name="upload_frame" style="display:none;"></iframe>
            </span>
          </div>
        </div>
      </div>
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
