---
layout: post
title: Ruby初学体会（与Python类比）
category: tech
tags: python ruby yield mixin
---

最近学习了下Ruby，学习过程是对比着Python的，因为对于Python还是比较熟悉的，
所以在学习中也有了自己的一些体会，无关乎对错，只是一种偏好，一种哲学。

![ruby vs python](/assets/images/ruby-vs-python.png)

## 关于哲学

Python倡导的是(Quoted from [Zen of Python][Zen of Python])——

There should be one-- and preferably only one --obvious way to do it.


而Ruby则不同——

There is more than one way to do the same thing

关于Python与Ruby的比较，随便一google便一大堆，例如[Ruby 和 Python 相比有什么优势和缺陷？][Ruby 和 Python 相比有什么优势和缺陷？]等等，
但我个人认为最为重要的还是上面的哲学的差别。

举个简单的例子，比如从五道口到天安门去，可以：1.地铁 2.公交 3.出租 4.步行 5. 自行车 等等各种
方式，Ruby则允许你任选其中之一甚至混搭；Python则不同，它只提供**最优（或尽量最优）的唯一方式**，
例如地铁，那么你只能乘坐地铁去天安门。为了与编程更加贴切，完成从五道口到天安门只是其中一项工作，
还有包括记录路线，别人阅读你的路线等。

简单的例子，可以感受到二者的差别，初看或许觉得Ruby的自由选择更加人性化一些，细看时，更多的选择
会带来更多的学习成本，还不论选择的成本。

倘若编程只是为了自己阅读或者无需维护，则Ruby的方式更显得合适，但实际情况并非如此，可读性或许比
灵活性更加重要。

你已经看出来了，我是Python粉。

那么在学习过程中对于Ruby的纯OO，block，mixin等机制还是很喜欢的，相比Python我想说下我对于一些机制的
理解。

## yield

### Ruby的yield

Ruby的yield通常与block来一起使用，用于执行传进来的block，例如：

def aMethod
    yield
end

调用时: aMethod{puts('hello'}

当然也可以传递参数。

Ruby中的yield，我的理解，是与block（匿名函数）一起使用的语法结构。

### Python的yield

Python也有关键字yield，则有完全不同的用法和目的。

Python中的关键字是用于产生generator的一种语法结构，而generator则是一种memory friendly的结构，例如:

def fab(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b 
        a, b = b, a+b
        n += 1

fab(5)

上面的代码则是一个yield的示例，yield的执行大致如此：程序执行含有yield的函数时，会进行特殊处理，例如
记录变量的当前值，在下次执行时会使用保留的变量值继续执行，直到结束或者返回。

## Mixin

Ruby很强大的一个功能就是mixin，通过include module来mixin方法，提供代码的复用性。
但是Mixin作为一种通用的pattern，Python中也有较多的使用，关于在Python中的使用可以参考SO上的一个thread:
[What is a mixin, and why are they useful?][What is a mixin, and why are they useful?]






## 参考资料
1. [Zen of Python][Zen of Python]
2. [What is a mixin, and why are they useful?][What is a mixin, and why are they useful?]
3. [Ruby 和 Python 相比有什么优势和缺陷？][Ruby 和 Python 相比有什么优势和缺陷？]


[Zen of Python]: http://www.python.org/dev/peps/pep-0020/
[What is a mixin, and why are they useful?]: http://stackoverflow.com/questions/533631/what-is-a-mixin-and-why-are-they-useful
[Ruby 和 Python 相比有什么优势和缺陷？]: http://www.zhihu.com/question/19552194

