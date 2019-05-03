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
	height: 930px;
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
 
#img_px {
   width: 200x;
   height: 120px;  
   margin-left : 10px;
}
.uploadResult{
	margin-left : 140px;
}

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

	
	
	<!-- 파일 업로드 부분 시작 -->
</script>


<!-- 파일 업로드 부분 시작 -->
<script>
$(function(){
   // 처음 상태를 복제
   // var cloneObj=$(".uploadDiv").clone();
   var formObj=$("form[role='form']");
/*    var region = $('#region').val();
   var region2 = $('#region2').val();
   var region3 = $('#region3').val();
   var region4 = $('#region4').val();
   var region5 = $('#region5').val();
   alert(region+region2+region3+region4+region5); 주소한번 합쳐봄 */

   $("button[type='submit']").click(function(e){
      // submit 버튼이 눌러지면 폼 전송 막기
      // 막는 이유는 첨부파일 내용을 가지고 같이가야 하기 떄문이다.
      e.preventDefault();
      
      // 첨부파일내용 : uuid, uploadPath, fileType, fileName
      //=> uploadResult ul li가 가지고 있기 때문에 그 영역에 있는 값 수집하기
      var str="";
      $(".uploadResult span").each(function(i,obj){
         var job=$(obj);
         
         str+="<input type='hidden' name='homeAttach["+i+"].uuid' value='"+job.data("uuid")+"'>";
         str+="<input type='hidden' name='homeAttach["+i+"].uploadPath' value='"+job.data("path")+"'>";
         str+="<input type='hidden' name='homeAttach["+i+"].fileName' value='"+job.data("filename")+"'>";
         str+="<input type='hidden' name='homeAttach["+i+"].fileType' value='"+job.data("type")+"'>";
      });
      console.log(str);
      formObj.append(str);
      formObj.submit();
   });
      
      // uploadBtn을 입력하면 uploadFile에 있는 정보 가져오기
      
      $("#uploadIMG").click(function(){
         console.log("등록하기 버튼 클릭");
         
         // multipart/form-data 형태의 폼을 한꺼번에 처리하기
         var formData = new FormData();
         // file안에 들어있는 여러개의 첨부된 파일 가져오기
         var inputFile=$("input[name='uploadFile']");
         var files=inputFile[0].files;
         
         for(var i=0; i<files.length;i++){
            
            if(!checkExtension(files[i].name, files[i].size)){
               return false;
            } 
            else if(files.length > 3) {
               alert("이미지는 3개까지 등록 가능합니다.");
               return false;
            }
            formData.append("uploadFile",files[i]);
         }
         
         // formData를 ajax 기술로 서버로 전송하기 
         $.ajax({
            url : "/homeAjax",   // 가야할 컨트롤러 주소
            data : formData,      // 전송할 데이터
            processData : false,   // formData를 쓸때 무조건 필요함(데이터를 어떤방식으로 변환할 것인지 결정)
            contentType : false,   // formData를 쓸때 무조건 필요함(formData가 기본적으로  application/x-www-form-urlencoded인 상황이라 false로 지정)
            type :"post",
            dataType : "json",      // 되돌아오는 데이터 타입 (전송이 잘 되면 success라는 문자열을 전송받을 예쩡)
            success:function(result) {
               console.log(result);   // 브라우저에 찍힌 파일내용
               showUploadedFile(result);
               //$(".uploadDiv").html(cloneObj.html());
            }
         });
      });  //#uploadBtn 종료
      
      // 첨부파일의 크기와 확장자 제한
      function checkExtension(fileName, fileSize){
         var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 정규식 패턴 // 확장자 막음
         var maxSize = 5242880; // 5MB
         
         if(fileSize > maxSize){
            alert("파일 사이즈 초과");
            return false;
         }
         if(regex.test(fileName)){
            alert("이미지만 업로드할 수 있습니다.");
            return false;
         }
         return true;
      } // checkExtension 종료
      
      //서버에서 result를 받은 후 result 보여주기
      function showUploadedFile(uploadResultArr){
         //결과를 보여줄 영역 가져오기
         var uploadResult = $(".uploadResult");
         console.log(uploadResultArr);
         var str="";                  
         $(uploadResultArr).each(function(i,obj){   
            if(obj.fileType){//true이면 이미지
               //썸네일 이미지 경로
               var filePath=encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
                //원본 파일 이미지 경로
               var oriPath=obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
                
               //폴더 구분의 \를 /로 바꾸는 작업
               oriPath=oriPath.replace(new RegExp(/\\/g),"/");
               str+="<span id = 'image_span' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
               str+=" data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
               str+="<img src='/homedisplay?fileName="+filePath+"' id ='img_px'></a>"; // 고정이미지값을 줄려고 id를 넣음
               str+="</span>";
            }
            
         });
         var span_length=$(".uploadResult span").length;
         console.log("span갯수 : " + span_length);
         
         if(span_length === 3) {
            alert("이미지는 3개까지 업로드 가능합니다. ");
            $("#uploadIMG").off('click');
            
            return;
      }
          uploadResult.append(str);
      }
      
      // X를 클릭하면 첨부된 파일 삭제하기
      $(".uploadResult").on("click","button",function(){
         var targetFile=$(this).data("file");
         var type=$(this).data("type");
      
         // 첨부목록 삭제
         var targetLi=$(this).closest("li");
         
         
         // 가져온 데이터 서버로 전송
         $.ajax({
            url : '/deleteHomeFile',
            dataType : 'text',
            data:{
               fileName:targetFile,
               type:type
            },
            type:'post',
            success:function(result){
               console.log(result);
               targetLi.remove();
            }
         });
      });
   })

</script>
