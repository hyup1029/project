<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.domain.AirUserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Bootstrap core CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<style>
.navbar-form {
    border-color: #101010;
}
._cfvh61 {
    display: inherit !important;
}
@media (min-width: 985px){
._1wsro53 {
    left: 80px !important;
    
}
}
@media (min-width: 744px){
._1wsro53 {
    top: 16px !important;
    transition: width 200ms ease-in !important;
    width: 460px !important;
}
}
@media (min-width: 744px){
._shzwii {
    width: 100% !important;
    display: table !important;
}
}
@media (min-width: 744px){
._1fkg0r2 {
    display: table-cell !important;
    width: 100% !important;
    vertical-align: middle !important;
}
}
._1fkg0r2 {
    background-color: #ffffff !important;
    transition: box-shadow 200ms ease-in !important;
    border: 1px solid #EBEBEB !important;
    border-radius: 4px !important;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1) !important;
    height: 48px !important;
}
._1wsro53 {
    display: block !important;
    position: absolute !important;
    z-index: 21 !important;
}
form {
    display: block;
    margin-top: 0em;
}
._1blc3lt {
    width: 100% !important;
    height: 100% !important;
    padding-left: 12px !important;
    padding-right: 4px !important;
    position: relative !important;
}
._1os10fm {
    display: table !important;
    margin: 0px !important;
    padding: 0px !important;
    table-layout: fixed !important;
    white-space: nowrap !important;
    width: 100% !important;
}
._1cxn5bx2 {
    background-color: transparent !important;
    border: 0px !important;
    margin: 0px !important;
    padding: 0px !important;
    width: 100% !important;
    text-overflow: ellipsis !important;
    font-weight: 800 !important;
    font-size: 17px !important;
}
._1m8bb6v {
    position: absolute !important;
    display: block !important;
    border: 0px !important;
    margin: -1px !important;
    padding: 0px !important;
    height: 1px !important;
    width: 1px !important;
    clip: rect(0, 0, 0, 0) !important;
    overflow: hidden !important;
}
._1hwe6usi {
    padding-top: 3px !important;
    padding-left: 5px !important;
    padding-right: 10px !important;
    width: 39px !important;
    display: table-cell !important;
    height: 100% !important;
    vertical-align: middle !important;
}
svg:not(:root){
    overflow: hidden;
}
._1u1cgx19 {
    display: table-cell !important;
    height: 100% !important;
    vertical-align: middle !important;
    width: 100% !important;
}
._1w14zmh {
    overflow: hidden !important;
    position: relative !important;
}
.arrangeheader{
	display: table !important;
    height: 64px !important;
    list-style: none !important;
    padding: 0px !important;
    margin: 0px !important;
}
._li1{
	display: table-cell !important;
}
div{
	display: block;
}
._div1{
	display: table-cell !important;
}
@media (min-width: 744px){
	.buttonstyle{
	    height: 80px !important;
    	line-height: 80px !important;
	}
}
.buttonstyle{
    -webkit-appearance: none !important;
    color: inherit !important;
    display: inline-block !important;
    position: relative !important;
    white-space: nowrap !important;
    background: transparent !important;
    border-width: initial !important;
    border-style: none !important;
    border-color: initial !important;
    border-image: initial !important;
    text-decoration: none !important;
    margin: 0px !important;
    padding: 0px 8px !important;
}
.buttonline{
	height: 100% !important;
    vertical-align: middle !important;
    box-sizing: border-box !important;
    border-bottom: 2px solid transparent !important;
}
.buttonfont{
	display: inline-block !important;
    vertical-align: middle !important;
    line-height: 1 !important;
    padding: 8px !important;
    border-bottom: 2px solid transparent !important;
    font-size: 18px;
    letter-spacing: -1px;
    font-weight: bold;
}
._lvb55za {
    display: inline-block !important;
    vertical-align: middle !important;
    line-height: 1 !important;
    padding: 8px !important;
    border-bottom: 2px solid transparent !important;
}
._sftyq0 {
    background-color: rgb(242, 242, 242) !important;
    box-shadow: rgb(235, 235, 235) 0px 0px 0px 2px !important;
    display: inline-block !important;
    vertical-align: middle !important;
    width: 28px !important;
    height: 28px !important;
    border-radius: 50% !important;
    overflow: hidden !important;
}
._1pa4v1p {
    vertical-align: top !important;
}
</style>
<title>에어비엔나</title>

