为什么会突然搞一个一言的API呢
原因是前几天的一个梦，我收到一份礼物，是一封信。拆开是两张很精致的纸，其中一张写了大大大大的I hate U.另一张用蝇头小楷写满了I miss U. 于是就有了这个![一言API][1]

**好像扯远了，下面开始正题！**
##调用一言库##
####请求地址：http://api.icyuyan.net/hitokoto/index.php ####
####请求方式：GET####

>调用官方库示例：
>https://api.icyuyan.net/hitokoto/?type=txt
>调用私人库示例（此示例无返回则无此用户）：
>https://api.icyuyan.net/hitokoto/?type=txt&user=YourUserName
>添加条目示例：
>https://api.icyuyan.net/index.php?user=YourUser&passwd=YourPassword&data=ILOVEU

| 参数   | 数据结构   | 介绍           | 默认值(带有默认值的参数可以不写在请求链接里) |
| ---- | ------ | ------------ | ---------------- |
| type | string | 指定输出格式，添加语录。 | 暂无，(考虑吧txt做成默认值) |
| user | string | 指定输出用户库的条目     |0，(0也是官方库)           |
| passwd | string | 用于添加条目以认证user |暂无(不添加条目时可以不写)    |
| data | string | 用于添加条目   |暂无(不添加条目时可以不写)             |
###type参数详解###
| type的参数 | 介绍|
| ---- | -------------------------------|
| txt  | 以txt格式随机返回指定库的一条语录  |
| json | 以json格式随机返回指定库的一条语录 |
| add  | 添加条目专用！配合上表user，passwd参数可添加条目到指定库 |

##新建用户一言库##
####请求地址：http://api.icyuyan.net/hitokoto/add.php ####
####请求方式：GET####

> 示例：https://api.icyuyan.net/add.php?user=YourUser&passwd=YourPassword&email=i@i-em.me

| 参数   | 数据结构 | 介绍         |                  |
| ----   | ------ | ------------ | ---------------- |
| user   | string | 创建用户的用户名     |重要参数,请务必牢记 (丢失无法找回)       |
| passwd | string | 密码                |重要参数,请务必牢记       |
| email  | string | 邮箱                |                         |

  [1]: http://ok9lhjky0.bkt.clouddn.com/2018/05/1038855631.jpeg?imageView2/0/w/700/q/100
