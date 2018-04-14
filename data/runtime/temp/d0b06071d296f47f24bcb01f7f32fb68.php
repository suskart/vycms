<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:50:"D:\wwwroot\vycms/app/admin\view\system\system.html";i:1521594995;s:48:"D:\wwwroot\vycms\app\admin\view\common\head.html";i:1523619588;s:48:"D:\wwwroot\vycms\app\admin\view\common\foot.html";i:1523623560;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo config('sysname'); ?>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/public/static/plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="/public/static/admin/css/global.css" media="all">
    <link rel="stylesheet" href="/public/static/common/css/font.css" media="all">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	
  <div class="layui-header">
    <div class="layui-logo" style="color: #fff;font-size: 22px;"><?php echo config('sysname'); ?></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left" lay-filter="menuTab">
    	
    	<?php if(is_array($topMenus) || $topMenus instanceof \think\Collection || $topMenus instanceof \think\Paginator): $i = 0; $__LIST__ = $topMenus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
    	<li class="layui-nav-item toplist <?php if($vo["id"] == $topMid): ?>layui-this<?php endif; ?>" data-pid="<?php echo $vo['id']; ?>"><a href="javascript:;"><?php echo $vo['title']; ?></a></li>
    	<?php endforeach; endif; else: echo "" ;endif; ?>

      
    </ul>
    <ul class="layui-nav layui-layout-right">
		 <li class="layui-nav-item"><a href="/" target="_blank">网站首页</a></li>
		 <li class="layui-nav-item"><a href="javascript:;" id="cache">清除缓存</a></li>
	      <li class="layui-nav-item">
	        <a href="javascript:;">
	          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
	          <?php echo session('username'); ?>
	        </a>
	        <dl class="layui-nav-child">
	          <dd><a href="">基本资料</a></dd>
	          <dd><a href="">安全设置</a></dd>
	        </dl>
	      </li>
	  	<li class="layui-nav-item"><a href="<?php echo url('index/logout'); ?>">注销</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">

