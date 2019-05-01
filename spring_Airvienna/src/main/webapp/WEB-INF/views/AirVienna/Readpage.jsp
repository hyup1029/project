<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 

	int price = 50000; 

	String email = "ajdzl777@naver.com";

	String content = "너무 좋아요!";

%>

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/carousel/">

    <!-- Bootstrap core CSS --> 

<link href="/resources/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

 <style>


      .bd-placeholder-img {

        font-size: 1.125rem;

        text-anchor: middle;

        -webkit-user-select: none;

        -moz-user-select: none;

        -ms-user-select: none;

        user-select: none;
      }


      /* .d-block w-100{


		width : 70px;


		height : 100px;      

 } */


      @media (min-width: 768px) {
  .bd-placeholder-img-lg {
 
        font-size: 3.5rem;

        }
   }

    </style>

   <!-- Custom styles for this template -->


    <link href="/resources/css/carousel.css" rel="stylesheet">

 

 

 

  </head>


  <body style = "padding-top: 0px;">

<main role="main">



  <div id="myCarousel" class="carousel slide" data-ride="carousel">

 

 

 

    <ol class="carousel-indicators">

 

 

 

      <li data-target="#myCarousel" data-slide-to="0" class=""></li>

 

 

 

      <li data-target="#myCarousel" data-slide-to="1" class=""></li>

      <li data-target="#myCarousel" data-slide-to="2" class="active"></li>

    </ol>

 

 

 

    <div class="carousel-inner">


      <div class="carousel-item">

 

 

 

      <img src="resources/img/home1.jpg" width = "80px" height = "100%" class="d-block w-100" alt="First Slide">

 

 

 

            

 

 

 

        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"></rect></svg>

 

 

 

        

 

 

 

        <div class="container">

 

 

 

          <div class="carousel-caption text-left">

 

 

 

           <p></p>

 

 

 

          </div>

 

 

 

        </div>

 

 

 

      </div>

 

 

 

      <div class="carousel-item">

        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"></rect></svg>

        <div class="container">

          <div class="carousel-caption">

            <h1>Another example headline.</h1>

            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>

    	 	</div>
     	</div>
   	</div>
  <div class="carousel-item active">
  <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"></rect></svg>
  <div class="container">
   <div class="carousel-caption text-right">
     <h1>One more for good measure.</h1>
 	  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>

 

 

 

            <p></p>

 

 

 

          </div>

 

 

 

        </div>

 

 

 

      </div>

 

 

 

    </div>

 

 

 

    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">

 

 

 

      <span class="carousel-control-prev-icon" aria-hidden="true"></span>

 

 

 

      <span class="sr-only">Previous</span>

 

 

 

    </a>

 

 

 

    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">

 

 

 

      <span class="carousel-control-next-icon" aria-hidden="true"></span>

 

 

 

      <span class="sr-only">Next</span>

 

 

 

    </a>

 

 

 

<!--     <a class="btn btn-lg btn-primary" role="button">예약하기</a> -->

 

 

 

  </div>

 

 

 

 

 

 

 

 

 

 

 

  <!-- Marketing messaging and featurettes

 

 

 

  ================================================== -->

 

 

 

  <!-- Wrap the rest of the page in another container to center all the content. -->

 

 

 

 

 

 

 

  <div class="container marketing">
  <hr class="featurette-divider">

 

 

 

 

 

 

 

    <div class="row featurette">

 

 

 

      <div class="col-md-6">

 

 

 

    <h2 class="featurette-heading">${vo.ano}</h2>
    <h3 class="text-muted">${vo.homename}</h3>


        <h3 class = "text-muted price" style = "text-align:right;" id = "price">${vo.price}<span>원</span></h3>
      <p></p>

        <h1></h1>

        <h2></h2>

 

 

 

        <p class="lead" style = "padding-top:5rem;">${vo.content}</p>

 

 

 

      </div>

 

 

 

    

 

 

 

      <div class="col-md-2" style = "text-align:center;">

 

 

 

        <img class="bd-placeholder-img rounded-circle" width="100" height="100" src="resources/img/octopus.png" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em"></text></img>

 

 

 

        <p style = "text-align:center;">${vo.ano}</p>


 

 

      </div>

 

 

 

      

 

 

 

      <div class="col-md-4">

 

 

 

      <!-- 예약 페이지 -->

 

 

 

