<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<link rel="stylesheet" href="/resources/css/costomercenter.css"/>
<section id="contents" class="contents " data-reference="" data-product-id="" data-vendor-item-id="" data-item-id="" data-category-id="" data-is-subscribable="" data-vendor-item-package-id="">
            	
  <div class="cs-search">
    <h1 class="cs-search__title">고객센터</h1>
    <div class="cs-search__input-area">
        <input class="cs-search__input" id="cs-search-input" name="cs-search-input" type="text" placeholder="자주묻는 질문 검색">
        <span class="cs-search__icon">
            <div class="cs-sprite-icon-search">
                <button type="button" class="btn btn-outline-info"style="margin-top: 5px;padding-left: 5px;padding-right: 5px;">검색</button>
            </div>
        </span>
    </div>
</div>
  <div class="cs-nav" id="tabs">
    <ul class="cs-nav__menu-lists" id=>
        <li class="cs-nav__menu" ><a class="cs-nav__menu-link"   href="question">자주묻는 질문</a></li>
        <li class="cs-nav__menu"><a class="cs-nav__menu-link"  href="costomersound">고객의 소리</a></li>
        <li class="cs-nav__menu"><a class="cs-nav__menu-link"   href="inform">AirVienna소식</a></li>
    </ul>
 
    <div class="cs-nav__phone-section" id="myList" role="tablist">
        <div class="cs-nav__phone-line"></div>
        <div class="cs-nav__phone-label">AirVienna고객센터</div>
        <div class="cs-nav__phone-number">1577-8282</div>
    </div>
</div>
			<c:if test="${question}">
				<jsp:include page="question.jsp"/>
			</c:if>
			<c:if test="${costomersound}">
				<jsp:include page="costomersound.jsp"/>
			</c:if>
			<c:if test="${inform}">
				<jsp:include page="inform.jsp"/>
			</c:if>
</section>

</body>
</html>