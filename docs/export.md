<h1>Export</h1>
<div class="markdown"><p>The Export module helps in exporting the code to script files.</p>
</div>
## Lower Level Entities&#40;Structs, methods etc.&#41;
<p>These are the objects on which nbdev&#39;s Export module was built. You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>

## Nucleus type

> struct Nucleus–> This is the lowest entity of a code notebook. This type represents the code cell in a Pluto notebook.
>
>   * Fields:
>
>       * code–> String which makes up a code cell



> Nucleus(code)–>Getter for accessing the constructer of the Nucleus type




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
nucleus=Nucleus(sample_code)
------
Output
------
Any["Nucleus", Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :struct, "Nucleus", "d9e34f839c3d27a9"]
```

```
nucleus.code
------
Output
------
"a=1+1"
```

## Nb type

> struct Nb–> a notebook having nuclei made up of code cells only.
>
>   * Fields:
>
>       * nuclei–> Array of Nucleus type
>       * name–> name of notebook




> nuclei(nuclei::Array)–> Helper to collect an array of Nucleus.




> nuclei(nuclei::Array)–> Helper to collect an name of a notebook.




<div class="markdown"><p>A Nb type is used to collect all code cells&#40;which are contained in the Nucleus type. These code cells are actual code represented as string.</p>
</div>
<div class="markdown"><h4>Example</h4>
</div>
```
samplecodes=[Nucleus("a=1+1"), Nucleus("function test(x)  x+1 end"), Nucleus("test(2)")]
------
Output
------
Any["Main.workspace2.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "9e58522eb612df7a"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "1223e3549da9c080"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "ea32d807cdc7a8e7"), MIME type application/vnd.pluto.tree+object))], :Array, "", "9bd05b5c282fb803"]
```

```
nb=Nb(samplecodes, "testnb.jl")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace2.Nucleus", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "9e58522eb612df7a"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "1223e3549da9c080"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "ea32d807cdc7a8e7"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "9bd05b5c282fb803"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"testnb.jl\"", MIME type text/plain))], :struct, "Nb", "1d85bdfdaa360b94"]
```

```
nb.nuclei
------
Output
------
Any["Main.workspace2.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "9e58522eb612df7a"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "1223e3549da9c080"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "ea32d807cdc7a8e7"), MIME type application/vnd.pluto.tree+object))], :Array, "", "9bd05b5c282fb803"]
```

```
nb.name
------
Output
------
"testnb.jl"
```

> collect_nuclei(notebook::ScrubbedNotebook, marker)–> Reads a notebook, collects code from code cells and returns an array of Nucelus.




<div class="markdown"><p><code>collect_nuclei&#40;notebook::ScrubbedNotebook, marker&#41;</code> reads the entire notebook cell by cell and then checks if the content of that cell starts with a marker, only then it builds an array of the Nucleus type. </p>
</div>
## load<em>scrubbed</em>nb

> load*scrubbed*nb(io, path)::ScrubbedNotebook–> These are modification of the Pluto.load_notebook methods. Scrubs the notebook of all stuff but the code to be exported.




<div class="markdown"><p><code>load_scrubbed_nb</code> reads the notebook in the given path cell by cell, while ignoring the stuffs in the notebook like the cell order delimeters and the cell start delimeter. The result is a <code>ScrubbedNotebook</code> type which contains only the code which you intend to export.</p>
</div>
## High Level APIs
<p>This too are called automatically by Nbdev.</p>

## load_nb

> load*nb(filename::String, marker::String)–> High level function which calls _load*nb




> *load*nb(filename::String, marker::String)–> creates a scrubbed notebook and returns a curated Nb type having code to be exported.




## ScrubbedNotebook

```
testnb= load_nb("01_export.jl", "#export")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace2.Nucleus", :elements => Any[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nimport Pluto: Notebook, Cell, load_notebook_nobackup\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c32ee7b87816d50"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nfunction processMdChunk(mdChunk::String)\\n\\tchopMdMarker(mdChunk)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "11ecfca092f58b22"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nucleus--> This is the lowest entity of a code notebook. This type represents the code cell in a Pluto notebook.\\n> * Fields:\\n>   * code--> String which makes up a code cell\\n\\\"\\\"\\\"\\nBase.@kwdef mutable struct Nucleus\\n\\tcode::String=\\\"\\\"\\n\\tend\\n\\n\\\"\\\"\\\"\\n> Nucleus(code)-->Getter for accessing the constructer of the Nucleus type\\n\\\"\\\"\\\"\\nNucleus(code) = Nucleus(code = code)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "886a98247ff0d318"), MIME type application/vnd.pluto.tree+object)), (4, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nb--> a notebook having nuclei made up of code cells only.\\n> * Fields:\\n>   * nuclei--> Array of Nucleus type\\n>   * name--> name of notebook\\n\\\"\\\"\\\"\\nmutable struct Nb\\n\\tnuclei::Array{Nucleus,1}\\n\\tname::AbstractString\\nend\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an array of Nucleus.\\t\\n\\\"\\\"\\\"\\nnuclei(nuclei::Array) = nuclei\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an name of a notebook.\\n\\\"\\\"\\\"\\nname(name::AbstractString) = name\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "ea4c0f29c3b3be85"), MIME type application/vnd.pluto.tree+object)), (5, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\nHeaders that would appear in a code file\\n\\\"\\\"\\\"\\nconst _header = \\\"### A Nbdev script file ###\\\"\\nconst _sub_header = \\\"### Autogenerated file. Don't modify. ###\\\"\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "7532a3b7d980e563"), MIME type application/vnd.pluto.tree+object)), (6, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nThis had to be done because having the cell iddelimeter as a constant gives an error during parsing the notebook\\n\\\"\\\"\\\"\\ncell_id_delimiter=string(\\\"#\\\",\\\" ╔═╡ \\\")\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "8f95c55d8e47297a"), MIME type application/vnd.pluto.tree+object)), (7, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nmarks the end of a cell\\n\\\"\\\"\\\"\\nconst _cell_suffix = \\\"\\\\n\\\\n\\\"\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "b802877d5f20adf5"), MIME type application/vnd.pluto.tree+object)), (8, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> struct ScrubbedNotebook--> Represents a notebook from which all but code to be exported are scrubbed off.\\n> * Fields-->\\n>   * cells--> Vector of strings.\\n\\\"\\\"\\\"\\nmutable struct ScrubbedNotebook\\n\\tcells::Array{String, 1}\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "7089ae6d502ef8a6"), MIME type application/vnd.pluto.tree+object)), (9, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> collect_nuclei(notebook::ScrubbedNotebook, marker)--> Reads a notebook, collects code from code cells and returns an array of Nucelus.\\n\\\"\\\"\\\"\\nfunction collect_nuclei(notebook::ScrubbedNotebook, marker)\\n\\tnotebook_cells=notebook.cells\\n\\tnuclei=[]\\n\\t\\t\\n    for i in 1:length(notebook_cells)\\n    \\traw_code=notebook_cells[i]\\n    \\tnucleus=Nucleus(raw_code)\\n    \\t\\n    \\tif startswith(raw_code, marker)\\n            push!(nuclei,nucleus)\\n        end\\n    \\t\\n    end\\n\\t nuclei\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "cdb3ebfa8a8384ef"), MIME type application/vnd.pluto.tree+object)), "more", (18, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> notebook2script()--> Export all the code to the ../src path of the project\\n\\\"\\\"\\\"\\nfunction notebook2script()\\n\\texport_content(readfilenames(), \\\"../src\\\", \\\"#export\\\")\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "ee375f99cb8a78a9"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "d7307760a4095a4b"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"01_export.jl\"", MIME type text/plain))], :struct, "Nb", "7985f0b96440e982"]
```

```
testnb.nuclei[1].code
------
Output
------
"#export\nimport Pluto: Notebook, Cell, load_notebook_nobackup"
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
"module $(uppercasefirst(strip(strip(k, r"[0-9_]"), r".jl")))"
------
Output
------
"module Export"
```

<div class="markdown"><p>To export the required code, the following scenarios must be considered.</p>
<p>👉 Check if the file is in the src directory. If it&#39;s there then overwrite it. </p>
<p>👉 If it&#39;s not there then create and then write.</p>
</div>
> save_nb(io, notebook)–> Reads the supplied notebook and creates an io and writes stuffs like the module name and the content to the created io.



> save_nb(notebook::Nb, path::String)–> Creates a file in the supplied path with the name in the NB type.




<div class="markdown"><h4>Example</h4>
</div>
```
save_nb(testnb, "../testpath")
------
Output
------

