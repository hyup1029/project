<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.0.min.js" type="application/javascript"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
BootPay.request({
   price: '${resev.result}', //실제 결제되는 가격
   application_id: "5cbecf7a396fa65278e54256",
   name: '${vo.homename}', //결제창에서 보여질 이름
   show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
   items: [
      {
         item_name: 'gggg', //상품명
         qty: 1, //수량
         unique: '123', //해당 상품을 구분짓는 primary key
         price: 1000, //상품 단가
         cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
         cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
         cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
      }
   ],
   user_info: {
      username: '사용자 이름',
      email: 'yhm0411@naver.com',
      addr: '사용자 주소',
      phone: '010-1234-4567'
   },
   order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
   params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
   account_expire_at: '2019-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
   extra: {
      start_at: '2019-04-24', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
      end_at: '2019-10-10' // 정기결제 만료일 -  기간 없음 - 무제한
   }
}).error(function (data) {
   //결제 진행시 에러가 발생하면 수행됩니다.
   console.log(data);
}).cancel(function (data) {
   //결제가 취소되면 수행됩니다.
   location.href='paymentfail'
   console.log(data);
}).ready(function (data) {
   // 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
   console.log(data);
}).confirm(function (data) {
   //결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
   //주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
   console.log(data);
   var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
   if (enable) {
      this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
   } else {
      this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
   }
}).close(function (data) {
    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
    console.log(data);
}).done(function (data) {
   //결제가 정상적으로 완료되면 수행됩니다
   //비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
   location.href='completePay';
   console.log(data);
});


</script>
</body>
</html>