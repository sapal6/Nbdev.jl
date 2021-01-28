
<h1>Documenter</h1>

<div class="markdown"><p>The Documenter module is based on the following question:</p>
<p><strong>What failities would we want to have if we need a way to generate documents from a 📓 ?</strong>🤔</p>
<p>These might be some answers to the above questions👇</p>
<p>💡 An automatic way to generate documents from the markdown matter.</p>
<p>💡 Automatic way to document functions, methods etc.</p>
<p>💡 Automatically create project readme.</p>
<p>🤫 <em>The third capability is yet to come.</em></p>
</div>

<div class="markdown"><h2>Lower Level Entities&#40;Structs, methods etc.&#41;</h2>
<p>These are the objects on which nbdev&#39;s Documenter module was built. You can use it extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>
</div>

<div class="markdown"><h4>Section type</h4>
</div>

<div class="markdown"><p>A Section can be thought of as a paragraph on a page📃. This would be composed of several lines. The Section type represents a paragraph and the field line is a string which ultimatley goes on to form a section inthe generated document.</p>
</div>

> struct Section–> This is like the section of a page and is made up of one or multiple \lines\.
>
>   * Fields:
>
>       * line–> String which makes up a section



> Section(line)–> Helper function to call the constructor of the type Section





> line(section::Section)–> Getter for accessing the underlying field \line\.





<div class="markdown"><h4>Example</h4>
</div>

```
begin
section=Section("This is a test line")
line(section)
end
------
Output
------
This is a test line
```


<div class="markdown"><h4>Page Type</h4>
</div>

> Page–> The type that represents a page in a document.
>
>   * Fields:
>
>       * sections–> Array of Section type.
>       * name–> Name of the module being documented.



> Page–> Helper function to create constructer for Page type.





> sections–> Getter for accessing teh underlying field \sections\ of Page.





> name–> Getter for accessing teh underlying field 
ame\ of Page.





<div class="markdown"><p>A 📃 is made up of several sections. These sections can be example codes, text ,graphs&#40;to be implemented&#41; and function documentation and several pages. The Page type helps in implementing this concept into code.</p>
</div>

<div class="markdown"><h4>Example</h4>
</div>

```
begin
page=Page([Section("iny, meeny, miny mo"), Section("🙈 🙊 🙉")], "Monkey module")
sections(page)
end
------
Output
------
Section[1-->Section(line-->iny, meeny, miny mo)2-->Section(line-->🙈 🙊 🙉)]
```


```
page
------
Output
------
Page(sections-->Section[1-->Section(line-->iny, meeny, miny mo)2-->Section(line-->🙈 🙊 🙉)]name-->Monkey module)
```


```
typeof(page)
------
Output
------
Page
```


<div class="markdown"><h4>img</h4>
</div>

> img(img_path::String)–> Helper function to load images within a notebook. This can be helpful to have images appear in the final document.





<div class="markdown"><p><code>img&#40;&#41;</code> accepts image path and loads an image onto the notebook where it is called.</p>
</div>

<div class="markdown"><h5>newsitegen</h5>
</div>

<div class="markdown"><p>Nbdev uses <a href="https://michaelhatherly.github.io/Publish.jl/0.1.0/docs/getting_started.html">Publish.jl</a> to generate the document site. All the documents are in markdown format and must be present under the <code>docs</code> 📂 in the project root. The <code>newsitegen</code> function makes sure to create a docs 📂 if it&#39;s not available in project root.</p>
</div>

<div class="markdown"><h5>run<em>and</em>update</h5>
</div>

<div class="markdown"><p><code>run_and_update_nb</code> uses the <code>load_notebook_nobackup</code> function in Pluto.jl. There are multiple ways to achieve what this fucntions achieves without depending on Pluto internals but for now this was the quickiest way to achieve this.</p>
<p><strong>Note-</strong>Depending on Pluto to run anad update a notebook this way makes it difficult to run unit test for this function from within pluto itself because a Pluto cell is treated as worker 2, 3 and so on but when you do load_notebook&#40;&#41; then it spins up another worker. Only worker 1 can spwan further processes and not a notebook cell.</p>
</div>

<div class="markdown"><h5>stitchCode</h5>
</div>

> stitchCode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is acode block.



> stitchCode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block



> stitchCode(cellop::AbstractString)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object





<div class="markdown"><h4>FunctionDocs</h4>
</div>

