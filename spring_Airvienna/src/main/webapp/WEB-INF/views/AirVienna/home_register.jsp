<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.navbar {
   border-bottom: solid 1px #cccccc;
}

.py-5 {
   background-image: url("/resources/img/house.jpg");
   background-size: 100%;
   background-repeat: no-repeat;
}

.number {
   float: right;
   margin-left: 100px;
   position: relative;
   bottom: 10px;
}


#home_img {
   width: 220px;
   height: 145px;  
}

#image_span {
   margin-right : 10px;

}

#img_px {
   width: 220px;
   height: 145px;  
}
</style>
</head>

<!-- 점보트론 부분 -->
<body class="bg-light">
   <div class="container">
      <div class="py-5 text-center">
         <h1>당신의 집을 등록하세요!</h1>
         <p class="lead">
            <b>많은 여행객들이 이용할 수 있도록 자신의 집을 소개하세요!!</b>
         </p>
      </div>
<!-- 점보트론 부분 끝 -->


<!-- 사이드 옵션 부분 시작 -->

      <div class="row" style="margin-top: 5%">
         <div class="col-md-4 order-md-2 mb-4">
         
            <h4 class="d-flex justify-content-between align-items-center mb-3">
               <span class="text-muted">정보</span>
            </h4>
            <ul class="list-group mb-3">
               <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                     <h6 class="my-0">최대 인원</h6>
                     <small class="text-muted">수용할 수 있는 인원 수</small>
                     <div class="number" style ="right:4px;">
                        <a href="#" id="decreaseQuantity"><img src="/resources/img/blue_decrease_20.png"/></a>
                        <span id="numberUpDown">1</span>
                        <a href="#" id="increaseQuantity"><img src="/resources/img/blue_increase_20.png"/></a>
                     </div>
                  </div>
               </li>
               <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                     <h6 class="my-0">침대 갯수</h6>
                        <small class="text-muted">숙소에 있는 침대의 수</small>
                        <div class="number">
                        <a href="#" id="BeddecreaseQuantity"><img src="/resources/img/blue_decrease_20.png"/></a>
                        <span id="BedUpDown">1</span>
                        <a href="#" id="BedincreaseQuantity"><img src="/resources/img/blue_increase_20.png"/></a>
                     </div>
                  </div>
               </li>
               <li
                  class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                     <h6 class="my-0">조식 제공</h6>
                     <small class="text-muted">아침에 조식을 제공하나요?</small>
                     <div class="custom-control custom-radio" style ="margin-top : 5px;">
                        <input id="offer" name="bfast" type="radio" value ="1"
                        class="custom-control-input" >
                         <label class="custom-control-label" for="offer">제공</label>
                  </div>
                  <div class="custom-control custom-radio">
                     <input id="offer_not" name="bfast" type="radio" value ="0"
                        class="custom-control-input">
                         <label class="custom-control-label" for="offer_not">제공 안함</label>
                  </div>
                  </div>
               </li>

               
               <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                     <h6 class="my-0">주차장</h6>
                     <small class="text-muted">건물에 주차장이 있나요?</small>
                     <div class="custom-control custom-radio" style ="margin-top : 5px;">
                        <input id="parking_ok" name="parking" type="radio" value ="1"
                        class="custom-control-input"  required="">
                         <label class="custom-control-label" for="parking_ok">주차장 있음</label>
                  </div>
                  <div class="custom-control custom-radio">
                     <input id="parking_not" name="parking" type="radio" value ="0"
                        class="custom-control-input" required="">
                         <label class="custom-control-label" for="parking_not">주차장 없음</label>
                  </div>
                  </div>
               </li>
               
               <li class="list-group-item d-flex justify-content-between lh-condensed">
                  <div>
                     <h6 class="my-0">와이파이</h6>
                     <small class="text-muted">와이파이가 설치돼있나요?</small>
                     <div class="custom-control custom-radio" style ="margin-top : 5px;">
                        <input id="wifi_ok" name="wf" type="radio" value ="1"
                        class="custom-control-input" required="">
                         <label class="custom-control-label" for="wifi_ok">와이파이 있음</label>
                  </div>
                  <div class="custom-control custom-radio">
                     <input id="wifi_not" name="wf" type="radio" value ="0"
                        class="custom-control-input" required="">
                         <label class="custom-control-label" for="wifi_not">와이파이 없음</label>
                  </div>
                  </div>
               </li>
            </ul>
               <!-- 코리아 it 광고판 -->
                  <div>
                  <a href="http://sinchon.koreaisacademy.com"><img src="/resources/img/koreaitadd.jpg" alt="" /></a>
                  </div>
               <!-- 광고 부분 끝 -->
         </div>
         
