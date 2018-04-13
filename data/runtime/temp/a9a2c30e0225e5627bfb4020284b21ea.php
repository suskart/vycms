<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:52:"D:\wwwroot\vycms/app/admin\view\auth\admin_rule.html";i:1523543350;s:48:"D:\wwwroot\vycms\app\admin\view\common\head.html";i:1523607033;s:48:"D:\wwwroot\vycms\app\admin\view\common\foot.html";i:1523605911;}*/ ?>
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
    	<li class="layui-nav-item toplist" data-pid="<?php echo $vo['id']; ?>"><a href="javascript:;"><?php echo $vo['title']; ?></a></li>
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
      
      <ul class="layui-nav layui-nav-tree" id="navlist" lay-filter="test">
        <li class="layui-nav-item layui-this">
            <a href="javascript:;"><i class="fa fa-home"></i>首页</a>
           
        </li>
        
        
<script id="navdata" type="text/html">
{{each data as v}}
  <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">{{ v.title }}<span class="layui-nav-more"></span></a>
          <dl class="layui-nav-child">
          	
{{each v.child as vv}}
            <dd><a href="{{ vv.href }}">{{ vv.title }}</a></dd>
           
{{/each}}
    
          </dl>
        </li>
{{/each}}

</script>

        
        <?php if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
        <!--<li class="layui-nav-item">
          <a class="" href="javascript:;"><?php echo $v['title']; ?></a>
          <dl class="layui-nav-child">
          	<?php if(is_array($v['children']) || $v['children'] instanceof \think\Collection || $v['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $v['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($i % 2 );++$i;?>
            <dd><a href="<?php echo $vv['href']; ?>"><?php echo $vv['title']; ?></a></dd>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            
          </dl>
        </li>-->
        <?php endforeach; endif; else: echo "" ;endif; ?>
        
        <!--<li class="layui-nav-item layui-this">
          <a href="javascript:;">解决方案</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>-->
      </ul>
      
      
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>菜单列表</legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <a href="<?php echo url('ruleAdd'); ?>" class="layui-btn layui-btn-sm"><?php echo lang('add'); ?>权限</a>
    </blockquote>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/html" id="auth">
    <input type="checkbox" name="authopen" value="{{d.id}}" lay-skin="switch" lay-text="是|否" lay-filter="authopen" {{ d.authopen == 0 ? 'checked' : '' }}>
</script>
<script type="text/html" id="status">
    <input type="checkbox" name="menustatus" value="{{d.id}}" lay-skin="switch" lay-text="显示|隐藏" lay-filter="menustatus" {{ d.menustatus == 1 ? 'checked' : '' }}>
</script>
<script type="text/html" id="order">
    <input name="{{d.id}}" data-id="{{d.id}}" class="list_order layui-input" value=" {{d.sort}}" size="10"/>
</script>
<script type="text/html" id="icon">
    <span class="icon {{d.icon}}"></span>
</script>
<script type="text/html" id="action">
    <a href="<?php echo url('ruleEdit'); ?>?id={{d.id}}" class="layui-btn layui-btn-xs"><?php echo lang('edit'); ?></a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><?php echo lang('del'); ?></a>
</script>
</div>
  </div>
  
  <div class="layui-footer" style="text-align: center;">
    <!-- 底部固定区域 -->
    © www.vycom.com - 版权所有 2017-2018
  </div>
</div>
<script src="/public/static/plugins/layui/layui.js"></script>
<script src="/public/static/admin/js/template-web.js" type="text/javascript" charset="utf-8"></script>
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
              $.post('<?php echo url("common/getMenu"); ?>',{pid:pid},function (data) {
              	
              	if(data.status==1){
              		var html = template('navdata', data);
 document.getElementById('navlist').innerHTML = html;
              	}
//              	layer.msg(data.info, {icon: 6}, function (index) {
//                layer.close(index);
//                window.location.href = data.url;
                });
	            });
            });
   
						
       
    </script>
</body>
</html>
<script>
    layui.use(['table','form'], function() {
        var table = layui.table,form = layui.form, $ = layui.jquery;
        tableIn = table.render({
            elem: '#list',
            url: '<?php echo url("adminRule"); ?>',
            method: 'post',
            cols: [[
                {field: 'id', title: '<?php echo lang("id"); ?>', width: 70, fixed: true},
                {field: 'icon', align: 'center',title: '<?php echo lang("icon"); ?>', width: 60,templet: '#icon'},
                {field: 'ltitle', title: '权限名称', width: 200},
                {field: 'href', title: '控制器/方法', width: 200},
                {field: 'authopen',align: 'center', title: '是否验证权限', width: 150,toolbar: '#auth'},
                {field: 'menustatus',align: 'center',title: '菜单<?php echo lang("status"); ?>', width: 150,toolbar: '#status'},
                {field: 'sort',align: 'center', title: '<?php echo lang("order"); ?>', width: 80, templet: '#order'},
                {width: 160,align: 'center', toolbar: '#action'}
            ]]
        });
        form.on('switch(authopen)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var authopen = obj.elem.checked===true?0:1;
            $.post('<?php echo url("ruleTz"); ?>',{'id':id,'authopen':authopen},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
        form.on('switch(menustatus)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var menustatus = obj.elem.checked===true?1:0;
            $.post('<?php echo url("ruleState"); ?>',{'id':id,'menustatus':menustatus},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
        table.on('tool(list)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('您确定要删除该记录吗？', function(index){
                    var loading = layer.load(1, {shade: [0.1, '#fff']});
                    $.post("<?php echo url('ruleDel'); ?>",{id:data.id},function(res){
                        layer.close(loading);
                        if(res.code==1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            obj.del();
                        }else{
                            layer.msg(res.msg,{time:1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }
        });
        $('body').on('blur','.list_order',function() {
           var id = $(this).attr('data-id');
           var sort = $(this).val();
           $.post('<?php echo url("ruleOrder"); ?>',{id:id,sort:sort},function(res){
                if(res.code==1){
                    layer.msg(res.msg,{time:1000,icon:1},function(){
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
           })
        })
    })
</script>