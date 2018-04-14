<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:49:"D:\wwwroot\vycms/app/admin\view\category\add.html";i:1521594995;s:48:"D:\wwwroot\vycms\app\admin\view\common\head.html";i:1523619588;s:48:"D:\wwwroot\vycms\app\admin\view\common\foot.html";i:1523623560;}*/ ?>
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
    	
<div class="admin-main fadeInUp animated">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo $title; ?></legend>
    </fieldset>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">请选择模型</label>
            <div class="layui-input-3">
                <select name="moduleid" lay-verify="required" lay-filter="moduleid" id="moduleid">
                    <?php if(is_array($modulelist) || $modulelist instanceof \think\Collection || $modulelist instanceof \think\Paginator): $i = 0; $__LIST__ = $modulelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <option value="<?php echo $vo['id']; ?>" <?php if($module['moduleid'] == $vo['id']): ?>selected<?php endif; ?>><?php echo $vo['title']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上级栏目</label>
            <div class="layui-input-3">
                <select name="parentid" id="parentid">
                    <option value="">作为一级栏目</option>
                    <?php echo $categorys; ?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">栏目名称</label>
            <div class="layui-input-4">
                <input type="text" name="catname" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>栏目名称" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux red">*</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">栏目目录</label>
            <div class="layui-input-4">
                <input type="text" name="catdir" placeholder="<?php echo lang('pleaseEnter'); ?>栏目目录" lay-verify="required" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux red">*</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">栏目图片</label>
            <input type="hidden" name="image" id="image">
            <div class="layui-input-block">
                <div class="layui-upload">
                    <button type="button" class="layui-btn layui-btn-primary" id="cateBtn"><i class="icon icon-upload3"></i>点击上传</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="cateImage">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">SEO标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" placeholder="<?php echo lang('pleaseEnter'); ?>SEO标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">SEO关键字</label>
            <div class="layui-input-block">
                <textarea placeholder="<?php echo lang('pleaseEnter'); ?>SEO关键字" name="keywords" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">SEO描述</label>
            <div class="layui-input-block">
                <textarea placeholder="<?php echo lang('pleaseEnter'); ?>SEO描述" name="description" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">多栏目设置</label>
            <div class="layui-input-1">
                <input type="checkbox" name="child" value="1" lay-skin="switch" title="多栏目设置">
            </div>
            <div class="layui-form-mid layui-word-aux">打开后，其下将不能添加内容。</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">导航</label>
            <div class="layui-input-block">
                <input type="radio" name="ismenu" lay-filter="is_open" checked value="1" title="<?php echo lang('yes'); ?>">
                <input type="radio" name="ismenu" lay-filter="is_open" value="0" title="<?php echo lang('no'); ?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">访问权限</label>
            <div class="layui-input-block">
                <?php if(is_array($rlist) || $rlist instanceof \think\Collection || $rlist instanceof \think\Paginator): $i = 0; $__LIST__ = $rlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                <input type="checkbox" name="readgroup[<?php echo $i; ?>]" value="<?php echo $item['group_id']; ?>" title="<?php echo $item['title']; ?>">
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">分页条数</label>
                <div class="layui-input-inline">
                    <input type="number" name="pagesize" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">为空时默认值为系统设置的值</div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">列表页模板</label>
            <div class="layui-input-3">
                <select name="template_list" id="template_list">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内容页模板</label>
            <div class="layui-input-3">
                <select name="template_show" id="template_show">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="submit"><?php echo lang('submit'); ?></button>
                <a href="<?php echo url('index'); ?>" class="layui-btn layui-btn-primary"><?php echo lang('back'); ?></a>
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
<script src="/public/static/common/js/jquery.2.1.1.min.js"></script>
<script>
    var modulearr = new Array();
    <?php if(is_array($modulelist) || $modulelist instanceof \think\Collection || $modulelist instanceof \think\Paginator): $i = 0; $__LIST__ = $modulelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$mdate): $mod = ($i % 2 );++$i;?>
    modulearr[<?php echo $mdate['id']; ?>] = "<?php echo $mdate['name']; ?>";
    <?php endforeach; endif; else: echo "" ;endif; ?>
    var templatearr = new Array();
    <?php if(is_array($templates) || $templates instanceof \think\Collection || $templates instanceof \think\Paginator): $i = 0; $__LIST__ = $templates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tem): $mod = ($i % 2 );++$i;?>
    templatearr[<?php echo $i; ?>] = "<?php echo $tem['value']; ?>,<?php echo $tem['filename']; ?>";
    <?php endforeach; endif; else: echo "" ;endif; ?>
    var datas = "<option value=''>请选择</option>";
    var moduleid =  $('#moduleid').val();
    var image = '';

    layui.use(['form','upload'], function () {
        var form = layui.form,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#cateBtn',
            url: '<?php echo url("UpFiles/upload"); ?>',
            done: function(res){
                if(res.code>0){
                    $('#image').val(res.url);
                    $('#cateImage').attr('src', "/public"+res.url);
                }else{
                    //如果上传失败
                    return layer.msg('上传失败');
                }
            },
            error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

        form.on('submit(submit)', function (data) {
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post("<?php echo url('insert'); ?>", data.field, function (res) {
                layer.close(loading);
                if (res.code > 0) {
                    layer.msg(res.msg, {time: 1800, icon: 1}, function () {
                        location.href = res.url;
                    });
                } else {
                    layer.msg(res.msg, {time: 1800, icon: 2});
                }
            });
        });
        form.on('select(moduleid)', function(data){
            showtemplist(data.value,0,form);
        });
    });
    function showtemplist(m,t,form){
        var type='_list';
        if(t){
            type='_index';
        }
        var mtlist = modulearr[m]+type;
        var mtshow = modulearr[m]+'_show';

        if(modulearr[m]=='page'){
            mtlist=mtshow ='page';
        }
        $('#template_list').html(datas);
        $('#template_show').html(datas);

        listdatas = showdatas ='';
        for(i=1;i<templatearr.length;i++){
            data = templatearr[i].split(',');
            if(data[0].indexOf(mtlist)  >= 0){
                listdatas  ="<option value='"+data[0]+"'>"+data[1]+"</option>";
                $('#template_list').append(listdatas);
            }
            if(data[0].indexOf(mtshow)  >= 0){
                showdatas ="<option value='"+data[0]+"'>"+data[1]+"</option>";
                $('#template_show').append(showdatas);
            }
        }
        if(form){
            form.render()
        }
    }
    showtemplist(moduleid,<?php if(empty($module[listtype])): ?>0<?php else: ?><?php echo $module['listtype']; endif; ?>);
</script>