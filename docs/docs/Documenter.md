<h1>Documenter</h1>
<div class="markdown"><p>The Documenter module is based on the following question:</p>
<p><strong>What facilities would we want to have if we need a way to generate documents from a 📓 ?</strong>🤔</p>
<p>These might be some answers to the above questions👇</p>
<p>💡 An automatic way to generate documents from the markdown matter.</p>
<p>💡 Automatic way to document functions, methods etc.</p>
<p>💡 Automatically create project readme.</p>
<p>🤫 <em>The third capability is yet to come.</em></p>
</div>
<div class="markdown"><h2>Lower Level Entities&#40;Structs, methods etc.&#41;</h2>
<p>These are the objects on which nbdev&#39;s Documenter module was built. You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>
</div>
<div class="markdown"><h4>Section type</h4>
</div>
<div class="markdown"><p>A Section can be thought of as a paragraph on a page📃. This would be composed of several lines. The Section type represents a paragraph and the field line is a string which ultimatley goes on to form a section inthe generated document.</p>
</div>
> struct Section–> This is like the section of a page and is made up of one or multiple lines.
>
>   * Fields:
>
>       * line–> String which makes up a section



> Section(line)–> Helper function to call the constructor of the type Section




> line(section::Section)–> Getter for accessing the underlying field line.




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
"This is a test line"
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




> sections–> Getter for accessing the underlying field sections of Page.




> name–> Getter for accessing the underlying field name of Page.




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
Any["Main.workspace4.Section", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "eb4d58793a7e388c"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "f169c56dc6b7135d"), MIME type application/vnd.pluto.tree+object))], :Array, "", "37b9fd1bd152157c"]
```

```
page
------
Output
------
Any["Page", Any[(:sections, (Dict{Symbol, Any}(:prefix => "Main.workspace4.Section", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "eb4d58793a7e388c"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "f169c56dc6b7135d"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "37b9fd1bd152157c"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"Monkey module\"", MIME type text/plain))], :struct, "Page", "963d7059b8e5bb56"]
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

<div class="markdown"><p><code>img&#40;&#41;</code> accepts image path and loads an image onto the notebook where it is called.</p>
</div>
<div class="markdown"><h5>run<em>and</em>update</h5>
</div>
<div class="markdown"><p><code>run_and_update_nb</code> uses the <code>load_notebook_nobackup</code> function in Pluto.jl. There are multiple ways to achieve what this fucntions achieves without depending on Pluto internals but for now this was the quickiest way to achieve this.</p>
<p><strong>Note-</strong>Depending on Pluto to run anad update a notebook this way makes it difficult to run unit test for this function from within pluto itself because a Pluto cell is treated as worker 2, 3 and so on but when you do load_notebook&#40;&#41; then it spins up another worker. Only worker 1 can spwan further processes and not a notebook cell.</p>
</div>
<div class="markdown"><h5>stitchCode</h5>
</div>
> stitchCode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.



> stitchCode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block



> stitchCode(fdocs::FunctionDocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object




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
Any["String", Tuple{Int64, Any}[(1, ("\"i\"", MIME type text/plain)), (2, ("\"j\"", MIME type text/plain))], :Array, "", "4a4a5bad027fed26"]
```

> collectFuncDocs(obj)–> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from teh docstrings). Creates aFunctionDocs type from these documents.




<div class="markdown"><h4>Example</h4>
</div>
```
collectFuncDocs(stitchCode).funcDocs
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"> stitchCode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.\\n\\n\"", MIME type text/plain)), (2, ("\"> stitchCode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block\\n\\n\"", MIME type text/plain)), (3, ("\"> stitchCode(fdocs::FunctionDocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object\\n\\n\"", MIME type text/plain))], :Array, "", "464a0bd0ffe4fb96"]
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
Any["MyStruct", Any[(:name, ("\"test\"", MIME type text/plain))], :struct, "MyStruct", "147200701841e21"]
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
Main.workspace4.inlinetest
```

<div class="markdown"><h5>createPage</h5>
</div>
> CreatePage–> Creates the Page type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.




<div class="markdown"><p>While generating document you don&#39;t need to call this function. This is done automatically😃 for you when nbdev generates documents.</p>
</div>
<div class="markdown"><h5>md2html</h5>
</div>
```
"""
> md2html(md)--> Tiny helper to format a markdown into html.
"""
md2html(md)=Export.strip(Markdown.html(md), "\n")
------
Output
------
Main.workspace4.md2html
```

<div class="markdown"><p>Sometimes it better to have tiny helpers like this. The <code>md2html</code> converts the supplied markdown into a visible html.🎈🎈</p>
</div>
<div class="markdown"><h4>Example</h4>
</div>
"<p>This is a test</p>"
<div class="markdown"><h4>sw</h4>
<p>Checks if a given string startwith a certain susbstring. Helpful when there are a list of strings to match.</p>
</div>
<div class="markdown"><h4>Example</h4>
</div>
<div class="markdown"><h5>save_page</h5>
</div>
> save_page(io, page::Page)–> Take the contents from a Page type and write to the io



> save*page(save*page(io, docnames::Array{String,1}))–> Given an array of document names, creates a table of content



> save_page(page::Page, path::String)–> Given a Page type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated



> save_page(docnames::Array{String,1})–> Given an array of documents, creates the related table of contents in \toc.md\




<div class="markdown"><p>Nbdev calls the required method of <code>save_page</code> automatically during document generation.</p>
</div>
<div class="markdown"><h5>export2md</h5>
</div>
> export2md(file::String, path::String)–> Generate document for a file in the given path



> export2md(files::AbstractVector, path::String)–> Map the `export2md(file, path)` to a given vector of file.



> export2md()–> Higher level API to generate documents for all the valid notebooks




<div class="markdown"><p>The <code>export2md&#40;&#41;</code> is what gets summoned when document generation is invoked. Like most things in nbdev &#40;and unlike most things in life&#41; this too gets invoked automatically. 🥳</p>
</div>
