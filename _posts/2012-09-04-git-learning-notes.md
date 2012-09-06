---
layout: post
title: Git学习纪要
category: tech
tags: Git tutorial
---

## 缘起

其实用[Git][Git]的时间也不算晚，甚至每天都要用，例如今天[写博客][write blog]。
但是[Git][Git]的使用远没有[SVN][SVN]或者[Mercurial][Mercurial]用起来熟悉和
底气十足，特别是当*恢复一个本地文件*,*撤销一次commit*，*merge*等操作时，往往还要
查看manual。

于是，还是决定补补[Git][Git]落下的课。

## 哲学

1. Commit early, commit often (其实所有的VCS基本都是这么要求的，可是实际的项目中有几人能够做到？目前自己在这方面持续努力）
2. One commit reprsents one snapshot（必须要保证commit的代码是正常工作的，不能break the repo)
3. Enjoy playing with branches(因为分支的易用，所以使用分支是非常推荐的。)
4. Stage/Index can make you more proficient(stage的概念一方面让git更加复杂，但是也让一些流程成为可能）

## 主要特色

1. Git是snapshot based,意味着，它存储的是当期项目的一份简单快照，而不是其它VCS的基于
文件补丁或者更改的方式
2. Branch更加容易和安全, 所谓的killer feature
3. Stage/Index may be a good idea,当然如果习惯于svn/mercurial的开发者也完全可以跳过，*git commit -a*

## 关键概念

### stage/index

在我的理解，这两个应该是一个概念，在Git的帮助或者显示中也是混用的，如git status时看到的提示是*stage/unstage*,
在*git help add*看到的第一个解释却是*add file contents to the index*.

所以，二者可以作为是一个概念，也叫做*cached area*，是一个缓冲区。

当然，stage更多是当作动词来使用,index则是名词，可以翻译为*将...加到缓冲区（舞台)*和*缓冲区(舞台)*

参考 [Understanding the stage area, index and cache in git][Git stage]和[Git workflow][Git workflow].

### remote

不同于当前本地repo的repo，这个remote repo可以在本机，也可以在任何其它的机器，它指是指向的是
关联的repos.例如：

1. git remote add ~/work/another_repo  // same computer
2. git remote add http://github.com/towerjoo/towerjoo.github.com  // a real "remote" computer

## 操作

### 配置 Git Config

配置信息包括当前用户的用户名，Email，commit message时的editor等，都可以通过 *git config*
来配置。如果使用*--global*参数则会写到*~/.gitconfig*文件里记录。

Git读取配置的顺序为:*/etc/gitconfig*->*~/.gitconfig*->*.git/config*

常用的配置命令有:

1. *git config --global user.name "Zhu Tao"*
2. *git config --global user.email "Email Address"*

### 初始化 Git init

最简单的方法就是在已有的目录下*git init*来初始化，执行后，相应的git支持文件会生成，
现在就可以*增加*和*提交*文件了.

1. *mkdir myrepo*
2. *cd myrepo*
3. *git init*
4. *touch README*
5. *git add .*
6. *git commit -a -m "init repo"*

### 克隆 Git Clone

将已有的代码库克隆到本地workcopy，即用此命令，对于一个新手，通常此命令就是
我们遇到的第一个命令。

Git所支持的与代码库服务器通信的协议比较多，常用的三种: ssh, git, http

### 日常使用 Workflow

日常使用与别的VCS类似，通常也是如下流程:

1. 更改文件
2. 查看修改文件
3. 增加修改文件到版本库
4. 提交修改
5. 重复

常用的操作如下:

1. *make changes in workcopy*
2. *git status*
3. *git add .*
4. *git commit -a -m"messge"*

那么所有的修改一次就提交了。

如果我们想将修改分次提交，则会涉及到stage的概念。

*stage*就是舞台的意思，Git对于在舞台的修改才能通过commit来提交。
通过*git status*我们可以看到修改的状态：untracked, not staged等。

例如，我们修改了a.py和b.py,那么执行*git status*时:

![git status result](/assets/images/git_status_result.png)

有两个*not staged*修改，如果我们想一次提交则: *git commit -a*或者
*git add .*和*git commit*即可。

如果我们分两次提交则:

1. *git add a.py*   // 将a.py纳入舞台
2. *git commit*     // 纳入舞台的修改才能提交
3. *git add b.py*   // 将b.py纳入舞台
4. *git commit*

