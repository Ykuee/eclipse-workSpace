<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page import="java.util.*"%>
<%@page import="java.io.Writer"%>
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ysnc.DB, com.ysnc.Article, java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class=" widthauto" xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.onload = function() {
		CKEDITOR.replace('cont');
	};
</script>
<script src="imgs/hm.js"></script>
<script src="imgs/ODQ1MjAwNA.js" charset="GBK" type="text/javascript"></script>
<script src="imgs/detect.json" id="_1472387329244_8859"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<%
		String admin = (String) session.getAttribute("admin");
		if (admin != null && admin.equals("true"))
			login = true;
	%>

	<title>帖子内容</title> <script type="text/javascript" src="imgs/m.js"></script>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<link href="http://bbs.3dmgame.com/thread-5270467-1-1.html"
			rel="canonical">
			<meta name="keywords" content="在上古卷轴5里实现计算器功能。">
				<meta name="description" content="在上古卷轴5里实现计算器功能。 ,3DMGAME论坛">
					<meta name="generator" content="Discuz! X3.2">
						<meta name="author" content="Discuz! Team and Comsenz UI Team">
							<meta name="copyright" content="2001-2013 Comsenz Inc.">
								<meta name="MSSmartTagsPreventParsing" content="True">
									<meta http-equiv="MSThemeCompatible" content="Yes">
										<!-- base href="http://bbs.3dmgame.com/" -->
										<link rel="stylesheet" type="text/css"
											href="imgs/style_2_common.css">
											<link rel="stylesheet" type="text/css"
												href="imgs/style_2_forum_viewthread.css">
												<script type="text/javascript">
													var STYLEID = '2', STATICURL = 'static/', IMGDIR = 'static/image/common', VERHASH = 'N92', charset = 'utf-8', discuz_uid = '8097581', cookiepre = 'uchome_2132_', cookiedomain = '', cookiepath = '/', showusercard = '1', attackevasive = '0', disallowfloat = 'newthread|reply', creditnotice = '1|贡献度|,2|金元|,3|银行存款|', defaultstyle = '', REPORTURL = 'aHR0cDovL2Jicy4zZG1nYW1lLmNvbS90aHJlYWQtNTI3MDQ2Ny0xLTEuaHRtbA==', SITEURL = 'http://bbs.3dmgame.com/', JSPATH = 'data/cache/', CSSPATH = 'data/cache/style_', DYNAMICURL = '';
												</script>
												<script src="imgs/common.js" type="text/javascript"></script>
												<meta name="application-name" content="3DMGAME论坛">
													<meta name="msapplication-tooltip" content="3DMGAME论坛">
														<meta name="msapplication-task"
															content="name=论坛;action-uri=http://bbs.3dmgame.com/forum.php;icon-uri=http://bbs.3dmgame.com/static/image/common/bbs.ico">
															<link rel="archives" title="3DMGAME论坛"
																href="http://bbs.3dmgame.com/archiver/">
																<link rel="stylesheet" id="css_widthauto"
																	type="text/css" href="imgs/style_2_widthauto.css">
																	<script type="text/javascript">
																		HTMLNODE.className += ' widthauto'
																	</script>
																	<script src="imgs/forum.js" type="text/javascript"></script>
																	<script src="imgs/smilies.js" charset="GBK"
																		id="YWPWYYWYDaYOIEHEaOXFOOjIbQJZabEJ"
																		type="text/javascript"></script>
</head>

