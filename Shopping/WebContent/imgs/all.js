Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
		if (this[i] == val) return i;
	}
	return -1;
};
Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
		this.splice(index, 1);
	}
};
var cookie_pre = '';
var cookie_domain = '';
var cookie_path = '/';
function getcookie(name) {
    name = cookie_pre+name;
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while(i < clen) {
		var j = i + alen;
		if(document.cookie.substring(i, j) == arg) return getcookieval(j);
		i = document.cookie.indexOf(" ", i) + 1;
		if(i == 0) break;
	}
	return null;
}

function setcookie(name, value, days) {
    name = cookie_pre+name;
	var argc = setcookie.arguments.length;
	var argv = setcookie.arguments;
	var secure = (argc > 5) ? argv[5] : false;
	var expire = new Date();
	if(days==null || days==0) days=1;
	expire.setTime(expire.getTime() + 3600000*24*days);
	document.cookie = name + "=" + escape(value) + ("; path=" + cookie_path) + ((cookie_domain == '') ? "" : ("; domain=" + cookie_domain)) + ((secure == true) ? "; secure" : "") + ";expires="+expire.toGMTString();
}

function delcookie(name) {
    var exp = new Date();
	exp.setTime (exp.getTime() - 1);
	var cval = getcookie(name);
    name = cookie_pre+name;
	document.cookie = name+"="+cval+";expires="+exp.toGMTString();
}

function getcookieval(offset) {
	var endstr = document.cookie.indexOf (";", offset);
	if(endstr == -1)
	endstr = document.cookie.length;
	return unescape(document.cookie.substring(offset, endstr));
}

function live800(){
	var m_username = "游客";
	
	if(username){
		m_username = username;
	}
	
	var _t = encodeURIComponent(document.title);
	
	var _url = encodeURIComponent(document.URL);
	var _u = 'http://v2.live800.com/live800/chatClient/chatbox.jsp?companyID=462096&configID=124587&jid=8634726995&enterurl='+_url+'&info=userId=&name='+encodeURIComponent(m_username)+'&memo=&hashCode=7077e7c61f4760fa384f24dccb10504c&timestamp=1442938095&pagetitle='+_t+'&pagereferrer=http://www.sundan.com/&firstEnterUrl='+_url;
	window.open( _u,'', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );
	return false;
}



// JavaScript Document
$(document).ready(function(){
	$('.web-nav').hover(function(){
        $('.linkdiv',this).fadeIn(100); $(this).addClass('web-nav-hover');
    },function(){
        $('.linkdiv',this).fadeOut(100); $(this).removeClass('web-nav-hover');
    })
	$('.head-cart').hover(function(){$(this).addClass('cart-hover');},function(){$(this).removeClass('cart-hover');})
	$('.nav-category').hover(function(){$(this).addClass('category-hover');},function(){$(this).removeClass('category-hover');})
	$('.cyboxlist').hover(function(){$(this).addClass('cybox-hover');},function(){$(this).removeClass('cybox-hover');})
	$('.float-bg').css('opacity','0.2');
	
	//cart delete
	$('.hcgoods-list li').each(function(){
		var removeBox = $(this);
		var removeBut = $('.dele-link',this);
		removeBut.click(function(){
			removeBox.remove();
		})
	})
	
	//回到顶部
	$('.gototop').click(function(){
		$('html, body').animate({scrollTop: '0'},800)
	})
	
	//首页右侧浮动导航
	$('.float-nav .fn-li').click(function(){
		var floatNub = $(this).index();
		var floatDiv = $('body').find('.fn-box').eq(floatNub);
		$('html, body').stop().animate({scrollTop: floatDiv.offset().top},800)
	})

	//监视滚动条变换浮动导航
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		var fnNub = $('body').find('.fn-box').length;
		
		for(i=0;i<fnNub;i++){
			var fnBoxTop = $('.fn-box').eq(i).offset().top-10;
			var fnLi = $('.fn-li');
			if(fnBoxTop < scrollTop){
				fnLi.eq(i).addClass('hover').siblings().removeClass('hover');

			}else{
				fnLi.eq(i).removeClass('hover');
			}
		}
	});
	
	//member-comment JS
	$('.user-comment span').click(function(){
		if($(this).hasClass('hover')){
			$(this).removeClass('hover');
			$('input[type=checkbox]',this).attr("checked",false);
		}else{
			$(this).addClass('hover'); $('input[type=checkbox]',this).attr("checked",true);
		}
		
	})
})


function deletecart(obj){
	$.ajax({
			cache: true,
			type: "POST",
			dataType: "html",
			url:'/index.php/cart-remove.html',
			data:'response_json=true&'+$(obj).attr("data-name")+'='+$(obj).attr("data-val")+'&modify_quantity[obj_type]=good',
			async: false,
			error: function(request) {
				alert("请检查网络是否连接，否则出现技术问题,请联系技术人员QQ:1300374672！");
			},
			success: function(data) {
				$("#goods"+$(obj).attr("data")).remove();
				$("#mycartgoods").html('购物车'+$("#hcgoods-lists li").length+'件');
			}
	});
	updatetotalprice();
}


$(function(){
	$('.remove-but').click(function(){$(this).parent().remove();})
	$('.close-but').click(function(){$(this).parent().fadeOut(200);})
})

