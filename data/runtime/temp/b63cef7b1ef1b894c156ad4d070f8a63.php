<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:51:"D:\wwwroot\vycms/app/admin\view\auth\rule_edit.html";i:1523592083;s:48:"D:\wwwroot\vycms\app\admin\view\common\head.html";i:1523593540;s:48:"D:\wwwroot\vycms\app\admin\view\common\foot.html";i:1523543425;}*/ ?>
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
    <div class="layui-logo"><?php echo config('sysname'); ?></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    	<?php if(is_array($topMenus) || $topMenus instanceof \think\Collection || $topMenus instanceof \think\Paginator): $i = 0; $__LIST__ = $topMenus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
    	<li class="layui-nav-item"><a href="<?php echo url('aaa'); ?>"><?php echo $vo['title']; ?></a></li>
    	<?php endforeach; endif; else: echo "" ;endif; ?>
      <!--<li class="layui-nav-item layui-this">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>-->
      
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
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        
        <?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
        <li class="layui-nav-item">
          <a class="" href="javascript:;"><?php echo $v['title']; ?></a>
          <dl class="layui-nav-child">
          	<?php if(is_array($v['children']) || $v['children'] instanceof \think\Collection || $v['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($i % 2 );++$i;?>
            <dd><a href="<?php echo $vv['href']; ?>"><?php echo $vv['title']; ?></a></dd>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            
          </dl>
        </li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        
        <li class="layui-nav-item layui-this">
          <a href="javascript:;">解决方案</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>
      </ul>
      
      
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	
<div class="admin-main">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>编辑菜单</legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        1、《控制器/方法》： 例如 System/list<br/>
        2、图标名称为左侧导航栏目的图标样式，菜单小图标采用的是<a href="https://icomoon.io/#premium" target="_blank">premium图标</a>
    </blockquote>
    <form class="layui-form layui-form-pane">
        <input type="hidden" name="id" value="<?php echo $rule['id']; ?>">
        <div class="layui-form-item">
            <label class="layui-form-label">菜单名称</label>
            <div class="layui-input-4">
                <input type="text" name="title" value="<?php echo $rule['title']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>菜单名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">控制器/方法</label>
            <div class="layui-input-4">
                <input type="text" name="href" value="<?php echo $rule['href']; ?>" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>控制器/方法" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标名称</label>
            <div class="layui-input-4">
                <input type="text" name="icon" value="<?php echo $rule['icon']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?>图标名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单状态</label>
            <div class="layui-input-block">
                <input type="radio" name="menustatus" <?php if($rule['menustatus'] == 1): ?>checked<?php endif; ?> value="1" title="开启">
                <input type="radio" name="menustatus" <?php if($rule['menustatus'] == 0): ?>checked<?php endif; ?> value="0" title="关闭">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-2">
                <input type="text" name="sort" value="<?php echo $rule['sort']; ?>" placeholder="<?php echo lang('pleaseEnter'); ?>排序编号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="auth">立即提交</button>
                <a href="<?php echo url('adminRule'); ?>" class="layui-btn layui-btn-primary">返回</a>
            </div>
        </div>
    </form>
</div>
</div>
  </div>
  
  <div class="layui-footer" style="text-align: center;">
    <!-- 底部固定区域 -->
    © www.vycom.com - 版权所有 2017-2018
  </div>
</div>
<script src="/public/static/plugins/layui/layui.js"></script>

<script>
        layui.use(['layer','element'],function(){
            var $ = layui.jquery, layer = layui.layer,element = layui.element;
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
        })
    </script>
</body>
</html>
<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form,layer = layui.layer,$ = layui.jquery;
        form.on('submit(auth)', function (data) {
            // 提交到方法 默认为本身
            $.post("<?php echo url('ruleEdit'); ?>",data.field,function(res){
                if(res.code > 0){
                    layer.msg(res.msg,{time:1800,icon:1},function(){
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{time:1800,icon:2});
                }
            });
        })
    })
</script>
</body>
</html>