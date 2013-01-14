---
layout: post
title: 说说Python Web框架Flask
category: tech
tags: python flask django
---

今天惊闻神童hacker [Aaron Swartz][Aaron Swartz]自杀了，这位只有25周岁的Hacker是无数
程序员的偶像，他的事迹有：

1. RSS标准制定者之一
2. Reddit创始人之一
3. Markdown的贡献者
4. web.py的作者
5. Creative Commons协议的参与制定
6. 抗议SOPA等等

无论拿出上面的任一条，我们已经可奉为大牛，而万千功绩集一身时，我们只能仰望。

![Aaron Swartz](/assets/images/us-three.jpg)

下午便看了一个下午的相关信息，[知乎][知乎]，[Quora][Quora]，博客等等，特别是看到[Aaron Swartz][Aaron Swartz]的
女友（或者不是）那[感人的博文][感人的博文]，真是至美的文字，和至美的情感。

至于自杀的原因，无论是忧郁症，对于牢狱的恐惧，或者是极度敏感的性格，那已经不重要了，
只是希望[Aaron Swartz][Aaron Swartz]一路走好。

提到[Aaron Swartz][Aaron Swartz]写的Python Web框架[web.py][web.py]，不禁想起了另外一个Python Web框架[Flask][Flask]，
这也是一个轻型的Web框架，有了些了解，便想记录于此。

![Flask](/assets/images/flask-logo.png)


## Flask的哲学

[Flask的哲学][Flask的哲学]我还是比较认同的，主要有几点：

1. 保持核心的micro，这样易于维护，也能保证可靠性
2. 保证1的同时，又要兼顾功能，作者选择了extension机制，这也是目前主流的软件惯用的方式，
   如chrome, firefox, [sphinx][sphinx]等

于是，相比于我更加熟悉的[Django][Django]，Flask显得轻了许多，轻巧而不失优雅，核心小而提供扩充的无限可能，
在这些方面，Django则显得笨重，无论是核心，还是辅助功能，更多的功能意味着更多的耦合，和不够灵活。

当然，另一方面，Django直接可用的所谓killer feature那自是这种笨重的原因，这便是二者的哲学差别。

## 学习门槛与效率

[Flask][Flask]本身的文档还是足够健全的，特别是对于Python/Django比较熟悉的开发者，这些都会帮助开发者来
快速应用。

至于效率，[Flask][Flask]没有内建的Admin, ORM, User等辅助功能，这可能会需要一些时间来开发，可喜的是，
[Flask][Flask]已经有[较多的extension][较多的extension], 包括: Admin, Debug Toolbar等等，所以相比于[Django][Django]，[Flask][Flask]的
效率也不会差多少。而加上其简洁的语法，和构建的快速和便利，这些都让后续的维护性有了更好的保障。

## 不足

在我看来，下面的不足或许只是时间的问题（相比Django），随着时间向前发展，[Flask][Flask]也会不断进步，到了1.0时相信
会解决大部分列表中的问题。

1. 现实使用的例子不多
2. 社区还不够完善
3. 稳定性
4. 周边的软件（如Django的South, Debug Toolbar等）

## 计划

最近会有一个[Flask][Flask]的项目，也算是对于自己学习的实践，以及通过实际使用来对[Flask][Flask]进行检验。


## 参考资料
1. [知乎][知乎]
2. [Aaron Swartz][Aaron Swartz]
3. [Quora][Quora]
4. [Flask][Flask]
5. [Django][Django]
6. [感人的博文][感人的博文]
7. [Flask的哲学][Flask的哲学]
8. [web.py][web.py]
9. [较多的extension][较多的extension]
10. [sphinx][sphinx]


[知乎]: http://www.zhihu.com/topic/19629488
[Aaron Swartz]: http://www.aaronsw.com/
[Quora]: https://www.quora.com/Aaron-Swartz-1
[Flask]: http://flask.pocoo.org/
[Django]: https://www.djangoproject.com/
[感人的博文]: http://www.quinnnorton.com/said/?p=644
[Flask的哲学]: http://flask.pocoo.org/docs/foreword/
[web.py]: http://webpy.org/
[较多的extension]: http://flask.pocoo.org/extensions/
[sphinx]: http://sphinx-doc.org/

