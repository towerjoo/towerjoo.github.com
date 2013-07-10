---
layout: post
title: WiX——用于制作Windows MSI安装程序的利器
category: tech
tags: WiX MSI CI
---

话说今天是美国的国庆日了，想必也有类似的黄金周的假期，于是可以一家在周边驱车
郊游，享受这无边的惬意，即使只在家旁，也是一片绿意盎然，独栋外加大大的草地、
宽阔的马路，于是我便想起了昨天在水木上看到的别的华人在西雅图晒自己家的照片，
唯有一句话可抒内心的情感：万恶的美帝！

当然，今天不谈政治，不谈生活，只谈乌托邦的技术。

![wix](/assets/images/wix_logo.png)

## Windows下程序的分发

除了所谓的绿色软件，大致分发时，都是需要相应的安装程序，来进行文件的拷贝、注册表
的写入、自启动的加入等，一些复杂的软件还需要对于运行环境的检测、依赖的检测等，
以确保可以正确安装。而随着互联网时代的到来，程序的更新也与安装程序相关。

于是，安装程序便是在开发完成软件后最后一个关键的步骤，而自Windows垄断桌面操作系统后，
相应的解决方案也是[各类繁多][各类繁多]，用得比较多的有*InstallShield*, *Inno Setup*, *NSIS*, *WiX*
等，而Windows推荐的是MSI格式的安装包，所以使用微软自己的*WiX*也是比较合适的。

## 关于MSI

[MSI][MSI]是微软推荐的安装程序，它有几个好处：

1. 与Windows的结合更加紧密
2. 便于Windows维护安装程序的数据库
3. 回退、版本、权限等功能的支持

而在本次所参与的一个项目中，客户便要求使用MSI的安装程序。

## 关于WiX

相应的可以生成MSI安装程序的软件是比较多的，如InstallShield等，选择WiX有如下几个好处：

1. 基于纯文本的XML作为构建基础，这使得构建的配置粒度、版本控制等更加容易操作
2. WiX提供了一系列的辅助程序，便于通过命令行完成整个MSI构建过程
3. 支持命令行构建，更加便于集成到CI中
4. WiX与VS等能够较好结合使用


关于WiX的介绍有[不少的内容][不少的内容]，这里就不再介绍，我想在这里说明下我自己如何使用Python和Windows批处理
文件来自动化整个构建过程，及如何集成到CI服务器中。

代码可以在[WixSample][WixSample]中查看。

### 生成wxs源文件

wxs是作为WiX项目的源文件，后续的编译、链接都是基于此文件，所以生成、管理此文件是首要的工作。
对于一个简单的项目（文件数量较少），则可以选择手动管理的方式来进行，但是当文件数量比较大时~1000，
则手工进行显然是不现实的，为此，基于wxs的XML纯文本格式，及Python强大的文本处理能力，二者结合起来
可作为wxs源文件的生成与管理方案。

[gen_wxs.py][gen_wxs.py]文件即是负责此工作，它主要的功能包括：

1. 遍历目录结构，来为每个文件生成相应的component(含GUID)
2. 支持临时（中间）文件的清理
3. 支持多语言的patch

如此，只需要执行 *gen_installer.bat* 即可生成相应的MSI文件。

### 如何支持多语言

对于有自定义字符串的安装程序，必然涉及到多语言支持问题，最好的处理方式，应该是：

<pre>
安装程序可根据系统语言来显示相应的安装语言，对于不支持的语言，则显示默认语言。
</pre>

但是，WiX的官方文档中提到的**只能为一特定语言生成一特定的MSI安装包**，显然此种分发方式不太合理，也不易于
维护和管理。于是便有了Undocumented的解决方案，可以参考几个文档：

1. [Creating a multi-language MSI][Creating a multi-language MSI]
2. [Multi-Language MSI Packages without Setup.exe Launcher][Multi-Language MSI Packages without Setup.exe Launcher]

而通过[gen_installer.bat][gen_installer.bat]也可以查看我的解决方案。

### 关于升级的处理

这块目前仍在研究，待研究清楚，再更新。

[更新2013年7月9日]

对于一般的应用场景，进行[大版本升级][大版本升级]即可，而无须考虑所谓的patch升级，如此场景，WiX提供了简便的方法，即：

    <MajorUpgrade DowngradeErrorMessage="!(loc.Install_OldVersion)" />

上面的代码即可保证，**只请允许从低版本向高版本升级，而不允许从高版本向低版本降级**。

升降级相关的处理上，有如下几点需要特别注意：

1. [MSI][MSI]的版本号有效位为三位，即xxx.xxx.xxxxx，如果有更多位，则会忽略，其中三个部分分别为：major version, minor version
   和build number, 有效范围分别为[0,255],[0,255],[0,65535]
2. Product Id="*" 用于生成一个随机的Id, **对于大版本升级，每次升级需要更新Product Id**,具体参考[Changing the Product Code][Changing the Product Code]

### 关于CI服务器的集成

Jenkins是业内用得比较多的CI服务器，如果是Windows项目，则CI服务器可配置在Windows服务器上，在安装必要的依赖
软件后，则可将[gen_installer.bat][gen_installer.bat]脚本进行部署，继而每次build都生成相应的MSI。




## 参考资料
1. [Multi-Language MSI Packages without Setup.exe Launcher][Multi-Language MSI Packages without Setup.exe Launcher]
2. [Creating a multi-language MSI][Creating a multi-language MSI]
3. [gen_wxs.py][gen_wxs.py]
4. [WixSample][WixSample]
5. [gen_installer.bat][gen_installer.bat]
6. [MSI][MSI]
7. [各类繁多][各类繁多]
8. [不少的内容][不少的内容]
9. [大版本升级][大版本升级]
10. [Changing the Product Code][Changing the Product Code]


[Multi-Language MSI Packages without Setup.exe Launcher]: http://www.installsite.org/cgi-bin/frames.cgi?url=http%3A%2F%2Fwww.installsite.org%2Fpages%2Fen%2Fmsi%2Farticles%2Fembeddedlang%2Findex.htm
[Creating a multi-language MSI]: http://packtlib.packtpub.com/library/9781782160427/ch12lvl1sec82
[gen_wxs.py]: https://github.com/towerjoo/WixSample/blob/master/gen_wxs.py
[WixSample]: https://github.com/towerjoo/WixSample
[gen_installer.bat]: https://github.com/towerjoo/WixSample/blob/master/gen_installer.bat
[MSI]: http://en.wikipedia.org/wiki/Windows_Installer
[各类繁多]: http://en.wikipedia.org/wiki/List_of_installation_software
[不少的内容]: https://www.google.com.hk/search?newwindow=1&safe=strict&biw=1600&bih=872&q=Wix+tutorial&oq=Wix+tutorial&gs_l=serp.3..35i39j0j0i30l8.2808507.2810277.0.2810463.12.8.0.0.0.0.369.692.3-2.2.0...0.0.0..1c.1.17.serp.wETC5A6bWiM
[Changing the Product Code]: http://msdn.microsoft.com/en-US/library/aa367850.aspx
[大版本升级]: http://msdn.microsoft.com/library/aa369786.aspx
