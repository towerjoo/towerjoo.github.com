---
layout: post
title: 编译原理系列之词法分析相关重要算法
category: tech
tags: KMP DFA NFA
---

## KMP算法

 
 解决问题：字符串A和字符串B，判断B是否为A的子串
 
###  思路一：

最直观的算法为：

1. i为A串中的第i个元素, M为\|A\|, N为\|B\|
2. i = 0
3. 如果i >= M-N，则不是子串，否则
4. 比较B与A[i:N-1]是否相同
5. 如果相同，则是子串，否则i+1, goto 3)
 
思路一中的算法是最朴素的，当然朴素的算法通常效率并不
高，其时间复杂度是O(MN)，当然通常情况是达不到最坏的复杂度的，
因为4）中的比较通常无须比较N次就会得出结论。
 
思路一的问题是，前一次的比较并没有对后一次的比较提供有效的信息，
也就是说4）中的每次比较都是独立的，相互之间并没有借用有效的信息。
 
例如：
<pre> 
  A: banananobano
  B: nano
 
  iteration  banananobano
     0       X
     1        X
     2         nanX
     3          X
     4           nano
</pre>
   
显然iteration 2已经知道A[2:4] = "nan"，所以iteration 3时则无须从
比较A[3]和B[0],而且已知A[4]='n'，也无须比较A[4]和B[0],而是直接比较
A[5]和B[1]
  
所以KMP解决的最重要问题就是如何利用已经匹配信息的问题, 从而避免+1的匹配，而是跳过做够长的距离来匹配。 
形式化地可以说明为：经过第i次匹配的比对后，程序是知道A[i:i+j-1]是什么
字符串的，也就是知道A[i:i+j-1]与B[0:j-1]是匹配的。

<pre>
  i=2: n a n
  i=3:   n a n
</pre>

在i=2后，我们是知道A[2:4] = B[0:3] = "nan"，那么i=3时
我们应该跳过冲突(confilict）的比较，直到不冲突的为止，例如A[3:4] = "an", B[0:1] = "na"，

所以:
<pre>
  i=2: n a n
  i=3:     n a n o 
</pre>

可以看到也就是当前匹配的子串x（partial match）与匹配串(B)的overlap，overlap可定义为：
既是x的后缀也是B的前缀的最长字符串，且不等于x或者B。所以"nan"和"nano"的overlap就是"n"
那么，A下次的起始匹配位置应该是i+ max(1, j-overlap(A[i:i+j-1], B)),而
A[i:i+j-1]=B[0:j-1]，所以有：

Next(i) = i+max(1, j-overlap(B[0:j-1], B))

可以看到，i的下一个匹配位置与被匹配串A无关，只与匹配串B有关。
  
第二个优化是内循环的优化，如：
<pre>
  i=2: n a n
  i=3:     n a n o
</pre>

如上，i=2时已经知道A[4]="n"，B[0]="n"，所以也无须比较A[4]与B[0]，形式化地说明为:

  Next(j)=overlap(B[0:j-1], B)
 
经过2此优化（获得有效的next(i)和next(j))从而通过已知的信息避免了无效的比较，提高了效率。
而这个算法便是KMP算法。
  
对于KMP算法剩下的问题便是overlap的计算方法，因为其不依赖于被匹配串，所以可以提前计算并以
表的形式存储供KMP算法中查询，当然也可以实时计算（需要时计算）.
  
假设w是串x和y的overlap, 那么w<suffix(x) && w<prefix(y), w最大
shorter(w)是w的少了一个字符的prefix,显然shorter(w)<prefix(y), 而且shorter(w)也是shorter(x)
的suffix,于是我们可以逆过来，即：

找到一个既是shorter(x)的suffix又是y的prefix的字符串，通过不断为其增加一个字符，
那么可以求出相应的overlap table，如果加一个字符后不满足suffix/prefix的要求，则需要回溯计算。


## 参考资料

1. [KMP算法详解][KMP算法详解]
2. [Knuth-Morris-Pratt string matching][Knuth-Morris-Pratt string matching] (讲到的overlap的提法还
   是比较新颖的，也易于理解）

[KMP算法详解]: http://www.matrix67.com/blog/archives/115
[Knuth-Morris-Pratt string matching]: http://www.ics.uci.edu/~eppstein/161/960227.html
