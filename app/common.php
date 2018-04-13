<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

//格式化打印数组
function p($arr){
    if(empty($arr)){
        header("Content-type: text/html; charset=utf-8"); 
        echo  '没有数据';
    }else{
        echo "<pre>";
        $arr = print_r($arr);
        echo "</pre>";
        return $arr;
    }
}
