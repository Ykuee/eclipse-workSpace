// JavaScript Document
// JavaScript Document
// JavaScript Document
// JavaScript Document
var username = "";
function getCart(){
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "html",
		url:'/index.php/cart-view.html',
		data:'',
		async: false,
		error: function(request) {
			////alert("出错了，请刷新页面1!");
		},
		success: function(data) {
			$("#ajax_cartbutton_box").html(data);
		}
	});
}

function getFav(){
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "html",
		url:'/index.php/member-ajax_favorite.html',
		data:'',
		async: false,
		error: function(request) {
			////alert("出错了，请刷新页面1!");
		},
		success: function(data) {
			$("#ajax_favbutton_box").html(data);
		}
	});
}

function getHistory(){
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "html",
		url:'/index.php/tools-history.html',
		data:'',
		async: false,
		error: function(request) {
			//alert("出错了，请刷新页面1!");
		},
		success: function(data) {
			$("#ajax_history_box").html(data);
		}
	});
}

function getMember(){
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "html",
		url:'/index.php/member-ajax_member.html',
		data:'',
		async: false,
		error: function(request) {
			//alert("出错了，请刷新页面1!");
		},
		success: function(data) {
			$("#ajax_member_box").html(data);
		}
	});
}

function delallCart(){
	$(".fmcart-list .goodscheckbox").each(function(i,e){
		delCart($(e).val());
		$(e).parents("dd").remove();
	});
	getCart();
}

function clearHistory(){
	delcookie("cainixihuanid");
	$('#ajax_history_box').html('');
}

function delCart(cartid){
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "html",
		url:'/index.php/cart-removeMiniCart-goods-'+cartid+'.html',
		data:'cartid='+cartid,
		async: false,
		error: function(request) {
			layer.alert("出错了，请刷新页面1!", 8, !1);
		},
		success: function(data) {
			getCart();
		}
	});
}
function getLoginStatus(){
	$.ajax({
		cache: true,
		type: "POST",
		dataType: "html",
		url:'/index.php/passport-ajaxstatus.html',
		data:'',
		async: false,
		error: function(request) {
			//alert("出错了，请刷新页面2!");
		},
		success: function(data) {
			if($.trim(data)){
				username = data;
				$("#loginstatus").html('<li><a href="/index.php/member.html" target="_blank">'+data+'</a></li> <li><a href="/index.php/passport-logout.html">退出</a></li><li><a href="/index.php/member-orders.html" target="_blank"> 订单 </a></li> <li><a href="/index.php/article-guide_jiaoyixuzhi-i-132.html" target="_blank"> 帮助 </a></li>');
			}else{
				//$("#loginstatus").html('<li><a href="javascript:;" onClick="public_login()"> 登录 </a></li><li><a href="javascript:;" onClick="public_reg()"> 注册 </a> </li><li><a href="javascript:;" onClick="public_login()"> 订单 </a></li> <li><a href="/index.php/article-guide_jiaoyixuzhi-i-132.html" target="_blank"> 帮助 </a></li>');
				$("#loginstatus").html('<li><a href="javascript:;" onClick="public_login()"> 登录 </a></li><li><a href="/passport-signup.html" target="_blank"> 注册 </a> </li><li><a href="javascript:;" onClick="public_login()"> 订单 </a></li> <li><a href="/index.php/article-guide_jiaoyixuzhi-i-132.html" target="_blank"> 帮助 </a></li>');
			}
		}
	});
}
function submitrast(){
	$("#rastbox_goods_id").val(getcookie("contrastlistgoods"));
	$("#rastbox_type_id").val(getcookie("contrastlistgoodstypeid"));
	if(!$("#rastbox_goods_id").val()){
		alert("没有对比商品!");
		return;
	}
	var arrayData = getcookie("contrastlistgoods").split(",");
	if(arrayData.length<2){
		alert("最少选择两个商品才能对比!");
		return;
	}
	$("#start-rast").submit();
}
$(document).ready(function(){
	$('.remove-but').click(function(){$(this).parent().remove();})
	$('.close-but').click(function(){$(this).parent().fadeOut(200);})
	getLoginStatus();
	getCart();
	getHistory();
	if(username){
		getFav();
		getMember();
		$('#ajax_member').bind('click',function(){
			$(".float-main .fmbox").hide();
			$('.float-main').stop(true,true).animate({right: "0px"},400);
			$('#ajax_member_box').show();
		})
		$("#nologin").html('');
	}else{
		$('.ni-mem').bind('click',function(){
			//niLogin('.ni-login');
			public_login();
		})
	}
})



$(document).ready(function(){
//add for new2.0 in 2015-08-07
	
	//微信
	$('.fm-weixin').hover(function(){
		$('.ni-view-wx',this).stop(true,true).fadeIn(200);
	},function(){
		$('.ni-view-wx',this).hide();
	})
	
	//回到顶部
	$('.ni-gotop').bind('click',function(){
		$('html,body').animate({scrollTop: '0'},800)
	})
	
	//登录窗口关闭
	$(document).on('click','.l-close',function(){
		fclose('.ni-login');
	})
	

	//缩回浮动区域
	$('.fm-close').bind('click',function(){
		$('.float-main').stop(true,true).animate({right: "-338px"},400);
	})
	
	$('#ajax_cartbutton').bind('click',function(){
		$(".float-main .fmbox").hide();
		$('.float-main').stop(true,true).animate({right: "0px"},400);
		$('#ajax_cartbutton_box').show();
	})
	
	$('#ajax_favbutton').bind('click',function(){
		$(".float-main .fmbox").hide();
		$('.float-main').stop(true,true).animate({right: "0px"},400);
		$('#ajax_favbutton_box').show();
	})
	
	$('#ajax_history').bind('click',function(){
		$(".float-main .fmbox").hide();
		$('.float-main').stop(true,true).animate({right: "0px"},400);
		$('#ajax_history_box').show();
	})
})