<form action = "pay">

 

 

 

<div class="datacover">

 

 

 

<div class="covereddata">

 

 

 

<div class="coverdata" style="background-color:transparant">

 

 

 

<div class="datainput">

 

 

 

   <div>

 

 

 

      <h1>편안하고 아늑한</h1>

 

 

 

      <h1>숙소를 예약하세요.</h1>

   </div>

  <!--  <div class="form-group">

       <label for="inputregion">지역</label>

 

 

 

         <input type="text" class="form-control" id="inputregion" placeholder="모든 위치">

 

 

 

     </div> -->

 

 

 

  <div class="form-row">

 

 

 

    <div class="form-group col-md-6">

 

 

 

      <label for="inputcheckin">체크인</label>

 

 

 

      <input type="date" class="form-control checkin" id="inputcheckin" placeholder="년/월/일">

 

 

 

    </div>

 

 

 

    <div class="form-group col-md-6">

 

 

 

      <label for="inputcheckout">체크아웃</label>

 

 

 

      <input type="date" class="form-control checkout" id="inputcheckout" placeholder="년/월/일">

 

 

 

    </div>

 

 

 

  </div>

 

 

 

  <div class="form-group">

 

 

 

    <label for="inputnumber">인원</label>

 

 

 

    <input type="number" class="form-control people" id="people" placeholder="인원">

 

 

 

  </div>

 

 

 

  <div class="form-group">

 

 

 

  	<label>가격</label>

 

 

 

  	<input type = "number" class = "form-control result" id = "result" readonly = "readonly">

 

 

 

  </div>

 

 

 

<div class="range" style = "align-items : center;">

 

 

 

  <button type = "submit" class="btn btn-primary" style = "background-color:red; board-color:pink;">예약하기</button>

 

 

</div>

 

</div>

 

</div>

 

</div>

 

</div>

 

</form>

 

