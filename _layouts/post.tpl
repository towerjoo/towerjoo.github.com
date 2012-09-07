---
layout: page

pageClass: page-type-post

scripts:
  - http://tech-justlog-me.disqus.com/embed.js

---

{% include header.tpl %}

<div id="main">
	<h1><a href="{{ page.url }}">{{ page.title }}</a></h1>
	{% assign post = page %}
	{% include meta.tpl %}
	{{ content }}
	{% capture permaurl %}http://{{site.host}}{{ page.url }}{% endcapture %}
	<!--<p class="permalink">永久链接：<a href="{{ permaurl }}">{{ permaurl }}</a></p>-->
	<div id="prevnext">
	{% if post.previous %}
		<span><a id="prevpost" href="{{ post.previous.url }}" title="{{ post.previous.title }}">&lt;&lt; Previous</a></span>
		{% endif %}

		{% if post.next %}
		<span><a id="nextpost" href="{{ post.next.url }}" title="{{ post.next.title }}">Next &gt;&gt;</a></span>
		{% endif %}
	</div>

</div>
<div id="disqus_thread" class="comments"></div>
<!-- JiaThis Button BEGIN -->
<script type="text/javascript">var jiathis_config = {data_track_clickback:true};</script>
<script type="text/javascript" src="http://v3.jiathis.com/code_mini/jiathis_r.js?move=0&amp;btn=r2.gif&amp;uid=89469" charset="utf-8"></script>
<!-- JiaThis Button END -->

<div id="disqus_thread"></div>
<script type="text/javascript">
/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
var disqus_shortname = 'towerjoo'; // required: replace example with your forum shortname

/* * * DON'T EDIT BELOW THIS LINE * * */
(function() {
 var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
 dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
 (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
 })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

