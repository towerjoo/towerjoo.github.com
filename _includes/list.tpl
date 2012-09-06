{% include header.tpl %}

<div id="main">
{% for post in list limit 10 %}
<article{% if forloop.index == 1 %} data-loaded="1"{% endif %}>
   <span class="title_date">{{ post.date | date: "%Y-%m-%d" }}</span> <a class="title" href="{{ post.url }}">{{ post.title }}</a>
	<div class="article-content">
	{% if forloop.index == 1 and preview %}
		{{ post.content }}
	{% endif %}
	</div>
</article>
{% endfor %}

{% if list == null %}
<article class="empty">
	<p>该分类下还没有文章</p>
</article>
{% endif %}
</div>