<!-- 사이드 옵션 부분 끝  -->


<!-- 숙보정보 부분 시작  -->
         <div class="col-md-8 order-md-1">
            <h3 class="mb-3">숙소 정보</h3>
            <form action="" method="post" class="home_info" role="form">
               <div class="row">
               <hr class="mb-4">
                  <div class="col-md-6 mb-3">
                     <label for="firstName">숙소 이름</label> <input type="text"
                        class="form-control" id="homename" name ="homename" value="">
                  </div>
                  <div class="col-md-6 mb-3">
                     <label for="lastName">등록자 성명</label> <input type="text"
                        class="form-control" id="username" name ="username" value="${info.username}" readonly="readonly">
                  </div>
               </div>
               <div class="mb-3">
                  <label for="sample4_postcode">집 주소</label> 
                     <input type="text" id="region" name ="region" class="form-control" placeholder="우편번호" style ="width: 100px;" />
                  <div style ="margin-top: 10px;">
                     <input type="text" id="region2" name ="region2" class="form-control" style ="width: 250px; float:left; margin-right:5px;" placeholder="도로명주소">
                     <input type="text" id="region3" name ="region3" class="form-control" style ="width: 300px;" placeholder="지번주소">
                     <span id="guide" style="color:#999;display:none"></span>
                  </div>
                  <div style ="margin-top: 5px;">
                     <input type="text" id="region4" name ="region4" class="form-control" style ="width: 400px; float:left; margin-right:5px;" placeholder="상세주소">
                     <input type="text" id="region5" name ="region5" class="form-control" style ="width: 150px;" placeholder="참고항목">
                  </div>
               </div>
               
               <div class="row">
                  <div class="col-md-5 mb-3">
                     <label for="price">가격</label> 
                     <input type="text" id="price" name="price" class="form-control" style ="width: 150px;" placeholder="">
                  </div>
               </div>
               <hr class="mb-4">

               <h3 class="text-info">당신의 집은 어떻게 생겼나요?</h3>
               <p class="text-muted"> 멋진 사진들로 손님들에게 자신의 집을 알리세요!</p>
               <!--이미지 업로드 구간 시작-->
               <div class="box">
                  <!-- 파일업로드 썸네일 부분  -->
                     <div class="uploadResult">
                  
                     </div>
                  <!-- 파일 추가 부분 -->
                  <div class="row" style="margin-top:10px;">
                     <div class="col-sm-10" style ="border : 1px solid #cccccc; background-color: white; border-radius: 5px; left:10px;">
                        <span class="control-fileupload">
                        <input type="file" name="uploadFile" multiple="multiple" style="margin:3px; right : 12px; position: relative;">
                        </span>
                     </div>
                     <div class="col-sm-2">
                        <button type="button" class="btn btn-primary btn-block" id = "uploadIMG">
                           <i class="icon-upload icon-white"></i> 사진등록 </button>
                     </div>
                  </div>
               </div>
               
               <hr>

               <div class="mb-3">
                  <label for="simple_intro"> 간단한 소개 </label>
                   <input type="text" class="form-control" id="birfcontent" name="birfcontent" placeholder="자신의 집을 간단하게 소개해보세요!">
               </div>
               
               <label for="home_intro">상세 설명 </label>
             <textarea class="form-control" id="content" name ="content" rows="7" style = "margin-bottom: 5%" placeholder ="(편의시설,방 갯수,구조,집의 상태 등등)"></textarea>
               <hr class="mb-4">
               <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input"
                     id="same-address"> <label class="custom-control-label"
                     for="same-address">숙소의 상세내용과 개인정보를 공개하는데 동의하시겠습니까?</label>
               </div>
               <hr class="mb-4">
               
               <input type="hidden" name="maxperson" id = "maxperson" value="" />
               <input type="hidden" name="bedcount" id = "bedcount" value=""/>
               <input type="hidden" name="breakfast" id = "breakfast" value =""/>
               <input type="hidden" name="parkingarea" id = "parkingarea" value ="" />
               <input type="hidden" name="wifi" id ="wifi" value =""/>
               
            <button class="btn btn-primary btn-lg btn-block" type="submit" id = "register_btn" >등록하기</button>
            
            </form>
      </div>
   </div>
      <footer class="my-5 pt-5 text-muted text-center text-small">
         <p class="mb-1">©2019 AirVienna</p>
         <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Termsa</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
         </ul>
      </footer>
   </div>
   