</div>

 

 

 

    </div>

    <!-- Three columns of text below the carousel -->


   <!--  <div class="row">

 

 

 

     <div class="col-lg-4">

 

 

 

        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

 

 

 

        <h2>집 이름을 여기다가 쓸건데</h2>

 

 

 

        <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>

 

 

 

      </div><!-- /.col-lg-4

 

 

 

      <div class="col-lg-4">

 

 

 

        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

 

 

 

        <h2>Heading</h2>

 

 

 

        <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>

 

 

 

        <p></p>

 

 

 

      </div><!-- .col-lg-4

 

 

 

      <div class="col-lg-4">

 

 

 

        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 140x140"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"></rect><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

 

 

 

        <h2>Heading</h2>

        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>

	  <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p>

      </div><!-- /.col-lg-4 

    </div> -->

 

 

 

    <!-- /.row -->


    <!-- START THE FEATURETTES -->

 

 

 

 

 

 

 

    <hr class="featurette-divider">

 

 

 

 

 

 

 

    <div class="row featurette">

      <div class="col-md-12">

        <h2 class="featurette-heading" style = "text-align:center; margin-bottom:75px">우리 숙소는요 <span class="text-muted">Our Home</span></h2>

 

 

 

       </div>

 

 

 

       <div class = "com-md-2" id="box1" style="width:230px;height:200px; border: 1px solid;"><img class = "bed" width="100" height="100" src="../resources/img/bed.png" style = "margin-top:30px; margin-left:64px;"></img>


       <p style="margin-top:15px; text-align:center">

 

 

 

       		침대 : <input type = "number" style = "text-align:right; width:30px; background-clip:padding-box; border:1px solid #ced4da; border-radius:.25rem" name = "num" placeholder = "0" readonly="readonly" />

 

 

 

      </p>

 

 

 

       </div>

 

 

 

      

 

 

 

       <div class = "com-md-1" style = "width:50px";></div>

 

 

 

        <div class = "com-md-2" id="box2" style="width:230px;height:200px; border: 1px solid;"><img class = "bed" width="100" height="100" src="../resources/img/breakfast.png" style = "margin-top:30px; margin-left:64px;"></img>

 

 

 

      

 

 

 

       <p style="margin-top:15px; text-align:center">

 

 

 

       		조식 : <input type = "checkbox" style = "text-align:right; width:30px; background-clip:padding-box; border:1px solid #ced4da; border-radius:.25rem" name = "num" placeholder = "0" readonly="readonly" />

 

 

 

      </p>

 

 

 

       </div>

 

 

 

        <div class = "com-md-1" style = "width:50px";></div>

 

 

 

         <div class = "com-md-2" id="box3" style="width:230px;height:200px; border: 1px solid;"><img class = "bed" width="100" height="100" src="../resources/img/parking.png" style = "margin-top:30px; margin-left:64px;"></img>

 

 

 

      

 

 

 

       <p style="margin-top:15px; text-align:center">

 

 

 

       		주차장 : <input type = "checkbox" style = "text-align:right; width:30px; background-clip:padding-box; border:1px solid #ced4da; border-radius:.25rem" name = "num" placeholder = "0" readonly="readonly" />

 

 

 

      </p>

 

 

 

       </div>

 

 

 

          <div class = "com-md-1" style = "width:50px";></div>

 

 

 

           <div class = "com-md-2" id="box5" style="width:230px;height:200px; border: 1px solid;"><img class = "bed" width="100" height="100" src="../resources/img/wifi.png" style = "margin-top:30px; margin-left:64px;"></img>

 

 

 

      

 

 

 

       <p style="margin-top:15px; text-align:center">

 

 

 

       		와이파이 : <input type = "checkbox" style = "text-align:right; width:30px; background-clip:padding-box; border:1px solid #ced4da; border-radius:.25rem" name = "num" placeholder = "0" readonly="readonly" />

 

 

 

      </p>

 

 

 

       </div>

 

 

 

       <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>

 

 

 

      </div>

 

 

 

    <!--   <div class="col-md-5">

 

 

 

        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="800" src="resources/img/geo.png" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"></rect><text x="50%" y="50%" fill="#aaa" dy=".3em"></text></img>

 

 

 

      </div> -->

 

 

 

    </div>

 

 

 

 

 

 

 

    <hr class="featurette-divider">

    <div class="row featurette">

 

 

 

<!--       <div class="col-md-7 order-md-2">

 

 

 

        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>

 

 

 

        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>

 

 

 

      </div> -->

 

      

 

      <div class = "container marketing" id="map" style="width:70%;height:500px;"></div>

 

 

 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=421002b27b578b32733d1a1574e320e6&libraries=services"></script>

 

<script>

 

// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

 

    mapOption = {

 

        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표

 

        level: 3 // 지도의 확대 레벨

 

    };  

 

 

 

// 지도를 생성합니다    

 

var map = new daum.maps.Map(mapContainer, mapOption); 

 

 

 

// 주소-좌표 변환 객체를 생성합니다

 

var geocoder = new daum.maps.services.Geocoder();

 

 

 

// 주소로 좌표를 검색합니다

 

geocoder.addressSearch('경기도 수원시 권선구 권선동 1165-14', function(result, status) {

 

 

 

    // 정상적으로 검색이 완료됐으면 

 

     if (status === daum.maps.services.Status.OK) {

 

 

 

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

 

 

 

        // 결과값으로 받은 위치를 마커로 표시합니다

 

        var marker = new daum.maps.Marker({

 

            map: map,

 

            position: coords

        });

 

 

 

        // 인포윈도우로 장소에 대한 설명을 표시합니다

 

        var infowindow = new daum.maps.InfoWindow({

 

            content: '<div style="width:300px;text-align:center;padding:6px 0;">우리집</div>'

 

        });

 

        

 

        var detailAddr = !!result[0].road_address ? '' + result[0].road_address.address_name + '' : '';

 

         detailAddr += '<div>' + result[0].address.address_name + '</div>';  

 

        

 

        var content = '<div class="bAddr" style = "width : 300px; height : 50px;">' +

 

                        '<span class="title"></span>' + 

 

                        detailAddr + 

 

                    '</div>';

 

        infowindow.setContent(content);

        infowindow.open(map, marker);

 

 

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다

 

        map.setCenter(coords);

 

    } 

 

}); 


