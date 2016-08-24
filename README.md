<h1><a id="user-content-bmfullscreenpopgesture" class="anchor" href="https://github.com/asiosldh/BMFullscreenPopGesture/tree/master#bmfullscreenpopgesture"></a>BMFullscreenPopGesture</h1>
<blockquote>
<p>BMFullscreenPopGesture是对<a href="https://github.com/forkingdog/FDFullscreenPopGesture" target="_blank">https://github.com/forkingdog/FDFullscreenPopGesture</a>是swift版（基本功能）</p>
</blockquote>
<h2>1.效果图</h2>
<p><img src="http://images2015.cnblogs.com/blog/724434/201608/724434-20160824163243511-1479860066.gif" alt="" /></p>
<p>&nbsp;</p>
<h2>2.使用</h2>
<blockquote>
<p>默认为开启全屏侧滑动返回功能。</p>
</blockquote>
<h3>　　2.1. 对单个控制器（UIViewController）操作</h3>
<div class="cnblogs_code">
<pre>        <span style="color: #008000;">//</span><span style="color: #008000;"> 关闭 vc 的侧滑返回功能</span>
        let vc =<span style="color: #000000;"> UIViewController()
        vc.bm_setFullscreen(</span><span style="color: #0000ff;">false</span><span style="color: #000000;">)

        </span><span style="color: #008000;">//</span><span style="color: #008000;"> 开启 vc1 的侧滑返回功能 （在vc1所在的导航控制器开启的情况下有效）</span>
        let vc1 =<span style="color: #000000;"> UIViewController()
        vc1.bm_setFullscreen(</span><span style="color: #0000ff;">true</span>)</pre>
</div>
<h3>　　2.2.对导航控制器（UIViewController）操作</h3>
<div class="cnblogs_code">
<pre>        <span style="color: #008000;">//</span><span style="color: #008000;"> 关闭 vc 的侧滑返回功能</span>
        let vc =<span style="color: #000000;"> UIViewController()
        vc.bm_setFullscreen(</span><span style="color: #0000ff;">false</span><span style="color: #000000;">)

        </span><span style="color: #008000;">//</span><span style="color: #008000;"> 开启 vc1 的侧滑返回功能 （在vc1所在的导航控制器开启的情况下有效）</span>
        let vc1 =<span style="color: #000000;"> UIViewController()
        vc1.bm_setFullscreen(</span><span style="color: #0000ff;">true</span>)</pre>
</div>
<p>&nbsp;</p>
<h2>3.<a id="user-content-license" class="anchor" href="https://github.com/forkingdog/FDFullscreenPopGesture#license"></a>License</h2>
<h3>MIT</h3>
<p>&nbsp;</p>
