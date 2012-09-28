---
layout: post
title: 自动生成不同DPI资源的新项目（Mobile Resource Helper)
category: tech
tags: 
---

Android产品有若干个厂商，每个厂商出的产品的屏幕分辨率、DPI等都不尽相同，而且同一厂商不同型号
的产品通常也不相同；一贯以体验统一的苹果，在推出iPhone5后，其旗下的产品的分辨率也有5种之多，
包括:iPhone(320x480), iPhone Retina(640x960)，iPad(1024x768), iPad Retina(2048x1536),
iPhone 5(1136x640),这样在制作universal app时通常会需要制作不同尺寸的资源图片。

常规的方法是:

1. 美工制作所需最高分辨率的资源
2. 根据比例对于不同的分辨率产品进行尺寸的调整，以达到最佳显示效果

显然，当资源文件比较多，所支持的设备比较多时，此项工作显得机械、无趣和易出错，于是
便有了我的这个项目。

*Laziness is the biggest virtue to a programmer*  -- I　can't agree more with this!

## 项目介绍

![Logo](/assets/images/helper_logo.png)

这是一个简化、辅助人工操作的工作，使用Python完成，保证了其平台无关性，目前只依赖于
[PIL][PIL]，而PIL本身也对于主流系统有比较好的支持，所以能够保证此脚本在主流系统
下的可用性。

### 项目地址

目前在github上存放，具体为[Mobile Resource Helper][mobile_resource_helper]. 

### 使用场景

美工完成了高分辨率的资源图片(例如android-xhdpi), 需要相应的hdpi/mdpi/ldpi的资源，
而且相应的资源比较多，此时使用此程序会大大提高效率。

具体来讲，有原始资源文件目录$RES, 需要生成的目标目录是$OUT,那么可使用如下的命令完成：

*python handle_resources.py -p android -d $RES -o $OUT*

### 使用方法

通过 *python handle_resources.py -h* 来获取帮助.


### 注意事项

1. 需要安装[PIL][PIL]
2. 保证原始的资源有高分辨率（因为其它资源是对其进行缩小操作）




## 参考资料
1. [Mobile Resource Helper][mobile_resource_helper]
2. [PIL][PIL]


[mobile_resource_helper]:https://github.com/towerjoo/mobile_resource_helper
[PIL]:http://www.pythonware.com/products/pil/

