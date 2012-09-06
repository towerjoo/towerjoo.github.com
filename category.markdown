---
layout: list
title: Category
---

{% include header.tpl %}
{% assign list = site.posts %}


<div id="main">
<ul class="listing">
{% for cat in site.custom.categories  %}
    <li class="listing-seperator">{{ cat.title }}</li>
    {% for post in site.posts %}
    {% capture c %}{{post.category }}{% endcapture %}
    {% if c == cat.name %}
    <li class="listing-item">
    <small><time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time></small>
    <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
    </li>
    {% endif %}
    {% endfor %}
{% endfor %}
</ul>
</div>
