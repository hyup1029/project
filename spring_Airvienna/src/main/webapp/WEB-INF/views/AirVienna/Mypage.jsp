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
			
			<form action="user_modify" method="post" id ="memberinfo" style = "margin-left : 100px" role="form">
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
			<input type="text" class="form-control" name="tel" value="${info.tel}" placeholder="010-0000-0000" id="tel" style ="width : 346px;"/> 
			<small id="tel" class="text-info"></small>
		</div>
		
		<div class="form-group">
			<label for="address">주소</label> 
			<input type="text" class="form-control" name="address" id="address" value="${info.address}" style ="width : 346px;" />
			<small id="address" class="text-info"></small>
		</div>
		
			<input type="file" name="uploadFile" class="file" style ="width:0px;"/> 
			
		
			<button type="submit" class="btn btn-primary" style ="margin-top: 10px;">수정완료</button>
			<button type="reset" class="btn btn-danger" style ="margin-top: 10px; margin-left: 5px" >취소</button>
			<button type="button" class="btn btn-danger" onclick="location.href='/AirVienna/userdelete'" style="margin-top: 10px; margin-left: 270px" >회원탈퇴</button>
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
							<img alt=" " height="28" src="/resources/img/vienna.PNG" width="28" class="photo">
						</c:when>
						<c:when test="${!empty info.uploadPath }">
							<%
								String filePath = null;
								AirUserVO vo = (AirUserVO)request.getAttribute("info");
								filePath= vo.getUploadPath()+"\\"+vo.getUuid()+"_"+vo.getFileName();
								filePath = filePath.replaceAll("\\\\", "/");
								System.out.print("filePath"+filePath);
							%>
							<img alt=" " height="28" src="/display?fileName=<%=filePath%>" width="28" class="photo">
						</c:when>
					</c:choose>
					 	
					 	
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
	
	<script>
	
	</script>
	
	
	<!-- 프로필 사진을 클릭했을때 이미지 업로드 -->
	<script>
	$(document).ready(function(){
		$(".photo").click(function(){
			$(".file").click() ;
			
			})			
		})
		
		$(function(){
		//처음 상태를 복제
		//var cloneObj=$(".uploadDiv").clone();
		var formObj=$("form[role='form']");
		$("button[type='submit']").click(function(e){
		
		
			//submit버튼이 눌러지면 폼 전송 막기
			//첨부파일 내용을 가지고 같이 가야 하기 때문에
			e.preventDefault();
			
			//첨부파일 내용 : uuid,uploadPath,fileType,fileName
			//=>uploadResult ul li가 가지고 있기 때문에 그 영역에 있는 값 수집하기
			var str="";
			$(".photo li").each(function(i,obj){
				var job=$(obj);
				
				str+="<input type='hidden' name='uuid' value='"+job.data("uuid")+"'>";
				str+="<input type='hidden' name='uploadPath' value='"+job.data("path")+"'>";
				str+="<input type='hidden' name='fileName' value='"+job.data("filename")+"'>";
				str+="<input type='hidden' name='fileType' value='"+job.data("type")+"'>";
			});
			console.log(str);
			formObj.append(str).submit();
		});
		$("input[type='file']").change(function(){
			console.log("upload 버튼 클릭");
			
			//multipart-form-data 형태의 폼을 한꺼번에 가져오기
			var formData=new FormData();
			//file안에 들어있는 여러개의 첨부된 파일 가져오기
			var inputFile=$("input[name='uploadFile']");
			var files=inputFile[0].files;
			
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name,files[i].size)){
					return false;
				}
				formData.append("uploadFile",files[i]);
			}
			
			//formData를 ajax 기술로 서버로 전송하기
			$.ajax({
				url : "/uploadAjax",	//가야할 컨트롤러 주소
				data : formData,		//전송할 데이터	
				processData : false,	//formData를 쓸때 무조건 필요함(데이터를 어떤 방식으로 변환할것인지 결정)
				contentType : false,	//formData를 쓸때 무조건 필요함(formData가 기본적으로 application/x-www-form-urlencoded인 상황이라 false로 지정)
				type : "post",
				dataType : "json",		//되돌아오는 데이터 타입(전송이 잘 되면 success라는 문자열을 전송받을 예정)
				success : function(result){
					console.log(result);
					showUploadedFile(result);
					//$(".uploadDiv").html(cloneObj.html());
				}
			});
		}); //#uploadBtn 종료
		//첨부파일의 크기와 확장자 제한
		function checkExtension(fileName,fileSize){
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB
			
			if(fileSize>maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 파일의 확장자는 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}	
		//서버에서 result를 받은 후 result 보여주기
		function showUploadedFile(uploadResultArr){
			//결과를 보여줄 영역 가져오기
			var uploadResult = $(".photo");
			//
			var str="";
			$(uploadResultArr).each(function(i,obj){
				if(obj.fileType){//true이면 이미지
					//썸네일 이미지 경로
					var filePath=encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);					
					
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'";
					str+=">";					
					str+="<img src='/display?fileName="+filePath+"'>";
					str+="</li>";
				}
			});
			//console.log(str);
			//uploadResult.append(str);
			uploadResult.html(str);
		};
		
});
		
		
		
	</script>	
		
		
	<script>
	<script>
	var sel_file;

	$(document).ready(function() {
	    $(".file").on("change", fileChange);
	});

	function fileChange(e) {
		e.preventDefault();


		var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);

	    filesArr.forEach(function(f) {
	        if(!f.type.match("image.*")) {
	            alert("확장자는 이미지 확장자만 가능합니다.");
	            return;
	        }

	        sel_file = f;

	        var reader = new FileReader();
	        reader.onload = function(e) {
	            $(".photo").attr("src", e.target.result);
	        	//$(".photo").css("height", "100px")
	        }
	        reader.readAsDataURL(f);
	    }); 
	}
		
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