</script>

	<div class = "container marketing" style = "text-align : center;">

        <button onclick = "location='review';" class="btn btn-primary btn-xs pull-right" style = "background-color:red; width : 200px; border-color : pink; margin-top:95px;" id="addReplyBtn">숙소에 대한 후기</button>

	</div>

  

    </div>
       <hr class="featurette-divider" />
   <!-- 댓글 영역 -->
<div class="container marketing">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			
			</div>
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user000</strong>
								<small class="pull-right text-muted">2019-04-12 00:00</small>
							</div>
							<p>Good Job!!!</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="panel-footer"><!-- 댓글 페이지 영역 -->			
			</div>
		</div>
	</div>
</div>
<!-- 댓글 영역 종료 -->
<!-- 댓글 모달 -->

<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Reply Modal</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="">Reply</label>
					<input value="New Reply" name="reply" class="form-control" />				
				</div>
				<div class="form-group">
					<label for="">Replyer</label>
					<input class="form-control" name="replyer" value="replyer"/>
		
		
				</div>
				<div class="form-group">
					<label for="">Reply Date</label>
					<input class="form-control" name="replyDate" value=""/>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-warning" id="modalModBtn" type="button">Modify</button>
				<button class="btn btn-danger" id="modalRemoveBtn" type="button">Remove</button>
				<button class="btn btn-primary" id="modalRegisterBtn" type="button">Register</button>
				<button class="btn btn-success" id="modalCloseBtn" type="button">Close</button>
			</div>
		</div>
	</div>
</div>
<form id="operForm" action="/board/modify">
	<input type="hidden" name="ano" value="${vo.ano}"/>
