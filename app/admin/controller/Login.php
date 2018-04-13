<?php
namespace app\admin\controller;
use think\Controller;
class Login extends Controller
{
    public function _initialize(){
        if (session('aid')) {
            $this->redirect('index/index');
        }
    }
	
	//登录首页
    public function index(){

        if(request()->isPost()) {
            
            $data = input('post.');
	
            if(!$this->check($data['code'])){
                //return json(array('code' => 0, 'msg' => '验证码错误'));
            }
			$res = 0;
			$user = db('admin')->where(['username'=>$data['username']])->find();

			if($user){
				if($user['password'] == md5($data['password'])){
					session('username',$user['username']);
					session('aid',$user['admin_id']);
					$avatar = $user['avatar']==''?'/static/admin/images/0.jpg':$user['avatar'];
					session('avatar',$avatar);
					$res = 1; //信息正确
				}else{
					$res = -1; //密码错误
				}
			}else{
				$res = -1; //用户不存在
			} 

            if($res == 1){
                return json(['code' => 1, 'msg' => '登录成功!', 'url' => url('index/index')]);
            }else {
                return json(array('code' => 0, 'msg' => '用户名或者密码错误，重新输入!'));
            }
        }else{
            
            return $this->fetch();
        }
    }
	
    public function check($code){
    	
    	return captcha_check($code);
    }
}