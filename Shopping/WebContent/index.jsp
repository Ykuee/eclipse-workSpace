<%@page import="com.ysnc.shopping.nUser"%>
<%@page	import="com.ysnc.shopping.product.*,
				com.ysnc.shopping.DAO.*,
				java.util.*"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta content="all" name="robots">
			<meta content="顺电网,www.sundan.com" name="author">
				<meta name="globalsign-domain-verification"
					content="fp-m0bUZ0P05zfPQkKpjf4ngKPYpB59SEv8Mkrx3nF">
					<meta content="顺电网,版权所有" name="Copyright">
						<meta
							content="【顺电网上商城】顺电旗下高端网上购物商城，正品保证，提供30天无理由退换、送货安装同步、货到付款。主要经营原装进口家电，囊括电视、冰箱、酒柜、空调、洗衣机、电脑、相机、手机、健康运动等产品。便捷的网上服务，放心的线下门店售后，解除您的后顾之忧，让您愉快购物！"
							name="description">
							<meta
								content="北京苏州深圳顺电,顺电网上商城,深圳顺电商城,顺电商城,顺电网,顺电购物,高端家电商城,家电商城,体验店,30天退换货,货到付款,进口家电,专业单反相机,网上购物,智能手机推荐,数码配件"
								name="keywords">
								<title>顺电网上商城(sundan.com)-高端家电购物商城，正品保障-支持送货上门货到付款</title>
								<meta http-equiv="X-UA-Compatible" content="IE=edge">
									<link href="imgs/style.css" rel="stylesheet" type="text/css">
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
														int hotProducts = 20;
														List<Product> products = ProductMgr.getInstance().hotProductList(hotProducts);
													%>
												
