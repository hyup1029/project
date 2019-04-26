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
</style>
</head>


<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<h1>당신의 집을 등록하세요!</h1>
			<p class="lead">
				<b>많은 여행객들이 이용할 수 있도록 자신의 집을 소개하세요!!</b>
			</p>
		</div>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted"> 정보</span> <span
						class="badge badge-secondary badge-pill">3</span>
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
								<input id="offer" name="breakfast" type="radio"
								class="custom-control-input" checked="" required="">
								 <label class="custom-control-label" for="offer">제공</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="offer_not" name="breakfast" type="radio"
								class="custom-control-input" required="">
								 <label class="custom-control-label" for="offer_not">제공 안함</label>
						</div>
						</div>
					</li>
					
					<li class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0">주차장</h6>
							<small class="text-muted">건물에 주차장이 있나요?</small>
							<div class="custom-control custom-radio" style ="margin-top : 5px;">
								<input id="parking_ok" name="parking" type="radio"
								class="custom-control-input" checked="" required="">
								 <label class="custom-control-label" for="parking_ok">주차장 있음</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="parking_not" name="parking" type="radio"
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
								<input id="wifi_ok" name="wifi" type="radio"
								class="custom-control-input" checked="" required="">
								 <label class="custom-control-label" for="wifi_ok">와이파이 있음</label>
						</div>
						<div class="custom-control custom-radio">
							<input id="wifi_not" name="wifi" type="radio"
								class="custom-control-input" required="">
								 <label class="custom-control-label" for="wifi_not">와이파이 없음</label>
						</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">집 주소</h4>
				<form class="needs-validation" novalidate="">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">숙소 이름</label> <input type="text"
								class="form-control" id="firstName" placeholder="" value=""
								required="">
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">등록자 성명</label> <input type="text"
								class="form-control" id="lastName" placeholder="" value=""
								required="">
							<div class="invalid-feedback">Valid last name is required.
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="sample4_postcode">집 주소</label> 
							<input type="text" id="sample4_postcode" class="form-control" placeholder="우편번호" style ="width: 100px;" />
						<div style ="margin-top: 10px;">
							<input type="text" id="sample4_roadAddress" class="form-control" style ="width: 250px; float:left; margin-right:5px;" placeholder="도로명주소">
							<input type="text" id="sample4_jibunAddress" class="form-control" style ="width: 300px;" placeholder="지번주소">
							<span id="guide" style="color:#999;display:none"></span>
						</div>
						<div style ="margin-top: 5px;">
							<input type="text" id="sample4_detailAddress" class="form-control" style ="width: 400px; float:left; margin-right:5px;" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" class="form-control" style ="width: 150px;" placeholder="참고항목">
						</div>
						
						<div class="invalid-feedback">Please enter your shipping address.</div>
					</div>
					
					<div class="row">
						<div class="col-md-5 mb-3">
							<label for="price">가격</label> 
							<input type="text" id="price" class="form-control" style ="width: 150px;" placeholder="">
							<div class="invalid-feedback">Please select a validcountry.</div>
						</div>
					</div>
					<hr class="mb-4">
					
					<div class="mb-3">
						<label for="simple_intro"> 간단한 소개 </label>
						 <input type="text" class="form-control" id="simple_intro" placeholder="자신의 집을 간단하게 소개해보세요!">
					</div>
					
					<label for="home_intro">상세 설명 </label>
				 <textarea class="form-control" id="home_intro" rows="7" style = "margin-bottom: 5%" placeholder ="(편의시설,방 갯수,구조,집의 상태 등등)"></textarea>
					<hr class="mb-4">
					
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="same-address"> <label class="custom-control-label"
							for="same-address">숙소의 상세내용과 개인정보를 공개하는데 동의하시겠습니까?</label>
					</div>
					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">등록하기</button>
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
<%@include file="../includes/footer.jsp"%>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>


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
		});
		$('#increaseQuantity').click(function(e) {
			e.preventDefault();
			var stat = $('#numberUpDown').text();
			var num = parseInt(stat, 10);
			num++;

			if (num > 20) {
				alert('설마 20명이상이 오겠어?');
				num = 5;
			}
			$('#numberUpDown').text(num);
		});
	});
</script>



<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
$(function(){
	$("#sample4_postcode").focus(function(){
		sample4_execDaumPostcode();
		 $('#sample4_postcode').blur();
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
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
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