</head>
<body>
<!-- 헤더부분,검색창,로고이미지 -->
	<nav class="navbar navbar-light bg-white">
		<a class="navbar-brand" style="font-size:2em; color:purple" onclick="location.href='/AirVienna/mainpage'">
		<img src='/resources/img/octopus.png' width="75" height="50">Airvienna</a>
		<c:if test="${empty info && empty sns}">
		<%-- <c:if test="${empty sns}"> --%>
		<ul class="arrangeheader">
		<li class="_li1"></li>
		<li class="_li1">
			<div>
				<div class="_div1">
					<button type="button" class="buttonstyle"  onclick="location.href='costomercenter'">
						<div class="buttonline">
							<div class="buttonfont">고객센터
							</div>
						</div>
					</button>
				</div>
			</div>
		</li>
		<li class="_li1">
			<div>
				<div class="_div1">
					<button type="button" class="buttonstyle" onclick="location.href='step1'">
						<div class="buttonline">
							<div class="buttonfont">회원가입
							</div>
						</div>
					</button>
				</div>
			</div>
		</li>
		<li class="_li1">
			<div>
				<div class="_cfvh61">
					<div>
						<div class="_1wsro53" style="margin-left: 170px; margin-top:4px">
							<div class="_1xb0vsy"><div class="_shzwii">
								<div class="_1fkg0r2">
									<form action="headsearch" method="post">
										<div dir="ltr">
											<div class="_1blc3lt">
												<label for="Koan-via-HeaderController__input" class="_1os10fm">
													<span class="_1m8bb6v">검색</span>
												<div class="_1hwe6usi">
													<svg viewBox="0 0 16 16" role="presentation" aria-hidden="true" focusable="false" style="height:18px;width:18px;display:block;fill:currentColor">
														<path d="m2.5 7c0-2.5 2-4.5 4.5-4.5s4.5 2 4.5 4.5-2 4.5-4.5 4.5-4.5-2-4.5-4.5m13.1 6.9-2.8-2.9c.7-1.1 1.2-2.5 1.2-4 0-3.9-3.1-7-7-7s-7 3.1-7 7 3.1 7 7 7c1.5 0 2.9-.5 4-1.2l2.9 2.8c.2.3.5.4.9.4.3 0 .6-.1.8-.4.5-.5.5-1.2 0-1.7">
														</path>
													</svg>
												</div>
												<div class="_1u1cgx19">
													<div class="_1w14zmh">
														<input type="text" name="region" class="_1cxn5bx2" aria-autocomplete="list" aria-describedby="Koan-via-HeaderController__description" aria-expanded="false" autocomplete="off" autocorrect="off" spellcheck="false" id="Koan-via-HeaderController__input" name="query" placeholder="어디로 가시나요?" role="combobox" value="">
													</div>
												</div>
												</label>
											</div>
										</div>
									</form>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
		<li class="_li1">
			<div>
				<div class="_div1">
					<%@include file="../AirVienna/login.jsp" %>
					<button type="button" class="buttonstyle" id="login"  data-toggle="modal" data-target="#myModal" >
						<div class="buttonline">
							<div class="buttonfont">로그인 </div>
						</div>
					</button>
				</div>
			</div>
		</li>
		</ul>
		</c:if>
		<%-- </c:if> --%>
		<c:if test="${!empty info || !empty sns }">
		<%-- <c:if test="${!empty sns}"> --%>
		<ul class="arrangeheader">
		<li class="_li1"></li>
		<li class="_li1">
			<div>
				<div class="_div1">
					<button type="button" class="buttonstyle"  onclick="location.href='costomercenter'">
						<div class="buttonline">
							<div class="buttonfont">고객센터
							</div>
						</div>
					</button>
				</div>
			</div>
		</li>
		<li class="_li1">
			<div>
				<div class="_div1">
					<button type="button" class="buttonstyle" onclick="location.href='jjimlist'">
						<div class="buttonline">
							<div class="buttonfont">찜목록
							</div>
						</div>
					</button>
				</div>
			</div>
		</li>
		<li class="_li1">
			<div>
				<div class="_cfvh61">
					<div>
						<div class="_1wsro53" style="margin-left: 170px; margin-top:4px">
							<div class="_1xb0vsy"><div class="_shzwii">
								<div class="_1fkg0r2">
									<form action="headsearch" method="post">
										<div dir="ltr">
											<div class="_1blc3lt">
												<label for="Koan-via-HeaderController__input" class="_1os10fm">
													<span class="_1m8bb6v">검색</span>
												<div class="_1hwe6usi">
													<svg viewBox="0 0 16 16" role="presentation" aria-hidden="true" focusable="false" style="height:18px;width:18px;display:block;fill:currentColor">
														<path d="m2.5 7c0-2.5 2-4.5 4.5-4.5s4.5 2 4.5 4.5-2 4.5-4.5 4.5-4.5-2-4.5-4.5m13.1 6.9-2.8-2.9c.7-1.1 1.2-2.5 1.2-4 0-3.9-3.1-7-7-7s-7 3.1-7 7 3.1 7 7 7c1.5 0 2.9-.5 4-1.2l2.9 2.8c.2.3.5.4.9.4.3 0 .6-.1.8-.4.5-.5.5-1.2 0-1.7">
														</path>
													</svg>
												</div>
												<div class="_1u1cgx19">
													<div class="_1w14zmh">
														<input type="text" name="region" class="_1cxn5bx2" aria-autocomplete="list" aria-describedby="Koan-via-HeaderController__description" aria-expanded="false" autocomplete="off" autocorrect="off" spellcheck="false" id="Koan-via-HeaderController__input" name="query" placeholder="어디로 가시나요?" role="combobox" value="">
													</div>
												</div>
												</label>
											</div>
										</div>
									</form>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</li>
		<li class="_li1">
			<div>
				<div class="_div1">
					<button type="button" class="buttonstyle" onclick="location.href='/AirVienna/logout'">
						<div class="buttonline">
							<div class="buttonfont">로그아웃
							</div>
						</div>
					</button>
				</div>
			</div>
		</li>
		<li class="_li1">
		<div class="_lvb55za">
			<div class="_sftyq0">
				<c:if test="${!empty info}">
					<c:choose>
						<c:when test="${empty info.uploadPath}">
							<img alt=" " height="28" src="/resources/img/vienna.PNG" width="28" class="_1pa4v1p" onclick="location.href='/AirVienna/profile'">
						</c:when>
						<c:when test="${!empty info.uploadPath }">
							<%
								String filePath = null;
								AirUserVO vo = (AirUserVO)request.getAttribute("info");
								filePath= vo.getUploadPath()+"\\"+vo.getUuid()+"_"+vo.getFileName();
								filePath = filePath.replaceAll("\\\\", "/");
								System.out.print("filePath"+filePath);
							%>
							<img alt=" " height="28" src="/display?fileName=<%=filePath%>" width="28" class="_1pa4v1p" onclick="location.href='/AirVienna/profile'">
						</c:when>
					</c:choose>
				</c:if>
				<c:if test="${!empty sns}">
				<img alt=" " height="28" src="${sns.snsimage}" width="28" class="_1pa4v1p">
				</c:if>
			</div>
		</div>
		</li>
		</ul>
		</c:if>
		<%-- </c:if> --%>
	</nav>
<script>
$(function(){
	$(".login").click(function(){
		$(".modal").modal();
	})
})
</script>