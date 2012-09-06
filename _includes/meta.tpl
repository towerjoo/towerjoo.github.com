{% if post.title == "About"%}
{% else %}
<p class="meta">
	<span class="datetime">{{ post.date | date: "%Y-%m-%d" }}</span> posted in [<a href="/category/{{ post.category }}" class="category">{{ site.custom.category[post.category] }}</a>] with tags: [{{ post.tags | array_to_sentence_string }}]
</p>
{% endif %}
