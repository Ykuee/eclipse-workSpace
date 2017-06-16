<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> 
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<!--webfonts-->
	<!--//webfonts-->
<title>新用户注册</title>
</head>
<body>
<div class="main">
		<div class="header" >
			<h1>来创建一个新用户吧！！！</h1>
		</div>
		<p>请填写下列信息，然后点击创建按钮。</p>
			<form name=regist action="registok.jsp" Method="post">
				<ul class="left-form">
					<h2>新用户信息:</h2>
					<li>
						<input type="text"  name="username" placeholder="username" required/>
						<a href="#" class="icon ticker"> </a>
						<div class="clear"> </div>
					</li> 
					<li>
						<input type="text"  name="email" placeholder="email" required/>
						<a href="#" class="icon ticker"> </a>
						<div class="clear"> </div>
					</li> 
					<li>
						<input type="password"  name="password" placeholder="password" required/>
						<a href="#" class="icon into"> </a>
						<div class="clear"> </div>
					</li> 
					<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>你得选中这个对勾，同意你不知道的条款。</label>
					<input type="submit" onClick="myFunction()" value="  提  交  ">
						<div class="clear"> </div>
				</ul>
				
				<div class="clear"> </div>
					
			</form>
			
		</div>

</body>
</html>