```

<div class="markdown"><p>We will read files in the /nbs folder in your project. This will host all your notebooks</p>
</div>
## readfilenames

> readfilenames()–> Reads files in the directory and subdirectories in the current path. Reads only the files with \.jl\ extension




<div class="markdown"><h4>Example</h4>
</div>
```
readfilenames()
------
Output
------
Any["Any", Tuple{Int64, Any}[(1, ("\"00_nbdev.jl\"", MIME type text/plain)), (2, ("\"01_export.jl\"", MIME type text/plain)), (3, ("\"02_documenter.jl\"", MIME type text/plain)), (4, ("\"03_codeRunner.jl\"", MIME type text/plain)), (5, ("\"05_makedocs.jl\"", MIME type text/plain)), (6, ("\"07_tutorial.jl\"", MIME type text/plain))], :Array, "", "43d83f00e851bf86"]
```

## export_file

> export_file(file::String, path::String, marker::String)–> Loads the file in the supplied path and reads the cells which are marked with \#export\. Then saves the notebook in the given path




## export_content

> export*content(files::AbstractVector, path::String, marker::String)–> maps the `export*file` function to each files




## getfile_extension

> getfile_extension(filename)–> get the file extensions in the pwd




<div class="markdown"><h4>Example</h4>
</div>
```
 getfile_extension("test.jl")
------
Output
------
".jl"
```

## notebook2script

> notebook2script()–> Export all the code to the ../src path of the project




<div class="markdown"><p><code>notebook2script</code> can be called from anotebook which you intend to export. Usually in the last cell of that notebook</p>
</div>
```
notebook2script()
------
Output
------
Any["Nothing", Tuple{Int64, Any}[(1, ("nothing", MIME type text/plain)), (2, ("nothing", MIME type text/plain)), (3, ("nothing", MIME type text/plain)), (4, ("nothing", MIME type text/plain)), (5, ("nothing", MIME type text/plain)), (6, ("nothing", MIME type text/plain))], :Array, "", "5cd67174aa74adf9"]
```

