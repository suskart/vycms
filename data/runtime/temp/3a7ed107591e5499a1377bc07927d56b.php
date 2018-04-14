<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:49:"D:\wwwroot\vycms/app/admin\view\module\field.html";i:1521594995;s:48:"D:\wwwroot\vycms\app\admin\view\common\head.html";i:1523619588;s:48:"D:\wwwroot\vycms\app\admin\view\common\foot.html";i:1523623560;}*/ ?>
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
        <legend>字段<?php echo lang('list'); ?></legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <a href="<?php echo url('fieldAdd',array('moduleid'=>input('id'))); ?>" class="layui-btn layui-btn-sm"><?php echo lang('add'); ?><?php echo lang('field'); ?></a>
        <a href="<?php echo url('index'); ?>" class="layui-btn layui-btn-sm layui-btn-primary pull-right">模型列表</a>
    </blockquote>
    <table class="layui-table" id="list" lay-filter="list"></table>
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
<script type="text/html" id="isSystem">
    {{# if(d.issystem==1){ }}
    <i class="icon icon-checkmark green"></i>
    {{# }else{  }}
    <i class="icon icon-cross red"></i>
    {{# } }}
</script>
<script type="text/html" id="required">
    {{# if(d.required==1){ }}
    <i class="icon icon-checkmark green"></i>
    {{# }else{  }}
    <i class="icon icon-cross red"></i>
    {{# } }}
</script>
<script type="text/html" id="action">
    {{# if(d.disable==1){ }}
        <a href="javascript:" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="stateyes">已禁用</a>
    {{# }else if(d.disable==2){  }}
        <a href="#" class="layui-btn layui-btn-xs layui-btn-disabled">已禁用</a>
    {{# }else{  }}
        <a href="javascript:" class="layui-btn layui-btn-xs layui-btn-warm" lay-event="stateyes">已启用</a>
    {{# } }}
    <a href="<?php echo url('fieldEdit'); ?>?moduleid={{d.moduleid}}&id={{d.id}}" class="layui-btn layui-btn-xs"><?php echo lang('edit'); ?></a>

    {{# if(d.delStatus==1){ }}
        <a href="#" class="layui-btn layui-btn-xs layui-btn-disabled">删除</a>
    {{# }else{  }}
        <a href="#" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    {{# } }}
</script>
<script type="text/html" id="order">
    <input name="{{d.id}}" data-id="{{d.id}}" class="list_order layui-input" value=" {{d.listorder}}" size="10"/>
</script>
<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        var tableIn=table.render({
            elem: '#list',
            url: '<?php echo url("field"); ?>',
            where: { //设定异步数据接口的参数
                id: '<?php echo input("id"); ?>'
            },
            method: 'post',
            cols: [[
                {field: 'field', title: '字段名', width: 120,fixed: true},
                {field: 'name', title: '别名', width: 100},
                {field: 'type', title: '字段类型', width: 100},
                {field: 'issystem', align: 'center', title: '系统字段', width: 100, toolbar: '#isSystem'},
                {field: 'required', align: 'center', title: '必填', width: 80, toolbar: '#required'},
                {field: 'listorder', title: '<?php echo lang("order"); ?>', width: 100, sort: true,templet: '#order'},
                {width: 190, align: 'center', toolbar: '#action'}
            ]]
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            if (obj.event === 'stateyes') {
                loading = layer.load(1, {shade: [0.1, '#fff']});
                $.post('<?php echo url("fieldStatus"); ?>', {id: data.id}, function () {
                    window.location.href = "<?php echo url('field'); ?>?id=<?php echo input('id'); ?>"
                });
            }else if(obj.event === 'del'){
                layer.confirm('你确定要删除该字段吗', function(index){
                    $.post("<?php echo url('fieldDel'); ?>",{id:data.id},function(res){
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
            var listorder = $(this).val();
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post('<?php echo url("listOrder"); ?>',{id:id,listorder:listorder,moduleid:"<?php echo input('id'); ?>"},function(res){
                layer.close(loading);
                if(res.code===1){
                    layer.msg(res.msg,{time:1000,icon:1});
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
            })
        })
    });
</script>