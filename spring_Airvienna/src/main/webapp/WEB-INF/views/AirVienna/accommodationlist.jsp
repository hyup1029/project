<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/accommodationlist.css"/>
<main role="main">

  <section class="jumbotron text-center" style="padding-bottom: 100px;">
    <div class="container"style="padding-top: 30px;">
      <h1 class="jumbotron-heading">모두가 호스트</h1>
      <p class="lead text-muted" style="margin-top: 20px;">자신의 집을 공유해 보세요!! 안쓰는 방 활용 하여 돈도 벌고 국내 여행객 뿐 아니라 여려나라 사람들을 만나며 경험과 견문을 확장 시킬수 있는 기회입니다.</p>
      <p style="padding-top: 20px;margin-bottom: 0px;">
        <a href="#" class="btn btn-primary my-2">자신의 home share</a>
      </p>
    </div>
  </section>
<input type="hidden" name="bno" value="${info.bno}"/>
<c:forEach var="jjim" items="${jjimlist}">
	<input type="hidden" id="jjimano" value="${jjim.ano}"/>
	<input type="hidden" id="jjimbno" value="${jjim.bno}"/>
	<input type="hidden" id="jjimhomename" value="${jjim.homename}"/>
	<input type="hidden" id="jjimselect" value="${jjim.jjimselect}"/>
	</c:forEach>
  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row">
      <c:forEach var="vo" items="${list}">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
          <form class="jjimlist" action="jjimregist" method="post">
            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            <div class="card-body">
              <p class="card-text">${vo.homename}</p>
              <%-- <input type="hidden" name="home" value="${vo.ano}" />	 --%>
              <h4 class="card-text">${vo.birfcontent}</h4>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <small class="card-tmuted">평점 : ${vo.ano} </small>
                </div>
                <small class="text-muted">등록 시간 : <fmt:formatDate pattern="yyyy-MM-dd" value="${vo.registDate}"></fmt:formatDate></small>
                <div class="jjim">
               <c:if test="${!empty jjimlist}">
               <%  boolean flag=false; %>
               	<c:forEach var="jjim" items="${jjimlist}">  
               	    <c:set value="${vo.ano}" var="v_ano"/>
               	    <c:set value="${jjim.ano}" var="j_ano"/>
               	    <%
               	    	Integer v_ano=(Integer)pageContext.getAttribute("v_ano");
               	 		Integer j_ano=(Integer)pageContext.getAttribute("j_ano");               	 	
               	 	
               	 		
               	 		if(v_ano.intValue()==j_ano.intValue()){
               	 			flag=true;               	  
               	 			break;
               		  }/* else{
               			if(flag){	 */
               	%> 
               	 </c:forEach>
               	
               	 <% if(flag){ %>
               	 <button type="button" id="_jjimremove" onclick="test(this.form)" class="_jjimremove" name="select" role="${vo.ano}" style="background-color:white; border:solid 0px;padding: 0px; margin: 0px;">
               		<svg class="sv" viewBox="0 0 32 32" fill="#FF5A5F" fill-opacity="1" stroke="#FF5A5F" stroke-width="2.5" focusable="false" aria-label="트립 저장하기" role="img" stroke-linecap="round" stroke-linejoin="round" style="height: 24px; width: 24px; display: block; overflow: visible;"><path d="m23.99 2.75c-.3 0-.6.02-.9.05-1.14.13-2.29.51-3.41 1.14-1.23.68-2.41 1.62-3.69 2.94-1.28-1.32-2.46-2.25-3.69-2.94-1.12-.62-2.27-1-3.41-1.14a7.96 7.96 0 0 0 -.9-.05c-1.88 0-7.26 1.54-7.26 8.38 0 7.86 12.24 16.33 14.69 17.95a1 1 0 0 0 1.11 0c2.45-1.62 14.69-10.09 14.69-17.95 0-6.84-5.37-8.38-7.26-8.38"></path></svg>
              	 <input type="hidden" name="homename1" value="${vo.homename}"/><input type="hidden" name="ano1" value="${vo.ano}"/>
              	 <input type="hidden" name="price1" value="${vo.price}"/>
                		<%	}if(!flag){%>
               		 <button type="button" id="_jjim" onclick="test(this.form)" class="_jjim" name="select" role="${vo.ano}" style="background-color:white; border:solid 0px;padding: 0px; margin: 0px;">
               		<svg class="sv" viewBox="0 0 32 32" fill="#ffffff" fill-opacity="0.5" stroke="#484848" stroke-width="2.5" focusable="false" aria-label="트립 저장하기" role="img" stroke-linecap="round" stroke-linejoin="round" style="height: 24px; width: 24px; display: block; overflow: visible;"><path d="m23.99 2.75c-.3 0-.6.02-.9.05-1.14.13-2.29.51-3.41 1.14-1.23.68-2.41 1.62-3.69 2.94-1.28-1.32-2.46-2.25-3.69-2.94-1.12-.62-2.27-1-3.41-1.14a7.96 7.96 0 0 0 -.9-.05c-1.88 0-7.26 1.54-7.26 8.38 0 7.86 12.24 16.33 14.69 17.95a1 1 0 0 0 1.11 0c2.45-1.62 14.69-10.09 14.69-17.95 0-6.84-5.37-8.38-7.26-8.38"></path></svg>
              	 <input type="hidden" name="homename1" value="${vo.homename}"/><input type="hidden" name="ano1" value="${vo.ano}"/>
              	 <input type="hidden" name="price1" value="${vo.price}"/>
               		<%} %>
               	 </c:if>
               	 <c:if test="${empty jjimlist}">
               	  <button type="button" id="_jjim" onclick="test(this.form)" class="_jjim" name="select" role="${vo.ano}" style="background-color:white; border:solid 0px;padding: 0px; margin: 0px;">
               		<svg class="sv" viewBox="0 0 32 32" fill="#ffffff" fill-opacity="0.5" stroke="#484848" stroke-width="2.5" focusable="false" aria-label="트립 저장하기" role="img" stroke-linecap="round" stroke-linejoin="round" style="height: 24px; width: 24px; display: block; overflow: visible;"><path d="m23.99 2.75c-.3 0-.6.02-.9.05-1.14.13-2.29.51-3.41 1.14-1.23.68-2.41 1.62-3.69 2.94-1.28-1.32-2.46-2.25-3.69-2.94-1.12-.62-2.27-1-3.41-1.14a7.96 7.96 0 0 0 -.9-.05c-1.88 0-7.26 1.54-7.26 8.38 0 7.86 12.24 16.33 14.69 17.95a1 1 0 0 0 1.11 0c2.45-1.62 14.69-10.09 14.69-17.95 0-6.84-5.37-8.38-7.26-8.38"></path></svg>
              	 <input type="hidden" name="homename1" value="${vo.homename}"/><input type="hidden" name="ano1" value="${vo.ano}"/>
              	 <input type="hidden" name="price1" value="${vo.price}"/>
               	 </c:if>
                </div>
              </div>
            </div>
            </form>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>
