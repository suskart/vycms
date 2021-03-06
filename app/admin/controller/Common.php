<?php
namespace app\admin\controller;
use think\Request;
use think\Db;
use think\Controller;
class Common extends Controller
{
    protected $mod,$role,$system,$nav,$menudata,$cache_model,$categorys,$module,$moduleid,$adminRules,$HrefId;
    public function _initialize()
    {

        //判断管理员是否登录
        if (!session('aid')) {
            $this->redirect('login/index');
        }
        define('MODULE_NAME',strtolower(request()->controller()));
        define('ACTION_NAME',strtolower(request()->action()));
        //权限管理
        //当前操作权限ID
        
        if(session('aid')!=1){
            $this->HrefId = db('auth_rule')->where('href',MODULE_NAME.'/'.ACTION_NAME)->value('id');
            //当前管理员权限
            $map['a.admin_id'] = session('aid');
            $rules=Db::table(config('database.prefix').'admin')->alias('a')
                ->join(config('database.prefix').'auth_group ag','a.group_id = ag.group_id','left')
                ->where($map)
                ->value('ag.rules');
            $this->adminRules = explode(',',$rules);
            if($this->HrefId){
                if(!in_array($this->HrefId,$this->adminRules)){
                    $this->error('您无此操作权限','index');
                }
            }
        }
		
		//导航
		
        $topMenus = db('auth_rule')->where(['pid'=>0])->order('sort')->select();
		$this->assign('topMenus', $topMenus);
        
        
        /*// 获取缓存数据
        $authRule = cache('authRule');
        if(!$authRule){
        	$mMap['menustatus'] = 1;
			$mpid = input('mpid');
			if(!empty($mpid)){
				$mMap['pid'] = $mpid;
			}
            $authRule = db('auth_rule')->where($mMap)->order('sort')->select();
            cache('authRule', $authRule, 3600);
        }
        //声明数组
        $menus = array();
        foreach ($authRule as $key=>$val){
            $authRule[$key]['href'] = url($val['href']);
            if($val['pid']==0){
                if(session('aid')!=1){
                    if(in_array($val['id'],$this->adminRules)){
                        $menus[] = $val;
                    }
                }else{
                    $menus[] = $val;
                }
            }
        }
        foreach ($menus as $k=>$v){
            foreach ($authRule as $kk=>$vv){
                if($v['id']==$vv['pid']){
                    if(session('aid')!=1) {
                        if (in_array($vv['id'], $this->adminRules)) {
                            $menus[$k]['children'][] = $vv;
                        }
                    }else{
                        $menus[$k]['children'][] = $vv;
                    }
                }
            }
        }*/
		
		//p($menus);die;
		$this->modeId = $modeId = db('auth_rule')->where('href',MODULE_NAME.'/'.ACTION_NAME)->value('id');
		
		$modePid = db('auth_rule')->where(['id'=>$modeId])->value('pid');
		
		$modePpidinfo = db('auth_rule')->find($modePid);
//		echo db('auth_rule')->getLastSql();

		if($modePpidinfo['pid']!=0){
			$modePpidinfo2 = db('auth_rule')->find($modePpidinfo['pid']);
			if($modePpidinfo2['pid']!=0){
				$modePpid = $modePpidinfo2['pid'];
			}else{
				$modePpid = $modePpidinfo['pid'];
			}
			
		}else{
			$modePpid = db('auth_rule')->where(['id'=>$modePpidinfo['pid']])->value('pid');
			
		}		
//		echo $modeId.'|'.$modePid.'|'.$modePpid.'|'.MODULE_NAME.'/'.ACTION_NAME;
		if(empty($modePpid)){
			$modePpid = 278;
		}

		$menus = $this->getMenu($modePpid);
        $this->assign('topMid', $modePpid);
        $this->assign('modeId', $modeId);
        $this->assign('menus', $menus['data']);

    }
    //空操作
    public function _empty(){
        return $this->error('空操作，返回上次访问页面中...');
    }
	
	public function clear(){
        $R = RUNTIME_PATH;
        if ($this->_deleteDir($R)) {
            $result['info'] = '清除缓存成功!';
            $result['status'] = 1;
        } else {
            $result['info'] = '清除缓存失败!';
            $result['status'] = 0;
        }
        $result['url'] = url('admin/index/index');
        return $result;
    }
	
	public function getMenu($pid){
		if(empty($pid)){
			$pid = input('pid');
		}
		
        $menus = array();	
		if(!empty($pid)){
			
			// 获取缓存数据
			
			$menuslist = db('auth_rule')->where(['pid'=>$pid,'menustatus'=>1])->order('sort')->select();
			foreach ($menuslist as $k => $v) {
				if(session('aid')!=1){
                    if(in_array($v['id'],$this->adminRules)){
                        $menus[] = $v;
                    }
                }else{
                    $menus[] = $v;
                }
				$childs = db('auth_rule')->where(['pid'=>$v['id'],'menustatus'=>1])->order('sort')->select();
				if(session('aid')!=1) {
                    if (in_array($vv['id'], $this->adminRules)) {
                        $menus[$k]['child'] = $childs;
                    }
                }else{
                	$menus[$k]['child'] = $childs;
                }
			}
			
			foreach ($menus as $k => $v) {
				$menus[$k]['href'] = url($v['href']);
				foreach($menus[$k]['child'] as $kk=>$vv){
					$menus[$k]['child'][$kk]['href'] = url($vv['href']);
					if($this->modeId==$vv['id']){
						$menus[$k]['child'][$kk]['act'] = 1; 
					}
				}
			}
		
//			p($menus);
			
			$result['status'] = 1; 
			$result['info'] = '获取成功!';
			$result['data'] = $menus;
		}else{
			$result['info'] = '获取失败!';
            $result['status'] = 0;
		}
        return $result;
    }
	
}
