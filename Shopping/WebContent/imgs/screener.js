// JavaScript Document
$(document).ready(function(){
	//价格输入
	$('.price-itxt input[type="button"]').click(function(){
		var firstVal = $('.price-itxt .itxt').eq(0).val();
		var secondVal = $('.price-itxt .itxt').eq(1).val();

		//如果都为空，则跳出
		if(firstVal == '' && secondVal == ''){
			return false;
		}
		//如果值相等，则跳出
		if(firstVal == secondVal){
			return false;
		}
		//如果第一个为空，第二个不为空
		if(firstVal == ''){
			firstVal='0';
			secondVal = $('.price-itxt .itxt').eq(1).val();
		};
		//如果第二个为空，第一个不为空
		if(secondVal == ''){
			firstVal= $('.price-itxt .itxt').eq(0).val();
			secondVal='以上';
		
		};
		//如果第一个比第二个更大
		var priceItxt;
		
		if( parseInt(firstVal) > parseInt(secondVal)){
			priceItxt = secondVal + '-' + firstVal;
		}else{
			priceItxt = firstVal + '-' + secondVal;
		}

		var showLinkBox = $('#condition');
		var priceCon = '<i>></i><a onclick="removeSelf(this)" class="price-con">' + priceItxt + '</a>';
		
		$('.price-screener a').removeClass('hover');
		if(showLinkBox.find('a').hasClass('price-con')){
			showLinkBox.find('.price-con').html(priceItxt);
		}else{
			showLinkBox.append(priceCon);
		}
	})
	
	$('.price-itxt .clear-itxt').click(function(){
		$('.price-itxt input.itxt').val('');
		$('#condition .price-con').remove();
		$(this).parents('li').find('a').removeClass('hover');
		$(this).parents('li').find('a.first').addClass('hover');
	})
	

	/*$('.screener li').each(function(){
		if($(this).height()>36){
			$(this).append('<span class="more">更多<em>&or;</em></span>');
			$(this).css('height','36px');
		}
	})*/

	
	$('.show-more-but').click(function(){
		if($('.screener').height() == 275){
			$('.screener').css('height','auto'); $(this).html('隐藏部分 -');
		}else{
			if($('.screener').height()>275){
				$('.screener').css('height','275px'); $(this).html('显示更多 +');
			}
		}
	})

	$('.screener .more').click(function(){
		if($(this).parent().height()==36){
			$(this).parent().css('height','auto'); $('em',this).html('&and;');
		}else{
			$(this).parent().css('height','36px'); $('em',this).html('&or;');
		}
	})
	
	$('.clear-choose').click(function(){allClear();})
	$('.screener a.first').addClass('hover');
})
var brand_sum = 1;
$(function(){
	var screenerLink = $('.screener .linkdiv a');
	var showLinkBox = $('#condition');
	
	screenerLink.click(function(){
		var obj = this;
		var linkText = replaceImg($(this).html());
		var condition = '<i>></i><a onclick="removeSelf(this)" data="'+$(obj).attr("data-fid")+'">' + replaceImg($(this).html()) + '</a>';
		var priceCon = '<i>></i><a onclick="removeSelf(this)" class="price-con"  data="'+$(obj).attr("data-fid")+'">' + replaceImg($(this).html()) + '</a>';
		
		if($(this).hasClass("hover")){
			$(this).removeClass('hover');
			$('a',showLinkBox).each(function(){
				if(replaceImg($(this).html())==linkText){$(this).prev().remove();$(this).remove();}
			})
			
			//判断价格
			if($(this).parents('li').hasClass('price-screener')){
				$('.price-itxt input.itxt').val('');
			}

		}else{
			$(this).addClass('hover');
			
			//判断价格
			if($(this).parents('li').hasClass('price-screener')){
				
				if(showLinkBox.find('a').hasClass('price-con')){
					showLinkBox.find('.price-con').html(replaceImg($(this).html()));
					$(this).siblings().removeClass('hover');
				}else{
					showLinkBox.append(priceCon);
				}
				
				for(i=0;i<2;i++){
					$('.price-itxt input.itxt').eq(i).val($('em',this).eq(i).html());
				}

			}else{
				showLinkBox.append(condition);
			}
			
		}
		clearFirst(this);
		getData();
	})
	
})

$(function(){
	var firstAll = $('.screener a.first');
		firstAll.click(function(){
			$(this).addClass('hover');
			firstClear(this);
				
			//判断价格
			if($(this).parents('li').hasClass('price-screener')){
				$('.price-itxt input.itxt').val('');
			}
		})

})

function removeSelf(obj){
	var linkText = $(obj).html();
	$(obj).prev().remove();
	$(obj).remove();
	
	//判断价格
	if($(obj).hasClass('price-con')){
		$('.price-itxt input.itxt').val('');
	}
	
	$('.screener .linkdiv a').each(function(){
		if(replaceImg($(this).html())==linkText){$(this).removeClass('hover');
		 clearFirst(this);	
		}
		
	})
	getData();
}
function allClear(){
	$('#condition a').remove();
	$('.screener .linkdiv a').removeClass('hover');
	$('.screener a.first').addClass('hover');
	getData();
}
function firstClear(a){
	var clearBox = $(a).parent().find('.linkdiv');
	$('a',clearBox).each(function(){
		var linkText = replaceImg($(this).html());
		$(this).removeClass('hover');
		$('#condition a').each(function(){if(replaceImg($(this).html())==linkText){$(this).remove();}})
	});
	getData();
}

function clearFirst(obj){
	if($(obj).parent().find('a').is('.hover')){
	$(obj).parent().prev().removeClass('hover');
	}else{
		$(obj).parent().prev().addClass('hover');
	}
	getData();
}

function replaceImg(str) {
	var pattern= /<img(.*)>/ig;
    var result=str.replace(pattern,'');
	return result;
}