</main>
<script>
	/* function test(form){
		console.log(form.home.value);
		var homename=form.homename.value;
		var ano=form.ano.value;
		var bno=form.bno.value;
		console.log()
	} */

	$(function(){
		var formObj=$('.jjimlist');
		/* var length=${fn:length(jjimlist)};
		for(var i=0;i<length;i++){
			${jjimlist}.get(i).toString();
		} */
		/* var length = ${fn:length(list)}; */
		/* for(var i=1;i<=length;i++){
			var test=$("#jjimano"+i+"").val();
		} */
		$('._jjim').click(function(){
			//var homename=$("#data").data('homename');
			//var ano=$("#data").data('ano');
			/* var res = $('._jjim').val();	
			alert(res); */
			var str="";
			if(${!empty info}){
				
					//$(this).find('.sv').attr("fill", "#FF5A5F");
					//$(this).find('.sv').attr("fill-opacity", "1");
					//$(this).find('.sv').attr("stroke", "#FF5A5F");
				var homename = $(this).find("input[name='homename1']").val();
				var ano = $(this).find("input[name='ano1']").val();
				var price = $(this).find("input[name='price1']").val();
				res=true;
				str+="<input type='hidden' name='jjimselect' value='"+res+"'/>"
				str+="<input type='hidden' name='bno' value='${info.bno}'/>"
				str+="<input type='hidden' name='ano' value='"+ano+"'/>"
				str+="<input type='hidden' name='homename' value='"+homename+"'/>"
				str+="<input type='hidden' name='price' value='"+price+"'/>"
				formObj.append(str);
				formObj.submit();
				
			}else{
				alert("로그인을 하고 찜 기능을 이용하십시오!!");
				location.href="login";
			}
			
			});
		$('._jjimremove').click(function(){
			var str="";
			formObj.attr("action","jjimremovelist")
			var ano = $(this).find("input[name='ano1']").val();
			str+="<input type='hidden' name='ano' value='"+ano+"'/>"
			formObj.append(str);
			formObj.submit();
		})
			
	});
</script>
<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">Back to top</a>
    </p>
    <p>Album example is © Bootstrap, but please download and customize it for yourself!</p>
    <p>New to Bootstrap? <a href="https://getbootstrap.com/">Visit the homepage</a> or read our <a href="/docs/4.3/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
