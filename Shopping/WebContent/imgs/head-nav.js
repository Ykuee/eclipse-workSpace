$('.all-sort-list > .item').hover(function(){
	var eq = $('.all-sort-list > .item').index(this),	
		h = $('.all-sort-list').offset().top,	
		s = $(window).scrollTop(),
		i = $(this).offset().top,	
		item = $(this).children('.item-list').height(),
		sort = $('.all-sort-list').height();	
	if ( item < sort ){
		if ( eq == 0 ){
			$(this).children('.item-list').css('top', (i-h));
		} else {
			$(this).children('.item-list').css('top', (i-h)+1);
		}
	} else {
		if ( s > h ) {
			if ( i-s > 0 ){
				$(this).children('.item-list').css('top', (s-h)+2 );
			} else {
				$(this).children('.item-list').css('top', (s-h)-(-(i-s))+2 );
			}
		} else {
			$(this).children('.item-list').css('top', 0 );
		}
	}	

	$(this).addClass('hover');
	$(this).children('.item-list').css('display','block');
},function(){
	$(this).removeClass('hover');
	$(this).children('.item-list').css('display','none');
});

$('#nav-down').mouseenter(function(){
	$("#menu-list-box").css('display','block');
})
$('#nav-down').mouseleave(function(){
	$("#menu-list-box").css('display','none');
})

function open_login(ths) {
	$("#reg_box").css("display","none");
	$(ths).next().css("display","block");
}
function open_reg(ths) {
	$("#login_box").css("display","none");
	$(ths).next().css("display","block");
}
function close_lrbox(id) {
	$("#" + id).css("display","none");
}