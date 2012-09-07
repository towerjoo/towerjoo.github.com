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
<script type="text/javascript" src="/assets/js/shortcuts.js"></script>
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

<body onkeypress="shortcuts(event)">



<div class="container">
<section id="main_content">

{{ content }}

</section>
</div>

<footer>
		<p>&copy; Since 2009 <a href="http://github.com/towerjoo" style="color:white" target="_blank">github.com/towerjoo</a></p>
		<p>
			<img src="/assets/images/firefox.png" style="border:0"></img>
			<img src="/assets/images/chrome.png" style="border:0"></img>
			<img src="/assets/images/safari.png" style="border:0"></img>
			<img src="/assets/images/opera.png" style="border:0"></img>
		</p>
</footer>

<div id="side_top">
    <a href="#">Top</a>
</div>

<div id="mask">

</div>

<div id="shortcuts_tips">
<h3>Press q to hide the help</h3>
<table class="shortcut">
	<tr>
		<th></th>
		<th>Key</th>
		<th>Action</th>
		<th>Key</th>
		<th>Action</th>
	</tr>
	<tr>
		<td>Small Scroll</td>
		<td class="key_td">j</td>
		<td>Scroll Down</td>
		<td class="key_td">k</td>
		<td>Scroll Up</td>
	</tr>
	<tr>
		<td>Big Scroll</td>
		<td class="key_td">b</td>
		<td>Scroll to Bottom</td>
		<td class="key_td">t</td>
		<td>Scroll to Top</td>
	</tr>
	<tr>
		<td>Post Navigation</td>
		<td class="key_td">n</td>
		<td>Next Post(if exists)</td>
		<td class="key_td">p</td>
		<td>Previous Post(if exists)</td>
	</tr>
	<tr>
		<td>Page Navigation</td>
		<td class="key_td">h</td>
		<td>Go to Blog's Home Page</td>
		<td class="key_td">a</td>
		<td>Go to Blog's Archive Page</td>
	</tr>
	<tr>
		<td>Page Navigation</td>
		<td class="key_td">c</td>
		<td>Go to Blog's Category Page</td>
		<td class="key_td">?</td>
		<td>Show this help</td>
	</tr>
</table>
</div>

</body>
</html>
