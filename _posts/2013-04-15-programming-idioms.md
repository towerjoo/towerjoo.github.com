---
layout: post
title: 常见的编程idioms
category: tech
tags: RAII DIP IoC 
---


## RAII

[RAII], 也就是Resources Acquisition is Initialization, 对应的中文术语没有固定的，所以
我们还是称为RAII。这个概念是C++的创始人提出并应用于C++，继而后续很多语言也开始使用
这个模式，例如C#, Python等。

核心而言，这种模式是为了更好地管理资源的生命周期，**保证无论是成功操作，或者出现异常，都能够
正常关闭申请的资源。**

in C++, 由于存在destructor(析构函数），所以资源作为一个类，可以在析构函数中进行资源的关闭；
C#中存在managed resources和unmanage resources的区分，前者GC可以自动回收，后者需要显式dispose。
对于RAII，C#常用的方式是使用using statement.

in Python, 因为与C#类似，与using相似，Python使用with statement来实现RAII。

上面的各种RAII的实现，等价于try .. finally，当然是需要语言支持的。

一个RAII的常见例子:

<script src="https://gist.github.com/towerjoo/5395943.js"></script>


上面是使用with的RAII示例，能够保证在with block后，文件资源能够得以正确释放。

等价于:

<script src="https://gist.github.com/towerjoo/5395955.js"></script>
    

## Programming to Interface, not Implementation

这算是OO的基本要求或者说是精华之一，也是区别于面向过程语言的优势。
这样的好处是易见的，抽象带来的灵活性（注意在人类历史上，抽象总是优于具象，是
人类发展的标志之一），以及后期的维护性（重构等的成本）。

在[SO]上有个不错的帖子给出的示例还是比较贴切的，大致如下：

场景：一个游戏，需要在人物吃饭时引入一些烦人的事件。
目前在游戏中设定的烦人事件包括：苍蝇，推销电话。

那么有如下的设计：

<script src="https://gist.github.com/towerjoo/5395963.js"></script>

上面代码中的createAnnoy(IPest pest)其中的参数为接口IPest而非具体的类（实现），
这即是所谓的Programming to interface, not implementation


## Dependency Inversion Principle