function niLogin(obj){
	if($(obj).css('display')=='none'){
		$(obj).stop(true,true).fadeIn(200);
	}else{
		$(obj).hide();
	}
}

function fclose(obj){
	$(obj).hide();
}

function floatMain(){
	var box = $('.float-main');
	box.stop(true,true).animate({right: "0"},400);
}

//数量计算
function contNub(obj){
	
		var Nub = $('.gn-itxt',obj);
		var Add = $('.gn-iup',obj);
		var Red = $('.gn-idown',obj);
		
		if(parseInt(Nub.val())<2){Red.addClass('no-click');}
		if(Nub.val()==""){Nub.val(1); Red.addClass('no-click');}

		Add.click(function(){
			var val = parseInt(Nub.val());
			val += 1;
			Nub.val(val);
			Red.removeClass('no-click');
		})
		
		Red.click(function(){
			var val = parseInt(Nub.val());
				
			if(val > 1){
				val -= 1;
			}else{
				val = 0;
				Red.addClass('no-click');
			}

			Nub.val(val);
		
		})
		
		Nub.blur(function(){
			var val = parseInt($(this).val());
			
			if(val < 0){
				val = 0;
				$(this).val(val);
				Red.addClass('no-click');	
			}
		})

}
$(document).ready(function(){
//add for new2.0 in 2015-08-07
	
	//微信
	$('.fm-weixin').hover(function(){
		$('.ni-view-wx',this).stop(true,true).fadeIn(200);
	},function(){
		$('.ni-view-wx',this).hide();
	})
	
	//回到顶部
	$('.ni-gotop').bind('click',function(){
		$('html,body').animate({scrollTop: '0'},800)
	})
	
	//登录窗口关闭
	$(document).on('click','.l-close',function(){
		fclose('.ni-login');
	})
	
	//提交登录按钮，弹出浮动区域
	$(document).on('click','.ni-logon-but',function(){
		$.ajax({
			cache: true,
			type: "POST",
			dataType: "json",
			url:$("#login_create_form").attr("action"),
			data:$('#login_create_form').serialize(),
			async: false,
			error: function(request) {
				alert("出错啦，请刷新重试！");
			},
			success: function(data) {
				if(data.success){
					fclose('.ni-login');
					getMember();
					getLoginStatus();
					$('#ajax_member').bind('click',function(){
						$(".float-main .fmbox").hide();
						$('.float-main').stop(true,true).animate({right: "0px"},400);
						$('#ajax_member_box').show();
					})
					$("#nologinbox").html('');
				}else{
					alert(data.error);
				}
			}
		});
		
	})
	
	//缩回浮动区域
	$('.fm-close').bind('click',function(){
		$('.float-main').stop(true,true).animate({right: "-338px"},400);
	})
	
	$('#ajax_cartbutton').bind('click',function(){
		$(".float-main .fmbox").hide();
		$('.float-main').stop(true,true).animate({right: "0px"},400);
		$('#ajax_cartbutton_box').show();
	})
	
	$('#ajax_favbutton').bind('click',function(){
		$(".float-main .fmbox").hide();
		$('.float-main').stop(true,true).animate({right: "0px"},400);
		$('#ajax_favbutton_box').show();
	})
	
	$('#ajax_history').bind('click',function(){
		$(".float-main .fmbox").hide();
		$('.float-main').stop(true,true).animate({right: "0px"},400);
		$('#ajax_history_box').show();
	})
})

function niLogin(obj){
	if($(obj).css('display')=='none'){
		$(obj).stop(true,true).fadeIn(200);
	}else{
		$(obj).hide();
	}
}

function fclose(obj){
	$(obj).hide();
}

function floatMain(){
	var box = $('.float-main');
	box.stop(true,true).animate({right: "0"},400);
}

//数量计算
function contNub(obj){
	
		var Nub = $('.gn-itxt',obj);
		var Add = $('.gn-iup',obj);
		var Red = $('.gn-idown',obj);
		
		if(parseInt(Nub.val())<2){Red.addClass('no-click');}
		if(Nub.val()==""){Nub.val(1); Red.addClass('no-click');}

		Add.click(function(){
			var val = parseInt(Nub.val());
			val += 1;
			Nub.val(val);
			Red.removeClass('no-click');
		})
		
		Red.click(function(){
			var val = parseInt(Nub.val());
				
			if(val > 1){
				val -= 1;
			}else{
				val = 0;
				Red.addClass('no-click');
			}

			Nub.val(val);
		
		})
		
		Nub.blur(function(){
			var val = parseInt($(this).val());
			
			if(val < 0){
				val = 0;
				$(this).val(val);
				Red.addClass('no-click');	
			}
		})

}






