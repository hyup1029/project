/**
 * joinForm.jsp의 validation
 */
$(function(){
	$("#password_change").validate({
		errorPlacement:function(error,element){
			$(element).closest("form").find("small[id='"+element.attr("id")+"']")
				.append(error);
	},

		rules:{
			password:{
				required: true,
				validPwd : true
			},
			curruent_password:{
				required: true,
				validPwd : true
			},
			check_password:{
				required: true,
				validPwd : true,
				equalTo : "#curruent_password"
			}
		},
		messages:{
			password:{
				required: "현재 비밀번호와 다릅니다.",
			},
			curruent_password:{
				required: "비밀번호를 확인해 주세요.",
				minlength: "최소 8글자는 입력 해야합니다.",
				maxlength: "최대 15자리 까지 입력 가능합니다."
			},
			check_password:{
				required: "비밀번호를 확인해 주세요.",
				minlength: "최소 8글자는 입력 해야합니다.",
				maxlength: "최대 15자리 까지 입력 가능합니다.",
				equalTo : "이전 비밀번호와 다릅니다."
			}
		}
	});
});


$.validator.addMethod("validPwd",function(value){
	var regPwd= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
	return regPwd.test(value);
},"패스워드는 숫자,영문자,특수문자의 조합으로 8~15자리까지만 입력 가능합니다.");

