---
layout: page

pageClass: page-type-post

scripts:
  - http://tech-justlog-me.disqus.com/embed.js

---

{% include header.tpl %}

<article>
	<h1><a href="{{ page.url }}">{{ page.title }}</a></h1>
	{% assign post = page %}
	{% include meta.tpl %}
	{{ content }}
	{% capture permaurl %}http://{{site.host}}{{ page.url }}{% endcapture %}
	<!--<p class="permalink">永久链接：<a href="{{ permaurl }}">{{ permaurl }}</a></p>-->
</article>
<div id="disqus_thread" class="comments"></div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript">var jiathis_config = {data_track_clickback:true};</script>
<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jiathis_r.js?move=0&amp;btn=r2.gif&amp;uid=89469" charset="utf-8"></script>
<!-- JiaThis Button END -->

<script type="text/javascript" src="/assets/js/site.js"></script>
