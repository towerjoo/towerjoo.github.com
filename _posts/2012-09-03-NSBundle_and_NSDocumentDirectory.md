---
layout: post
title: iOS下使用本地文件存储应用数据(NSBundle和NSDocumentDirectory)
category: tech
tags: iOS 安全 sandbox
---

在iOS开发中经常会遇到用户数据持久化的问题,一个比较简单的方法是在用户的sandbox
运行环境下使用plist进行存储和读取,这里面有个最常遇到的问题就是有时发你
觉得自己的代码没有问题时,但是就是不能存储成功.

看下面的代码片断.

<script src="https://gist.github.com/3601289.js"> </script>

乍一看没有任何问题,但是在执行中会发现数据永远都不能存储.

于是我们开始思考可能会是权限的问题,于是在google的帮助下,我们使用了下面的代码:

<script src="https://gist.github.com/3601310.js"> </script>

然后在执行时,一切都正常了!整个世界安静了.

作为目标是一流程序员的我们当然不甘于只知道how,我们更要知道why.

## why


![ios sandbox](/assets/images/ios_app_layout.jpg)

阅读官方文档总是最好的办法, 请看[苹果官方文档][1]中关于文件结构的说明:

$home/AppName.app   -> 这个就是我们上面代码片断1中的[NSBundle mainBundle],而这个目录是只读.
主要是为了安全考虑.

$home/Docuemnts/  -> 这个就是我们代码片断2中所指向的路径,而此目录正是为了存储应用的数据等信息,
所以在此目录下存储是非常合适.

其它目录说明参考[苹果官方文档][1].

[1]: http://developer.apple.com/library/mac/#documentation/FileManagement/Conceptual/FileSystemProgrammingGUide/FileSystemOverview/FileSystemOverview.html