<script id="navdata" type="text/html">
  <ul>
  {{#  layui.each(d.data, function(index, item){ }}
    <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">{{ item.title }}</a>
          <dl class="layui-nav-child">
          	{{#  layui.each(item.child, function(index2, item2){ }}
            <dd {{# if(item2.act==1){ }} class="layui-this"{{# } }}><a href="{{ item2.href }}">{{ item2.title }}</a></dd>
            {{#  }) }} 
            
          </dl>
        </li>

  {{#  }) }} 
  </ul>
</script>
		<div class="">
        	
        </div>
      <ul class="layui-nav layui-nav-tree" id="navlist" >
        
        <?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
       	<li class="layui-nav-item layui-nav-itemed">
            <a href="javascript:;"><i class="fa fa-home"></i><?php echo $v['title']; ?></a>
           <dl class="layui-nav-child">
          	<?php if(is_array($v['child']) || $v['child'] instanceof \think\Collection || $v['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($i % 2 );++$i;?>
            <dd <?php if($vv['act'] == 1): ?>class="layui-this"<?php endif; ?>><a href="<?php echo $vv['href']; ?>"><?php echo $vv['title']; ?></a></dd>
            <?php endforeach; endif; else: echo "" ;endif; ?>   
            
          </dl>
        </li>
    	<?php endforeach; endif; else: echo "" ;endif; ?>   
      </ul>
      
      
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo lang('systemSet'); ?></legend>
    </fieldset>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('websiteName'); ?></label>
            <div class="layui-input-4">
                <input type="text"name="name" value="<?php echo $system['name']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('websiteName'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('WebsiteUrl'); ?></label>
            <div class="layui-input-4">
                <input type="text" name="url" value="<?php echo $system['url']; ?>" lay-verify="url" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('WebsiteUrl'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('seoTitle'); ?></label>
            <div class="layui-input-4">
                <input type="text"name="title" value="<?php echo $system['title']; ?>"lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('WebsiteUrl'); ?>" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label"><?php echo lang('seoKeyword'); ?></label>
            <div class="layui-input-block">
                <textarea name="key" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('seoKeyword'); ?>" class="layui-textarea"><?php echo $system['key']; ?></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label"><?php echo lang('description'); ?></label>
            <div class="layui-input-block">
                <textarea name="des" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('description'); ?>" class="layui-textarea"><?php echo $system['des']; ?></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">网站LOGO</label>
            <input type="hidden" name="logo" id="logo" value="<?php echo $system['logo']; ?>">
            <div class="layui-input-block">
                <div class="layui-upload">
                    <button type="button" class="layui-btn layui-btn-primary" id="logoBtn"><i class="icon icon-upload3"></i>点击上传</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="cltLogo">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('recordNum'); ?></label>
            <div class="layui-input-3">
                <input type="text" name="bah" value="<?php echo $system['bah']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('recordNum'); ?>" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">Copyright</label>
            <div class="layui-input-3">
                <input type="text" name="copyright" value="<?php echo $system['copyright']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?>Copyright" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('companyAddress'); ?></label>
            <div class="layui-input-3">
                <input type="text" name="ads" value="<?php echo $system['ads']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('companyAddress'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('tel'); ?></label>
            <div class="layui-input-3">
                <input type="text" name="tel" value="<?php echo $system['tel']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('tel'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('email'); ?></label>
            <div class="layui-input-3">
                <input type="text" name="email" value="<?php echo $system['email']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('email'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="sys"><?php echo lang('submit'); ?></button>
                <button type="reset" class="layui-btn layui-btn-primary"><?php echo lang('reset'); ?></button>
            </div>
        </div>
    </form>
</div>
</div>
  </div>
  
  <div class="layui-footer" style="text-align: center;">
    <!-- 底部固定区域 -->
    © www.vycms.com - 版权所有 2017-2018
  </div>
</div>
<script src="/public/static/plugins/layui/layui.js"></script>

<script>
        layui.use(['layer','element','laytpl'],function(){
            var $ = layui.jquery, layer = layui.layer,element = layui.element,laytpl = layui.laytpl;
            $('#cache').click(function () {
                document.cookie="skin=;expires="+new Date().toGMTString();
                layer.confirm('确认要清除缓存？', {icon: 3}, function () {
                    $.post('<?php echo url("clear"); ?>',function (data) {
                        layer.msg(data.info, {icon: 6}, function (index) {
                            layer.close(index);
                            window.location.href = data.url;
                        });
                    });
                });
            });


            $('.toplist').click(function () {
            	var pid = $(this).attr('data-pid');
              $.post('<?php echo url("common/getMenu"); ?>', {pid: pid},function(data) {

							var getTpl = navdata.innerHTML
							,view = document.getElementById('navlist');
							laytpl(getTpl).render(data, function(html){
							  view.innerHTML = html;
							  element.init();//重新加载
							});

                });
	            });
            });
   
						
       
    </script>
</body>
</html>
<script>
    layui.use(['form', 'layer','upload'], function () {
        var form = layui.form,layer = layui.layer,upload = layui.upload,$ = layui.jquery;
        if("<?php echo $system['logo']; ?>"){
            cltLogo.src = "/public"+ "<?php echo $system['logo']; ?>";
        }
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#logoBtn'
            ,url: '<?php echo url("UpFiles/upload"); ?>'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#cltLogo').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //上传成功
                if(res.code>0){
                    $('#logo').val(res.url);
                }else{
                    //如果上传失败
                    return layer.msg('上传失败');
                }
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //提交监听
        form.on('submit(sys)', function (data) {
            loading =layer.load(1, {shade: [0.1,'#fff']});
            $.post("<?php echo url('system/system'); ?>",data.field,function(res){
                layer.close(loading);
                if(res.code > 0){
                    layer.msg(res.msg,{icon: 1, time: 1000},function(){
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{icon: 2, time: 1000});
                }
            });
        })
    })
</script>
</body>
</html>