> struct FunctionDocs–> Stores the document of different objects.
>
>   * funcDocs–> Array of strings.



> FunctionDocs(funcDocs)–> Helper for accessing the FunctionDocs constructer.





<div class="markdown"><h4>Example</h4>
</div>

```
begin
funcdocs=FunctionDocs(["i", "j"])
funcdocs.funcDocs
end
------
Output
------
String[1-->i2-->j]
```


> collectFuncDocs(obj)–> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from teh docstrings). Creates aFunctionDocs type from these documents.





<div class="markdown"><h4>Example</h4>
</div>

```
collectFuncDocs(stitchCode).funcDocs
------
Output
------
String[1-->&gt; stitchCode(cell::Cell)–&gt; Stitches the code in a Pluto notebook cell with the output of that code. The output is acode block.\n\n2-->&gt; stitchCode(cellop::AbstractString)–&gt; Removes the quotes from a string and creates a code block with that string inside the newely formed code block\n\n3-->&gt; stitchCode(cellop::AbstractString)–&gt; When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object\n\n]
```


<div class="markdown"><h2>Higher Level API</h2>
</div>

<div class="markdown"><p>These higher level APIs can either be used directly or are already used internally by nbdev. One such functions which can be used directly is...</p>
</div>

<div class="markdown"><h5>showDoc</h5>
</div>

> showDoc(o)–> Takes an object and builds markdown documentation.





```
struct MyStruct
	name
end
------
Output
------

```


```
mystruct=MyStruct("test")
------
Output
------
MyStruct(name-->test)
```


```
typeof(mystruct)
------
Output
------
MyStruct
```


<div class="markdown"><p>Currently nbdev is unable to recognize the docstrings of inline expressions.👇</p>
</div>

```
"> inlinetest--> This is a inline test expression"
inlinetest=str->replace(str, "1"=> "one")
------
Output
------
Main.workspace6.inlinetest
```


<div class="markdown"><h5>createPage</h5>
</div>

> CreatePage–> Creates the \Page\ type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.





<div class="markdown"><p>While generating document this function you don&#39;t need to call this function. This is done automatically😃 for you when nbdev generates documents.</p>
</div>

<div class="markdown"><h5>md2html</h5>
</div>

<div class="markdown"><p>Sometimes it better to have tiny helpers like this. The <code>md2html</code> converts the supplied markdown into a visible html.🎈🎈</p>
</div>

<div class="markdown"><h4>Example</h4>
</div>

"<p>This is a test</p>\n"

<div class="markdown"><h5>save_page</h5>
</div>

> save_page(io, page::Page)–> Take the contents from a \Page\ type and write to the io



> save*page(save*page(io, docnames::Array{String,1}))–> Given an array of document names, creates a table of content



> save_page(page::Page, path::String)–> Given a \Page\ type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated



> save_page(docnames::Array{String,1})–> Given an array of documents, creates the related table of contents in \toc.md\





<div class="markdown"><p>Nbdev calls the required method of <code>save_page</code> automatically during document generation.</p>
</div>

<div class="markdown"><h5>export2html</h5>
</div>

> export2html(file::String, path::String)–> Generate document for a file in the given path



> export2html(files::AbstractVector, path::String)–> Map the `export2html(file, path)` to a given vector of file.



> export2html()–> Higher level API to generate documents for all the valid notebooks





<div class="markdown"><p>The <code>export2html&#40;&#41;</code> is what gets summoned when document generation is invoked. Like most things in nbdev &#40;and unlike most things in life&#41; this too gets invoked automatically. 🥳</p>
</div>

<div class="markdown"><h5>createtoc</h5>
</div>

> createtoc()–> Create the tableof contents and save that in toc.md inside docs directory





<div class="markdown"><p>Creating the toc.md and example–</p>
<ul>
<li><p>Create the file-</p>
<ul>
<li><p>The first two lines should be–&gt;  </p>
<p><strong>Documentation</strong></p>
<ul>
<li><p><a href="README.md">Introduction</a></p>
</li>
</ul>
</li>
</ul>
</li>
<li><p>Read the files in doc folder.</p>
<ul>
<li><p>Append to the file as–&gt;</p>
<ul>
<li><p>&#91;Module1&#93;<code>&#40;/docs/module1&#41;</code></p>
</li>
<li><p>&#91;Module2&#93;<code>&#40;/docs/module2&#41;</code></p>
</li>
</ul>
</li>
</ul>
</li>
</ul>
</div>

