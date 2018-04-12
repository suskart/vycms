<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 定义应用目录
define('APP_PATH', __DIR__ . '/application/');
// 站点安装目录
define('SITE_PATH','/thinkphp');
// runtime文件路径
define('RUNTIME_PATH', __DIR__ . '/data/runtime/');
// 加载框架引导文件
require  './thinkphp/start.php';
$build = include './build.php';
// 运行自动生成
\think\Build::run($build);