注意: *git commit -a* -a参数是自动将修改纳入舞台，所以也是符合*change->stage->commit*的过程。

### 查看修改 Git Diff

对于本地做的修改，我么在提交前通常是要查看做了那些修改，此时就要用到*git diff*，使用此命令
分为几种情形，具体如下:

1. 对于unstaged的修改，我们直接使用*git diff*(所有unstaged的变更)或者*git diff filename*
2. 对于staged但未commit的修改，我们可以使用*git diff --staged*(所有staged的变更)或者*git --staged filename*
3. 对于commit过的，可以使用*git diff \<commit\> \<commit\> tree/filename* (其中\<commit\>是指commit
的hash)


### 并行开发 Git Branching

Git最大的优势(killer feature）就是branching, 这是因为创建，切换，merge都很容易，所以
经常在开发中会有下面的best practice:

1. master branch是stable的代码
2. develop branch是新的feature的代码
3. develop branch稳定后，可以和容易的merge回master

常用的使用场景和流程:

![初始状态](/assets/images/branch_step1.png)

初始状态下，只有一个master默认分支.


![建立实验分支](/assets/images/branch_step2.png)

1. 可以通过 *git branch*查看当前的所有分支
2. *git branch experiment* 建立experiment分支

![在实验分支下开发和提交](/assets/images/branch_step3.png)

1. *git checkout experiment*    // 切换到experiment分支
2. make change
3. *git commit* // 在experiment分支提交

![在主分支下开发和提交](/assets/images/branch_step4.png)

1. *git checkout master* // 返回主分支
2. make change
3. *git commit* //在主分支下提交

![将实验分支merge回主分支](/assets/images/branch_step5.png)

1. *git merge experiment* //将experiment分支merge到主分支

merge有2中情况：1)自动merge成功，则会自动commit
2)自动merge失败，有冲突，则需要手动merge，并commit

手动merge的方法与SVN等相同.

![后续的多次merge](/assets/images/branch_step6.png)

然后主分支和experiment分支可以并行开发，随时merge, 随时将
实验分支的feature合入进来.

### 与远程交互 Git Remote

当需要与别人分享代码，共同开发时，就需要与远程的代码库交互，
所谓的Remote.

与SVN不同，Git可以有任意多的remote，每个remote可以有不同的权限(读/写),
从而与不同的代码库分享同步代码。

常用的命令:

1. *git remote add remote_name remote_url*  // remote_name可以是任意名称
2. *git push/pull remote_name master* // 如果有多个remote则可以在push指定

### 查看历史 Git Log

这个命令应该都很熟悉，用来显示commit的历史记录，当然Git支持更多的
输出格式，搜索等。

通过*git help log*来查看更多的选项.例如用来查看分支交互的*git log --prety=inline --graph*

### 小结

上面说的基本涵盖了日常的90%的使用情况，需要更多的了解，可以参考下面的FAQ部分。

下面这张图对整个workflow的交互过程有比较直观的描述（quote from [Git workflow][Git workflow])

![Git data transport](/assets/images/git-transport.png)

## Git FAQ

1. 如何回复本地删除的文件？  *git checkout -- filename* // 其中的--是为了
    避免与切换branch的歧义
2. 如何撤销本地的修改?  *git checkout -- filename* or *git checkout .*
3. 如何撤销一次commit? 1)如果并不修改history，则使用 *git revert \<commit\>*
2) 如果想要修改history(tree)，则可以 *get reset --hard \<commit\>*, 则被撤销
的commit不再存在。


## 参考资料

1. [Github Git Tutorial][Github_tutoral] 
2. [Git for Computer Scientist][Git Scientist]
3. [Git workflow][Git workflow]


[Github_tutoral]: http://learn.github.com/p/intro.html
[Git Scientist]: http://eagain.net/articles/git-for-computer-scientists/
[Git]: http://git-scm.com/ 
[write blog]: http://towerjoo.github.com/blog/2012/07/16/refine-my-knowledge-management-tech/
[SVN]: http://subversion.tigris.org/
[Mercurial]:http://mercurial.selenic.com/
[Git workflow]: http://osteele.com/archives/2008/05/my-git-workflow
[Git stage]: http://raflabs.com/blogs/silence-is-foo/2011/04/07/staging-area-index-cache-git/
