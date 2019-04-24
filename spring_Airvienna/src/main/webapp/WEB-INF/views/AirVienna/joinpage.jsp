<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/upload.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="/resources/js/jquery-3.3.1.js"></script>
<script src="/resources/js/jquery.validate.js"></script>
<script src="/resources/js/joinform.js"></script><!--form validation script -->
	<div class="container" style="margin-top:40px">
	<form class="form-signin" action="" method="post" id="joinpage">
		<div class="wen" >				
			<div>
				<img src="/resources/img/vienna.PNG" id="photo"/>
			</div>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="email" class="form-control" name="email" id="email" placeholder="email을 입력하세요"/>	
			<small id="email" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" class="form-control" name="password" id="password" placeholder="password를 입력하세요"/>	
			<small id="password" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="password를 입력하세요"/>	
			<small id="confirm_password" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="name">이 름</label>
			<input type="text" class="form-control" name="username" id="username" />
			<small id="username" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="address">주소</label>
			<input type="text" class="form-control" name="address" id="address"/>	
			<small id="address" class="text-info"></small>
		</div>
		<div class="form-group">
			<label for="tel">전화번호</label>
			<input type="text" class="form-control" name="tel" id="tel" placeholder="ex)010-xxxx-xxxx"/> 
			<small id="tel" class="text-info"></small>
		</div>
		
		<div class="form-group">
			<label for="birth">생년월일</label> 
			<input type="text" class="form-control" name="birth" id="birth" placeholder="ex)yymmdd" />
			<small id="birth" class="text-info"></small>
		</div>
	
		<div class="form-group text-center">
			<button type="submit" class="btn btn-primary">가입신청</button>
			<button type="reset" class="btn btn-danger">취소</button>
		</div>
	</form>
	</div>
<script>

</script>



  



