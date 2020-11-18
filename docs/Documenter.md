
<h1>Documenter</h1>

<div class="markdown"><p>what we need?</p>
<p>👉 An automatic way to generate documents for code from docstrings.</p>
<p>👉 If docstrings are not there then document should be genrated by show_doc or  something similar. For example you may not want to put docstrings inside a struct. In this case you have to use this customised function to document the struct.</p>
<p>👉 Automatically create project readme from a common source.</p>
</div>

<div class="markdown"><p>now the save_nb can take the type Journal</p>
</div>

<div class="markdown"><p><code>func img&#40;img_path::String&#41;</code></p>
<pre><code> &gt;Helper function to load image inside markdown</code></pre>
<p>The img function loads image from a path.</p>
</div>

<div class="markdown"><p>We will use Publish.jl to build our documentation which will also double up as a website for the project.</p>
<p>For this we will make a call to the <code>newsite&#40;&#41;</code> function which will generate the basic folder structure for us.</p>
</div>

<div class="markdown"><p><code>func newsitegen&#40;configpath::String&#61;&quot;../settings.ini&quot;&#41;</code></p>
<blockquote>
<p>generate a new site directory. Takes the seetings.ini file from the project root by default</p>
</blockquote>
</div>

<div class="markdown"><p>let&#39;s collect the markdown cells.</p>
<p>This can be done with the <code>collect_codecells</code> function in core.jl</p>
</div>

```

function test(x)
	x+1
end


test (generic function with 1 method)
```


```
test(1)

2
```


<div class="markdown"><p><code>run_and_update</code> runs all md and example code and updates the notebook type wit output</p>
</div>

<div class="markdown"><p>As seen above we have a collection of markdown cells and cells which are neither intended to be exported or hidden. Such code cells are ones which we intend to have as examples in the document.</p>
<p>In such cases the normal code cells&#40;cells without <em>#export</em>, <em>#hide</em> or <em>md</em> are supposed to be wrapped in triple backticks, that code getting executed, the output again wrapped in triple backticks and then inserted into the document.</p>
<p>The code to be executed&#40;wrapped in backticks&#41; and the ouput of such code&#40;wrapped in backticks&#41;.</p>
</div>

<div class="markdown"><p>how can we wrapthe code string to this ?</p>
</div>

```
Markdown.html(md"```func test end```")

"<p><code>func test end</code></p>\n"
```


```
code=testNb.cells[13].code

"md\"now the save_nb can take the type Journal\""
```


```
cleanedCode=Export.strip(Export.strip(code,"\n"), "\n")

"md\"now the save_nb can take the type Journal\""
```


<div class="markdown"><p>we can builda blocked code this way</p>
</div>

```
string("<p><code>",cleanedCode,"</code></p>\n")

"<p><code>md\"now the save_nb can take the type Journal\"</code></p>\n"
```


<div class="markdown"><p>How to stich only the code and the code output into a code block?</p>
<p>One way would be to read the executed notebook and look for cells wihtout code as <strong>md</strong> and then stich them together along with their output&#40;at the end of each code block&#41; into an html code block. This would be one line in section type.</p>
<p>In case the code.erroed is tru cancel the build and display a message.</p>
</div>

```
grabFuncSig(pat4func,dstr)

"stitchCode(cell::Pluto.Cell)"
```


```
fstr = string(methods(grabFuncSig).ms[1])

"(::Main.workspace8.var\"#2#3\")(pat, fdesc) in Main.workspace8 at nbs\\02_documenter.jl#==#00989200-25d6-11eb-3139-8dd2ca0346f8:2"
```


```
grabFuncSig(pat4anonymfunc,fstr)

"(::Main.workspace8.var\"#2#3\")"
```


