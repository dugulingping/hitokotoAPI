<?php
error_reporting(E_ALL^E_NOTICE^E_WARNING);//关闭错误提示
if($_GET[user] == "" || $_GET[user] == null)
{
	echo "plase input true user.";
	exit();
}
if($_GET[passwd] == "" || $_GET[passwd] == null)
{
	echo "plase input true passwd.";
	exit();
}
if($_GET[email] == "" || $_GET[email] == null)
{
	echo "plase input true email.";
	exit();
}
$usermd5 = md5($_GET[user]);
$dir = "./hitokoto/".$usermd5.'.list';
$passwd = md5($_GET[passwd])."\r\n";
$email = $_GET[email]."\r\n";


//var_dump($dir);
$file = fopen($dir, "w");
fwrite($file, $usermd5."\r\n");
fwrite($file, $passwd);
fwrite($file, $email);
fwrite($file, "一言hitokoto，你生活的一部分 ————独孤伶俜\r\n");
fclose($file);
echo "属于你的一言(hitokoto)库创建成功<br />账号:".$_GET[user]." 密码:".$_GET[passwd]." email:".$_GET[email];
echo "<br />注意重复执行本页面可能会丢失数据！！！！！！！<br />本系统是暂时测试版！不对任何数据负责！请自行备份！v0.1";
exit();
	