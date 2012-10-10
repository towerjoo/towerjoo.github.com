<header>
	<h1>{% if page.title %}<a href="/" class="minor">找寻模式</a> / {{ page.title }}
        {% else %}找寻模式 <a href="http://towerjoo.github.com/feed.xml"><img src="/assets/images/rss.gif"></img></a>
        <iframe width="63" height="24" frameborder="0" allowtransparency="true" marginwidth="0" marginheight="0" scrolling="no" border="0" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&width=63&height=24&uid=1068998583&style=1&btn=red&dpc=1"></iframe>
        {% endif %}</h1>
	<p class="additional">阅读, 人生, 技术
	<a href="javascript:void(0)" onclick="showhelp()" title="Keyboard shortcuts are supported, press ? to show the help">
		<img src="/assets/images/keyboard.png" id="keyboard"></img>
	</a>
    </p>
    <div id="header_nav">
    <a href="/category.html">Category</a>
    <a href="/archive.html">Archive</a>
    <a href="/projects.html">Projects</a>
    <a href="/portfolio.html">Portfolios</a>
    <a href="/about.html">About</a>
    <a href="/misc.html">Misc</a>
    </div>
    <div id="search_box">
    <form action="/search/" class="block block-search">
    <input type="search" onfocus="isFocusInInput=true" onblur="isFocusInInput=false" id="search_input" name="q" placeholder="回车搜索" />
    </form>
    </div>
</header>
