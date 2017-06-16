// JavaScript Document
var flags = [false,false,false,false];
var RegEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
var RegPhone = /^(13[0-9]|14(5|7)|15(0|1|2|3|5|6|7|8|9)|18[0-9]|17[0-9])\d{8}$/;
var is_username = 0;
var is_password = 0;
var is_repassword = 0;
var is_vcode = 0;
function lineState(name,state,msg){
	if(state == 'error') {
		$("#notice_" + name).css('display', 'block').html(msg);
		return;
	}
	if(state == 'corect') {
		$("#notice_" + name).css('display', 'none').html(msg);
		return;
	}
}
//Email
function v_account(){
var account = $("#account").val();
if(!RegEmail.test(account)) {lineState("account","error","邮箱格式不正确"); flags[0]=false;enableSubmit(false);}
else{lineState("account","corect","");flags[0] = true;}
}
//user name
function v_name(){
	var name = $("#name").val();
	if(name.length==0) {
		lineState("userinfo","error","您输入的手机号码不正确！");
		is_username = 0;
	}else{
		if(!RegPhone.test(name)) {
			lineState("userinfo","error","您输入的手机号码不正确！");
			is_username = 0;
		}else{
			lineState("userinfo","corect","");
			is_username = 1;
		}
	}
}
//user password
function v_password(){
	var password = $("#password").val();
	if(password.length == 0) {
		is_password = 0;
		lineState("userinfo","error","请您输入密码");
	}else{
		if(password.length<6  || password.length>22 ){
			is_password = 0;
			lineState("userinfo","error","请您输入密码");
		}else{
			is_password = 1;
			lineState("userinfo","corect","");
		}
	}
}

//user login
function login(){
	$("#notice_userinfo").css('display','none');
	$("#notice_verifycode").css('display','none');
	var name = $("#login_name").val();
	if(!RegPhone.test(name)) {
		lineState("userinfo","error","您输入的手机号码不正确！");
		return false;
	}
	var password = $("#login_password").val();
	if(password.length<6  || password.length>22 ){
		lineState("userinfo","error","请您输入密码");
		return false;
	}
	var verifycode = $("#login_verifycode").val();
	if(verifycode.length != 4) {
		lineState("verifycode","error","请输入正确验证码");
		return false;
	}
	$("#login_submit").val('登录中，请稍候……');
	$.ajax({
		type: "POST",
		dataType: "json",
		url:$("#login_form").attr("action"),
		data:$('#login_form').serialize(),
		async: false,
		error: function(request) {
			alert("出错啦，请刷新重试！");
			$("#login_submit").val('登录');
		},
		success: function(data) {
			if(data.success){
				window.location = data.redirect;
			}else{
				$("#login_submit").val('登录');
				lineState("userinfo","error",data.error);
			}
		}
	});
}

//user reg
function rv_name(){
	var name = $("#name").val();
	if(name.length==0) {
		lineState("reginfo","error","请输入您的手机号码！");
		is_username = 0;
	}else{
		if(!RegPhone.test(name)) {
			lineState("reginfo","error","您输入的手机号码不正确！");
			is_username = 0;
		}else{
			$.ajax({
				cache: true,
				type: "POST",
				dataType: "json",
				url:linkreg,
				data:'pam_account[login_name]='+$("#name").val(),
				async: false,
				error: function(request) {
					alert("出错啦，请刷新重试！");
				},
				success: function(data) {
					if(data.needVerify){
						lineState("name","corect","");
						is_username = 1;
					}else{
						lineState("reginfo","error","该手机号已被注册！");
						is_username = 0;
					}
				}
			});
		}
	}
}
//user password
function rv_password(){
	var password = $("#password").val();
	if(password.length == 0) {
		is_password = 0;
		lineState("reginfo","error","请输入6位数字密码");
	}else{
		if(password.length<6  || password.length>22 ){
			is_password = 0;
			lineState("reginfo","error","请输入6位数字密码");
		}else{
			//if(password.match(/\d+/g) && password.match(/[a-zA-Z]/g)) {
			var reg =/^\d{6}$/;
			if(reg.test(password)){
				is_password = 1;
				lineState("reginfo","corect","");
			}else{
				is_password = 0;
				//lineState("password","error","请您输入6-25位字母和数字组合的密码");
				lineState("reginfo","error","请输入6位数字密码");
			}
		}
	}
}
//user password repeat
function rv_repeat(){
	if(!is_password) {
		//lineState("password","error","请您输入6-25位字母和数字组合的密码！");
		lineState("reginfo","error","请输入6位数字密码");
		is_repassword = 0;
		return;
	}
	if($("#repeat").val().length == 0) {
		lineState("reginfo","error","您没有输入确认密码");
		is_repassword = 0;
		return;
	}
	
	if($("#password").val()!=$("#repeat").val()) {
		lineState("reginfo","error","确认密码不一致");
		is_repassword = 0;
		return;
	}else{
		lineState("reginfo","corect","");
		is_repassword = 1;
	}

}

function adaptValue(){
	var name = $("#name").val();
	if(name.length==0) {
		lineState("reginfo","error","请输入您的手机号码！");
		return;
	}else{
	
		if(!is_username){
			lineState("reginfo","error","您输入的手机号码不正确！");
			return;
		}else{
			lineState("reginfo","corect","");
		}
	}
	
	if(!is_password){
		lineState("reginfo","error","请您输入6-25位的密码");
		return;
	}else{
		lineState("reginfo","corect","");
	}
	
	if(!is_repassword){
		lineState("reginfo","error","确认密码不不正确！");
		return;
	}else{
		lineState("reginfo","corect","");
	}

	if(!is_vcode){
		$("#vcodewarn").show();
		lineState("regvcode","error","验证码不正确！");
		return;
	}else{
		$("#vcodewarn").show();
	}
	$(".login-but").val("正在注册...");
	$(".login-but").attr("disabled","true");
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "json",
		url:$("#create_from").attr("action"),
		data:$('#create_from').serialize(),// 你的formid
		async: false,
		error: function(request) {
			alert("出错啦，请刷新重试！");
		},
		success: function(data) {
			if(data.success){
				window.location = data.redirect;
			}else{
				alert(data.error);
			}
		}
	});
}

$(document).keypress(function(e) {   
	$(document).keyup(function(){
        if(event.keyCode == 13){
           adaptValue();
        }
    });
});
