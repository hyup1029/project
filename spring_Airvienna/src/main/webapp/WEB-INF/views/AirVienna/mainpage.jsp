<!-- 메인페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/mainpage.css"/>
<%
 String success = (String)request.getAttribute("success");
if(success == null){
	success = "true";
}else{
	%>
	 <script>
	  alert("비밀번호를 성공적으로 변경하였습니다.다시 로그인 해주세요");
 	 </script>
	<% 
}
%>
<%
 String msg = (String)request.getAttribute("msg");
if(msg == null){
	msg = "true";
}else{
	%>
	 <script>
	  alert("그동안 이용해 주셔서 감사합니다.");
 	 </script>
	<% 
}
%>
<div class="backimg">
	<form action="search" method="post" role="form">
		<div class="datacover">
			<div class="covereddata">
				<div class="coverdata" style="background-color:transparant">
					<div class="datainput">
						<div>
							<h1>편안하고 아늑한</h1>
							<h1>숙소를 예약하세요.</h1>
						</div>
						<div class="form-group">
					    	<label for="inputregion">지역</label>
					   		<input type="text" name="region2" class="form-control" id="inputregion" placeholder="모든 위치">
					  	</div>
					  <div class="form-row">
					    <div class="form-group col-md-6">
					      <label for="inputcheckin">체크인</label>
					      <input type="date" name="checkin" class="form-control" id="inputcheckin" placeholder="년/월/일">
					    </div>
					    <div class="form-group col-md-6">
					      <label for="inputcheckout">체크아웃</label>
					      <input type="date" name="checkout" class="form-control" id="inputcheckout" placeholder="년/월/일">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputnumber">인원</label>
					    <input type="number" name="maxperson" class="form-control" id="inputnumber" placeholder="인원">
					  </div>
					<div class="range">
					  <button type="submit" class="btn btn-primary">검색</button>
					</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

