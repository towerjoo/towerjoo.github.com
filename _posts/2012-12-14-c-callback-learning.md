---
layout: post
title: C语言中的“回调函数”学习
category: tech
tags: C callback pointer
---


## 缘起

最近在做一个调用第三方库的项目，此库提供的接口是如下的结构体:

<script src="https://gist.github.com/4283566.js"></script>

对于c语言这样的使用场景之前还是遇到的比较少的，特别是对于回调函数的
使用，所以决定学习下C中回调函数的使用。

## 心得

###  直接使用函数指针

<script src="https://gist.github.com/4283555.js"></script>

这是一个很简单的使用函数指针的例子,但是函数指针的定义和声明显得
过于繁琐，所有有了[typedef][typedef]可以来简化。

### 使用typedef

<script src="https://gist.github.com/4283528.js"></script>


### 使用struct来传递额外的参数

<script src="https://gist.github.com/4283562.js"></script>

对于额外参数的传递，使用struct来作为数据结构的聚合还是比较合适的，
一个结构体中包含回调函数，回调函数所需要的参数等等。

## 总结

回调函数在各种语言中都有广泛的应用，特别是异步编程的流行，例如JS中
ajax的回调，或者各种事件机制下的调用等，总之C中的回调更加底层一些，
也能够更加了解C中的指针之强大。



## 参考资料
1. [typedef][typedef]


[typedef]: http://en.wikipedia.org/wiki/Typedef

