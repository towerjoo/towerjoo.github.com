---
layout: post
title: iOS开发中游戏与应用开发的差别
category: tech
tags: cocos2d iOS app 对比
---

从2007年发布iPhone，到后来大行其道的iPhone,iPod,iPad等果粉们热烈追逐
的神器，带给我们码农的便是一些职业的机会，和一些赚些小钱的可能。

2009年起开始了Mac下的程序开发，从黑苹果，到真正的黑色苹果（我买的
是一个二手的黑色外壳的MacBook），然后是iPod, iPad一路过来，
感叹苹果产品的极致体验的同时，也开始了自己的Mac/iOS开发历程。

![黑色MacBook](/assets/images/black_macbook.jpg)

注：我的所有苹果设备都是二手的，码农没钱啊，囧。2011年乔不死离开之时，
我也曾有个简单的不是悼文的感慨，可以从[知乎这里][zhihu jobs]来看到。

# 开发历程

最初也是媚俗地进行的一些C2C(Copy to China)的游戏开发，当然我们使用的是[cocos2d-iphone][cocos2d-iphone]，
优美的框架，甚至让开发者不用关心什么Interface Builder, View Controller, Delegates等
这些陌生的词，要做的只是如同堆积木一般在自家的客厅里进行各式的堆积和创意，其中的
动态效果也是自成一套系统，甚至你根本感受不到iOS本身开发的元素。

再到后来，也做一些App的开发，这便是基于iOS本身的View Controller来进行，.h/.m/.xib三合一的模式
在每天延续着，动态效果则是只能受限于iOS本身的Design Guide，再到后来的storyboard等，让整个开发
过程更加简洁和敏捷。

于是乎，在使用cocos2d时，想要iOS的元素(navigation, table等），而在做app时，却时不时地想
x.position=ccp(x,y)来定位。无果后，想着这或许是人生的最大悲剧——你和她永远没有交集（当然有无数的
人在一旁高呼“在一起”，行动家也在努力地尝试着实际的办法。）


# 游戏开发与App开发

我做个简单的对比，当然都是个人的感受，或许不太客观，当然也只能尽力而为了。


<table border="1">
    <tr>
        <td></td>
        <td>游戏</td>
        <td>应用</td>
        <td>备注</td>
    </tr>
    <tr>
        <td>开发难度</td>
        <td>☆☆☆</td>
        <td>☆☆☆☆</td>
        <td>iOS太多的hook，以及美术与程序员的耦合太强(想想IB)，内存管理也比较头疼</td>
    </tr>
    <tr>
        <td>入门难度</td>
        <td>☆☆☆</td>
        <td>☆☆☆☆</td>
        <td>tab/navigation等切换和嵌套，元素的复用等，在iOS的开发模式中都需要时日才能掌握</td>
    </tr>
    <tr>
        <td>动态效果定制</td>
        <td>☆☆☆☆</td>
        <td>☆☆☆</td>
        <td>App的开发必须要遵循Apple的Guide并且只能使用有限的动态效果，cocos2d则完全自由</td>
    </tr>
    <tr>
        <td>开发资源</td>
        <td>☆☆☆</td>
        <td>☆☆☆☆☆</td>
        <td>当然Apple的文档和社区要远大于cocos2d，相关的参考源代码也更加易用</td>
    </tr>
    <tr>
        <td>整体评价</td>
        <td>☆☆☆☆</td>
        <td>☆☆☆☆</td>
        <td>各自当然是更适合各自的场景，在各自的场景二者都是比较完美的解决方案</td>
    </tr>
</table>


# 我的几个游戏

顺便做下广告，加下我做的游戏的链接，其实就是一个（还有一个正在开发）：

1. [Gem Town(iPhone Version)][Gem Town iPhone]
2. [Gem Town HD(iPad Version)][Gem Town iPad]
3. [Gem Town Lite(iPhone Version)][Gem Town iPhone Lite]

![Gem Town](/assets/images/gemtown.jpg)

简单的介绍：

> Gem Town is a 60 second gem rush: click colorful gems, unleash magic diamonds and active the magic fire to achieve a high score.
>
> You can level up, earn bonus to make higher score and more!




[zhihu jobs]: http://www.zhihu.com/question/19870437/answer/13206843
[cocos2d-iphone]: http://www.cocos2d-iphone.org/
[Gem Town iPhone]: http://itunes.apple.com/tr/app/gem-town/id455175115?mt=8
[Gem Town iPad]: http://itunes.apple.com/cn/app/gem-town-hd/id456580956?mt=8
[Gem Town iPhone Lite]: http://itunes.apple.com/tr/app/gem-town-lite/id462553156?mt=8

