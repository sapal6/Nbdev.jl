
<h1>Documenter</h1>

<div class="markdown"><p>what we need?</p>
<p>👉 An automatic way to generate documents for code from docstrings.</p>
<p>👉 If docstrings are not there then document should be genrated by show_doc or  something similar. For example you may not want to put docstrings inside a struct. In this case you have to use this customised function to document the struct.</p>
<p>👉 Automatically create project readme from a common source.</p>
</div>

<div class="markdown"><p>now the save_nb can take the type Journal</p>
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
d=methods(stitchCode)
# 3 methods for generic function <b>stitchCode</b>:<ul><li> stitchCode(fdocs::<b>Main.workspace2.FunctionDocs</b>) in Main.workspace2 at nbs\02_documenter.jl#==#d75486f0-2022-11eb-2d95-aded3418c079:30</li> <li> stitchCode(cell::<b>Pluto.Cell</b>) in Main.workspace2 at nbs\02_documenter.jl#==#d75486f0-2022-11eb-2d95-aded3418c079:11</li> <li> stitchCode(cellop::<b>AbstractString</b>) in Main.workspace2 at nbs\02_documenter.jl#==#d75486f0-2022-11eb-2d95-aded3418c079:20</li> </ul>
```


```
grabFuncSig(pat4func,dstr)
"stitchCode(fdocs::Main.workspace2.FunctionDocs)"
```


```
fstr = string(methods(grabFuncSig).ms[1])
"(::Main.workspace2.var\"#2#3\")(pat, fdesc) in Main.workspace2 at nbs\\02_documenter.jl#==#00989200-25d6-11eb-3139-8dd2ca0346f8:2"
```


```
grabFuncSig(pat4anonymfunc,fstr)
"(::Main.workspace2.var\"#2#3\")"
```


```
docs=@doc stitchCode
<div class="markdown"><blockquote>
<p>stitchCode&#40;cell::Cell&#41;–&gt; blah blah1</p>
</blockquote>


<blockquote>
<p>stitchCode&#40;cellop::AbstractString&#41;–&gt; blah blah2</p>
</blockquote>


<blockquote>
<p>stitchCode&#40;cellop::AbstractString&#41;–&gt; blah blah3</p>
</blockquote>


</div>
```


```
"$(docs.meta[:results][1].object)"
"> stitchCode(cell::Cell)–> blah blah1\n\n"
```


```
collectFuncDocs(stitchCode).funcDocs
<jltree class="collapsed" onclick="onjltreeclick(this, event)">String<jlarray><r><k>1</k><v><pre>&quot;&gt; stitchCode&#40;cell::Cell&#41;–&gt; blah blah1\n\n&quot;</pre></v></r><r><k>2</k><v><pre>&quot;&gt; stitchCode&#40;cellop::AbstractString&#41;–&gt; blah blah2\n\n&quot;</pre></v></r><r><k>3</k><v><pre>&quot;&gt; stitchCode&#40;cellop::AbstractString&#41;–&gt; blah blah3\n\n&quot;</pre></v></r></jlarray></jltree>
```


```
tt="testfunc"
"testfunc"
```


> stitchCode(cell::Cell)–> blah blah1



> stitchCode(cellop::AbstractString)–> blah blah2



> stitchCode(cellop::AbstractString)–> blah blah3





<div class="markdown"><p>Creating the toc.md–</p>
<ul>
<li><p>Create the file-</p>
<ul>
<li><p>The first two lines should be <strong>Documentation</strong> and * <a href="README.md">Introduction</a></p>
</li>
</ul>
</li>
<li><p>Read the files in doc folder.</p>
<ul>
<li><p>Append to the file as <code>&#91;&lt;md file name from the doc folder&gt;&#93;&#40;file path&#41;</code></p>
</li>
</ul>
</li>
</ul>
</div>

```
filenames=readdir("../docs")
<jltree class="collapsed" onclick="onjltreeclick(this, event)">String<jlarray><r><k>1</k><v><pre>&quot;Documenter.md&quot;</pre></v></r></jlarray></jltree>
```


```
docnames=[Export.strip(name, ".md") for name in filenames]
<jltree class="collapsed" onclick="onjltreeclick(this, event)">String<jlarray><r><k>1</k><v><pre>&quot;Documenter&quot;</pre></v></r></jlarray></jltree>
```


```
save_page(docnames)

```


```
createtoc()

```


