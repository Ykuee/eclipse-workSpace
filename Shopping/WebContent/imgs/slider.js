    $(function(){
        $(".sundan_item").hover(
          function () {
            $(this).find(".sundan_two").show();
          },
          function () {
            $(this).find(".sundan_two").hide();
          }
        );
    });

    //滚动广告
    var len = $(".sundan_shop").length;
    var index = 0;  
    var adTimer;
     adTimer = setInterval(function() {
            showDiv(index);
            index++
            if (index>=len) {       //最后一张图片之后，转到第一张
                index = 0;
            }
        }, 3000);
    $(".doot").eq(0).addClass('doot_click');
    $('.doot,.sundan_shop').hover(function() {
        clearInterval(adTimer);
        _index=$(this).index();
        showDiv(_index)
    }, function() {
            _index=$(this).index();
            if(_index>=len-1){
                index=0;
            }else{
                index=_index+1
            }
            adTimer = setInterval(function() {
            showDiv(index);
            index++
            if (index>=len) {       //最后一张图片之后，转到第一张
                index = 0;
            }
        }, 3000);
    })

    function showDiv(index) {
        $(".sundan_shop").hide().eq(index).show();
        $(".doot").removeClass('doot_click').eq(index).addClass('doot_click');
    }