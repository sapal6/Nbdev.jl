<h1>Export</h1>
<div class="markdown"><p>The Export module helps in exporting the code to script files.</p>
</div>
```
using PlutoTest
------
Output
------

```

## Lower Level Entities&#40;Structs, methods etc.&#41;
<p>These are the objects on which nbdev&#39;s Export module was built. You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>

## Nucleus type

> Nucleus(code)–>Getter for accessing the constructer of the Nucleus type

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=nucleus)


<div class="markdown"><p>Every time a code cell is parsed, it gets stored as a Nucleus type. The stored code can then be accessed using the <code>code</code> field in the Nucleus type.</p>
</div>
<div class="markdown"><h4>Example</h4>
</div>
```
sample_code="a=1+1"
------
Output
------
"a=1+1"
```

```
n=nucleus(sample_code)
------
Output
------
Any["Nucleus", Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :struct, "Nucleus", "9c5b9f1cb48d342b"]
```

```
#noop
@test n.code == "a=1+1"
------
Output
------
 
```

## Nb type

> struct Nb–> a notebook having nuclei made up of code cells only.
>
>   * Fields:
>
>       * nuclei–> Array of Nucleus type
>       * name–> name of notebook

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=Nb)


> nuclei(nuclei::Array)–> Helper to collect an array of Nucleus.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=nuclei)


> nuclei(nuclei::Array)–> Helper to collect an name of a notebook.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=name)


<div class="markdown"><p>A Nb type is used to collect all code cells&#40;which are contained in the Nucleus type. These code cells are actual code represented as string.</p>
</div>
<div class="markdown"><h4>Example</h4>
</div>
```
samplecodes=[Nucleus("a=1+1"), Nucleus("function test(x)  x+1 end"), Nucleus("test(2)")]
------
Output
------
Any["Main.workspace#4.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "d158a468cc7dd7e7"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "e82ab27c6d1e65c"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "4bb821bb413cd32e"), MIME type application/vnd.pluto.tree+object))], :Array, "", "7c720a4f9e78775a"]
```

```
nb=Nb(samplecodes, "testnb.jl")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace#4.Nucleus", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "d158a468cc7dd7e7"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "e82ab27c6d1e65c"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "4bb821bb413cd32e"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "7c720a4f9e78775a"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"testnb.jl\"", MIME type text/plain))], :struct, "Nb", "ceed878b4211d5c8"]
```

```
#noop
@test nb.nuclei == samplecodes
------
Output
------
 
```

```
#noop
@test nb.name == "testnb.jl"
------
Output
------
 
```

> collectnuclei(notebook::Scrubbednb, marker)–> Reads a notebook, collects code from code cells and returns an array of Nucelus.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=collectnuclei)


<div class="markdown"><p><code>collect_nuclei&#40;notebook::ScrubbedNotebook, marker&#41;</code> reads the entire notebook cell by cell and then checks if the content of that cell starts with a marker, only then it builds an array of the Nucleus type. </p>
</div>
## loadscrubbednb

> loadscrubbednb(io, path)::Scrubbednb–> These are modification of the Pluto.load_notebook methods. Scrubs the notebook of all stuff but the code to be exported.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=loadscrubbednb)


<div class="markdown"><p><code>loadscrubbednb</code> reads the notebook in the given path cell by cell, while ignoring the stuffs in the notebook like the cell order delimeters and the cell start delimeter. The result is a <code>ScrubbedNotebook</code> type which contains only the code which you intend to export.</p>
</div>
## High Level APIs
<p>This too are called automatically by Nbdev.</p>

## loadnb

> loadnb(filename::String, marker::String)–> High level function which calls *load*nb

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=loadnb)


> *load*nb(filename::String, marker::String)–> creates a scrubbed notebook and returns a curated Nb type having code to be exported.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=_loadnb)


## Scrubbednb

