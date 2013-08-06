---
layout: post
title: Python中的对象比较
category: tech
tags: Python Comparisions 哲学 弊端
---

今天在回答知乎上题为[Python中字符和数字之间是怎么比较大小的？][Python中字符和数字之间是怎么比较大小的？]时，
总结了下Python关于对象比较的规则，摘取一份于此：

    参考5. Built-in Types中的说明，CPython按照如下规则进行比较（自己的总结）：

    1. 任何两个对象都可以比较
    2. 相同类型的对象（实例），如果是数字型（int/float/long/complex)，则按照简单的大小来比较；如果是非数字型，且类（型）中定义了__cmp__（含__gt__,__lt__等）则按照__cmp__来比较，否则按照地址（id)来比较
    3. 不同类型的对象（实例），如果其中一个比较对象是数字型（int/float/long/complex等），则数
    字型的对象<其它非数字型的对象；如果两个都是非数字型的对象，则按照类型名的顺序比较，如{} < "abc"（按照"dict" < "str")，而"abc" > [1,2], "abc" < (1,2)。
    4. 对于自定义的类（型）实例，如果继承自基本类型，则按照基本类型的规则比较（1-3）。否则，old-style class < new-style class, new-style class之间按照类型名顺序比较，old-style class之间按照地址进行比较
    5. bool类型是int的子类，且True=1, False=0，比较时按照1-4来比较，如True > -1, True < 4.2, True < "abc"等

上面的总结是针对Python2.x，3.x的有较大的变化，如str和int比较时会抛出异常等, 但目前业界
基本上还是更多地使用2.x，而过渡到3.x还需要一段时间（5年？）

## 评价

显然这些规则很让人费解，也与Python的哲学相悖（explicit与implicit），像上面这个问题的回答，
就有同学说是根据ascii值来比较（这也算是比较intuition），而这却不正确，它有上面复杂的规则。

Python是动态的强类型语言，也就是说它有严格的类型匹配要求，像*a=1+'2'*就是非法的，它需要进行
显式的类型转换，如*a=1+int('2')*或者*a=str(1)+'2'*。但是，在比较这个层面，却又体现出了“弱类型”
特征，并且允许任意类型的对象进行比较，这在语言设计的一致性层面显得站不住脚，也易于出错。

比较好的是，在3.x中，比较的规则有了一定的简化（当然其实还不够），例如int和str不能隐式地比较。
具体可以参考：[Python Comparisions][Python Comparisions]






## 参考资料
1. [Python中字符和数字之间是怎么比较大小的？][Python中字符和数字之间是怎么比较大小的？]
2. [Python Comparisions][Python Comparisions]


[Python中字符和数字之间是怎么比较大小的？]: http://www.zhihu.com/question/21435298/answer/18226025
[Python Comparisions]: http://docs.python.org/3.3/reference/expressions.html#not-in

