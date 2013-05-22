---
layout: post
title: 编译原理系列之词法分析相关重要工具
category: tech
tags: Lex FSM
---

## Lex

语言可以形式化描述（Regular Express)，所以也是可以自动化
生成相应的词法分析工具，而Lex(Flex)即是这样的工具——
生成词法分析工具的工具。

例如，有如下的词法定义：


<script src="https://gist.github.com/towerjoo/5625561.js"></script>

Lex的语法还是比较简单的，通常即是用正则表达式来定义语言，像：


<pre>
digit       [0-9]
integer     {digit}+
exponant    [eE][+-]?{integer}

real        {integer}("."{integer})?{exponant}?
</pre>

是对实数的定义。

当然，lex工具的使用通常是与yacc一起的，也是为什么这两个工具如同好基友
一样总是一同提及。yacc是生成语法分析工具的工具，它是根据语言的生成式
来生成其相应的语法分析工具，而生成的语法分析工具可以将lex的输出token串
转换为中间表达式（如树等）

而上面的lex源程序对应的yacc源程序为：

<script src="https://gist.github.com/towerjoo/5625588.js"></script>

如此，一个简单的计算器的词法分析和语法分析便完成了。

具体的编译可以参考：

[An example: a little expression interpreter][An example: a little expression interpreter]

## 参考资料

1. [An example: a little expression interpreter][An example: a little expression interpreter]

[An example: a little expression interpreter]: http://pltplp.net/lex-yacc/example.html.en