</head>
<body>
	<div class="home-top" style="width: 100%; overflow: hidden;"></div>

	<script>
		$.ajax({
			type : "POST",
			url : "/ads/topbanner.php",
			dataType : "html",
			success : function(data) {
				$(".home-top").html(data);
			}
		});
	</script>
	<div class="head-top">
		<div class="top-left">
			<div class="top-logo">
				<a href="" target="_blank"><img src="imgs/sundan-logo.png"></a>
			</div>
		</div>
		<div class="top-right">
			<div class="top-cart">
				<a href="mycart.jsp" style="color: #fff">购物车<span
					id="top-cart-sum">0</span></a>
			</div>
		</div>
		<div class="top-middle">
			<div class="top-search">
				<form action="/search-result.html" method="post" async="false"
					id="search_form">
					<input name="search_keywords" id="search_keywords"
						class="search-input"
						autocompleter="associate_autocomplete_goods:name,goods_id"
						placeholder="请输入..." type="text"> <input
						class="search-button" value="&nbsp;" type="submit">
				</form>
			</div>
		</div>
	</div>
	<div class="head-box" id="top-scroll-nav">
		<div class="menu">
			<div class="menu-box">
				<div class="nav-left">
					<div class="all-sort nav-down" id="nav-down">
						<h2>
							<a href="">全部商品分类</a>
						</h2>
						<div class="all-menu-list" style="display: none;"
							id="menu-list-box">
							<div class="all-sort-list">
								<div class="item">
									<h3>
										<a href="gallery-378.html"><img
											src="imgs/9516e1f6b3f9101567d60d655f825ce282997320.png">大家电/空调</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-437.html"><img
														src="imgs/42e8a8ba35e566c4c47e1d7799bf0b55ac29a047.jpg">家电大件</a>
												</dt>
												<dd>
													<em><a href="gallery-201.html"><font color="red">空调</font></a></em>
													<em><a href="gallery-30.html">电视</a></em> <em><a
														href="gallery-22.html">洗衣机</a></em> <em><a
														href="gallery-263.html">冰箱</a></em> <em><a
														href="gallery-272.html">酒柜/冷柜</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-438.html"><img
														src="imgs/06d6bee0b0487114fa7092bff0c2519b0859bfb3.jpg">厨卫大电</a>
												</dt>
												<dd>
													<em><a href="gallery-141.html">热水器</a></em> <em><a
														href="gallery-315.html">抽油烟机</a></em> <em><a
														href="gallery-174.html">炉具</a></em> <em><a
														href="gallery-152.html">消毒柜</a></em> <em><a
														href="gallery-205.html">烤箱/蒸箱</a></em> <em><a
														href="gallery-172.html">洗碗机</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-55.html"><img
														src="imgs/b3b9568a1c0df7943464b34cae2de2c0439aee69.jpg">家庭影音</a>
												</dt>
												<dd>
													<em><a href="gallery-56.html">家庭影院</a></em> <em><a
														href="gallery-57.html">音响/音箱</a></em> <em><a
														href="gallery-60.html">DVD播放器</a></em> <em><a
														href="gallery-59.html">功放机</a></em> <em><a
														href="gallery-427.html">家用投影仪</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-264.html"><img
														src="imgs/c3ab8ef9daa121dc03c5bd35986d25588e82574a.jpg">大家电配件</a>
												</dt>
												<dd>
													<em><a href="gallery-66.html">电视支架</a></em> <em><a
														href="gallery-64.html">麦克风</a></em> <em><a
														href="gallery-65.html">遥控器</a></em> <em><a
														href="gallery-67.html">影音线材</a></em> <em><a
														href="gallery-323.html">厨卫配件</a></em> <em><a
														href="gallery-68.html">转换器</a></em> <em><a
														href="gallery-265.html">清洗剂</a></em> <em><a
														href="gallery-266.html">空调挂架/辅材</a></em> <em><a
														href="gallery-328.html">洗衣配件</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a href="gallery-index---0---201.html"
																	target="_blank"><img src="imgs/djd2016_003.jpg"
																		alt="" height="29" width="83"></a></td>
																<td><a href="gallery-index---0---202.html"
																	target="_blank"><img src="imgs/djd2016_006.jpg"
																		alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---203.html"
																	target="_blank"><img src="imgs/djd2016_002.jpg"
																		alt="" height="29" width="83"></a></td>
																<td><a href="gallery-index---0---204.html"
																	target="_blank"><img src="imgs/djd2016_005.jpg"
																		alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---205.html"
																	target="_blank"><img src="imgs/djd2016_004.jpg"
																		alt="" height="30" width="83"></a></td>
																<td><a href="gallery-index---0---206.html"
																	target="_blank"><img src="imgs/djd2016_008.jpg"
																		alt="" height="30" width="82"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/djd2016_007.jpg"
																	alt="" height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-13304.html"
																	target="_blank"><img src="imgs/djd831_08.jpg"
																		alt="" height="127" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/djd2016.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-8246.html"
																	target="_blank"><img src="imgs/djd831_10.jpg"
																		alt="" height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-1.html"><img
											src="imgs/8b50180fb6c30214c023496de868ba2e58bb5adf.png">手机通讯</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-431.html"><img
														src="imgs/851a162f1fca32971d73bc39c4f69870980393f4.png">通讯</a>
												</dt>
												<dd>
													<em><a href="mobile.jsp"><font color="red">手机</font></a></em>
													<em><a href="gallery-228.html">电话机</a></em> <em><a
														href="gallery-121.html">对讲机</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-53.html"><img
														src="imgs/75a944c55484d99be09c681e2e4542ccd1000e91.jpg">手机配件</a>
												</dt>
												<dd>
													<em><a href="gallery-84.html">移动电源</a></em> <em><a
														href="gallery-85.html">手机壳/套</a></em> <em><a
														href="gallery-116.html">贴膜</a></em> <em><a
														href="gallery-426.html">手机存储卡</a></em> <em><a
														href="gallery-106.html">数据线/充电器</a></em> <em><a
														href="gallery-386.html">自拍杆</a></em> <em><a
														href="gallery-314.html">车载配件</a></em> <em><a
														href="gallery-113.html">创意配件</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---243.html"><img
																		src="imgs/sj_01.jpg" alt="" height="29" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---245.html"><img
																		src="imgs/sj_02.jpg" alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---246.html"><img
																		src="imgs/sj_03.jpg" alt="" height="29" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---248.html"><img
																		src="imgs/sj_04.jpg" alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---271.html"><img
																		src="imgs/sj_05.jpg" alt="" height="30" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---251.html"><img
																		src="imgs/sj_06.jpg" alt="" height="30" width="82"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/sj_07.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a target="_blank"
																	href="http://www.sundan.com/product-14971.html"><img
																		src="imgs/vivo-v3.jpg" alt="" height="127" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/sj_09.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a target="_blank"
																	href="http://www.sundan.com/product-15008.html"><img
																		src="imgs/sx_n7.jpg" alt="" height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-432.html"><img
											src="imgs/d34303cd1e338f21b058cd4ad2a7a3a9448df24f.png">智能/娱乐</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-200.html"><img
														src="imgs/6b15745aadaea49c2c588bd3cbb53bcb3cfe1490.jpg">时尚影音</a>
												</dt>
												<dd>
													<em><a href="gallery-227.html"><font color="red">耳机</font></a></em>
													<em><a href="gallery-236.html">桌面音箱/蓝牙音箱</a></em> <em><a
														href="gallery-245.html">MP3/MP4</a></em> <em><a
														href="gallery-268.html">收/录音机</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-126.html"><img
														src="imgs/5fb1e567865ffdef5e84d7cbf578e8a61f2789c8.jpg">智能设备</a>
												</dt>
												<dd>
													<em><a href="gallery-407.html">智能手表/手环</a></em> <em><a
														href="gallery-450.html">VR虚拟现实</a></em> <em><a
														href="gallery-367.html">智能生活</a></em> <em><a
														href="gallery-131.html">体感车/助力车</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-178.html"><img
														src="imgs/27221cbde8c31f8b7024de552c74bd6ac2942808.jpg">学习游戏</a>
												</dt>
												<dd>
													<em><a href="gallery-95.html">游戏电玩</a></em> <em><a
														href="gallery-180.html">电子书</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-443.html"><img
														src="imgs/293a332922becf2cff8febfeb625bb27aaeb0abe.jpg">乐器</a>
												</dt>
												<dd>
													<em><a href="gallery-411.html">钢琴/电子琴</a></em> <em><a
														href="gallery-413.html">电吉他/电贝司</a></em> <em><a
														href="gallery-409.html">吉他/贝司</a></em> <em><a
														href="gallery-412.html">打击乐器</a></em> <em><a
														href="gallery-414.html">乐器配件</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---209.html"><img
																		src="imgs/znyl_01.jpg" alt="" height="29" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---210.html"><img
																		src="imgs/znyl_02.jpg" alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---211.html"><img
																		src="imgs/znyl_03.jpg" alt="" height="29" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---212.html"><img
																		src="imgs/znyl_04.jpg" alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---213.html"><img
																		src="imgs/znyl_05.jpg" alt="" height="30" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---214.html"><img
																		src="imgs/znyl_06.jpg" alt="" height="30" width="82"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/znyl_07.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a target="_blank"
																	href="http://www.sundan.com/product-14671.html"><img
																		src="imgs/bbkh_lc.jpg" alt="" height="127" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/znyl_09.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a target="_blank"
																	href="http://www.sundan.com/product-13791.html"><img
																		src="imgs/TY_k1.jpg" alt="" height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-382.html"><img
											src="imgs/ce899a8a62de57dbef93a3aabf68b87c5511af2b.png">数码/航拍</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-405.html"><img
														src="imgs/e56a3d2b5d6dba7aa01655fb666c54f05c559263.jpg">摄影摄像</a>
												</dt>
												<dd>
													<em><a href="gallery-420.html"><font color="red">相机</font></a></em>
													<em><a href="gallery-433.html">航拍器</a></em> <em><a
														href="gallery-313.html">摄像机</a></em> <em><a
														href="gallery-232.html">镜头</a></em> <em><a
														href="gallery-319.html">望远镜</a></em> <em><a
														href="gallery-451.html">手持云台</a></em> <em><a
														href="gallery-214.html">数码相框</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-138.html"><img
														src="imgs/b31dff4a66c21b1b3500ad66f617bc0cdad9bb5d.jpg">数码配件</a>
												</dt>
												<dd>
													<em><a href="gallery-286.html">相机包</a></em> <em><a
														href="gallery-112.html">存储卡/读卡器</a></em> <em><a
														href="gallery-299.html">相机电池/充电器</a></em> <em><a
														href="gallery-408.html">镜头防护/清洁套装</a></em> <em><a
														href="gallery-293.html">三脚架/云台</a></em> <em><a
														href="gallery-410.html">闪光灯/单反手柄</a></em> <em><a
														href="gallery-419.html">GoPro配件</a></em> <em><a
														href="gallery-425.html">拍立得相片纸</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---216.html"><img
																		src="imgs/smhp_01.jpg" alt="" height="29" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---217.html"><img
																		src="imgs/smhp_02.jpg" alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---219.html"><img
																		src="imgs/smhp_03.jpg" alt="" height="29" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---224.html"><img
																		src="imgs/smhp_04.jpg" alt="" height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---225.html"><img
																		src="imgs/smhp_05.jpg" alt="" height="30" width="83"></a></td>
																<td><a target="_blank"
																	href="http://www.sundan.com/gallery-index---0---227.html"><img
																		src="imgs/smhp_06.jpg" alt="" height="30" width="82"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/znyl_07.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a target="_blank"
																	href="http://www.sundan.com/product-9070.html"><img
																		src="imgs/sj_08.jpg" alt="" height="127" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/znyl_09.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a target="_blank"
																	href="http://www.sundan.com/product-12155.html"><img
																		src="imgs/sj_10.jpg" alt="" height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-389.html"><img
											src="imgs/7c588cadb1cc574e16bded4521d82e58041325f2.png">电脑</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-388.html"><img
														src="imgs/b463e99e4ddc89a93ef1639ba0733bcb47b859b9.jpg">电脑</a>
												</dt>
												<dd>
													<em><a href="gallery-40.html"><font color="red">笔记本电脑</font></a></em>
													<em><a href="gallery-82.html">平板电脑</a></em> <em><a
														href="gallery-90.html">台式电脑</a></em> <em><a
														href="gallery-444.html">服务器/工作站</a></em> <em><a
														href="gallery-188.html">显示器</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-38.html"><img
														src="imgs/2fcd3284640ddad3261904fa0f07657e73855af8.jpg">电脑外设</a>
												</dt>
												<dd>
													<em><a href="gallery-384.html">鼠标/键盘</a></em> <em><a
														href="gallery-130.html">U盘</a></em> <em><a
														href="gallery-139.html"><font color="red">移动硬盘</font></a></em>
													<em><a href="gallery-109.html">鼠标垫</a></em> <em><a
														href="gallery-160.html">电脑包</a></em> <em><a
														href="gallery-143.html">电脑音箱</a></em> <em><a
														href="gallery-189.html">摄像头</a></em> <em><a
														href="gallery-127.html">手写板</a></em> <em><a
														href="gallery-166.html">平板保护套</a></em> <em><a
														href="gallery-190.html">清洁套装</a></em> <em><a
														href="gallery-185.html">刻录光驱</a></em> <em><a
														href="gallery-156.html">线缆/适配器</a></em> <em><a
														href="gallery-153.html">麦克风</a></em> <em><a
														href="gallery-176.html">电脑软件</a></em> <em><a
														href="gallery-290.html">其他配件</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-436.html"><img
														src="imgs/9222e5427fa151e265cc4ea9d30cd4e9c2a9c188.jpg">网络产品</a>
												</dt>
												<dd>
													<em><a href="gallery-193.html">路由器/交换机</a></em> <em><a
														href="gallery-194.html">无线网卡</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a href="gallery-index---0---254.html"
																	target="_blank"><img src="imgs/DN_01.jpg" alt=""
																		height="29" width="83"></a></td>
																<td><a href="gallery-index---0---257.html"
																	target="_blank"><img src="imgs/DN_02.jpg" alt=""
																		height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---259.html"
																	target="_blank"><img src="imgs/DN_03.jpg" alt=""
																		height="29" width="83"></a></td>
																<td><a href="gallery-index---0---260.html"
																	target="_blank"><img src="imgs/DN_04.jpg" alt=""
																		height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---262.html"
																	target="_blank"><img src="imgs/DN_05.jpg" alt=""
																		height="30" width="83"></a></td>
																<td><a href="gallery-index---0---264.html"
																	target="_blank"><img src="imgs/DN_06.jpg" alt=""
																		height="30" width="82"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/DN_07.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-13265.html"
																	target="_blank"><img src="imgs/dn_08.jpg" alt=""
																		height="127" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/DN_09.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-11960.html"
																	target="_blank"><img src="imgs/dn_10.jpg" alt=""
																		height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-203.html"><img
											src="imgs/8b5d1ff9cbc6476b4fd1ff56c13a984b720af1a4.png">办公设备</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-434.html"><img
														src="imgs/a9fe0e5ff957f00f37cd11dd9b14838eece5cce9.jpg">打印设备</a>
												</dt>
												<dd>
													<em><a href="gallery-390.html">多功能打印一体机</a></em> <em><a
														href="gallery-383.html">单功能打印机</a></em> <em><a
														href="gallery-220.html">复印机</a></em> <em><a
														href="gallery-222.html">扫描仪</a></em> <em><a
														href="gallery-218.html">传真机</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-452.html"><img
														src="imgs/c721284ae9406b6312b206d313d5e21c8e6f81d4.jpg">投影设备</a>
												</dt>
												<dd>
													<em><a href="gallery-392.html">商用投影仪</a></em> <em><a
														href="gallery-69.html">投影幕</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-453.html"><img
														src="imgs/d899b6993ebbd43bf368223aa2d835695b577955.jpg">财务及其他设备</a>
												</dt>
												<dd>
													<em><a href="gallery-229.html">验钞/点钞机</a></em> <em><a
														href="gallery-226.html">碎纸机</a></em> <em><a
														href="gallery-238.html">保险柜</a></em> <em><a
														href="gallery-181.html">录音笔</a></em> <em><a
														href="gallery-449.html">UPS电源</a></em> <em><a
														href="gallery-391.html">其他办公设备</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-435.html"><img
														src="imgs/77ebbc238444d9e8df9d0277a003925ca9b5b9ee.jpg">耗材/文具</a>
												</dt>
												<dd>
													<em><a href="gallery-246.html">硒鼓/墨盒/色带</a></em> <em><a
														href="gallery-422.html">复印纸/相片纸</a></em> <em><a
														href="gallery-251.html">办公文具</a></em> <em><a
														href="gallery-361.html">计算器</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a href="gallery-index---0---230.html"
																	target="_blank"><img src="imgs/BG_01.jpg" alt=""
																		height="29" width="83"></a></td>
																<td><a href="gallery-index---0---233.html"
																	target="_blank"><img src="imgs/BG_02.jpg" alt=""
																		height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---234.html"
																	target="_blank"><img src="imgs/BG_03.jpg" alt=""
																		height="29" width="83"></a></td>
																<td><a href="gallery-index---0---236.html"
																	target="_blank"><img src="imgs/BG_04.jpg" alt=""
																		height="29" width="82"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---237.html"
																	target="_blank"><img src="imgs/BG_05.jpg" alt=""
																		height="30" width="83"></a></td>
																<td><a href="gallery-index---0---239.html"
																	target="_blank"><img src="imgs/BG_06.jpg" alt=""
																		height="30" width="82"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/BG_07.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-13166.html"
																	target="_blank"><img src="imgs/bg_08.jpg" alt=""
																		height="127" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><img src="imgs/BG_09.jpg" alt=""
																	height="5" width="165"></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-2552.html"
																	target="_blank"><img src="imgs/bg_10.jpg" alt=""
																		height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-145.html"><img
											src="imgs/11a24729fce2c719a36695d42358bfab39378dc6.png">厨房小家电</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-50.html"><img
														src="imgs/21fb5c7bdaa72a2757ee4b89c5b718ba7a41fd24.jpg">水设备</a>
												</dt>
												<dd>
													<em><a href="gallery-221.html">净水器</a></em> <em><a
														href="gallery-237.html">饮水机</a></em> <em><a
														href="gallery-235.html">电水壶/电热水瓶</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-173.html"><img
														src="imgs/881161df3330a950071e2504a1069f2734087c77.jpg">食物制作</a>
												</dt>
												<dd>
													<em><a href="gallery-163.html"><font color="red">电饭煲</font></a></em>
													<em><a href="gallery-169.html">电压力锅</a></em> <em><a
														href="gallery-158.html">电磁炉/电陶炉</a></em> <em><a
														href="gallery-311.html">炖锅/汤煲</a></em> <em><a
														href="gallery-168.html">微波炉</a></em> <em><a
														href="gallery-312.html">面条机 </a></em> <em><a
														href="gallery-187.html">面包机/多士炉</a></em> <em><a
														href="gallery-428.html">电饼铛/烧烤盘</a></em> <em><a
														href="gallery-447.html">干果机</a></em> <em><a
														href="gallery-240.html">煮蛋机</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-308.html"><img
														src="imgs/a6d1010dc15ca2bc6c3c28f664b20ece08beb9ee.jpg">饮品制作</a>
												</dt>
												<dd>
													<em><a href="gallery-310.html">料理/榨汁机</a></em> <em><a
														href="gallery-309.html">豆浆机</a></em> <em><a
														href="gallery-209.html">咖啡机</a></em> <em><a
														href="gallery-211.html">咖啡机配件</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a href="gallery-index---0---223.html"><img
																		src="imgs/sjd_01.jpg" alt="" height="29" width="82"></a></td>
																<td><a href="gallery-index---0---226.html"><img
																		src="imgs/sjd_02.jpg" alt="" height="29" width="83"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---228.html"><img
																		src="imgs/sjd_03.jpg" alt="" height="29" width="82"></a></td>
																<td><a href="gallery-index---0---231.html"><img
																		src="imgs/sjd_04.jpg" alt="" height="29" width="83"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---232.html"><img
																		src="imgs/sjd_05.jpg" alt="" height="30" width="82"></a></td>
																<td><a href="gallery-index---0---235.html"><img
																		src="imgs/sjd_06.jpg" alt="" height="30" width="83"></a></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-5961.html"
																	target="_blank"><img src="imgs/xjd_07.jpg" alt=""
																		height="137" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-14681.html"
																	target="_blank"><img src="imgs/xjd_08.jpg" alt=""
																		height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-404.html"><img
											src="imgs/cfe9d1b811f7897a6c725d0621883c1e28e419e0.png">生活电器</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-439.html"><img
														src="imgs/df47e141904d7a20a3ca460fd5a852f2caf2f23d.jpg">环境电器</a>
												</dt>
												<dd>
													<em><a href="gallery-91.html">空气净化器</a></em> <em><a
														href="gallery-92.html">净化器滤网</a></em> <em><a
														href="gallery-446.html"><font color="red">风扇</font></a></em> <em><a
														href="gallery-96.html">除湿机</a></em> <em><a
														href="gallery-94.html">加湿器</a></em> <em><a
														href="gallery-101.html">空调扇</a></em> <em><a
														href="gallery-89.html">取暖电器</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-440.html"><img
														src="imgs/adf804835f4e454a55f2b272ada2c7b8763450f2.jpg">居家电器</a>
												</dt>
												<dd>
													<em><a href="gallery-117.html">吸尘器/地宝</a></em> <em><a
														href="gallery-98.html">挂烫机/电熨斗</a></em> <em><a
														href="gallery-339.html">清洁机</a></em> <em><a
														href="gallery-119.html">智能马桶盖</a></em> <em><a
														href="gallery-120.html">清洁类配件</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-441.html"><img
														src="imgs/79b570f6321e266bf4335c207ab94f1b03b529c7.jpg">灯具</a>
												</dt>
												<dd>
													<em><a href="gallery-355.html">台灯</a></em> <em><a
														href="gallery-360.html">电筒</a></em> <em><a
														href="gallery-351.html">小夜灯</a></em> <em><a
														href="gallery-257.html">照明设备/灯具</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-247.html"><img
														src="imgs/7f2ffd3737b8fc09fad566d98b1ccca1dd4f4693.jpg">生活配件</a>
												</dt>
												<dd>
													<em><a href="gallery-350.html">灭蚊</a></em> <em><a
														href="gallery-259.html">转换器/排插</a></em> <em><a
														href="gallery-297.html">生活电池</a></em> <em><a
														href="gallery-349.html">门铃</a></em> <em><a
														href="gallery-347.html">花洒/水龙头</a></em> <em><a
														href="gallery-298.html">除味产品</a></em> <em><a
														href="gallery-322.html">厨房配件</a></em> <em><a
														href="gallery-244.html">垃圾处理机</a></em> <em><a
														href="gallery-300.html">其他生活配件</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a href="gallery-index---0---238.html"
																	target="_blank"><img src="imgs/shdq_01.jpg" alt=""
																		height="29" width="82"></a></td>
																<td><a href="gallery-index---0---240.html"
																	target="_blank"><img src="imgs/shdq_02.jpg" alt=""
																		height="29" width="83"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---247.html"
																	target="_blank"><img src="imgs/shdq_03.jpg" alt=""
																		height="29" width="82"></a></td>
																<td><a href="gallery-index---0---244.html"
																	target="_blank"><img src="imgs/shdq_04.jpg" alt=""
																		height="29" width="83"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---241.html"
																	target="_blank"><img src="imgs/shdq_05.jpg" alt=""
																		height="30" width="82"></a></td>
																<td><a href="gallery-index---0---250.html"
																	target="_blank"><img src="imgs/shdq_06.jpg" alt=""
																		height="30" width="83"></a></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-12327.html"
																	target="_blank"><img src="imgs/shdq_07.jpg" alt=""
																		height="137" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-14194.html"
																	target="_blank"><img src="imgs/shdq_08.jpg" alt=""
																		height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>
												</dd>
											</dl>
										</div>
									</div>
								</div>
								<div class="item">
									<h3>
										<a href="gallery-33.html"><img
											src="imgs/995fb34b598848ed04ccb998e3432a175c830287.png">个护/健康</a>
									</h3>
									<div class="item-list clearfix">
										<div class="subitem">
											<dl class="fore1">
												<dt>
													<a href="gallery-35.html"><img
														src="imgs/962150b6a67da5af2268fc949050229f1656605b.jpg">个人护理</a>
												</dt>
												<dd>
													<em><a href="gallery-36.html"><font color="red">剃须刀</font></a></em>
													<em><a href="gallery-41.html">电吹风</a></em> <em><a
														href="gallery-42.html">口腔护理</a></em> <em><a
														href="gallery-44.html">美发器/理发器</a></em> <em><a
														href="gallery-343.html">剃/脱毛器</a></em> <em><a
														href="gallery-345.html">美容器</a></em> <em><a
														href="gallery-45.html">小型按摩器</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-442.html"><img
														src="imgs/15a7b787c1082661077ce75128bc3ac77a38fb2c.jpg">按摩/健康器材</a>
												</dt>
												<dd>
													<em><a href="gallery-137.html">按摩椅</a></em> <em><a
														href="gallery-107.html">足浴盆</a></em> <em><a
														href="gallery-76.html">血压仪/血糖仪</a></em> <em><a
														href="gallery-128.html">脂肪测量仪</a></em> <em><a
														href="gallery-51.html">健康秤</a></em> <em><a
														href="gallery-78.html">制氧机</a></em> <em><a
														href="gallery-77.html">体温计</a></em> <em><a
														href="gallery-79.html">家庭医疗配件</a></em>
												</dd>
											</dl>
											<dl class="fore1">
												<dt>
													<a href="gallery-123.html"><img
														src="imgs/bd5b61bb94fe58ab4d91a8ab9e8d289494244237.jpg">健身训练</a>
												</dt>
												<dd>
													<em><a href="gallery-445.html">滑板车</a></em> <em><a
														href="gallery-140.html">跑步机</a></em> <em><a
														href="gallery-346.html">健身车</a></em> <em><a
														href="gallery-430.html">椭圆机</a></em> <em><a
														href="gallery-429.html">综合训练器</a></em> <em><a
														href="gallery-125.html">其他运动器械</a></em> <em><a
														href="gallery-129.html">运动配件</a></em>
												</dd>
											</dl>
										</div>
										<div class="cat-right">
											<dl class="categorys-promotions">
												<dd>
													<table id="__01" border="0" cellpadding="0" cellspacing="0"
														height="352" width="165">
														<tbody>
															<tr>
																<td><a href="gallery-index---0---253.html"><img
																		src="imgs/gh_01.1" alt="" height="29" width="82"></a></td>
																<td><a href="gallery-index---0---255.html"><img
																		src="imgs/gh_02.1" alt="" height="29" width="83"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---261.html"><img
																		src="imgs/gh_03.1" alt="" height="29" width="82"></a></td>
																<td><a href="gallery-index---0---256.html"><img
																		src="imgs/gh_04.1" alt="" height="29" width="83"></a></td>
															</tr>
															<tr>
																<td><a href="gallery-index---0---258.html"><img
																		src="imgs/gh_05.1" alt="" height="30" width="82"></a></td>
																<td><a href="gallery-index---0---263.html"><img
																		src="imgs/huli812_06.jpg" alt="" height="30"
																		width="83"></a></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-14549.html"
																	target="_blank"><img src="imgs/huli826_07.jpg"
																		alt="" height="137" width="165"></a></td>
															</tr>
															<tr>
																<td colspan="2"><a href="product-12720.html"
																	target="_blank"><img src="imgs/huli826_08.jpg"
																		alt="" height="127" width="165"></a></td>
															</tr>
														</tbody>
													</table>

												</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="nav-main">
					<ul class="clearfix nav-item">
						<li><a href="index.html">首页</a></li>
						<li><a href="gallery-201.html" target="_blank">空调专场</a></li>
						<li><a href="gallery-91.html" target="_blank">空气净化器</a></li>
						<li><a href="index.php/activity-mendian.html" target="_blank">线下体验店</a></li>
					</ul>
					<script>
						var url_self = GetPageName();
						$('.nav-item a').each(
								function() {
									var self_p_obj = $(this);
									var reg_url = new RegExp(url_self.replace(
											/\./, '\\.'));
									if (url_self != ''
											&& url_self != '/'
											&& url_self != 'index.php'
											&& reg_url.test($(this)
													.attr('href'))) {
										self_p_obj.addClass('current')
												.siblings().removeClass(
														'current');
									}
								});
						//获取页面文件名 
						function GetPageName() {
							var path_name = window.location.href.split('/')
									.pop();
							path_name = (path_name.match(/\?/) !== -1) ? path_name
									.split("?")[0]
									: path_name;
							return path_name;
						}
					</script>
				</div>
				<div class="nav-right">
					<ul class="nav-help-ul" id="loginstatus">
					<%
						nUser u = (nUser)session.getAttribute("nuser");
						if(u !=null){
							%>
							<li><a href="">欢迎回来,<%=u.getUsername()%>账户管理 </a></li>
							<li><a href="nuser/index.jsp"> 后台管理 </a>						
							<%
						}else{
					%>
						<li><a href="nuser/login.jsp"> 登录 </a></li>
						<li><a href="nuser/rejister.jsp" target="_blank"> 注册 </a></li>
						<li><a href="admin/login.jsp"> 后台登录 </a>
						<%} %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="head-keyword" id="">
		<div class="keyword-left">
			<div class="keyword-logo"></div>
		</div>
		<div class="keyword-right">
			<div class="keyword-cart"></div>
		</div>
		<div class="keyword-middle">
			<div class="keyword-search">
				<div id="bigAutocompleteContent" class="bigautocomplete-layout"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="imgs/jquery_002.js"></script>
	<script>
		$(function() {
			$("#search_keywords").bigAutocomplete({
				'url' : '/index.php/activity-keywords.html'
			});

		})
	</script>



	<script type="text/javascript">
		/*
		var _adwq = _adwq || [];
		_adwq.push(['_setAccount', 'x1ul1']);
		_adwq.push(['_setDomainName', '.sundan.com']);
		_adwq.push(['_trackPageview']);

		(function() {
		  var adw = document.createElement('script');
		  adw.type = 'text/javascript';
		  adw.async = true;
		  adw.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://s') + '.emarbox.com/js/adw.js';
		  var s = document.getElementsByTagName('script')[0];
		  s.parentNode.insertBefore(adw, s);
		})();
		 */
	</script>
	<div class="index_slide">
		<link href="imgs/style.css" rel="stylesheet" type="text/css">
			<link href="imgs/new2.css" rel="stylesheet">
				<link rel="stylesheet" href="imgs/head_menu.css">
					<script src="imgs/jquery.js"></script>



					<link href="imgs/slide_focus.css" rel="stylesheet">
						<div style="height: 360px; margin-bottom: 20px;">
							<div style="height: 360px; margin-bottom: 20px;">
								<div class="focusBox" style="margin: 0 auto">
									<ul class="pic"
										style="position: relative; width: 1879px; height: 360px;">
										<li
											style="position: absolute; width: 1879px; left: 0px; top: 0px; display: none;">
											<a href="product-15008.html" target="_blank"> <img
												src="imgs/sx_note37.jpg"></a>
										</li>
										<li
											style="position: absolute; width: 1879px; left: 0px; top: 0px; display: none;">
											<a href="product-13265.html" target="_blank"> <img
												src="imgs/daier.jpg"></a>
										</li>
										<li
											style="position: absolute; width: 1879px; left: 0px; top: 0px; display: none;">
											<a href="activity/2016/08/teacher/" target="_blank"> <img
												src="imgs/teacher_banner_1.jpg"></a>
										</li>
										<li
											style="position: absolute; width: 1879px; left: 0px; top: 0px;">
											<a href="activity/2016/08/surface/" target="_blank"> <img
												src="imgs/surface_banner.jpg"></a>
										</li>
									</ul>
									<div class="focus-slt">
										<a class="prev" href="javascript:void(0)"
											style="opacity: 0.399978; display: block;"></a> <a
											class="next" href="javascript:void(0)"
											style="opacity: 0.399978; display: block;"></a>
									</div>
									<ul class="hd" style="">
										<li class="">1</li>
										<li class="">2</li>
										<li class="">3</li>
										<li class="on">4</li>
									</ul>

								</div>
								<script src="imgs/jquery_003.js"></script>
								<script type="text/javascript">
									jQuery(".focusBox").hover(
											function() {
												jQuery(this)
														.find(".prev,.next")
														.stop(true, true)
														.fadeTo("show", 0.4)
											},
											function() {
												jQuery(this)
														.find(".prev,.next")
														.fadeOut(300)
											});
								</script>
							</div>
						</div>
	</div>
	<script>
		$.ajax({
			type : "POST",
			url : "/ads/indexslide.php",
			dataType : "html",
			success : function(data) {
				$(".index_slide").html(data);
				$(".hd").show();
			}
		});
	</script>
	<div class="box n-main screener">
		<div class="n-goods-list">
			<ul class="list" id="datalist">
				<form action="/cart-add-goods.html" method="post" id="buy_form">
					<input name="btype" class="btype" type="hidden"> <input
						name="mini_cart" value="" class="mini_cart" type="hidden">
							<input name="response_json" value="" class="response_json"
							type="hidden"> <input class="js-goods_id"
								name="goods[goods_id]" value="" type="hidden"> <input
									class="js-product_id" name="goods[product_id]" value=""
									type="hidden"> <input class="js-num" name="goods[num]"
										value="1" type="hidden">
				</form>
				
				<%
					for (Iterator<Product> it = products.iterator(); it.hasNext();) {
						Product p = it.next();
				%>
		<!--hot products start here -->
				<li class="n-goods"><a href="productshow.jsp?id=<%=p.getId() %>"
					target="_blank">
					<img src="imgs/products/<%=p.getId() %>.jpg" height="350" width="385"></a>
					<div class="con">
						<p class="name">
							<a href="productshow.jsp?id=<%=p.getId() %>" target="_blank">HOT!!-<%=p.getName() %></a>
						</p>
						<p class="ex">
							<span class="price">￥<%=p.getMemberprice() %></span>
						</p>

						<div class="intro">
							<!--<span class="name-img1#0099b0"><img src="/statics/ad/m001.jpg" /> 风言风语</span>-->
						</div>
					</div> <a href="productshow.jsp?id=<%=p.getId() %>" target="_blank"><p class="info">
							●会员价： <%=p.getMemberprice() %><br> ●市场价： <%=p.getNormalprice() %><br> ●产品描述： <%=p.getDescr() %><br> ●发售日期：
										<%=p.getPdate() %><br>
						</p></a>
				</li>
		<!--products over -->
				<%
					}
				%>





	<script src="imgs/layer.js"></script>
	<script type="text/javascript">
		function public_login() {
			var publicLogin = layer.open({
				type : 1,
				title : false,
				closeBtn : 0,
				shadeClose : true,
				skin : 'public-lr',
				content : $('#public-login-box')
			});
			layer.style(publicLogin, {
				width : 'auto'
			});
		}

		function public_reg() {
			var publicReg = layer.open({
				type : 1,
				title : false,
				closeBtn : 0,
				shadeClose : true,
				skin : 'public-lr',
				content : $('#public-reg-box')
			});
			layer.style(publicReg, {
				width : 'auto'
			});
		}
	</script>
	<script>
		var linkreg = "/passport-signup_ajax_check_name.html";
	</script>
	<script type="text/javascript" src="imgs/head_login_reg.js"></script>

	<div style="display: none;">
		<script>
			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "//hm.baidu.com/hm.js?285fc3052efc11334b80ae350c0b00f7";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
		</script>
	</div>


	<script>
		$('.nftshare4').on('mouseover', function(event) {
			var obj = this;
			$("#weixinfenxiangcontentnongweixin").show();
		}).on('mouseout', function(event) {
			var obj = this;
			$("#weixinfenxiangcontentnongweixin").hide();
		});
	</script>
	<script>
		var url_self = GetPageName();
		$('.n-nav a').each(
				function() {
					var self_p_obj = $(this).parent();
					var reg_url = new RegExp(url_self.replace(/\./, '\\.'));
					if (url_self != '' && url_self != '/'
							&& url_self != 'index.php'
							&& reg_url.test($(this).attr('href'))) {
						self_p_obj.addClass('hover').siblings().removeClass(
								'hover');
					}
				});
		//获取页面文件名 
		function GetPageName() {
			var path_name = window.location.href.split('/').pop();
			path_name = (path_name.match(/\?/) !== -1) ? path_name.split("?")[0]
					: path_name;
			return path_name;
		}
	</script>
	<script src="imgs/head-nav.js"></script>
</body>
</html>