function closeParent(a,b){$(a).click(function(){$(this).parents(b).fadeOut(200);})}

function removeParent(a,b){$(a).click(function(){$(this).parents(b).remove();})}


function openFloat(a){
	var floatBox = a;
	floatBox.fadeIn(200);	
}
function CloseFloat(a){
	var floatBox = a;
	floatBox.fadeOut(200);	
}

function openNext(obj){
	var openNextBut = $(obj);
	openNextBut.next().fadeIn(200);	
}

function openBox(a,b){
	var openBut = $(a);
	var openBox = $(b);
	openBut.click(function(){openBox.fadeIn(200);})
}

function showcontrastin(obj){
	$(obj).addClass('rast-hover');
}

function showcontrastout(obj){
	$(obj).removeClass('rast-hover');
}

function showcontrastdel(obj){
	var productids = "";
	var arrayData = getcookie("contrastlistgoods").split(",");
	for(var i=0;i<arrayData.length;i++){
		if(arrayData[i]!=$(obj).attr("data")){
			if(i==0){
				productids += arrayData[i];
			}else{
				productids += ","+arrayData[i];
			}
		}
		setcookie("contrastlistgoods", productids, 5);
	}
	$(obj).parent().remove();
	$("#productcontrastid_"+$(obj).attr("data")).removeClass("contrast-hover");
	if(arrayData.length==0){
		setcookie("contrastlistgoodstypeid", "");
	}
}

function openChild(a,b){
	var floatParent = $(a);
	var floatChild = $(b);
	floatParent.hover(function(){
		$(this).find(b).stop(true,true).fadeIn(100); $(this).css('z-index','1000');
	},function(){
		$(this).find(b).stop(true,true).fadeOut(100); $(this).css('z-index','100');	
	})
}



//评分JS
$(document).ready(function(){
	$('.star-sys').each(function(){
		var stepW = 24;
		var description = new Array("极不满意","很不满意","一般般吧","还算满意","非常满意");
		var stars = $(".star-ul li",this);
		var descriptionTemp;
		var currentRating = $(".current-rating",this);
		var starText = $(".description",this);
		
		currentRating.css("width",0);
		stars.each(function(i){
			$(stars[i]).click(function(e){
				var n = i+1;
				currentRating.css({"width":stepW*n});
				descriptionTemp = description[i];
				starText.parent(".star-sys").children(".action-score").val(n);
				$(this).find('a').blur();
				return stopDefault(e);
				return descriptionTemp;
			});
		});
		stars.each(function(i){
			$(stars[i]).hover(
				function(){
					starText.text(description[i]);
					var n = i+1;
				},
				function(){
					if(descriptionTemp != null)
						starText.text(descriptionTemp);
					else 
						starText.text("请您评分");
				}
			);
		});
	});
});
function stopDefault(e){
    if(e && e.preventDefault)
           e.preventDefault();
    else
           window.event.returnValue = false;
    return false;
};


//计算总价
function GetCount() {
	var conts = 0; //总价不含优惠
	var aa = 0; //数量
	var prefer = 0; //优惠价
	var payPrice = 0; //总价减去优惠
	
	$(".cart-tab input[name=check-box]").each(function () {
            //custom s
			var nubPrice = parseFloat($(this).parents("tr").find('.cart-com').text()); //产品单价
			var nubText = parseInt($(this).parents("tr").find('.spinner-nub').val()); //产品数量

			var preferPrice = parseFloat($(this).parents("tr").find('.prefer-price').text()); //产品优惠价
			var subPrice = $(this).parents("tr").find('.subtotal'); //产品小计
            //custom s
            if($(this).parents('tr').hasClass('p-adjunct')){
                var old_prefer = $(this).parents("tr").find('.prefer-price').data('prefer');
                $(this).parents("tr").find('.prefer-price').text((parseFloat(old_prefer)*nubText).toFixed(2));
                var preferPrice = $(this).parents("tr").find('.prefer-price').text(); //产品优惠价

                var subNub = nubPrice*nubText-preferPrice;
            }else{
                var subNub = (nubPrice-preferPrice)*nubText;
            }
			//custom e
			subPrice.html((subNub).toFixed(2));
			conts += parseFloat(nubText*nubPrice);
			aa += parseInt(nubText);
			prefer += parseFloat(nubText*preferPrice);
			payPrice += parseFloat(subPrice.text());
		
	});

	$("#cart-nub").text(aa);
	$("#cart-all-price").html((conts).toFixed(2));
	$('#prefer-all').html((conts-payPrice).toFixed(2));
	$("#pay-price").html((payPrice).toFixed(2));
}


//猜你喜欢

$(document).ready(function(){
	var likeList = $('.like-goods ul');
	var likeLi = $('.like-goods li');
	var likeNub = likeLi.length;
	var likeLiW = likeLi.width()+1;
	var likeCont = likeNub;
	
	likeList.css('width',likeNub*likeLiW);
	
	$('.in-batch').click(function(){
		if(likeCont>5){
			likeList.stop(true,true).animate({'margin-left': '-='+likeLiW*5},300);
			likeCont -= 5;
		}else{
			likeList.stop(true,true).animate({'margin-left': 0},300);
			likeCont = likeNub;
		}
		
		
	})

})