<body id="nv_forum" class="pg_viewthread"
	onkeydown="if(event.keyCode==27) return false;">



	<table class="hd_table" align="center" border="0" cellpadding="0"
		cellspacing="0" width="98%">
		<tbody>
			<tr>
				<!-- -->
				<td width="15"><img src="imgs/top_1_l.gif" height="55"
					width="15"></td>
				<td background="imgs/top_1_c.gif"><table border="0"
						cellpadding="0" cellspacing="0" height="55" width="98%">

						<tbody>
							<tr>
								<td width="19%" height="55" align="left" valign="top"><img
									longdesc="" src="imgs/logo_3dm.jpg" alt="3DMGAME" height="53"
									width="183"></td>
							</tr>
						</tbody>
					</table></td>
				<td width="15"><img src="imgs/top_1_r.gif" height="55"
					width="15"></td>
			</tr>
		</tbody>
	</table>
	<div class="wp a_h">
		<center></center>
	</div>
	<div id="hd">
		<div class="wp">
			<div id="h_nv"></div>
			<div class="p_pop h_pop" id="mn_userapp_menu" style="display: none"></div>
			<div id="mu" class="cl"></div>
			<ul id="scbar_type_menu" class="p_pop" style="display: none;">
				<li><a href="javascript:;" rel="curforum" fid="685">本版</a></li>
				<li><a href="javascript:;" rel="forum" class="curtype">帖子</a></li>
				<li><a href="javascript:;" rel="user">用户</a></li>
			</ul>
			<script type="text/javascript">
				initSearchmenu('scbar', '');
			</script>
		</div>
	</div>


	<div id="wp" class="wp">
		<script type="text/javascript">
			var fid = parseInt('685'), tid = parseInt('5270467');
		</script>

		<script src="imgs/forum_viewthread.js" type="text/javascript"></script>
		<script type="text/javascript">
			zoomstatus = parseInt(1);
			var imagemaxwidth = '1024';
			var aimgcount = new Array();
		</script>

		<style id="diy_style" type="text/css"></style>
		<!--[diy=diynavtop]-->
		<div id="diynavtop" class="area"></div>
		<!--[/diy]-->

		<style id="diy_style" type="text/css"></style>
		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area"></div>
			<!--[/diy]-->
		</div>
		<%
			int id = Integer.parseInt(request.getParameter("id"));
			int rootid = Integer.parseInt(request.getParameter("rootid"));
			List<Article> article = new ArrayList<Article>();
			
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/bbs?user=root&password=123456&useSSL=true";
			Connection conn = DriverManager.getConnection(url);
			Statement stmt = conn.createStatement();
			/*
			Connection conn = DB.getConn();
			System.out.println("sdfasdfasdfasdsdf");
			Statement stmt = DB.getStmt(conn);
			System.out.println("sdfasdfasdfasdsdf1");
			*/
			String sql = "select * from article where id =" + id;
			ResultSet rs = DB.getRs(stmt, sql);
			rs.next();
			String strLogin = "";
			//str += "<tr><td>主题：" + rs.getString("title") + "</td></tr>";
			//str += "<tr><td>内容：" + rs.getString("cont") + "</td></tr>";
		%>
		<div id="ct" class="wp cl">
			<div id="pgt" class="pgs mbm cl ">
				<div class="pgt"></div>
				<span class="y pgb" id="visitedforums"
					onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'34'})">
					<a href="sgjz.jsp">返回列表</a>
				</span> <a href="Post.jsp" title="发新帖"><img src="imgs/pn_post.png"
					alt="发新帖"></a><a
					href="Reply.jsp?id=<%=id%>&rootid=<%=rs.getInt("rootid")%>&title=<%=rs.getString("title")%>"
					title="回复"><img src="imgs/pn_reply.png" alt="回复"></a>
			</div>





			<div id="postlist" class="pl bm">
				<table cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="pls ptn pbn">
								<div class="hm ptn">
									<span class="xg1">查看:</span> <span class="xi1">3</span><span
										class="pipe">|</span><span class="xg1">回复:</span> <span
										class="xi1">0</span>
								</div>
							</td>
							<td class="plc ptm pbn vwthd">
								<h1 class="ts">
									<a
										href="http://bbs.3dmgame.com/forum.php?mod=forumdisplay&amp;fid=685&amp;filter=typeid&amp;typeid=5926">[讨论]</a>

									<span id="thread_subject"><%=rs.getString("title")%></span>
								</h1> <span class="xg1"> <a
									href="http://bbs.3dmgame.com/thread-5270467-1-1.html"
									onclick="return copyThreadUrl(this, '3DMGAME论坛')">[复制链接]</a>

							</span>
								<td><a
									href="Reply.jsp?id=<%=rs.getInt("id")%>&rootid=<%=rs.getInt("rootid")%>&title=<%=rs.getString("title")%>">回复本楼</a></td>
							</td>
						</tr>
					</tbody>
				</table>


				<table class="ad" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="pls"></td>
							<td class="plc"></td>
						</tr>
					</tbody>
				</table>
				<div id="post_170172091">
					<table id="pid170172091" class="plhin" summary="pid170172091"
						cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="pls" rowspan="2">
									<div id="favatar170172091" class="pls favatar">
										<a name="lastpost"></a>
										<div class="pi">
											<div class="authi">
												<a href="http://bbs.3dmgame.com/space-uid-1988087.html"
													target="_blank" class="xw1" style="color: #000000">Ykkk</a>
											</div>
										</div>
										<div class="p_pop blk bui card_gender_0"
											id="userinfo170172091"
											style="display: none; margin-top: -11px;">
											<div class="m z">
												<div id="userinfo170172091_ma"></div>
											</div>
											<div class="i y">
												<div>
													<strong><a
														href="http://bbs.3dmgame.com/space-uid-1988087.html"
														target="_blank" class="xi2" style="color: #000000">Ykkk</a></strong>
													<em>当前在线</em>
												</div>
												<dl class="cl">
													<dt>积分</dt>
													<dd>
														<a
															href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
															target="_blank" class="xi2">430</a>
													</dd>
												</dl>
												<div class="imicn">
													<a
														href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
														target="_blank" title="查看详细资料"><img
														src="imgs/userinfo.gif" alt="查看详细资料"></a>
												</div>
												<div id="avatarfeed">
													<span id="threadsortswait"></span>
												</div>
											</div>
										</div>
										<div>
											<div class="avatar"
												onmouseover="showauthor(this, 'userinfo170172091')">
												<a href="http://bbs.3dmgame.com/space-uid-1988087.html"
													class="avtm" target="_blank"><img lazyloaded="true"
													src="imgs/87_avatar_middle.jpg"
													file="http://user.3dmgame.com/data/avatar/001/98/80/87_avatar_middle.jpg"
													height="101" width="130"></a>
											</div>
										</div>
										<div class="tns xg2">
											<table cellpadding="0" cellspacing="0">
												<tbody>
													<tr>
														<th><p>
																<a
																	href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=thread&amp;type=thread&amp;view=me&amp;from=space"
																	class="xi2">38</a>
															</p>主题</th>
														<th><p>
																<a
																	href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=thread&amp;type=reply&amp;view=me&amp;from=space"
																	class="xi2">405</a>
															</p>帖子</th>
														<td><p>
																<a
																	href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
																	class="xi2">430</a>
															</p>积分</td>
													</tr>
												</tbody>
											</table>
										</div>

										<p>
											<em><a
												href="http://bbs.3dmgame.com/home.php?mod=spacecp&amp;ac=usergroup&amp;gid=13"
												target="_blank"><font color="#000000">高级玩家</font></a></em>
										</p>


										<p>
											<span id="g_up170172091"
												onmouseover="showMenu({'ctrlid':this.id, 'pos':'12!'});"><img
												src="imgs/star_level3.gif" alt="Rank: 4"></span>
										</p>
										<div id="g_up170172091_menu" class="tip tip_4"
											style="display: none;">
											<div class="tip_horn"></div>
											<div class="tip_c">
												<font color="#000000">高级玩家</font>, 积分 430, 距离下一级还需 170 积分
											</div>
										</div>


										<p>
											<span class="pbg2" id="upgradeprogress_170172091"
												onmouseover="showMenu({'ctrlid':this.id, 'pos':'12!', 'menuid':'g_up170172091_menu'});"><span
												class="pbr2" style="width: 51%;"></span></span>
										</p>
										<div id="g_up170172091_menu" class="tip tip_4"
											style="display: none;">
											<div class="tip_horn"></div>
											<div class="tip_c">
												<font color="#000000">高级玩家</font>, 积分 430, 距离下一级还需 170 积分
											</div>
										</div>

										<dl class="pil cl">
											<dt>贡献度</dt>
											<dd>36</dd>
											<dt>金元</dt>
											<dd>2855</dd>
											<dt>积分</dt>
											<dd>
												<a
													href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
													target="_blank" class="xi2">430</a>
											</dd>
											<dt>精华</dt>
											<dd>0</dd>
											<dt>注册时间</dt>
											<dd>2009-7-6</dd>
										</dl>

										<dl class="pil cl"></dl>
										<ul class="xl xl2 o cl">
											<li class="pm2"><a
												href="http://bbs.3dmgame.com/home.php?mod=spacecp&amp;ac=pm&amp;op=showmsg&amp;handlekey=showmsg_1988087&amp;touid=1988087&amp;pmid=0&amp;daterange=2&amp;pid=170172091&amp;tid=5270467"
												onclick="showWindow('sendpm', this.href);" title="发消息"
												class="xi2">发消息</a></li>
										</ul>
									</div>
								</td>
								<td class="plc"><div class="pct">
										<style type="text/css">
