<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/login.css" />
<!DOCTYPE html>
<head>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="818462422761-r4scl8o5ncm7upoh5vh6o9nvh0fpcp9k.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta charset="UTF-8">
<script>
function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail()); 
 // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
    $.ajax({
    	type:"post",
    	url:"/AirVienna/googleLogin",
    	headers:{
    		"Accept":"application/json",
    		"Content-Type":"application/json"
    	},
    	data:JSON.stringify({
    		snsid : profile.getId(),
    		snsemail : profile.getEmail(),
    		snsnickname : profile.getName(),
    		snsimage : profile.getImageUrl()
    	}),
    	dataType:"text",
    	success:function(result){
    		$(".modal").modal("hide");
    		if(result==='success'){
    			location.href='mainpage';
    		}
    	}
    })
}
</script>
<%
 String fa = (String)request.getAttribute("fa");
if(fa == null){
	fa = "true";
}else{
	%>
	 <script>
	  alert("아이디와 비밀번호를 잘못 입력하셨습니다.");
 	 </script>
	<% 
}
%>
</head>
<style>
#kakao-login-btn {
 width:434px;
 height:50px;
}

</style> 
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style = "padding:0px;">
				<div>
					<div>
						<div dir="ltr" style="direction: ltr; unicode-bidi: isolate;">
							<div class="_n0520t">
								<div class="_1sjmvoc">
									<div class="_13nnc13">
										<div role="dialog" aria-label="로그인" class="_1tnlies"> 
											<section>
												<div class="_wpwi48" style = "width : 499px; padding-left : 0px;">
													<div class="_152qbzi">
														<button type="button" class="_1rp5252" aria-busy="false" data-dismiss="modal" style="padding:0px; margin:0px;">
															<svg viewBox="0 0 24 24" role="img" aria-label="닫기" focusable="false" style="height: 16px; width: 16px; display: block; fill: rgb(118, 118, 118);">
															<path d="m23.25 24c-.19 0-.38-.07-.53-.22l-10.72-10.72-10.72 10.72c-.29.29-.77.29-1.06 0s-.29-.77 0-1.06l10.72-10.72-10.72-10.72c-.29-.29-.29-.77 0-1.06s.77-.29 1.06 0l10.72 10.72 10.72-10.72c.29-.29.77-.29 1.06 0s .29.77 0 1.06l-10.72 10.72 10.72 10.72c.29.29.29.77 0 1.06-.15.15-.34.22-.53.22" fill-rule="evenodd"></path>
															</svg>
														</button>
													</div>
													<section>
														<section>
															<div>
																<div style="margin-bottom: 8px;">
																	<div class="g-signin2" data-onsuccess="onSignIn" data-width="434" data-height="50" data-longtitle="true" ></div>
																</div>
																<div style="margin-bottom: 8px;" >
																	<a id="kakao-login-btn"></a>
																	<a href="http://developers.kakao.com/logout"></a>
																
																	<script>
																	$(document).ready(function(){
																		//<![CDATA[
																		// 사용할 앱의 JavaScript 키를 설정해 주세요.
																		Kakao.init('40b247566ba3a9ad80eb5d6ab5c35e74');
																		//여기서 아까 발급받은 키 중 javascript키를 사용해준다.
																		// 카카오 로그인 버튼을 생성합니다.
																		Kakao.Auth.createLoginButton({
																			container: '#kakao-login-btn',
																			success: function(authObj) {
																				//alert(JSON.stringify(authObj));
																				Kakao.API.request({
																		          url: '/v2/user/me',
																		          success: function(res) {
														           			 		 $(".modal").modal("hide");
																		        	
																		            //alert(JSON.stringify(res));
																			            alert(res.properties.nickname+'님 환영합니다.');
																		           		login(res);
																				  },
																				  fail: function(error) {
																				            alert(JSON.stringify(error));
																				   }
																		        }); //Kakao.API.request 종료
																		      },
																			 fail: function(err) {
																				alert(JSON.stringify(err));
																			}
																		});
																	});
																	//]]>
																	function login(res){
																		$.ajax({
														           			type:"post",
														           			url:"/AirVienna/kakaoLogin",
														           			headers : {
														           				"Accept" : "application/json",
														           				"Content-Type" : "application/json"
														           			}, 
														           			//dataType: "json",
														           			data:JSON.stringify({
														           				snsid : res.id,
														           				snsemail : res.kaccount_email,
														           				snsnickname : res.properties.nickname,
														           				snsimage : res.properties.thumbnail_image
														           			}),
														           			dataType:"text",
														           			success: function(result){
														           				console.log(result);
														           				if(result==='success'){
														           					location.href='mainpage';
														           				}
														           			}
														           		})
																	}
																		
																		
																	</script>
																</div>	
															</div>
															<div>
																<div style="margin-top : 16px; margin-bottom: 16px;">
																	<div class="_12j61cy">
																		<span class="_1ish1khj">
																			<span class="_1rbmiub1">또는</span>
																		</span>							
																	</div>
																</div>	
																<form action="/AirVienna/login" method="post" id="input_login"novalidate>	<!-- action에 들어가있던거 /authenticate -->	
																	<input type="hidden" name="authenticity_token" value=
																	"V4$.airbnb.co.kr$oACVpmJE18E$A4EnTj0C_-nzS1fo3bfM3MTy7A2MLAP42_mZKZ1dh2M=">
																	<div>
																		<div style="margin-bottom: 16px;">
																			<input type="hidden" name="from" value="email_login">
																		</div>
																		<div style="margin-bottom: 16px;">
																			<input type="hidden" name="airlock_id" value>
																		</div>
																		<div style="margin-bottom: 16px;">
																			<div class="inspectletIgnore">
																				<div class="_9hxttoo">
																					<label class="_1m8bb6v" for="email-login-email">이메일 주소</label>
																					<div dir="ltr" style="direction: ltr; unicode-bidi: isolate;">
																						<div class="_1wcr140x">
																							<div class="_107ja4p">
																								<div class="_1lmb7hx" style="visibility: visible; height: 46px;">
																									<div class="_nncr1bm">
																										<div class="_ni9axhe">
																											<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" 
																											focusable="false" style="height: 1em; width: 1em; display: block; fill: currentcolor;">
																											<path d="m22.5 4h-21c-.83 0-1.5.67-1.5 1.51v12.99c0 .83.67 1.5 1.5 1.5h20.99a1.5 1.5 0 0 0 1.51-1.51v-12.98c0-.84-.67-1.51-1.5-1.51zm.5 14.2-6.14-7.91 6.14-4.66v12.58zm-.83-13.2-9.69
																											 7.36c-.26.2-.72.2-.98 0l-9.67-7.36h20.35zm-21.17.63 6.14 4.67-6.14 7.88zm.63 13.37 6.3-8.1 2.97 2.26c.62.47 1.57.47 2.19 0l2.97-2.26 6.29 8.1z" fill-rule="evenodd"></path>
																											 </svg>
																										</div>
																									</div>
																								</div>
																							</div>
																							<div class="_178faes">
																								<input type="email" autocomplete="username" class="_14fdu48d" id="email-login-email" name="email" placeholder="이메일 주소" value="">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																			<div style="margin-bottom: 16px;">
																				<div>
																					<div class="_9hxttoo">
																						<label class="_1m8bb6v" for="email-login-password">비밀번호</label>
																					<div dir="ltr" style="direction: ltr; unicode-bidi: isolate;">
																						<div class="_1wcr140x">
																							<div class="_107ja4p">
																								<div class="_1lmb7hx" style="visibility: visible; height: 46px;">
																									<div class="_nncr1bm">
																										<div class="_ni9axhe">
																											<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 1em; width: 1em; display: block; fill: currentcolor;">
																												<path d="m19.5 9h-.5v-2a7 7 0 1 0 -14 0v2h-.5c-.78 0-1.5.72-1.5 1.5v12c0 .78.72 1.5 1.5 1.5h15c .78 0 1.5-.72 1.5-1.5v-12c0-.78-.72-1.5-1.5-1.5zm.5 13.5c0 .22-.28.5-.5.5h-15c-.22 0-.5-.28-.5-.5v-12c0-.22.28-.5.5-.5h1a
																												 .5.5 0 0 0 .5-.5v-2.5a6 6 0 1 1 12 0v2.5a.5.5 0 0 0 .5.5h1c .22 0 .5.28.5.5zm-8-10.5a3 3 0 0 0 -3 3c0 .83.36 1.59.94 2.15l-.9 2.16a.5.5 0 0 0 .46.69h5a .5.5 0 0 0 .46-.69l-.87-2.19c.56-.55.91-1.31.91-2.13a3 3 0 0 0 
																												 -3-3zm1.04 5.19.72 1.81h-3.51l.74-1.79a.5.5 0 0 0 -.17-.6 2 2 0 1 1 3.18-1.61c0 .64-.31 1.24-.8 1.6a.5.5 0 0 0 -.17.59zm-1.04-14.19a4 4 0 0 0 -4 4v2.5a.5.5 0 0 0 .5.5h7a .5.5 0 0 0 .5-.5v-2.5a4 4 0 0 0 -4-4zm3 6h-6v-2a3
																												  3 0 1 1 6 0z" fill-rule="evenodd"></path>
																											</svg>
																										</div>
																									</div>
																								</div>
																							</div>
																							<div class="_178faes">
																								<input type="password" autocomplete="off" class="_14fdu48d" id="email-login-password" name="password" placeholder="비밀번호" value="" autocapitalize="none" autocorrect="off" spellcheck="false">
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div style="margin-bottom: 16px;">
																			<div id="airlock-inline-container"></div>
																		</div>
																		<div style="margin-bottom: 16px;">
																			<button type="submit" class="_1d2e9r9a" id="login" aria-busy="false">
																				<span class="_ftj2sg4">로그인</span>
																			</button>
																		</div>
																	</div>
																</form>
															</div>
															<div style="margin-top: 16px; margin-bottom: 16px;">
																<div class="_7qp4lh"></div>
															</div>
															<div class="va-container va-container-h">
																<span class="va-middle text-center">
																	<span class="_czm8crp">에어비앤나 계정이 없으세요?</span>
																	<div class="_36rlri" style="margin-left: 8px; margin-right: 8px;">
																		<span class="_1p3joamp">
																			<a href="/AirVienna/joinpage" class="_15da8x1u" aria-busy="false">회원 가입</a>
																		</span>
																	</div>
																</span>
															</div>
														</section>
													</section>
												</div>
											</section>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