```
testnb= loadnb("01_export.jl", "#export")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace#4.Nucleus", :elements => Any[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nimport Pluto: Notebook, Cell, load_notebook_nobackup\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "5342514a49d27ca0"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nucleus--> This is the lowest entity of a code notebook. This type represents the code cell in a Pluto notebook.\\n> * Fields:\\n>   * code--> String which makes up a code cell\\n\\\"\\\"\\\"\\nBase.@kwdef mutable struct Nucleus\\n\\tcode::String=\\\"\\\"\\n\\tend\\n\\n\\\"\\\"\\\"\\n> Nucleus(code)-->Getter for accessing the constructer of the Nucleus type\\n\\\"\\\"\\\"\\nnucleus(code) = Nucleus(code = code)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "68cba21d74e51cf2"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nb--> a notebook having nuclei made up of code cells only.\\n> * Fields:\\n>   * nuclei--> Array of Nucleus type\\n>   * name--> name of notebook\\n\\\"\\\"\\\"\\nmutable struct Nb\\n\\tnuclei::Array{Nucleus,1}\\n\\tname::AbstractString\\nend\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an array of Nucleus.\\t\\n\\\"\\\"\\\"\\nnuclei(nuclei::Array) = nuclei\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an name of a notebook.\\n\\\"\\\"\\\"\\nname(name::AbstractString) = name\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "8a8f00fd386be909"), MIME type application/vnd.pluto.tree+object)), (4, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\nHeaders that would appear in a code file\\n\\\"\\\"\\\"\\nconst header = \\\"### A Nbdev script file ###\\\"\\nconst subheader = \\\"### Autogenerated file. Don't modify. ###\\\"\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2cb8115cfcbe050a"), MIME type application/vnd.pluto.tree+object)), (5, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nThis had to be done because having the cell iddelimeter as a constant gives an error during parsing the notebook\\n\\\"\\\"\\\"\\ncelliddelim=string(\\\"#\\\",\\\" ╔═╡ \\\")\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "280e2b5284fa853"), MIME type application/vnd.pluto.tree+object)), (6, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nmarks the end of a cell\\n\\\"\\\"\\\"\\nconst cellsuff = \\\"\\\\n\\\\n\\\"\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c896ba64347b56ba"), MIME type application/vnd.pluto.tree+object)), (7, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> struct Scrubbednb--> Represents a notebook from which all but code to be exported are scrubbed off.\\n> * Fields-->\\n>   * cells--> Vector of strings.\\n\\\"\\\"\\\"\\nmutable struct Scrubbednb\\n\\tcells::Array{String, 1}\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "f2f55cae09389a9d"), MIME type application/vnd.pluto.tree+object)), (8, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> collectnuclei(notebook::Scrubbednb, marker)--> Reads a notebook, collects code from code cells and returns an array of Nucelus.\\n\\\"\\\"\\\"\\nfunction collectnuclei(nb::Scrubbednb, marker)\\n\\tnbcells=nb.cells\\n\\tnuclei=[]\\n\\t\\t\\n    for i in 1:length(nbcells)\\n    \\traw_code=nbcells[i]\\n    \\tnucleus=Nucleus(raw_code)\\n    \\t\\n    \\tif startswith(raw_code, marker)\\n            push!(nuclei,nucleus)\\n        end\\n    \\t\\n    end\\n\\t nuclei\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "cd0480153d56e5b0"), MIME type application/vnd.pluto.tree+object)), (9, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n>loadscrubbednb(io, path)::Scrubbednb--> These are modification of the Pluto.load_notebook methods. Scrubs the notebook of all stuff but the code to be exported.\\n\\\"\\\"\\\"\\nfunction loadscrubbednb(io, path)::Scrubbednb\\n    collectedcells = []\\n\\t\\t\\n\\t# ignore first bits of file\\n    readuntil(io,celliddelim)\\n\\n    last_read = \\\"\\\"\\n    while !eof(io)\\n        cellidstr = String(readline(io))\\n        if cellidstr == \\\"Cell order:\\\"\\n            break\\n        else\\n            rawcode = String(readuntil(io, celliddelim))\\n            # change Windows line endings to Linux\\n            normalisedcode = replace(rawcode, \\\"\\\\r\\\\n\\\" => \\\"\\\\n\\\")\\n            # remove the cell appendix\\n            code = normalisedcode[1:prevind(normalisedcode, end, length(cellsuff))]\\n\\n            readcell = code\\n            push!(collectedcells, readcell)\\n        end\\n    end\\n\\t\\t\\n\\tScrubbednb(collectedcells)\\nend\\n\\t\\nfunction loadscrubbednb(path::String)::Scrubbednb\\n    local loaded\\n    open(path, \\\"r\\\") do io\\n        loaded = loadscrubbednb(io, path)\\n    end\\n    loaded\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "a50cf188ed67c684"), MIME type application/vnd.pluto.tree+object)), "more", (18, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nexport notebook2script\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "89a791483600df1b"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "10ceda263061fd"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"01_export.jl\"", MIME type text/plain))], :struct, "Nb", "2126f5d7e906cd28"]
```

```
#noop
@test testnb.nuclei[1].code == "#export\nimport Pluto: Notebook, Cell, load_notebook_nobackup"
------
Output
------
 
```

<div class="markdown"><p>something to save files</p>
</div>
## strip
<blockquote>
<p>strip –&gt; Helper fucntion to replace a substring y in a string x with blank.</p>
</blockquote>

<div class="markdown"><h4>Example</h4>
</div>
```
fn = "01_export.jl"
------
Output
------
"01_export.jl"
```

```
#noop
@test uppercasefirst(strip(strip(fn, r"[0-9_]"), r".jl")) == "Export"
------
Output
------
 
```

## savenb

<div class="markdown"><p>To export the required code, the following scenarios must be considered.</p>
<p>👉 Check if the file is in the src directory. If it&#39;s there then overwrite it. </p>
<p>👉 If it&#39;s not there then create and then write.</p>
</div>
> savenb(io, nb)–> Reads the supplied notebook and creates an io and writes stuffs like the module name and the content to the created io.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=savenb)