.pcb {
	margin-right: 0
}
</style>
										<div class="pcb">

											<div class="t_fsz">
												<table cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<td class="t_f" id="postmessage_170172091"><%=rs.getString("cont")%></td>
														</tr>
													</tbody>

												</table>



											</div>
											<div id="comment_170172091" class="cm"></div>

											<div id="post_rate_div_170172091"></div>
										</div>
									</div></td>
							</tr>
							<tr>
							</tr>
							<tr id="_postposition170172091"></tr>
							<tr>
								<td class="pls"></td>
								<td class="plc" style="overflow: visible;">
									<div class="po hin">
										<div class="pob cl">
											<em> <a class="fastre"
												href="http://bbs.3dmgame.com/forum.php?mod=post&amp;action=reply&amp;fid=685&amp;tid=5270467&amp;reppost=170172091&amp;extra=page%3D1&amp;page=1"
												onclick="showWindow('reply', this.href)">回复</a>
											</em>

											<p>
												<a href="javascript:;"
													onclick="showWindow('miscreport170172091', 'misc.php?mod=report&amp;rtype=post&amp;rid=170172091&amp;tid=5270467&amp;fid=685', 'get', -1);return false;">举报</a>
											</p>

										</div>
									</div>
								</td>
							</tr>
							<tr class="ad">
								<td class="pls"></td>
								<td class="plc"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<%
					//out.println("<a href='Reply.jsp?id=" + rs.getInt("id") + "&rootid=" + rs.getInt("rootid") + "'>回复</a>");
					tree(article, conn, id, 0);
				%>

				<%!boolean login = false;

	private void tree(List<Article> article, Connection conn, int id, int level) {

		Statement stmt = DB.getStmt(conn);
		String sql = "select * from article where pid = " + id;
		ResultSet rs = DB.getRs(stmt, sql);
		
		try {

			while (rs.next()) {
				/*
				if (login) {
					strLogin = "<td><a href='Dele.jsp?id=" + rs.getInt("id") + "&pid=" + rs.getInt("pid")
							+ "' >删除</a></td>";
				
				}
				*/
				Article a = new Article();
				a.setCont(rs.getString("cont"));
				a.setId(rs.getInt("id"));
				a.setIsleaf(rs.getInt("isleaf") == 0 ? true : false);
				a.setPdate(rs.getDate("pdate"));
				a.setPid(rs.getInt("pid"));
				a.setRootid(rs.getInt("rootid"));
				a.setTitle(rs.getString("title"));
				a.setLevel(level + 1);
				article.add(a);

				if (!a.getIsleaf()) {
					tree(article, conn, a.getId(), level + 1);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			/*
						DB.close(conn);
						DB.close(rs);
						DB.close(stmt);
				*/
		}
	}%>

				<%
					for (Iterator<Article> it = article.iterator(); it.hasNext();) {
						Article a = it.next();
						if (login) {
							strLogin = "<td><a href='Dele.jsp?id=" + a.getId() + "&pid=" + a.getPid()
									+ "' >删除</a></td>";
						
						}
				%>


				<div id="postlist" class="pl bm">
					<table cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="pls ptn pbn">
									<div class="hm ptn">
										<span class="xg1">查看:</span> <span class="xi1">3</span><span
											class="pipe">|</span><span class="xg1">回复:</span> <span
											class="xi1">0</span>
									</div>
								</td>
								<td class="plc ptm pbn vwthd"><h1 class="ts">
										<a href="">[讨论]</a><span id="thread_subject"><%=a.getTitle()%></span>
									</h1></td>

								<td><a
									href="Reply.jsp?id=<%=a.getId()%>&rootid=<%=a.getRootid()%>&title=<%=rs.getString("title")%>">回复本楼</a>
							</td>
								<td>
									<%=strLogin %>
								</td>
								<td><%=new SimpleDateFormat("yyyy-MM-dd").format(a.getPdate())%></td>
							</tr>
						</tbody>
					</table>


					<table class="ad" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="pls"></td>
								<td class="plc"></td>
							</tr>
						</tbody>
					</table>
					<div id="post_170172091">
						<table id="pid170172091" class="plhin" summary="pid170172091"
							cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td class="pls" rowspan="2">
										<div id="favatar170172091" class="pls favatar">
											<a name="lastpost"></a>
											<div class="pi">
												<div class="authi">
													<a href="http://bbs.3dmgame.com/space-uid-1988087.html"
														target="_blank" class="xw1" style="color: #000000">guohaozhi</a>
												</div>
											</div>
											<div class="p_pop blk bui card_gender_0"
												id="userinfo170172091"
												style="display: none; margin-top: -11px;">
												<div class="m z">
													<div id="userinfo170172091_ma"></div>
												</div>
												<div class="i y">
													<div>
														<strong><a
															href="http://bbs.3dmgame.com/space-uid-1988087.html"
															target="_blank" class="xi2" style="color: #000000">Ykui</a></strong>
														<em>当前在线</em>
													</div>
													<dl class="cl">
														<dt>积分</dt>
														<dd>
															<a
																href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
																target="_blank" class="xi2">430</a>
														</dd>
													</dl>
													<div class="imicn">
														<a
															href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
															target="_blank" title="查看详细资料"><img
															src="imgs/userinfo.gif" alt="查看详细资料"></a>
													</div>
													<div id="avatarfeed">
														<span id="threadsortswait"></span>
													</div>
												</div>
											</div>
											<div>
												<div class="avatar"
													onmouseover="showauthor(this, 'userinfo170172091')">
													<a href="http://bbs.3dmgame.com/space-uid-1988087.html"
														class="avtm" target="_blank"><img lazyloaded="true"
														src="imgs/87_avatar_middle.jpg"
														file="http://user.3dmgame.com/data/avatar/001/98/80/87_avatar_middle.jpg"
														height="101" width="130"></a>
												</div>
											</div>
											<div class="tns xg2">
												<table cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<th><p>
																	<a
																		href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=thread&amp;type=thread&amp;view=me&amp;from=space"
																		class="xi2">38</a>
																</p>主题</th>
															<th><p>
																	<a
																		href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=thread&amp;type=reply&amp;view=me&amp;from=space"
																		class="xi2">405</a>
																</p>帖子</th>
															<td><p>
																	<a
																		href="http://bbs.3dmgame.com/home.php?mod=space&amp;uid=1988087&amp;do=profile"
																		class="xi2">430</a>
																</p>积分</td>
														</tr>
													</tbody>
												</table>
											</div>

											<p>
												<em><a
													href="http://bbs.3dmgame.com/home.php?mod=spacecp&amp;ac=usergroup&amp;gid=13"
													target="_blank"><font color="#000000">高级玩家</font></a></em>
											</p>


											<p>
												<span id="g_up170172091"
													onmouseover="showMenu({'ctrlid':this.id, 'pos':'12!'});"><img
													src="imgs/star_level3.gif" alt="Rank: 4"></span>
											</p>
											<div id="g_up170172091_menu" class="tip tip_4"
												style="display: none;">
												<div class="tip_horn"></div>
												<div class="tip_c">
													<font color="#000000">高级玩家</font>, 积分 430, 距离下一级还需 170 积分
												</div>
											</div>


											<p>
												<span class="pbg2" id="upgradeprogress_170172091"
													onmouseover="showMenu({'ctrlid':this.id, 'pos':'12!', 'menuid':'g_up170172091_menu'});"><span
													class="pbr2" style="width: 51%;"></span></span>
											</p>
											<div id="g_up170172091_menu" class="tip tip_4"
												style="display: none;">
												<div class="tip_horn"></div>
												<div class="tip_c">
													<font color="#000000">高级玩家</font>, 积分 430, 距离下一级还需 170 积分
												</div>
											</div>
										</div>
									</td>
									<td class="plc"><div class="pct">
											<style type="text/css">
.pcb {
	margin-right: 0
}
</style>
											<div class="pcb">

												<div class="t_fsz">
													<table cellpadding="0" cellspacing="0">
														<tbody>
															<tr>
																<td class="t_f" id="postmessage_170172091"><br><br><%=a.getCont()%></td>
															</tr>
														</tbody>
													</table>



												</div>
												<div id="post_rate_div_170172091"></div>
											</div>
										</div></td>
								</tr>
								<tr>
								</tr>
								<tr id="_postposition170172091"></tr>
								<tr>
									<td class="pls"></td>
									<td class="plc" style="overflow: visible;">&nbsp;</td>
								</tr>
								<tr class="ad">
									<td class="pls"></td>
									<td class="plc"></td>
								</tr>
							</tbody>
						</table>

					</div>
					<div id="postlistreply" class="pl">
						<div id="post_new" class="viewthread_table" style="display: none"></div>
					</div>
				</div>
				<%
					}
				%>
				<div class="pgs mtm mbm cl">
					<span class="pgb y" id="visitedforumstmp"
						onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'21'})"><a
						href="sgjz.jsp">返回列表</a></span>
				</div>

				<div id="f_pst" class="pl bm bmw">
					<table cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td class="pls">
									<div class="avatar avtm">
										<img lazyloaded="true" src="imgs/81_avatar_middle.jpg"
											file="http://user.3dmgame.com/data/avatar/008/09/75/81_avatar_middle.jpg"
											height="133" width="130">
									</div>
								</td>
								<td class="plc"><span id="fastpostreturn"></span>

									<form name=sgjzre action="ReplyOk.jsp" Method="post">
										<input type="hidden" name="id" value="<%=id%>"> <input
											type="hidden" name="rootid" value="<%=rootid%>">
												<table border="0">
													<tr>
														<td><input type="text" name="title" size="80"></td>
													</tr>
													<tr>
														<td><textarea cols="80" rows="12" name="cont"></textarea></td>
													</tr>
												</table> <input type="submit" value="回复">
									</form>
							</tr>
						</tbody>
					</table>
				</div>
</body>
</html>