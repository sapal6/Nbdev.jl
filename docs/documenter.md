<h1>Documenter</h1>
## Lower Level Entities&#40;Structs, methods etc.&#41;
<p>These are the objects on which nbdev&#39;s Documenter module was built. You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>

```
#noop
begin
f = joinpath("..", "Project.toml")
path = "https://github.com/sapal6/Nbdev.jl"
res = Dict("github_url" => "https://github.com/sapal6/Nbdev.jl")
end
------
Output
------
 
```

```
#noop
@test Common.getsetting(f, "settings") == res
------
Output
------
 
```

```
#noop
@test Common.getsettings(f, ["settings", "github_url"]) == res["github_url"]
------
Output
------
 
```

## Section type

> line(section::Section)–> Getter for accessing the underlying field line.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=line)


## Example

```
section=Section("This is a test line")
------
Output
------
Any["Section", Any[(:line, ("\"This is a test line\"", MIME type text/plain))], :struct, "Section", "252f45eac776c22"]
```

```
#noop
@test line(section) == "This is a test line"
------
Output
------
 
```

## Page Type

> Page–> The type that represents a page in a document.
>
>   * Fields:
>
>       * sections–> Array of Section type.
>       * name–> Name of the module being documented.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=Page)

> Page–> Helper function to create constructer for Page type.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=Page)


> sections–> Getter for accessing the underlying field sections of Page.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=sections)


> name–> Getter for accessing the underlying field name of Page.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=name)


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
Any["Main.workspace#9.Section", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "db1af0e35885ae9c"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "6660eb9cef11a461"), MIME type application/vnd.pluto.tree+object))], :Array, "", "dc793314d2d12b5b"]
```

```
page
------
Output
------
Any["Page", Any[(:sections, (Dict{Symbol, Any}(:prefix => "Main.workspace#9.Section", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "db1af0e35885ae9c"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "6660eb9cef11a461"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "dc793314d2d12b5b"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"Monkey module\"", MIME type text/plain))], :struct, "Page", "2562b58f313e81da"]
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

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=runandupdatenb)


## stitchcode

> stitchcode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=stitchcode)

> stitchcode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=stitchcode)

> stitchcode(fdocs::Functiondocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=stitchcode)


## Functiondocs

> struct Functiondocs–> Stores the document of different objects.
>
>   * funcdocs–> Array of strings.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=Functiondocs)

> Functiondocs(funcdocs)–> Helper for accessing the FunctionDocs constructer.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=Functiondocs)


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
Any["String", Tuple{Int64, Any}[(1, ("\"i\"", MIME type text/plain)), (2, ("\"j\"", MIME type text/plain))], :Array, "", "de0474ac6094ec52"]
```

## collectfuncdocs

> collectfuncdocs(obj)–> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from the docstrings). Creates aFunctionDocs type from these documents.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=collectfuncdocs)


<div class="markdown"><h4>Example</h4>
</div>
```
collectfuncdocs(stitchcode).funcdocs
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"> stitchcode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.\\n\\n [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=stitchcode)\"", MIME type text/plain)), (2, ("\"> stitchcode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block\\n\\n [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=stitchcode)\"", MIME type text/plain)), (3, ("\"> stitchcode(fdocs::Functiondocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object\\n\\n [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=stitchcode)\"", MIME type text/plain))], :Array, "", "423c824d31550382"]
```

## Higher Level API

<div class="markdown"><p>These higher level APIs can either be used directly or are already used internally by nbdev. One such functions which can be used directly is...</p>
</div>
## showdoc

> showdoc(o)–> Takes an object and builds markdown documentation.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=showdoc)


```
#noop
begin
"""
> An example of a struct
"""
struct Mystruct
	name
end
end
------
Output
------
 
```

```
mystruct=Mystruct("test")
------
Output
------
Any["Mystruct", Any[(:name, ("\"test\"", MIME type text/plain))], :struct, "Mystruct", "1ac9deea220e6f7c"]
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

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=Mystruct)


<div class="markdown"><p>Currently nbdev is unable to recognize the docstrings of inline expressions.👇</p>
</div>
```
#noop
"> inlinetest--> This is a inline test expression"
inlinetest=str->replace(str, "1"=> "one")
------
Output
------
 
```

## createpage

> CreatePage–> Creates the Page type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=createpage)


<div class="markdown"><p>While generating document you don&#39;t need to call this function. This is done automatically😃 for you when nbdev generates documents.</p>
</div>
## savepage

> savepage(io, page::Page)–> Take the contents from a Page type and write to the io

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=savepage)

> savepage(page::Page, path::String)–> Given a Page type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=savepage)


<div class="markdown"><p>Nbdev calls the required method of <code>save_page</code> automatically during document generation.</p>
</div>
## export2md

> export2md(fn::String, path::String)–> Generate document for a file in the given path

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=export2md)

> export2md(fns::AbstractVector, path::String)–> Map the `export2md(file, path)` to a given vector of file.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=export2md)

> export2md()–> Higher level API to generate documents for all the valid notebooks

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=export2md)


```
Export.readfilenames(joinpath(pwd()))
------
Output
------
Any["Any", Tuple{Int64, Any}[(1, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\00_nbdev.jl\"", MIME type text/plain)), (2, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\01_export.jl\"", MIME type text/plain)), (3, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\02_documenter.jl\"", MIME type text/plain)), (4, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\03_codeRunner.jl\"", MIME type text/plain)), (5, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\04_make.jl\"", MIME type text/plain)), (6, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\05_common.jl\"", MIME type text/plain)), (7, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\developerguide.jl\"", MIME type text/plain)), (8, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\index.jl\"", MIME type text/plain)), (9, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\styleguide.jl\"", MIME type text/plain)), (10, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl-changes\\\\nbdev-backlinks\\\\nbs\\\\tutorial.jl\"", MIME type text/plain))], :Array, "", "287e4b26780ba021"]
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

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=export2readme)


