<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

 <style>
.wen {width:200px; height:200px; border-radius:200px;margin-top:50px; margin: 0 auto; overflow:hidden; border: solid 2px #cccccc;}
.wen img {height:200px; width:200px; display:block; margin:0 auto;}
.navbar {border-bottom: solid 1px #cccccc;}
 </style>

</head>


<div class="container" style = "margin-top: 50px;">

	<div class="row">
		<div class="col-sm-3">
			<!--left col-->

			<div class="wen">
				<div>
					<img src="/resources/img/vienna.PNG" class="photo" /> <input
						type="file" name="uploadFile" class="file" />
				</div>

			</div>
			<br>
			<h5 style ="text-align: center;">~~ 님</h5>
			<ul class="list-group">
				
				<li class="list-group-item text-muted">Activity <i
					class="fa fa-dashboard fa-1x"></i></li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span>
					125</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span>
					13</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span>
					37</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span>
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

						<div class="form-group">

							<div class="col-xs-6">
								<label for="phone">이름</label>

							</div>
						</div>

						<div class="form-group">
							<div class="col-xs-6">
								<label for="mobile">전화번호</label>

							</div>



						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="email">이메일</label>

							</div>
						</div>
						<div class="form-group">

							<div class="col-xs-6">
								<label for="email">주소</label> asdasdasdasd
							</div>
						</div>



					</form>

					<hr>

				</div>


			</div>

		</div>
	</div>
</div>