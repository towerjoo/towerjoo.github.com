---
layout: post
title: IE下console惹得祸
category: tech
tags: IE console Javascript
---

最近在完成一个前端页面功能时遇到了一个奇怪的问题，也就是
在其他浏览器（包括Firefox, Chrome, Safari）上正常工作的页面
JS在IE下不能工作，更加奇怪的是不能工作的页面在IE下当打开
开发者工具时，又可以工作了。Goolge之，果然是个很多人都曾遇到的
问题，具体结论如下。

**JS代码中有console.log类似的调试语句，而此语句在IE上是默认不
支持的，但是当打开IE的开发者工具时，console对象在IE中才enable了**

具体可参考[Stackoverflow帖子][Stackoverflow帖子]。

这个问题可能像我一样最初将问题归结为IE对于标准的支持不完善，微软
背得罪名，然而事实是console.log并不是JS标准的一部分，而只是习惯延承
下来的，与实现相关的，所以浏览器厂商可以选择是否支持此对象。

从这个问题我大致可以学习到：

1. 不要自以为是。人云亦云齐骂微软IE并不能将任何屎盆子扣在其头上。
2. 生产代码上不能含有debug的代码
3. 需要了解标准，而不是习惯


## 参考资料
1. [Stackoverflow帖子][Stackoverflow帖子]


[Stackoverflow帖子]: http://stackoverflow.com/questions/7742781/ie9-bug-javascript-only-works-after-opening-developer-tools-once-very-stran
