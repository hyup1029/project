<%@page import="com.spring.domain.HomeAttachVO"%>
<%@page import="com.spring.domain.AccommodationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.wen {
	width: 200px;
	height: 200px;
	border-radius: 200px;
	margin-top: 50px;
	margin: 0 auto;
	overflow: hidden;
	border: solid 2px #cccccc;
}

.wen img {
	height: 200px;
	width: 200px;
	display: block;
	margin: 0 auto;
}

.navbar {
	border-bottom: solid 1px #cccccc;
}
.tab{white-space:pre;}
</style>

</head>

<div class="container" style="margin-top: 50px;">
<hr />
	<div class="row">
		<div class="col-sm-3">
			<!--left col-->

			<div class="wen">
				<div>
					<c:choose>
						<c:when test="${empty info.uploadPath}">
							<img src="/resources/img/vienna.PNG" class="photo">
						</c:when>
						<c:when test="${!empty info.uploadPath }">
							<%
								String filePath = null;
								AirUserVO vo = (AirUserVO)request.getAttribute("info");
								filePath= vo.getUploadPath()+"\\"+vo.getUuid()+"_"+vo.getFileName();
								filePath = filePath.replaceAll("\\\\", "/");
								System.out.print("filePath"+filePath);
							%>
							<img src="/display?fileName=<%=filePath%>" class="photo">
						</c:when>
					</c:choose>
				</div>
				
			</div>
			<br>
			<h5 style="text-align: center;"><b>${info.username}</b>&nbsp&nbsp&nbsp님</h5>
			<ul class="list-group" style ="margin-top : 60px;">

				<li class="list-group-item text-muted">활동 내역 <i
					class="fa fa-dashboard fa-1x"></i></li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>공유</strong></span>
					125</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>좋아요</strong></span>
					13</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>찜</strong></span>
					37</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>팔로워</strong></span>
					78</li>
			</ul>

			<div class="panel panel-default">
				<div class="panel-body">
					<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i>
					<i class="fa fa-twitter fa-2x"></i> <i
						class="fa fa-pinterest fa-2x"></i> <i
						class="fa fa-google-plus fa-2x"></i>
				</div>
			</div>


		</div>
		<!--/col-3-->
		<div class="col-sm-9">
			<div class="tab-content">
				<div class="tab-pane active" id="home">
					<form class="form" action="##" method="post" id="registrationForm">
						<h4 class="mb-3">프로필 정보</h4>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="name" class="tab">이      름 &#9;</label>${info.username}
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="tel" class="tab">전화번호 &nbsp;</label>${info.tel}
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<label for="email">이 메 일&nbsp;&nbsp;&nbsp;&nbsp;</label>${info.email}
							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="address" class="tab">주      소 &#9;</label>${info.address}
							</div>
						</div>
					</form>
					<hr>
					<h4 class="mb-3">등록된 집</h4>
					<div class="row">
						<div class="col-lg-4 text-center" style="margin-top: 10px;">
							<div class="home_container">
								<div>    
               <%
               AccommodationVO acc= (AccommodationVO)request.getAttribute("vo");
           if(acc.getHomeAttach()!=null){
               for(HomeAttachVO home : acc.getHomeAttach()){
                 	  String filePath2=null;
               
               

                         System.out.println("uuid "+home.getUuid());
                         filePath2=home.getUploadPath()+"\\s_"+home.getUuid()+"_"+home.getFileName();
                             String oriPath2 = filePath2;
                             oriPath2= oriPath2.replaceAll("\\\\","/");
                         // 이렇게 변수에 담고

                         System.out.println("uuid "+filePath2);
                         System.out.println("oriPath"+oriPath2); 
                       
              %>        

              <img src="/homedisplay?fileName=<%=oriPath2%>" style='margin-top:10px; width:96%; height:250px;'/>
				<%} %>
				<%} %>			
								</div>
							</div>

						</div>
						<div class="col-lg-8" style="padding-right: 55px;">
							<ul class="list-layout picture-tiles clearfix ui-sortable"></ul>
							<h3 style="margin-top: 10px;">${vo.homename}</h3>

							<hr>
							<p>${vo.birfcontent}</p>
							<div class="row row-condensed">
								<div class="">
									<span class="file-input-container"> <iframe
											id="upload_frame" name="upload_frame" style="display: none;"></iframe>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>
</div>

<script>



</script>
