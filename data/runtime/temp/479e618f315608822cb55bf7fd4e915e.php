<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:48:"D:\wwwroot\vycms/app/admin\view\login\index.html";i:1523535128;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<script src="/public/static/admin/login/push.js"></script>
		<script type="text/javascript" async="" src="/public/static/admin/login/ga.js"></script>
		<script charset="utf-8" src="/public/static/admin/login/jquery-1.7.1.min.js"></script>
		<link type="text/css" rel="stylesheet" href="/public/static/admin/login/store_login.css">
		<title>后台管理系统登录</title>

		<script type="text/javascript">
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-7572959-9']);
			_gaq.push(['_trackPageview']);

			(function() {
				var ga = document.createElement('script');
				ga.type = 'text/javascript';
				ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(ga, s);
			})();
		</script>
		<script charset="utf-8" src="/public/static/admin/login/ani.js"></script>
	</head>

	<body style="background: #014148;">
		<div class="frontHome page" id="loginbox">
			
			<div class="wrap-container">
				<div id="home_container" class="clearfix">
					<div id="home_main">
						<div class="wrap-header" style="text-align: center;margin: 0 auto;">
				            <div class="inner-header">
				                <div class="logoNav">
				                    <a href="#" id="logo" target="_blank" style="color: #fff;">微易网站管理系统 <font>beta1.0</font></a>
				                </div>
				            </div>
				        </div>
		   
		    
						<div class="inner-main">
							<div class="login_box">
								<div class="form-title">

									<h3>登录</h3>

									<h4>LOGIN</h4>
								</div>

								<form class="well form-horizontal layui-form layui-form-pane" method="POST" action="" style="background:#FFF">
									<div class="logininput"> <input type="hidden" name="csrfmiddlewaretoken" value="Ko38ACGLLk3Yw3xIrcw5n8VYnFWPmLg5">
										<fieldset>

											<div id="div_id_username" class="clearfix control-group">

												<label for="id_username" class="control-label requiredField">
				帐号<span class="asteriskField">*</span>
			</label>

												<div class="controls">

													<input class="textinput textInput" id="id_username" maxlength="30" name="username" placeholder="用户名" type="text">

												</div>

											</div>

											<div id="div_id_password" class="clearfix control-group">

												<label for="id_password" class="control-label requiredField">密码<span class="asteriskField">*</span>
			</label>

												<div class="controls">

													<input class="textinput textInput" id="id_password" name="password" placeholder="密码" type="password">

												</div>

											</div>
											
											<div id="div_id_password" class="clearfix control-group">
												<label for="id_password" class="control-label requiredField">验证码<span class="asteriskField">*</span>
			</label>
												<div class="controls" style="width: 150px; float: left;clear: none;">
													<input type="text" class="textinput textInput" id="code" name="code" placeholder="验证码" style="width:calc(100% - 20px)">
												</div>
												<div class="controls captcha" style="width: 160px;float: right;margin-left: 10px;clear: none;border: none;box-shadow:none;" id="captcha"><img src="<?php echo captcha_src(); ?>" alt="captcha" onclick="this.src=this.src+'?'+'id='+Math.random()" style="width: 100%;"/></div>
											</div>

										</fieldset>
									</div>

									<fieldset class="form-actions" style="position:relative; margin-top:15px;">

										<div class="loginFormBtn clearfix">
											<button class="login_btn js_login_btn" type="submit" style="width:100%;" lay-submit lay-filter="login">登录</button>
										
										
                              
                           
											<div class="zzy">专业的互联网工具提供商</div>
										</div>
									</fieldset>
								</form>

							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="wrap-footer">
				<div id="footer">
					<div class="inner-footer">
						<div class="foot" style="color: #fff;">微易内容管理系统 &nbsp;&nbsp;2017-2018
							<a href="http://www.vycms.com" style="color: #fff;">www.vycms.com</a> 版权所有</div>
					</div>
				</div>
			</div>
		</div>

<script type="text/javascript" src="/public/static/plugins/layui/layui.js"></script>
<script>
    layui.use('form',function(){
        var form = layui.form,$ = layui.jquery;
        //监听提交
        form.on('submit(login)', function(data){
            loading =layer.load(1, {shade: [0.1,'#fff'] });//0.1透明度的白色背景
            $.post('<?php echo url("login/index"); ?>',data.field,function(res){
                layer.close(loading);
                if(res.code == 1){
                    layer.msg(res.msg, {icon: 1, time: 1000}, function(){
                        location.href = res.url;
                    });
                }else{
                    $('#captcha').val('');
                    layer.msg(res.msg, {icon: 2, anim: 6, time: 1000});
                    $('.captcha img').attr('src','<?php echo captcha_src(); ?>?id='+Math.random());
                }
            });
            return false;
        });
    });
</script>

	</body>

</html>
