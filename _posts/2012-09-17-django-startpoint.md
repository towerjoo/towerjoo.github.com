---
layout: post
title: 自己的一个小项目Django Startpoint
category: tech
tags: project django
---

使用[Django][django]已经有几年了，每当遇到一个新项目
便要*start project*等一系列的准备工作，而这些工作着实
没有一点技术含量，根据程序员美德之一的*lazy*,便有了
此项目。

![django startpoint logo](/assets/images/django_startpoint.png)

## 相关资源

1. [项目地址 ][project_path]
2. [提交Issue][report_issues]


This project is to ease the start of a new django project which is called *start point* in this project.

And it should:

1. easy to start from
2. easy to customize
3. add some useful toolkits

## Features

Now the current project supports:

1. [django debug toolbar][debug_toolbar] supports - to ease development/bugfixing
2. [django evolution][evolution] - to migrate the models when fields changed. I prefer this to [south][south]
3. basic setup: admin, static files, etc.
4. a *reasonable* directories layout, at least for me.

## Usage

To use this tool, you can:

1. clone or download the source code
2. *cd* to the root directory of the source code, and run the *rename.py* to change the project name to what you want.
   *python rename.py -h* will show you the usage of that script
3. after *syncdb* and *runserver* you'll see your page in *http://localhost:8000/sample/* for the builtin sample app


## TODO

Check [To Do List][todo] here.


[debug_toolbar]:https://github.com/robhudson/django-debug-toolbar
[evolution]:http://code.google.com/p/django-evolution/
[south]: http://south.aeracode.org/
[todo]: https://github.com/towerjoo/django_startpoint/issues?labels=TODO&page=1&state=open
[report_issues]:https://github.com/towerjoo/django_startpoint/issues?state=open 
[project_path]: https://github.com/towerjoo/django_startpoint 
[django]: http://www.djangoproject.com
