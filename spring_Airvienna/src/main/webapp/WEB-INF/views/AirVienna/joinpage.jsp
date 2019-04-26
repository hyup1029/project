<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<script src="/resources/js/joinform.js"></script><!--form validation script -->
<link rel="stylesheet" href="/resources/css/upload.css" />
	<div class="container" style="margin-top:40px">
	<form class="form-signin" action="" method="post" role="form" enctype="multipart/form-data" id="joinpage">
		<div class="wen" >				
			<div class="uploadDiv">
				<img src="/resources/img/vienna.PNG" class="photo" />
				<br />
				<br />
				<br />
				<br />
				<br />
				<br />				
				<input type="file" name="uploadFile"  class="file" />
			</div>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="email" class="form-control" name="email" id="email" placeholder="email을 입력하세요"/>	
			<small id="email" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" class="form-control" name="password" id="password" placeholder="password를 입력하세요"/>	
			<small id="password" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="password를 입력하세요"/>	
			<small id="confirm_password" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="name">이 름</label>
			<input type="text" class="form-control" name="username" id="username" />
			<small id="username" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<input type="text" class="form-control" name="address" id="address"/>	
			<small id="address" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="tel">전화번호</label>
			<input type="text" class="form-control" name="tel" id="tel" placeholder="ex)010-xxxx-xxxx"/> 
			<small id="tel" class="text-info"></small>
		</div>
		
		<div class="form-group">
			<label for="birth">생년월일</label> 
			<input type="text" class="form-control" name="birth" id="birth" placeholder="ex)yymmdd" />
			<small id="birth" class="text-info"></small>
		</div>
	
		<div class="form-group text-center">
			<button type="submit" class="btn btn-primary">가입신청</button>
			<button type="reset" class="btn btn-danger">취소</button>
		</div>
	</form>
	</div>
	

	
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




