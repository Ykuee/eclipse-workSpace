<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.text.StyledEditorKit.BoldAction"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>

<%
	String admin = (String) session.getAttribute("admin");
	if (admin != null && admin.equals("true"))
		login = true;
%>

<%!String str = "";
	boolean login = false;

	private void tree(Connection conn, int id, int level) {
		Statement stmt = null;
		ResultSet rs = null;
		String block = "";

		try {
			stmt = conn.createStatement();
			String sql = "select * from article where pid = " + id;
			rs = stmt.executeQuery(sql);
			String strLogin = "";
			while (rs.next()) {
				if (login) {
					strLogin = "<td><a href='Dele.jsp?id=" + rs.getInt("id") + "&pid=" + rs.getInt("pid")
							+ "' >删除</a></td>";
				}
				str += "<tr><td>" + rs.getInt("id") + "</td><td><a href ='ShowCont.jsp?id=" + rs.getInt("id") + "'>"
						+ block + rs.getString("title") + "</a></td>" + strLogin + "</tr>";
				if (rs.getInt("isleaf") != 0) {
					tree(conn, rs.getInt("id"), level + 1);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
					stmt = null;

				}
				if (rs != null) {
					rs.close();
					rs = null;

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
	Connection conn = DriverManager.getConnection(url);
	Statement stmt = conn.createStatement();
	String sql = "select * from article where pid = 0";
	ResultSet rs = stmt.executeQuery(sql);
	String strLogin = "";

%>

	



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class=" widthauto" xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="imgs/hm.js"></script>
<script src="imgs/ODQ1MjAwNA.js" charset="GBK" type="text/javascript"></script>
<script src="imgs/detect.json" id="_1472374001521_7373"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<title>上古卷轴5 </title> <script src="imgs/fm.js" async=""	type="text/javascript"></script>
	<script type="text/javascript" src="imgs/m.js"></script>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<script type="text/javascript">
			(function() {
				_fmOpt = {
					partner : 'bbs_3dmgame_com',
					appName : 'bbs_3dmgame_com_web',
					token : 'prmkqqsfmcr0veu3ibnafnb1a0'
				};
				var cimg = new Image(1, 1);
				cimg.onload = function() {
					_fmOpt.imgLoaded = true;
				};
				cimg.src = "https://fp.fraudmetrix.cn/fp/clear.png?partnerCode=bbs_3dmgame_com&appName=bbs_3dmgame_com_web&tokenId="
						+ _fmOpt.token;
				var fm = document.createElement('script');
				fm.type = 'text/javascript';
				fm.async = true;
				fm.src = ('https:' == document.location.protocol ? 'https://'
						: 'http://')
						+ 'static.fraudmetrix.cn/fm.js?ver=0.1&t='
						+ (new Date().getTime() / 3600000).toFixed(0);
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(fm, s);
			})();
		</script>
		<meta name="keywords" content="上古卷轴5,天际,中文,下载,攻略">
			<meta name="description"
				content="本专题论坛是国内最大的上古卷轴5：天际专题讨论版,有上古卷轴5：天际的中文版下载和上古卷轴5：天际的mod,攻略,新闻等内容 ">
				<meta name="generator" content="Discuz! X3.2">
					<meta name="author" content="Discuz! Team and Comsenz UI Team">
						<meta name="copyright" content="2001-2013 Comsenz Inc.">
							<meta name="MSSmartTagsPreventParsing" content="True">
								<meta http-equiv="MSThemeCompatible" content="Yes">
									<!-- base href="http://bbs.3dmgame.com/" -->
									<link rel="stylesheet" type="text/css"
										href="imgs/style_2_common.css">
										<link rel="stylesheet" type="text/css"
											href="imgs/style_2_forum_forumdisplay.css">
											<script type="text/javascript">
												var STYLEID = '2', STATICURL = 'static/', IMGDIR = 'static/image/common', VERHASH = 'N92', charset = 'GBK', discuz_uid = '8097581', cookiepre = 'uchome_2132_', cookiedomain = '', cookiepath = '/', showusercard = '1', attackevasive = '0', disallowfloat = 'newthread|reply', creditnotice = '1|贡献度|,2|金元|,3|银行存款|', defaultstyle = '', REPORTURL = 'aHR0cDovL2Jicy4zZG1nYW1lLmNvbS9mb3J1bS02ODUtMS5odG1s', SITEURL = 'http://bbs.3dmgame.com/', JSPATH = 'data/cache/', CSSPATH = 'data/cache/style_', DYNAMICURL = '';
											</script>
											<script src="imgs/common.js" type="text/javascript"></script>
											<meta name="application-name" content="3DMGAME论坛">
												<meta name="msapplication-tooltip" content="3DMGAME论坛">
													<meta name="msapplication-task"
														content="name=论坛;action-uri=http://bbs.3dmgame.com/forum.php;icon-uri=http://bbs.3dmgame.com/static/image/common/bbs.ico">
														<link rel="archives" title="YKUI"
															href="http://bbs.3dmgame.com/archiver/">
															<link rel="stylesheet" id="css_widthauto" type="text/css"
																href="imgs/style_2_widthauto.css">
																<script type="text/javascript">
																	HTMLNODE.className += ' widthauto'
																</script>
																<script src="imgs/forum.js" type="text/javascript"></script>
																<script src="imgs/smilies.js" charset="GBK"
																	id="YWPWYYWYDaYOIEHEaOXFOOjIbQJZabEJ"
																	type="text/javascript"></script>
</head>

<body id="nv_forum" class="pg_forumdisplay"
	onkeydown="if(event.keyCode==27) return false;">
	<div style="position: absolute; bottom: 0px;">
		<object type="application/x-shockwave-flash" wmode="transparent"
			data="imgs/clear.swf" id="fmFlash" style="visibility: hidden;"
			height="1" width="1">
			<param name="movie"
				value="http://static.fraudmetrix.cn/clear.swf?v1=2">
				<param name="allowScriptAccess" value="always">
					<param name="flashVars"
						value="sessionId=prmkqqsfmcr0veu3ibnafnb1a0&amp;partnerCode=bbs_3dmgame_com&amp;serviceUrl=fpflash.fraudmetrix.cn">
		</object>
	</div>
	<div id="append_parent">
		<div style="display: none; width: 80px;" class="sltm"
			id="typeid_fast_ctrl_menu">
		</div>
		<div class="sllt" style="display: none;" id="fastpostsml_menu">
			<div style="overflow: hidden;" id="fastpostsmiliesdiv">
				<div style="width: 288px;" id="fastpostsmiliesdiv_tb"
					class="tb tb_s cl">
					<ul>
						<li class="current" id="fastpoststype_1"
							onclick="smilies_switch('fastpostsmiliesdiv', '8', 1, 1, 'fastpost');if(CURRENTSTYPE) {$('fastpoststype_'+CURRENTSTYPE).className='';}this.className='current';CURRENTSTYPE=1;doane(event);"><a
							href="javascript:;" hidefocus="true">默认</a></li>
						<li id="fastpoststype_2"
							onclick="smilies_switch('fastpostsmiliesdiv', '8', 2, 1, 'fastpost');if(CURRENTSTYPE) {$('fastpoststype_'+CURRENTSTYPE).className='';}this.className='current';CURRENTSTYPE=2;doane(event);"><a
							href="javascript:;" hidefocus="true">酷猴</a></li>
						<li id="fastpoststype_3"
							onclick="smilies_switch('fastpostsmiliesdiv', '8', 3, 1, 'fastpost');if(CURRENTSTYPE) {$('fastpoststype_'+CURRENTSTYPE).className='';}this.className='current';CURRENTSTYPE=3;doane(event);"><a
							href="javascript:;" hidefocus="true">洋葱头</a></li>
					</ul>
				</div>
				<div id="fastpostsmiliesdiv_data">
					<table id="fastpostsmiliesdiv_table" cellpadding="0"
						cellspacing="0">
						<tbody>
							<tr>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':)')"
									id="fastpostsmilie_1_td"><img id="smilie_1"
									src="imgs/smile.gif" alt=":)" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':(')"
									id="fastpostsmilie_2_td"><img id="smilie_2"
									src="imgs/sad.gif" alt=":(" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':D')"
									id="fastpostsmilie_3_td"><img id="smilie_3"
									src="imgs/biggrin.gif" alt=":D" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':\'(')"
									id="fastpostsmilie_4_td"><img id="smilie_4"
									src="imgs/cry.gif" alt=":'(" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':@')"
									id="fastpostsmilie_5_td"><img id="smilie_5"
									src="imgs/huffy.gif" alt=":@" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':o')"
									id="fastpostsmilie_6_td"><img id="smilie_6"
									src="imgs/shocked.gif" alt=":o" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':P')"
									id="fastpostsmilie_7_td"><img id="smilie_7"
									src="imgs/tongue.gif" alt=":P" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':$')"
									id="fastpostsmilie_8_td"><img id="smilie_8"
									src="imgs/shy.gif" alt=":$" height="20" width="20"></td>
							</tr>
							<tr>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ';P')"
									id="fastpostsmilie_9_td"><img id="smilie_9"
									src="imgs/titter.gif" alt=";P" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':L')"
									id="fastpostsmilie_10_td"><img id="smilie_10"
									src="imgs/sweat.gif" alt=":L" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':Q')"
									id="fastpostsmilie_11_td"><img id="smilie_11"
									src="imgs/mad.gif" alt=":Q" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':lol')"
									id="fastpostsmilie_12_td"><img id="smilie_12"
									src="imgs/lol.gif" alt=":lol" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':loveliness:')"
									id="fastpostsmilie_13_td"><img id="smilie_13"
									src="imgs/loveliness.gif" alt=":loveliness:" height="20"
									width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':funk:')"
									id="fastpostsmilie_14_td"><img id="smilie_14"
									src="imgs/funk.gif" alt=":funk:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':curse:')"
									id="fastpostsmilie_15_td"><img id="smilie_15"
									src="imgs/curse.gif" alt=":curse:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':dizzy:')"
									id="fastpostsmilie_16_td"><img id="smilie_16"
									src="imgs/dizzy.gif" alt=":dizzy:" height="20" width="20"></td>
							</tr>
							<tr>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':shutup:')"
									id="fastpostsmilie_17_td"><img id="smilie_17"
									src="imgs/shutup.gif" alt=":shutup:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':sleepy:')"
									id="fastpostsmilie_18_td"><img id="smilie_18"
									src="imgs/sleepy.gif" alt=":sleepy:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':hug:')"
									id="fastpostsmilie_19_td"><img id="smilie_19"
									src="imgs/hug.gif" alt=":hug:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':victory:')"
									id="fastpostsmilie_20_td"><img id="smilie_20"
									src="imgs/victory.gif" alt=":victory:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':time:')"
									id="fastpostsmilie_21_td"><img id="smilie_21"
									src="imgs/time.gif" alt=":time:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':kiss:')"
									id="fastpostsmilie_22_td"><img id="smilie_22"
									src="imgs/kiss.gif" alt=":kiss:" height="20" width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':handshake')"
									id="fastpostsmilie_23_td"><img id="smilie_23"
									src="imgs/handshake.gif" alt=":handshake" height="20"
									width="20"></td>
								<td
									onmouseover="smilies_preview('fastpost', 'fastpostsmiliesdiv', this, 20)"
									onclick="seditor_insertunit('fastpost', ':call:')"
									id="fastpostsmilie_24_td"><img id="smilie_24"
									src="imgs/call.gif" alt=":call:" height="20" width="20"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="sllt_p" id="fastpostsmiliesdiv_page"></div>
			</div>
		</div>
		<script src="imgs/common_smilies_var.js" charset="GBK"
			type="text/javascript"></script>
	</div>
	<div id="ajaxwaitid"></div>
	<div id="toptb" class="cl">
		<div class="wp">
			<div class="z" style="display: none;">
				<a href="javascript:;"
					onclick="setHomepage('http://bbs.3dmgame.com/');">设为首页</a><a
					href="http://bbs.3dmgame.com/"
					onclick="addFavorite(this.href, '3DMGAME论坛');return false;">收藏本站</a>
				<script type="text/javascript">
					var _speedMark = new Date();
				</script>
			</div>
			<div class="y" style="display: none;">
				<a id="switchblind" href="javascript:;" onclick="toggleBlind(this)"
					title="开启辅助访问" class="switchblind">开启辅助访问</a>
			</div>
		</div>
	</div>
	<ul id="myitem_menu" class="p_pop" style="display: none;">
		<li><a
			href="http://bbs.3dmgame.com/forum.php?mod=guide&amp;view=my">帖子</a></li>
		<li><a
			href="http://bbs.3dmgame.com/home.php?mod=space&amp;do=favorite&amp;view=me">收藏</a></li>
		<li><a
			href="http://bbs.3dmgame.com/home.php?mod=space&amp;do=friend">好友</a></li>
	</ul>
	<div id="qmenu_menu" class="p_pop " style="display: none;">
		<ul class="cl nav">
			<li><a
				href="http://bbs.3dmgame.com/home.php?mod=space&amp;do=friend"
				style="background-image: url(http://bbs.3dmgame.com/static/image/feed/friend_b.png) !important">好友</a></li>
			<li><a
				href="http://bbs.3dmgame.com/forum.php?mod=guide&amp;view=my"
				style="background-image: url(http://bbs.3dmgame.com/static/image/feed/thread_b.png) !important">帖子</a></li>
			<li><a
				href="http://bbs.3dmgame.com/home.php?mod=space&amp;do=favorite&amp;view=me"
				style="background-image: url(http://bbs.3dmgame.com/static/image/feed/favorite_b.png) !important">收藏</a></li>
			<li><a href="http://bbs.3dmgame.com/home.php?mod=magic"
				style="background-image: url(http://bbs.3dmgame.com/static/image/feed/magic_b.png) !important">道具</a></li>
			<li><a href="http://bbs.3dmgame.com/home.php?mod=medal"
				style="background-image: url(http://bbs.3dmgame.com/static/image/feed/medal_b.png) !important">勋章</a></li>
			<li><a href="http://bbs.3dmgame.com/home.php?mod=task"
				style="background-image: url(http://bbs.3dmgame.com/static/image/feed/task_b.png) !important">任务</a></li>
		</ul>
		<div id="fjump_menu" class="btda"></div>
	</div>
	<table class="hd_table" align="center" border="0" cellpadding="0"
		cellspacing="0" width="98%">
		<tbody>
			<tr>
				<!-- -->
				<td width="15"><img src="imgs/top_1_l.gif" height="55"
					width="15"></td>
				<td
					background="imgs/top_1_c.gif"><table
						border="0" cellpadding="0" cellspacing="0" height="55" width="98%">

						<tbody>
							<tr>
								<td rowspan="2" align="left" valign="top" width="19%"><img
									longdesc="" src="imgs/logo_3dm.jpg" alt="3DMGAME" height="53"
									width="183"></td>
							</tr>
							<tr>
								<td align="left" height="24" valign="center"><span
									style="height: 10px;"></span></td>
							</tr>
						</tbody>
					</table></td>
				<td width="15"><img src="imgs/top_1_r.gif" height="55"
					width="15"></td>
			</tr>
		</tbody>
	</table>
	<div class="wp a_h">
		<center>
		</center>
	</div>
	<div id="wp" class="wp">
		<style id="diy_style" type="text/css"></style>
		<!--[diy=diynavtop]-->
		<div id="diynavtop" class="area"></div>
		<!--[/diy]-->
		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area"></div>
			<!--[/diy]-->
		</div>
		<div class="boardnav">
			<div id="ct" class="wp cl">

				<div class="mn">
					<div class="bm bml pbn"></div>


					<div class="bm bmw fl">
						<div id="subforum_685" class="bm_c" style=""></div>
					</div>
					<div class="drag">
						<!--[diy=diy4]-->
						<div id="diy4" class="area"></div>
						<!--[/diy]-->
					</div>




					<div id="pgt" class="bm bw0 pgs cl">
						<span id="fd_page_top"><div class="pg">
								<strong>1</strong><a
									href="http://bbs.3dmgame.com/forum-685-2.html">2</a><a
									href="http://bbs.3dmgame.com/forum-685-3.html">3</a><a
									href="http://bbs.3dmgame.com/forum-685-4.html">4</a><a
									href="http://bbs.3dmgame.com/forum-685-5.html">5</a><a
									href="http://bbs.3dmgame.com/forum-685-6.html">6</a><a
									href="http://bbs.3dmgame.com/forum-685-7.html">7</a><a
									href="http://bbs.3dmgame.com/forum-685-8.html">8</a><a
									href="http://bbs.3dmgame.com/forum-685-9.html">9</a><a
									href="http://bbs.3dmgame.com/forum-685-10.html">10</a><a
									href="http://bbs.3dmgame.com/forum-685-1000.html" class="last">...
									4606</a><label><input name="custompage" class="px" size="2"
									title="输入页码，按回车快速跳转" value="1"
									onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=forumdisplay&amp;fid=685&amp;page='+this.value;; doane(event);}"
									type="text"><span title="共 1000 页"> / 1000 页</span></label><a
									href="http://bbs.3dmgame.com/forum-685-2.html" class="nxt">下一页</a>
							</div></span> <span class="pgb y" id="visitedforums"
							onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'34'})"><a
							href="http://bbs.3dmgame.com/forum.php">返&nbsp;回</a></span> <a
							href="Post.jsp" title="发新帖"><img src="imgs/pn_post.png" alt="发新帖"></a>
					</div>
					<script type="text/javascript">
						showTypes('thread_types');
					</script>
					<div id="threadlist" class="tl bm bmw" style="position: relative;">
						<div class="th">
							<table cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<th colspan="2">
											<div class="tf">
												<span id="atarget" onclick="setatarget(1)" class="y"
													title="在新窗口中打开帖子">新窗</span> <a id="filter_special"
													href="javascript:;" class="showmenu xi2"
													onclick="showMenu(this.id)">全部主题</a>&nbsp; <a
													href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=lastpost&amp;orderby=lastpost"
													class="xi2">最新</a>&nbsp; <a
													href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=heat&amp;orderby=heats"
													class="xi2">热门</a>&nbsp; <a
													href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=hot"
													class="xi2">热帖</a>&nbsp; <a
													href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=digest&amp;digest=1"
													class="xi2">精华</a>&nbsp; <a id="filter_dateline"
													href="javascript:;" class="showmenu xi2"
													onclick="showMenu(this.id)">更多</a>&nbsp; <span
													id="clearstickthread" style="display: none;"> <span
													class="pipe">|</span> <a href="javascript:;"
													onclick="clearStickThread()" class="xi2" title="显示置顶">显示置顶</a>
												</span>
											</div>
										</th>
										<td class="by">作者</td>
										<td class="num">回复/查看</td>
										<td class="by">最后发表</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="bm_c">
							<script type="text/javascript">
								var lasttime = 1472373996;
								var listcolspan = '5';
							</script>
							<div id="forumnew" style="display: none"></div>
							<form method="post" autocomplete="off" name="moderate"
								id="moderate"
								action="forum.php?mod=topicadmin&amp;action=moderate&amp;fid=685&amp;infloat=yes&amp;nopost=yes">
								<input name="formhash" value="1a979a41" type="hidden"> <input
									name="listextra" value="page%3D1" type="hidden">
										<table summary="forum_685" id="threadlisttableid"
											cellpadding="0" cellspacing="0">
						
	<%
	while (rs.next()) {
		if (login) {
			strLogin = "<td><a href='Dele.jsp?id=" + rs.getInt("id") + "&pid=" + rs.getInt("pid")
					+ "' >删除</a></td>";
		}
%>
											
                    <tbody >
                    <tr>
                    <td class="icn">
                    <a href="" title="" >
                    <img src="imgs/folder_new.gif">
                    </a>
                    </td>
                    <th class="new">
                    <em><a href ="sgjzre.jsp?id=<%=rs.getInt("id")%>&rootid=<%=rs.getInt("rootid") %>" style='font-weight: bold;color: #3C5A40;' onclick='atarget(this)' class='s xst'> <%=rs.getString("title")%></a><%=strLogin%>
                    </th>
                    <td class="by">
                    <cite>
                    <a mid="card_3731" href="" c="1" style="color: #9E4ED3;">YKUI</a></cite>
                    <em><span>2016-8-27 19:47</span></em>
                    </td>
                    <td class="num"><a href="" class="xi2">233</a><em>20342</em></td>
                    <td class="by">
                     <cite><a mid="card_4130" href="" c="1">Darling HR</a></cite>
                    <em><a href=""><%=new SimpleDateFormat("yyyy-MM-dd ").format(rs.getDate("pdate")) %></a></em>
                    </td>
                    </tr>
                    </tbody>
                    
 <%
}
%>
   						
                   

										</table> <!-- end of table "forum_G[fid]" branch 1/3 -->
							</form>
						</div>
					</div>
					<div id="filter_reward_menu" class="p_pop" style="display: none"
						change="forum.php?mod=forumdisplay&amp;fid=685&amp;filter=specialtype&amp;specialtype=reward&amp;rewardtype='+$('filter_reward').value">
						<ul>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=specialtype&amp;specialtype=reward">全部悬赏</a></li>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=specialtype&amp;specialtype=reward&amp;rewardtype=1">进行中</a></li>
						</ul>
					</div>
					<div id="filter_dateline_menu" class="p_pop" style="display: none">
						<ul class="pop_moremenu">
							<li>排序: <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=author&amp;orderby=dateline">发帖时间</a><span
								class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=reply&amp;orderby=replies">回复/查看</a><span
								class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=reply&amp;orderby=views">查看</a>
							</li>
							<li>时间: <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;orderby=lastpost&amp;filter=dateline"
								class="xw1">全部时间</a><span class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=86400">一天</a><span
								class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=172800">两天</a><span
								class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=604800">一周</a><span
								class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=2592000">一个月</a><span
								class="pipe">|</span> <a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=7948800">三个月</a>
							</li>
						</ul>
					</div>
					<div id="filter_orderby_menu" class="p_pop" style="display: none">
						<ul>
							<li><a href="http://bbs.3dmgame.com/forum-685-1.html">默认排序</a></li>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=author&amp;orderby=dateline">发帖时间</a></li>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=reply&amp;orderby=replies">回复/查看</a></li>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=reply&amp;orderby=views">查看</a></li>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=lastpost&amp;orderby=lastpost">最后发表</a></li>
							<li><a
								href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=heat&amp;orderby=heats">热门</a></li>
						</ul>
					</div>
					<a class="bm_h" href="javascript:;"
						rel="forum.php?mod=forumdisplay&amp;fid=685&amp;page=2"
						curpage="1" id="autopbn" totalpage="1000" picstyle="0"
						forumdefstyle="">下一页 ?</a>
					<script src="imgs/autoloadpage.js" type="text/javascript"></script>
					<div class="bm bw0 pgs cl">
						<span id="fd_page_bottom"><div class="pg"><strong>1</strong><a href="http://bbs.3dmgame.com/forum-685-2.html">2</a><a href="http://bbs.3dmgame.com/forum-685-3.html">3</a><a href="http://bbs.3dmgame.com/forum-685-4.html">4</a><a href="http://bbs.3dmgame.com/forum-685-5.html">5</a><a href="http://bbs.3dmgame.com/forum-685-6.html">6</a><a href="http://bbs.3dmgame.com/forum-685-7.html">7</a><a href="http://bbs.3dmgame.com/forum-685-8.html">8</a><a href="http://bbs.3dmgame.com/forum-685-9.html">9</a><a href="http://bbs.3dmgame.com/forum-685-10.html">10</a><a href="http://bbs.3dmgame.com/forum-685-1000.html" class="last">...
									10</a>
						  <label><input name="custompage" class="px" size="2"
									title="输入页码，按回车快速跳转" value="1"
									onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=forumdisplay&amp;fid=685&amp;page='+this.value;; doane(event);}"
									type="text"><span title="共 1000 页"> / 1000 页</span></label><a
									href="http://bbs.3dmgame.com/forum-685-2.html" class="nxt">下一页</a>
							</div></span> <span id="visitedforumstmp"
							onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'21'})"
							class="pgb y"><a href="http://bbs.3dmgame.com/forum.php">返&nbsp;回</a></span>
					</div>
					<!--[diy=diyfastposttop]-->
					<div id="diyfastposttop" class="area"></div>
					<!--[/diy]-->
					<script type="text/javascript">
						var postminchars = parseInt('10');
						var postmaxchars = parseInt('50000');
						var disablepostctrl = parseInt('0');
						var fid = parseInt('685');
					</script>
					<!--[diy=diyforumdisplaybottom]-->
					<div id="diyforumdisplaybottom" class="area"></div>
					<!--[/diy]-->
				</div>

			</div>
		</div>
		<div id="visitedforums_menu" class="p_pop blk cl"
			style="display: none;">
			<table cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td id="v_forums">
							<h3 class="mbn pbn bbda xg1">浏览过的版块</h3>
							<ul class="xl xl1">
								<li><a href="http://bbs.3dmgame.com/forum-1153-1.html">《唐老鸭历险记》</a></li>
								<li><a href="http://bbs.3dmgame.com/gta">《侠盗猎车4》</a></li>
								<li><a href="http://bbs.3dmgame.com/forum-1330-1.html">《模拟人生4》</a></li>
								<li><a href="http://bbs.3dmgame.com/forum-1468-1.html">《铲子骑士》</a></li>
								<li><a href="http://bbs.3dmgame.com/forum-248-1.html">PC独立游戏讨论区</a></li>
								<li><a href="http://bbs.3dmgame.com/forum-406-1.html">游戏杂谈区</a></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			document.onkeyup = function(e) {
				keyPageScroll(
						e,
						0,
						1,
						'forum.php?mod=forumdisplay&fid=685&filter=&orderby=lastpost&',
						1);
			}
		</script>
		<script type="text/javascript">
			checkForumnew_handle = setTimeout(function() {
				checkForumnew(685, lasttime);
			}, checkForumtimeout);
		</script>
		<div class="wp mtn">
			<!--[diy=diy3]-->
			<div id="diy3" class="area"></div>
			<!--[/diy]-->
		</div>
		<script>
			fixed_top_nv();
		</script>
	</div>

	<div id="ft" class="wp cl"></div>

	<script src="imgs/html5notification.js" type="text/javascript"></script>
	<div style="left: auto; right: 0px; visibility: visible;"
		id="scrolltop">
		<span hidefocus="true"><a title="返回顶部"
			onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a></span>
		<span> <a href="http://bbs.3dmgame.com/forum.php"
			hidefocus="true" class="returnboard" title="返回版块"><b>返回版块</b></a>
		</span>
	</div>
	<script type="text/javascript">
		_attachEvent(window, 'scroll', function() {
			showTopLink();
		});
		checkBlind();
	</script>
	<div id="discuz_tips" style="display: none;"></div>
	<script type="text/javascript">
		var tipsinfo = '8452004|X3.2|0.6||0|1B848ED26F970B5644FCDD5E26216259|8097581|11|1472373996|d6f368995d6f08318f6ba89f78bb9bdb|2';
	</script>
	<script src="imgs/discuz_tips.js" type="text/javascript" charset="GBK"></script>

</body>
</html>