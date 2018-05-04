<?php
/**
* 独孤伶俜
* hitokotoAPI
* 2018年4月30日15点43分
*/
error_reporting(E_ALL^E_NOTICE^E_WARNING);//关闭错误提示
class API{
	public $user;
	public $key;
	public $dir;
	
	function get_dir($user){
		$usermd5 = md5($user);
		$this -> dir = "./hitokoto/".$usermd5.'.list';
		$this -> key = file($this -> dir);
		return $this -> dir;
	}
	
	function add_data($data){
		$handle = fopen($this -> dir, "a");
		if ($handle) {
			fwrite($handle, $data);
			fclose($handle);
		}
	}
	
	function rarray_rand($arr){
		return mt_rand( 3, count( $arr ) - 1 );
	}
	
	function varray_rand($arr) {
		return $arr[$this -> rarray_rand($arr)];
	}
	
	function rand_txt(){
		$keyword=trim($this -> varray_rand($this -> key));
		return $keyword;
	}
	function rand_json(){
		$keyword=trim($this -> varray_rand($this -> key));
		$keyword_josn = json_encode($keyword);
		return $keyword_josn;
	}

}

$api = new API; 


if($_GET[user]=='' || $_GET[user] == null)
{
	$api -> user = 0;
	$api -> get_dir(0);
}
else{
	$api -> get_dir($_GET[user]);
}
//echo $api -> key[1];

if ($_GET[type] == NULL || $_GET[type] == '')
{
	echo"请传入type参数！";
	exit();
}

else if ($_GET[type] ==  'txt' || $_GET[type] == 'TXT')
{
//header('HTTP/1.1 301 Moved Permanently');
//header('Location: http://api.icyuyan.net/hitokoto/tencent14766839358678907107.txt');//
	echo $api -> rand_txt();
}

else if ($_GET[type] ==  'html' || $_GET[type] == 'HTML')
{
	echo $api -> rand_txt();
}

else if ($_GET[type] ==  'json' || $_GET[type] == 'JSON')
{
	echo $api -> rand_json();
}

else if ($_GET[type] ==  'add')
{
	if((md5($_GET[user])."\r\n") == $api ->key[0] && (md5($_GET[passwd])."\r\n") == $api -> key[1])
	{
		$api -> add_data(($_GET[data] .= "\r\n"));
		echo '成功添加了 '.$_GET[data];
	}
	else{
		echo "user或者passwd参数错误";
	}
}
else{
	echo "type参数错误！";
}