<!-- 숙소 정보 입력폼 끝 -->   
   
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<!-- 히든태그에 값보내주기 -->
<script>
$(function(){
   
   $("input[name='bfast']").click(function(){
      $("#breakfast").val($("input[name='bfast']:checked").val()); 
   });
   
   $("input[name='parking']").click(function(){
      $("#parkingarea").val($("input[name='parking']:checked").val()); 
   });
   
   $("input[name='wf']").click(function(){
      $("#wifi").val($("input[name='wf']:checked").val()); 
   });
   
});

</script>


<!-- 파일 업로드 부분 시작 -->
<script>
$(function(){
   var formObj=$("form[role='form']");

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
<!-- 파일 업로드 끝 -->


<!-- 침대 갯수 증감  스크립트 -->
<script>
$(function(){

   $('#BeddecreaseQuantity').click(function(e) {
         e.preventDefault();
         var stat = $('#BedUpDown').text();
         var num = parseInt(stat, 10);
         num--;
         if (num < 0) {
            alert('0 아래로는 내릴 수 없습니다.');
            num = 1;
         }
         $('#BedUpDown').text(num);
         $("#bedcount").val(num);
         
      });
      $('#BedincreaseQuantity').click(function(e) {
         e.preventDefault();
         var stat = $('#BedUpDown').text();
         var num = parseInt(stat, 10);
         num++;

         if (num > 5) {
            alert('더이상 늘릴수 없습니다.');
            num = 5;
         }
         $('#BedUpDown').text(num);
         $("#bedcount").val(num);
      });
   });
</script>

<!-- 최대인원수 증감  스크립트 -->

<script>

$(function() {
      $('#decreaseQuantity').click(function(e) {
         e.preventDefault();
         var stat = $('#numberUpDown').text();
         var num = parseInt(stat, 10);
         num--;
         if (num <= 0) {
            alert('0명 아래로는 내릴 수 없습니다.');
            num = 1;
         }
         $('#numberUpDown').text(num);
         $("#maxperson").val(num);
      });
      $('#increaseQuantity').click(function(e) {
         e.preventDefault();
         var stat = $('#numberUpDown').text();
         var num = parseInt(stat, 10);
         num++;

         if (num > 20) {
            alert('설마 20명이상이 오겠어?' + stat);
            num = 5;
         }
         $('#numberUpDown').text(num);
         $("#maxperson").val(num);
      });
   });
</script>



<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
$(function(){
   $("#region").focus(function(){
      sample4_execDaumPostcode();
       $('#region').blur();
     });
});
   function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('region').value = data.zonecode;
                document.getElementById("region2").value = roadAddr;
                document.getElementById("region3").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("region5").value = extraRoadAddr;
                } else {
                    document.getElementById("region5").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
      }

</script>

</body>
</html>