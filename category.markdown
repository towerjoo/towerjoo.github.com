---
layout: list
title: Category
---

{% include header.tpl %}
{% assign list = site.posts %}


<ul class="listing">
{% for post in site.posts %}
{% capture c %}{{post.category }}{% endcapture %}
{% if category != c %}
{% assign category = c %}
<li class="listing-seperator">{{ site.custom.category[c] }}</li>
{% endif %}
<li class="listing-item">
<small><time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time></small>
<a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
</li>
{% endfor %}
</ul>