</form>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="/resources/js/reply.js"></script> 
<script>
	//댓글 작업용 스크립트
	$(function(){
		//현재 글 번호 가져오기
		var anoVal=${vo.ano};
		
		//댓글리스트를 보여줄 영역 가져오기
		var replyUL=$(".chat");
		showList(1);  //현재 글의 페이지에 해당하는 댓글 가져오기 호출
		
	
		$("#modalRegisterBtn").on("click",function(){
			var reply={
					reply:modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					ano:anoVal
			};			
			
			replyService.add(reply,function(result){
				//alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				//댓글갱신
				showList(-1);
			});
		});	
		
	
		//댓글 페이지 번호 누르면 이동하기
	/* 	replyPageFooter.on("click","li a",function(e){
			e.preventDefault();    //페이지 번호를 누르면 a 태그가 가지고 있는 이벤트는 막기
			
			pageNum=$(this).attr("href");
			
			showList(pageNum);
		}); */
		
		
		
		
		function showList(){		
			replyService.getList({ano:anoVal},
					function(list){
				console.log(list);
				//페이지 수 계산
			/* 	if(page==-1){
					pageNum=Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				} */
				
				
				var str="";
				if(list == null || list.length==0){
					replyUL.html("");
					return;
				}
				
				//리스트가 있는 경우 
				for(var i=0;i<list.length;i++){
					str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str+="<div>";
					str+="<div class='header'>";
					str+="<strong class='primary-font'>"+list[i].replyer+"</strong>";
					str+="</div>";
					str+="<p>"+list[i].reply+"</p>";
					str+="</div>";
					str+="</li>";
				}
				replyUL.html(str);
			/* 	showReplyPage(replyCnt); */
			});		
		}
		
		
		//댓글의 리스트가 존재하는 것이 아니라 나중에 추가되는 형태이기 때문에
		//현재 존재하는 요소처럼 이벤트를 지정할 수 없음 => 따라서 이미 존재하는
		//요소에 이벤트를 걸고 나중에 변경을 하는 방식 사용(이벤트 위임)
		$(".chat").on("click","li",function(){
			var rno=$(this).data("rno");
			
			replyService.get(rno,function(data){
				console.log(data);
				
				//넘어온 데이터를 모달창에 넣어서 보여주기
				modalInputReply.val(data.reply);
				modalInputReplyer.val(data.replyer).attr("readonly","readonly");
				modalInputReplyDate.val(replyService.displayTime(data.replyDate))
												.attr("readonly","readonly");
				modal.data("rno",data.rno);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				modal.modal("show");
			});
		});		
		
		//댓글 모달 창
		var modal=$(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn=$("#modalModBtn");
		var modalRemoveBtn=$("#modalRemoveBtn");
		var modalRegisterBtn=$("#modalRegisterBtn");
		
		//등록버튼 누르면
		$("#addReplyBtn").on("click",function(){
			modal.find("input").val("");
			//날짜 부분 안보이게 설정
			modalInputReplyDate.closest("div").hide();
			//close버튼만 제외하고 다른 버튼 모두 안보이게 설정
			modal.find("button[id!='modalCloseBtn']").hide();
			//등록 버튼만 다시 보이게 설정
			modalRegisterBtn.show();
			//modify를 수행하고 오면 작성자를 수정못하게 막은 상태이기 때문에
			//다시 해제하는 코드 필요
			modalInputReplyer.attr("readonly",false);
			modal.modal("show");
		});
		
		//모달 창 close
		$("#modalCloseBtn").on("click",function(){
			modal.modal("hide");
		});
		
		//모달 창 Remove 버튼 클릭
		$("#modalRemoveBtn").on("click",function(){
			replyService.remove(modal.data("rno"),function(result){
				//alert(result);
				modal.modal("hide");
			/* 	showList(pageNum);
			 */}); 
		});	
		
		//모달 Modify버튼 클릭시
		$("#modalModBtn").on("click",function(){
			var reply={
					reply:modalInputReply.val(),					
					rno:modal.data("rno")
			};	
			replyService.update(reply,function(result){
				//alert(result);
				modal.modal("hide");
			/* 	showList(pageNum); */
			});		
		}); 


</script>
 

 

 

<script>window.jQuery || document.write('<script src="/resources/js/jquery-slim.min.js"><\/script>')</script><script src="/resources/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>

</body>

<script>

$(function() {

var resultp = $(".result");

 
var price = ${vo.price}; 
	
	var checkin;

 

	var resultd;

	$(".checkin").change(function() {

		checkin = $(".checkin").val();

	});

	$(".checkout").change(function() {

	var	checkout = $(".checkout").val();

	var datein = checkin.split('-');

	var dateina = new Date(datein[0],datein[1],datein[2]);

	var dateout = checkout.split('-');

	var dateouta = new Date(dateout[0],dateout[1],dateout[2]);

	var diff = dateouta - dateina;

	var currDay = 24 * 60 * 60 * 1000;

 	console.log(checkout);

 		console.log(checkin);
 		console.log(price);


		resultd = parseInt(diff/currDay);


	});
	
	$(".people").change(function() {

	var people = $(".people").val();

		var re = (price*people*resultd);

		if(re <= 0){

	     resultp.val(0);

		}

 
		if(re > 0){			

			resultp.val(price*people*resultd);

		}

		if (people > 20) {

 
			alert("너...친구 20명도 없잖아...");

			$(".people").val(20);

		}

	});

	$(".checkout").change(function() {

		var people = $(".people").val();

		var re = (price*people*resultd);

		if(re <= 0){
	     resultp.val(0);
		} 
		if(re > 0){			
		resultp.val(price*people*resultd);
		}
	});
	})
</script>
</html>