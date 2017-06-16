<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page
	import="com.ysnc.shopping.product.*,
				com.ysnc.shopping.DAO.*,
				java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
	<title>【三星Galaxy note7】三星 SAMSUNG Galaxy Note7 64G版
		全网通4G手机N9300 星钻黑 双卡双待【 行情 报价 价格 评测】——顺电网上商城</title>
	<meta name="keywords" content="深圳顺电华强店，三星手机 ，三星新品 ，三星Note7">
		<meta name="description"
			content="Note7继承了Note系列勇于创新的精神，为了更好地保护用户的隐私，推出的盖乐世Note7运用全新的虹膜识别功能，在强化大尺寸屏幕同时，还有别出心裁的S Pen设计来方便记录文字、图片和视频，采用的对称四曲面设计，拥有IP68级防尘防水性能，此外，Note7像素高达1000-1600万，拥有1200万全像素双核急速对焦技术。让您在日常工作与休闲娱乐中更加随心所欲。">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<link href="imgs/style.css" rel="stylesheet" type="text/css">
					<style>
html, * {
	-webkit-user-select: text !important;
	-moz-user-select: text !important;
}
</style>
					<link href="imgs/new2.css" rel="stylesheet">
						<link rel="stylesheet" href="imgs/head_menu.css">
							<script src="imgs/s.js" charset="GBK"></script>
							<script src="imgs/hm.js"></script>
							<script src="imgs/jquery.js"></script>
							<script src="imgs/all.js"></script>
							<script src="imgs/n-all.js"></script>
							<link style="" id="layui_layer_skinlayercss"
								href="imgs/layer.css" rel="stylesheet">

								<%
									int id = Integer.parseInt(request.getParameter("id"));
									Product p = ProductMgr.getInstance().loadById(id);
								%>
							
