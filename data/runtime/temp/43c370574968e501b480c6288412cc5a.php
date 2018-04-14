<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:51:"D:\wwwroot\vycms/app/admin\view\category\index.html";i:1521594995;s:48:"D:\wwwroot\vycms\app\admin\view\common\head.html";i:1523619588;s:48:"D:\wwwroot\vycms\app\admin\view\common\foot.html";i:1523623560;}*/ ?>
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
        <legend><?php echo $title; ?></legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <a href="<?php echo url('add'); ?>" class="layui-btn layui-btn-sm"><?php echo lang('add'); ?>栏目</a>
    </blockquote>
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>栏目名称<span id="cateNameMsg">(点击查看内容)</span></th>
            <th>所属模型</th>
            <th>导航</th>
            <th><?php echo lang('order'); ?></th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="con">
        <?php echo $categorys; ?>
        </tbody>
        <tfoot>
    </table>
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
<script src="/public/static/common/js/jquery.2.1.1.min.js"></script>
<script>
    layui.use('table', function(){
        var $= layui.jquery;
        $('body').on('blur','.list_order',function() {
            var id = $(this).attr('data-id');
            var listorder = $(this).val();
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post('<?php echo url("cOrder"); ?>',{id:id,listorder:listorder},function(res){
                layer.close(loading);
                if(res.code === 1){
                    layer.msg(res.msg, {time: 1000, icon: 1}, function () {
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
            })
        });
    });
    function del(id) {
        layer.confirm('你确定要删除该栏目及其子栏目吗？', {icon: 3}, function (index) {
            $.post('<?php echo url("del"); ?>', {id: id}, function (data) {
                if (data.status === 1) {
                    layer.alert(data.info, {icon: 6}, function(index){
                        layer.close(index);
                        window.location.href=data.url;
                    });
                }else{
                    layer.msg(data.info,{icon:5});
                }
            });
            layer.close(index);
        });
    }
</script>