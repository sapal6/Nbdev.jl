<h1>Documenter</h1>
## Lower Level Entities&#40;Structs, methods etc.&#41;
<p>These are the objects on which nbdev&#39;s Documenter module was built. You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>

## Section type

> struct Section–> This is like the section of a page and is made up of one or multiple lines.
>
>   * Fields:
>
>       * line–> String which makes up a section



> Section(line)–> Helper function to call the constructor of the type Section




> line(section::Section)–> Getter for accessing the underlying field line.




## Example

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

## Page Type

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
Any["Main.workspace#2.Section", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "ff2d9e7b8311a217"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "1822844534fb6dde"), MIME type application/vnd.pluto.tree+object))], :Array, "", "ee4d30a77bedbe08"]
```

```
page
------
Output
------
Any["Page", Any[(:sections, (Dict{Symbol, Any}(:prefix => "Main.workspace#2.Section", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "ff2d9e7b8311a217"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "1822844534fb6dde"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "ee4d30a77bedbe08"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"Monkey module\"", MIME type text/plain))], :struct, "Page", "204aebc17fcbf6dd"]
```

```
typeof(page)
------
Output
------
Page
```

## run<em>and</em>update

<div class="markdown"><p><code>runandupdatenb</code> uses the <code>load_notebook_nobackup</code> function in Pluto.jl. There are multiple ways to achieve what this function achieves without depending on Pluto internals but for now this was the quickiest way to achieve this.</p>
<p><strong>Note-</strong>Depending on Pluto internal to run and update a notebook makes it difficult to run unit test for this function from within pluto itself because a Pluto cell is treated as worker 2, 3 and so on but when you do load_notebook&#40;&#41; then it spins up another worker. Only worker 1 can spwan further processes and not a notebook cell.</p>
</div>
> runandupdatenb(fn::AbstractString)–> Run the notebook in the supplied path and update the notebook with the output of each cell.




## stitchcode

> stitchcode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.



> stitchcode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block



> stitchcode(fdocs::Functiondocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object




## Functiondocs

> struct Functiondocs–> Stores the document of different objects.
>
>   * funcdocs–> Array of strings.



> Functiondocs(funcdocs)–> Helper for accessing the FunctionDocs constructer.




<div class="markdown"><h4>Example</h4>
</div>
```
begin
funcdocs=Functiondocs(["i", "j"])
funcdocs.funcdocs
end
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"i\"", MIME type text/plain)), (2, ("\"j\"", MIME type text/plain))], :Array, "", "aca830f4fb62a07c"]
```

## collectfuncdocs

> collectfuncdocs(obj)–> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from teh docstrings). Creates aFunctionDocs type from these documents.




<div class="markdown"><h4>Example</h4>
</div>
```
collectfuncdocs(stitchcode).funcdocs
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"> stitchcode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.\\n\\n\"", MIME type text/plain)), (2, ("\"> stitchcode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block\\n\\n\"", MIME type text/plain)), (3, ("\"> stitchcode(fdocs::Functiondocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object\\n\\n\"", MIME type text/plain))], :Array, "", "c5c566172f13e744"]
```

## Higher Level API

<div class="markdown"><p>These higher level APIs can either be used directly or are already used internally by nbdev. One such functions which can be used directly is...</p>
</div>
## showdoc

> showdoc(o)–> Takes an object and builds markdown documentation.




```
#noop
begin

> An example of a struct

struct Mystruct
	name
end
end
```

```
mystruct=Mystruct("test")
------
Output
------
Any["Mystruct", Any[(:name, ("\"test\"", MIME type text/plain))], :struct, "Mystruct", "ea2076c48790f4e0"]
```

```
typeof(mystruct)
------
Output
------
Mystruct
```

<div class="markdown"><p><code>showdoc&#40;Mystruct&#41;</code></p>
</div>
> An example of a struct




<div class="markdown"><p>Currently nbdev is unable to recognize the docstrings of inline expressions.👇</p>
</div>
```
"> inlinetest--> This is a inline test expression"
inlinetest=str->replace(str, "1"=> "one")
------
Output
------
<div class="pluto-docs-binding" style="margin: .5em; padding: 1em; background: #8383830a; border-radius: 1em;">
<span style="
    display: inline-block;
    transform: translate(-19px, -16px);
    font-family: 'JuliaMono', monospace;
    font-size: .9rem;
    font-weight: 700;
    /* height: 1px; */
    margin-top: -1em;
    background: white;
    padding: 4px;
    border-radius: 7px;
    /* color: #646464; */
    /* border: 3px solid #f99b1536;
">inlinetest</span>
<div class="markdown"><blockquote>
<p>inlinetest–&gt; This is a inline test expression</p>
</blockquote>


</div>
</div>

```

## createpage

> CreatePage–> Creates the Page type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.




<div class="markdown"><p>While generating document you don&#39;t need to call this function. This is done automatically😃 for you when nbdev generates documents.</p>
</div>
## savepage

> savepage(io, page::Page)–> Take the contents from a Page type and write to the io



> savepage(page::Page, path::String)–> Given a Page type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated




<div class="markdown"><p>Nbdev calls the required method of <code>save_page</code> automatically during document generation.</p>
</div>
## export2md

> export2md(fn::String, path::String)–> Generate document for a file in the given path



> export2md(fns::AbstractVector, path::String)–> Map the `export2md(file, path)` to a given vector of file.



> export2md()–> Higher level API to generate documents for all the valid notebooks




```
Export.readfilenames(joinpath(pwd()))
------
Output
------
Any["Any", Tuple{Int64, Any}[(1, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\00_nbdev.jl\"", MIME type text/plain)), (2, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\01_export.jl\"", MIME type text/plain)), (3, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\02_documenter.jl\"", MIME type text/plain)), (4, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\03_codeRunner.jl\"", MIME type text/plain)), (5, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\04_makedocs.jl\"", MIME type text/plain)), (6, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\05_make.jl\"", MIME type text/plain)), (7, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\developerguide.jl\"", MIME type text/plain)), (8, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\index.jl\"", MIME type text/plain)), (9, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\styleguide.jl\"", MIME type text/plain)), (10, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\tutorial.jl\"", MIME type text/plain))], :Array, "", "a1f7009ee4daa27c"]
```

<div class="markdown"><p>The <code>export2md&#40;&#41;</code> is what gets summoned when document generation is invoked. Like most things in nbdev &#40;and unlike most things in life&#41; this too gets invoked automatically. 🥳</p>
</div>
```
#### export2readme
------
Output
------

```

> export2readme()–> create readme from the contents of Index notebook




