<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<meta name="author" content="towerjoo" />
<meta name="keywords" content="{{ page.tags | join: ',' }}" />
<title>{% if page.title %} {{ page.title }} / {% endif %}找寻模式</title>
<link href="http://towerjoo.github.com/feed.xml" rel="alternate" title="找寻模式" type="application/atom+xml" />
{% for style in page.styles %}<link rel="stylesheet" type="text/css" href="{{ style }}" />
{% endfor %}
<link rel="stylesheet" type="text/css" href="/assets/css/stylesheet.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/assets/css/pygment_trac.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/assets/css/print.css" media="print" />
<script type="text/javascript">

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-33537748-1']);
_gaq.push(['_trackPageview']);

(function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
 })();

</script>
</head>

<body>



<div class="container">
<section id="main_content">

{{ content }}

</section>
</div>

<footer>
		<p>&copy; Since 2012 <a href="http://github.com/towerjoo" target="_blank">github.com/towerjoo</a></p>
</footer>

<div id="side_top">
    <a href="#">Top</a>
</div>

</body>
</html>
