---
layout: post
title: Git非常用命令说明
category: tech
tags: Git Git命令
---

有一些命令不太常用，但当遇到特定的使用场景时，就显得特别重要，而有些命令则是
在其它VCS下没有或者意义完全不同（甚至相反）的，本文就是为了记录这些命令的
用法.

## 命令

###  Git Fetch

简单地说, *git fetch + git merge = git pull*

所以，git fetch只是将从remote取得的更新更新到local repos，并不与work space来
合并，如果需要合并则可通过*git merge*来完成。

好处是，在合并之前可以查看相应的修改是否适合合并。

### Git Stash

假如你已经在本地做了修改，突然发现修改没有完成时又有一个更加紧急的bug来fix，
此时你可以将你的修改暂时存储起来，*git stash*就是为了这个目的。

常用的命令:

1. *git stash* //将本地的个性暂存起来，work space revert到HEAD
2. *git stash list* //查看当前所有的stash
3. *git stash apply \<stash\>* //将<stash>合并到当前workspace
4. *git stash drop \<stash\>* // 删除stash


### Git Rebase

我所理解的rebase使用场景是这样的：在一个branch工作一段时间，而在此期间master本身
有更新，于是我们在将branch中的代码merge到master之前可以将master中的更新rebase到branch中，
也就是将branch的分支起点与master同步。

例如，

![Before Rebase](/assets/images/git_rebase1.png)

假设A分支是master，B分支是dev分支，B分支在A1 commit时建立，并且master/dev分别进行了多次commit,
那么执行:

1. *git checkout dev*  //进入dev分支
2. *git rebase master* //将dev的分支起始点(base)重新定位到合并后的HEAD(所谓的re-base)

执行后的结果应该为:

![After Rebase](/assets/images/git_rebase2.png)

(当然期间合并过程中可能某些commit会合并)

(从base的角度来看，dev分支的base与master的HEAD同步了，也就是rebase了)

对于*git rebase master*它实际的操作过程应该是:1)先将master分支的代码与当前工作分支dev的代码
的commit进行对比，确认差别的起始位置（即上面的A1点) 2)将master中自差别的起始位置到HEAD的
所有commit依次与当前分支dev的代码进行合并，合并完成即可。

注意合并期间可能会有冲突，手动解决后，可执行*git rebase --continue*来继续rebase.

关于rebase可以参考[Git Rebase说明][git rebase intro]和[intro to rebase][intro to rebase],关于rebase和merge的区别和关系
可参考[Git Rebase and Merge][git rebase and merge].


### Git Reset

Git Reset通常是用来取消一些本地的commit，对于已经push的commit不建立使用*git reset --hard*，因为这样会修改
整个的commit history，一些commit会从历史上完全消失。

通常的使用场景:

1) 回溯到某次commit,保留commit中的修改文件（不会删除文件)

1. *git commit ...*
2. *git reset --soft HEAD^* // 回溯到上次的commit,与那个版本不相关的文件会保留，并处于unstage状态

2) 取消某次stage

1. *git add abc.py*
2. *git reset \<filename\>* // unstage filename

3) 回溯到某次commit,删除与回溯版本无关的文件（会删除文件）

1. *git commit ...*
2. *git reset --hard HEAD^^* //回溯到上上一次commit，删除那个版本不相关的文件和修改


## 参考资料

1. [Git Rebase说明][git rebase intro]
2. [intro to rebase][intro to rebase]
3. [Git Rebase and Merge][git rebase and merge]


[git rebase intro]: http://www.cnblogs.com/kym/archive/2010/08/12/1797937.html
[git rebase and merge]: http://gitguru.com/2009/02/03/rebase-v-merge-in-git/
[intro to rebase]: http://gitready.com/intermediate/2009/01/31/intro-to-rebase.html