> savenb(nb::Nb, path::String)–> Creates a file in the supplied path with the name in the NB type.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=savenb)


## readfilenames

> readfilenames(nbsdir::String)–> Reads files in the directory and subdirectories in the given path. Reads only the files with \.jl\ extension

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=readfilenames)


<div class="markdown"><h4>Example</h4>
</div>
```
expected_list = ["..\\nbs\\00_nbdev.jl",
"..\\nbs\\01_export.jl",
"..\\nbs\\02_documenter.jl",
"..\\nbs\\03_codeRunner.jl",
"..\\nbs\\04_makedocs.jl",
"..\\nbs\\05_make.jl",
"..\\nbs\\06_common.jl",
"..\\nbs\\developerguide.jl",
"..\\nbs\\index.jl",
"..\\nbs\\styleguide.jl",
"..\\nbs\\tutorial.jl"]
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"..\\\\nbs\\\\00_nbdev.jl\"", MIME type text/plain)), (2, ("\"..\\\\nbs\\\\01_export.jl\"", MIME type text/plain)), (3, ("\"..\\\\nbs\\\\02_documenter.jl\"", MIME type text/plain)), (4, ("\"..\\\\nbs\\\\03_codeRunner.jl\"", MIME type text/plain)), (5, ("\"..\\\\nbs\\\\04_makedocs.jl\"", MIME type text/plain)), (6, ("\"..\\\\nbs\\\\05_make.jl\"", MIME type text/plain)), (7, ("\"..\\\\nbs\\\\06_common.jl\"", MIME type text/plain)), (8, ("\"..\\\\nbs\\\\developerguide.jl\"", MIME type text/plain)), (9, ("\"..\\\\nbs\\\\index.jl\"", MIME type text/plain)), (10, ("\"..\\\\nbs\\\\styleguide.jl\"", MIME type text/plain)), (11, ("\"..\\\\nbs\\\\tutorial.jl\"", MIME type text/plain))], :Array, "", "23e017f969fac20f"]
```

```
readfilenames(joinpath("..", "nbs"))
------
Output
------
Any["Any", Tuple{Int64, Any}[(1, ("\"..\\\\nbs\\\\00_nbdev.jl\"", MIME type text/plain)), (2, ("\"..\\\\nbs\\\\01_export.jl\"", MIME type text/plain)), (3, ("\"..\\\\nbs\\\\02_documenter.jl\"", MIME type text/plain)), (4, ("\"..\\\\nbs\\\\03_codeRunner.jl\"", MIME type text/plain)), (5, ("\"..\\\\nbs\\\\04_make.jl\"", MIME type text/plain)), (6, ("\"..\\\\nbs\\\\05_common.jl\"", MIME type text/plain)), (7, ("\"..\\\\nbs\\\\developerguide.jl\"", MIME type text/plain)), (8, ("\"..\\\\nbs\\\\index.jl\"", MIME type text/plain)), (9, ("\"..\\\\nbs\\\\styleguide.jl\"", MIME type text/plain)), (10, ("\"..\\\\nbs\\\\tutorial.jl\"", MIME type text/plain))], :Array, "", "7006c9f7fee7907f"]
```

```
#noop
@test readfilenames(joinpath("..", "nbs")) == expected_list
------
Output
------
 
```

## exportfile

> exportfile(f::String, srcdir::String, marker::String)–> Loads the file in the supplied path and reads the cells which are marked with \#export\. Then saves the notebook in the given path

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=exportfile)


## exportcontent

> exportcontent(fns::AbstractVector, srcdir::String, marker::String)–> maps the `export_file` function to each files

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=exportcontent)


## getfileextension

> getfileextension(fn)–> get the file extensions in the pwd

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=getfileextension)


<div class="markdown"><h4>Example</h4>
</div>
```
#noop
 @test getfileextension("test.jl") == ".jl"
------
Output
------
 
```

## notebook2script

> notebook2script(nbsdir::String, srcdir::String)–> Export all the code from the provided notebook directory to the given source directory

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Export.jl&q=notebook2script)


<div class="markdown"><p><code>notebook2script</code> can be called from a notebook which you intend to export. Usually in the last cell of that notebook</p>
</div>
```
notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))
------
Output
------
Any["Nothing", Tuple{Int64, Any}[(1, ("nothing", MIME type text/plain)), (2, ("nothing", MIME type text/plain)), (3, ("nothing", MIME type text/plain)), (4, ("nothing", MIME type text/plain)), (5, ("nothing", MIME type text/plain)), (6, ("nothing", MIME type text/plain)), (7, ("nothing", MIME type text/plain)), (8, ("nothing", MIME type text/plain)), (9, ("nothing", MIME type text/plain)), (10, ("nothing", MIME type text/plain))], :Array, "", "2a0906d67f73e881"]
```

