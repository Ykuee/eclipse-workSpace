var areaTabContainer=$("#SD-stock .tab li");
var provinceContainer=$("#stock_province_item");
var cityContainer=$("#stock_city_item");
var areaContainer=$("#stock_area_item");
var currentDom = provinceContainer;

function initSelectAera(initArea) {
	chooseProvince(initArea.provinceId, initArea.provinceName);
	if(initArea.cityId > 0) {
		chooseCity(initArea.cityId,initArea.cityName)
	}
	if(initArea.areaId > 0) {
		chooseArea(initArea.areaId,initArea.areaName)
	}
}

function createArea(areaId, parentid) {
	var areaList = '<ul class="area-list">';
	$.each(regionsdata,function(i, item) {
		if(item.parentid==parentid){
			areaList += '<li><a href="#none" data-value="'+item.regionsid+'">'+item.name+'</a></li>';
		}
	});
	areaList += '</ul>';
	areaId.html(areaList);
}

function chooseProvince(provinceId, provinceName){
	initArea.provinceId = provinceId;
	initArea.provinceName = provinceName;
	provinceContainer.hide();
	areaTabContainer.eq(0).removeClass("curr").find("em").html(provinceName);
	areaTabContainer.eq(1).addClass("curr").show().find("em").html("请选择");
	areaTabContainer.eq(2).hide();
	cityContainer.show();
	areaContainer.hide();
	createArea(cityContainer, provinceId);
	cityContainer.find("a").click(function() {
		//$("#store-selector").unbind("mouseout");
		chooseCity($(this).attr("data-value"),$(this).html());
	}).end();
}

function chooseCity(cityId,cityName){
	initArea.cityId = cityId;
	initArea.cityName = cityName;
	provinceContainer.hide();
	cityContainer.hide();
	areaTabContainer.eq(1).removeClass("curr").find("em").html(cityName);
	areaTabContainer.eq(2).addClass("curr").show().find("em").html("请选择");
	areaContainer.show();
	createArea(areaContainer, cityId);
	areaContainer.find("a").click(function() {
		//$("#store-selector").unbind("mouseout");
		chooseArea($(this).attr("data-value"),$(this).html());
	}).end();
}

function chooseArea(areaId,areaName){
	initArea.areaId = areaId;
	initArea.areaName = areaName;
	areaTabContainer.eq(2).html(areaName);
	$("#aere_on").html(initArea.provinceName + initArea.cityName + initArea.areaName);
	$('#store-selector').removeClass('hover');
	md_list_stock();
}
$(function(){
	$("#store-selector").unbind("mouseover").bind("mouseover",function(){
		$('#store-selector').addClass('hover');
		$("#store-selector .content,#SD-stock").show();
	}).find("dl").remove();
	$("#store-selector").bind("mouseout",function(){
		$('#store-selector').removeClass('hover');
	})
	createArea(provinceContainer, 0);
	initSelectAera(initArea);
	areaTabContainer.eq(0).find("a").click(function(){
		areaTabContainer.removeClass("curr");
		areaTabContainer.eq(0).addClass("curr").show();
		provinceContainer.show();
		cityContainer.hide();
		areaContainer.hide();
		areaTabContainer.eq(1).hide();
		areaTabContainer.eq(2).hide();
	});
	areaTabContainer.eq(1).find("a").click(function(){
		areaTabContainer.removeClass("curr");
		areaTabContainer.eq(1).addClass("curr").show();
		provinceContainer.hide();
		cityContainer.show();
		areaContainer.hide();
		areaTabContainer.eq(2).hide();
	});
	areaTabContainer.eq(2).find("a").click(function(){
		areaTabContainer.removeClass("curr");
		areaTabContainer.eq(2).addClass("curr").show();
		provinceContainer.hide();
		cityContainer.hide();
		areaContainer.show();
	});
	provinceContainer.find("a").click(function() {
		chooseProvince($(this).attr("data-value"),$(this).html());
	}).end();
	
});

function md_list_stock() {
	$.ajax({
		type: "post",
		dataType: "json",
		url:"/index.php/activity-ajax_md_list.html",
		data:{"provinceId":initArea.provinceId,"provinceName":initArea.provinceName,"cityId":initArea.cityId,"cityName":initArea.cityName,"areaId":initArea.areaId,"areaName":initArea.areaName,"goods_id":goods_id},// 你的formid
		error: function(request) {
			alert("出现网络错误!");
		},
		success: function(data) {
			if(data.stock < 1) {
				$("#md_stock_status").html("无货");
				$("#J_buy_btn").hide();
				$("#right_buy").hide();
				$("#md_to_buy").hide();
				$("#md_btn").hide();
				$("#J_no_buy_btn").show();
				$("#no_buy_notice").show();
			} else {
				if(data.stock > 10) {
					$("#md_stock_status").html("有货");
				} else {
					$("#md_stock_status").html("货源紧张");
				}
				
				$("#J_no_buy_btn").hide();
				$("#no_buy_notice").hide();
				$("#J_buy_btn").show();
				$("#right_buy").show();
				$("#md_to_buy").show();
				$("#md_btn").show();
			}
			if(data.store_list.length == 0) {
				$("#md-list").html("该地区暂无门店");
			} else {
				var md_list = '';
				for(i = 0; i < data.store_list.length; i++) {
					md_list += '<li><a href="/activity-mendian.html">详细地图</a><span>' +　data.store_list[i].title + '【'+data.store_list[i].is_have+'】</span></li>'
				}
				$("#md-list").html(md_list);
			}
		}
	});
}