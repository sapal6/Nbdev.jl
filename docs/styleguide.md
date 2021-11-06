<h1>Styleguide</h1>
<div class="markdown"><p>Many ideas for the style guide here are borrowed fom the great <a href="https://docs.fast.ai/dev/style.html">FastAI library</a>. So, some of the code style may seem similar.</p>
<p>There is good reason to borrow coding style ideas from the fastai library. Some of them are 👇</p>
<ul>
<li><p>Avoid too much scrolling while reading the code.</p>
</li>
<li><p>Convey information as fast as possible.</p>
</li>
<li><p>Keep things simple.</p>
</li>
<li><p>Spend less time on thinking what a particular piece of code does i.e. the name of a code piece should make it clear about the intention of that code.</p>
</li>
</ul>
</div>
## Naming

<div class="markdown"><ul>
<li><p>Module names are single words with the starting letter as uppercase.</p>
</li>
<li><p>Functions and variables are lowercase single words.</p>
<ul>
<li><p>For example,<code>makedocs</code>. This is to keep thing simple and easier for the user to remember the names. For example, the end user should not get confused about wether the name had an underscore or not.</p>
</li>
</ul>
</li>
<li><p>Struct names are single word and start with an upper case.</p>
</li>
<li><p>Commonly used things should be shorter.</p>
<ul>
<li><p>For example, </p>
<ul>
<li><p>&quot;object&quot; is named <code>o</code>.</p>
</li>
<li><p>&quot;image&quot; is named <code>img</code>.</p>
</li>
<li><p>input is denoted with x.</p>
</li>
</ul>
</li>
<li><p>Look in the &quot;Abbr&quot; section for a list of abbrevations used.</p>
<ul>
<li><p>Feel free to add any abbrevations which are missed.</p>
</li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
## Layout

<div class="markdown"><ul>
<li><p>One line of code should implement one complete idea, where possible</p>
</li>
</ul>
<p>Generally therefore an if part and its 1-line statement should be on one line Using the ternary operator x &#61; y if a else b can help with this guideline.</p>
<ul>
<li><p>If a 1-line function body comfortably fits on the same line as the function section, feel free to put them together.</p>
<ul>
<li><p>In such cases, wherever possible, the functions can also be denoted in the &quot;expression&quot; format like <code>func&#40;x&#41; &#61; x&#43;1</code>.</p>
</li>
</ul>
</li>
<li><p>If you’ve got a bunch of 1-line functions doing similar things, they don’t need a blank line between them</p>
<ul>
<li><p>These can be grouped together.</p>
</li>
</ul>
</li>
</ul>
</div>
```
begin
f(x:: Int8) = x+1
function f(x:: Float16) x*2 end
end
------
Output
------
f (generic function with 2 methods)
```

<div class="markdown"><ul>
<li><p>Aim to align statement parts that are conceptually similar. It allows the reader to quickly see how they’re different. </p>
<ul>
<li><p>For example</p>
<pre><code>if foo &#61;&#61; 0 x &#61; f&#40;x&#41;
   else     x &#61; f&#40;x&#41; end</code></pre>
</li>
</ul>
</li>
</ul>
</div>
