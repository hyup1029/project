<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/jjimpage.css"/>
<section id="contents-cart" class="contents-cart async-content" style="visibility: visible;">
      <div class="mp_title">
                        <h2>${info.username}님의 찜 목록</h2>
      </div>
      
    <div id="cartContent" data-faraway="" data-rocket-freemessage="{&quot;rocketFreshFreeShippingRemaingAmount&quot;:&quot;0&quot;,&quot;rocketFreshShippingOverAmount&quot;:&quot;0&quot;,&quot;skuFreeShippingOverAmount&quot;:&quot;0&quot;, &quot;skuFreeShippingRemaingAmount&quot;:&quot;0&quot;, &quot;freshLack&quot;:false, &quot;rocketLack&quot;:false }">

    <div class="tabs-wrap">

</div>
    
        <table class="cartTable" summary="장바구니 상품명, 제품가격, 선택한수량, 총결제비용 정보 및 결제 상품으로 선택,해제 및 수량변경, 삭제 기능 제공표">
            <caption class="none">찜록록</caption>
            <colgroup><col width="50"><col width="80"><col width="*"><col width="90"><col width="90"></colgroup>
            <thead>
            <tr class="head">
                <th scope="col" class="all-select-event"></th>
                <th scope="colgroup" id="th-product-box" colspan="3">방 이름</th>
                <th scope="col" id="th-unit-total-price">1인당 가격</th>
                <th scope="col" id="th-delivery-fee">찜</th>
            </tr>
            </thead>
            
        </table>
        
        <c:if test="${empty jjimlist}">
            <div class="cart-no-item">
                <h2 class="sr-only"></h2>
                <p class="txt">찜 목록이 비었습니다.</p>
                
            </div>
        </c:if>
        <c:if test="${!empty jjimlist}">
        <c:forEach var="jjim" items="${jjimlist}">
        	<form class="jjimform" action="jjimremove" method="post">
        	<div class="row" style="margin-left: 0px; margin-right: 0px;margin-top: 15px; margin-bottom: 15px;">
        	<div class="col-md-8">
        ${jjim.homename} 
      	</div>
      	<div class="col-md-2" style="margin-left: 25px;">
      		${jjim.price}
      	</div>
      	 <div class="col-md-1" style="margin-left: 2px;">
        <button type="button" id="_jjim" class="_jjim" value="false" style="background-color:white; border:solid 0px;padding: 0px; margin: 0px;"><svg id="svgjjim" viewBox="0 0 32 32" fill="#FF5A5F" fill-opacity="1" stroke="#FF5A5F" stroke-width="2.5" focusable="false" aria-label="트립 저장하기" role="img" stroke-linecap="round" stroke-linejoin="round" style="height: 24px; width: 24px; display: block; overflow: visible;"><path d="m23.99 2.75c-.3 0-.6.02-.9.05-1.14.13-2.29.51-3.41 1.14-1.23.68-2.41 1.62-3.69 2.94-1.28-1.32-2.46-2.25-3.69-2.94-1.12-.62-2.27-1-3.41-1.14a7.96 7.96 0 0 0 -.9-.05c-1.88 0-7.26 1.54-7.26 8.38 0 7.86 12.24 16.33 14.69 17.95a1 1 0 0 0 1.11 0c2.45-1.62 14.69-10.09 14.69-17.95 0-6.84-5.37-8.38-7.26-8.38"></path></svg>
        <input type="hidden" name="ano1" value="${jjim.ano}"/>
        </button>
	   </div>
	   </div>
	   </form>
	   </c:forEach>
        </c:if>
    
    <iframe id="ab_iframe" class="ab_test" src="" width="0" height="0" frameborder="0" vspace="0"></iframe>
      
</div>
    </section>
<script>
$(function(){
	var formObj=$('.jjimform');
	$('._jjim').click(function(){
		var str="";
		var ano = $(this).find("input[name='ano1']").val();
		str+="<input type='hidden' name='ano' value='"+ano+"'/>"
		formObj.append(str);
		formObj.submit();
	})
})
</script>
</body>
</html>