</head>
<body>
	<link href="imgs/goods_slide_focus.css" rel="stylesheet">
		<div style="height: 600px; background-color: #fff;">
			<div class="focusBox" style="margin: 0 auto">
				<ul style="position: relative; width: 1920px; height: 600px;"
					class="pic">
					<li
						style="position: absolute; width: 1920px; left: 0px; top: 0px; display: list-item; opacity: 0.761531;"><a
						href="javascript:;"><img
							src="imgs/products/<%=p.getId() %>.jpg"></a></li>
				</ul>
			</div>
		</div>
		<link rel="stylesheet" href="imgs/page_selector.css">
			<form action="cart.jsp" method="post"
				id="buy_form">
				<input type="hidden" name="id" value="<%=p.getId()%>">
				 <input name="mini_cart" value="" class="mini_cart" type="hidden">
						<input name="response_json" value="" class="response_json"
						type="hidden"> <input name="goods[goods_id]"
							value="260084" type="hidden"> <input
								name="goods[product_id]" value="15008" type="hidden">
									<div class="ng-area">
										<div class="box ng-view">
											<div class="ng-info">
												<h2 class="ng-tit"><%=p.getName()%></h2>
												<!--end ng-promot -->
												<p class="ex">
													●产品描述：<%=p.getDescr()%><br>●会员专享价：<%=p.getMemberprice()%><br>
															●市场价：<%=p.getNormalprice()%><br>
												</p>
												<div class="bot">
													<!--<p class="tt"><span class="name-img"><img src="/statics/ad/m001.jpg" /> 风言风语</span></p>-->
													<!--<p>因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，顺电不能确保客户收到的货物与顺电图片、产地、附件
                          说明完全一致，只能确保为原厂正品。</p>-->
												</div>
												<!--end bot -->
											</div>
											<!--end ng-info -->

											<div class="ng-size" style="min-height: 220px; width: 560px;">
												<ul class="ng-sul">
													<li class="ng-nub"><span class="tt">货品编号：</span>
														<div class="con"><%=p.getId()%></div></li>
													<li class="ng-nub"><span class="tt">您的位置：</span>
														<div class="con">
															<div id="">
																<div class="text">
																	<div>黑龙江云山农场</div>
																	<b></b>
																</div>
																<div class="content">
																	<div data-widget="tabs" class="m SD-stock"
																		id="SD-stock">
																		<div class="mt">
																			<div class="stock-line"></div>
																		</div>
																		<div style="display: none;" class="mc" data-area="0"
																			data-widget="tab-content" id="stock_province_item">
																		</div>
																		<div class="mc" data-area="1"
																			data-widget="tab-content" id="stock_city_item"
																			style="display: none;"></div>
																		<div class="mc" data-area="2"
																			data-widget="tab-content" id="stock_area_item"
																			style=""></div>
																	</div>
																</div>
																<div onclick="$('#store-selector').removeClass('hover')"
																	class="close"></div>
															</div>
														</div>
														<div style="clear: both;"></div></li>
												</ul>
												<li class="ng-nub"><span class="tt">数&nbsp;&nbsp;&nbsp;&nbsp;量：</span>
													<div class="con">
														<span class="goods-nub"> <span class="goods-nub">
																<input class="gn-itxt" value="1" name="goods[num]"
																type="text">
														</span>
														</span>
													</div></li>
												</ul>

												<div class="ngsize-pay" style="width: 560px;">
													<div class="price info-price">会员专享：<%=p.getMemberprice()%></div>
													<h3>市场价：<%=p.getNormalprice() %></h3>
													<div class="info-butdiv">
														<div>
															<!---<input name="" type="button" value="快速购买" class="buybut fast-buy" id="J_fast_buy"/>-->
															<input name="" value="立即购买" class="usbut ng-buy-but"
																id="J_buy_btn" type="submit"> 
																
																<input name=""value="无货" class="usbut ng-no-buy-but" id="J_no_buy_btn"
																style="display: none;" type="button">
																
																<input
																name="" class="usbut ng-buy-but" value="+购物车"
																onclick="cart();" type="button">
														</div>
	<script language="javascript" type="text/javascript">
		function cart(){
window.location.href="cart.jsp?id=<%=p.getId()%>"; 
}					
	</script>

														
														
														<script type="text/javascript">
															$(function() {
																$("#md_btn")
																		.click(
																				function() {
																					$(
																							"#md-list-box")
																							.css(
																									"display",
																									"block");
																				})
															})
															function md_close() {
																$(
																		"#md-list-box")
																		.css(
																				"display",
																				"none");
															}
														</script>
													</div>
													<!--end butdiv -->
												</div>
											</div>
											<!--end ngsize-pay -->
										</div>
										<!--end ng-size -->

										<div align="center">
											<img src="imgs/261461_01.jpg" style="display: block;">
												<img src="imgs/261461_02.jpg" style="display: block;">
													<img src="imgs/261461_03.jpg" style="display: block;">
														<img src="imgs/261461_04.jpg" style="display: block;">
															<img src="imgs/261461_05.jpg" style="display: block;">
																<img src="imgs/261461_06.jpg" style="display: block;">
																	<img src="imgs/261461_07.jpg" style="display: block;">
																		<img src="imgs/261461_08.jpg" style="display: block;">
																			<img src="imgs/261461_09.jpg" style="display: block;">
																				<img src="imgs/261461_10.jpg"
																				style="display: block;"> <img
																					src="imgs/261461_11.jpg" style="display: block;">
																						<img src="imgs/261461_12.jpg"
																						style="display: block;"> <img
																							src="imgs/261461_13.jpg" style="display: block;">
																								<img src="imgs/261461_14.jpg"
																								style="display: block;"> <img
																									src="imgs/261461_15.jpg"
																									style="display: block;"> <img
																										src="imgs/261461_16.jpg"
																										style="display: block;"> <img
																											src="imgs/261461_17.jpg"
																											style="display: block;"> <img
																												src="imgs/261461_18.jpg"
																												style="display: block;"> <img
																													src="imgs/261461_19.jpg"
																													style="display: block;"> <img
																														src="imgs/261461_20.jpg"
																														style="display: block;">
										</div>
</body>
</html>