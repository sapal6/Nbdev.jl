<h1>Export</h1>
<div class="markdown"><p>The Export module helps in exporting the code to script files.</p>
</div>
<div class="markdown"><h2>Lower Level Entities&#40;Structs, methods etc.&#41;</h2>
<p>These are the objects on which nbdev&#39;s Export module was built.You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>
</div>
<div class="markdown"><h4>Nucleus type</h4>
</div>
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
Any["Nucleus", Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :struct, "Nucleus", "47548a9678eb6201"]
```

```
nucleus.code
------
Output
------
"a=1+1"
```

<div class="markdown"><h4>Nb type</h4>
</div>
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
Any["Main.workspace2.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "306d40c84759e9a7"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c2976b556bae3e4f"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "6dde1c26c23ba23b"), MIME type application/vnd.pluto.tree+object))], :Array, "", "403f1afae8420fcc"]
```

```
nb=Nb(samplecodes, "testnb.jl")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace2.Nucleus", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "306d40c84759e9a7"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c2976b556bae3e4f"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "6dde1c26c23ba23b"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "403f1afae8420fcc"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"testnb.jl\"", MIME type text/plain))], :struct, "Nb", "4be33ca50065e252"]
```

```
nb.nuclei
------
Output
------
Any["Main.workspace2.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "306d40c84759e9a7"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c2976b556bae3e4f"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "6dde1c26c23ba23b"), MIME type application/vnd.pluto.tree+object))], :Array, "", "403f1afae8420fcc"]
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
<div class="markdown"><h4>load<em>scrubbed</em>nb</h4>
</div>
> load*scrubbed*nb(io, path)::ScrubbedNotebook–> These are modification of the Pluto.load_notebook methods. Scrubs the notebook of all stuff but the code to be exported.




<div class="markdown"><p><code>load_scrubbed_nb</code> reads the notebook in the given path cell by cell, while ignoring the stuffs in the notebook like the cell order delimeters and the cell start delimeter. The result is a <code>ScrubbedNotebook</code> type which contains only the code which you intend to export.</p>
</div>
<div class="markdown"><h2>High Level APIs</h2>
<p>This too are called automatically by Nbdev.</p>
</div>
<div class="markdown"><h4>load_nb</h4>
</div>
> load*nb(filename::String, marker::String)–> High level function which calls _load*nb




> *load*nb(filename::String, marker::String)–> creates a scrubbed notebook and returns a curated Nb type having code to be exported.




<div class="markdown"><h4>ScrubbedNotebook</h4>
</div>
```
testnb= load_nb("01_export.jl", "#export")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace2.Nucleus", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nimport Pluto: Notebook, Cell, load_notebook_nobackup\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "ff74b8c09c2a01d"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nfunction processMdChunk(mdChunk::String)\\n\\tchopMdMarker(mdChunk)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "7234e7b14e3dd8b6"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nucleus--> This is the lowest entity of a code notebook. This type represents the code cell in a Pluto notebook.\\n> * Fields:\\n>   * code--> String which makes up a code cell\\n\\\"\\\"\\\"\\nBase.@kwdef mutable struct Nucleus\\n\\tcode::String=\\\"\\\"\\n\\tend\\n\\n\\\"\\\"\\\"\\n> Nucleus(code)-->Getter for accessing the constructer of the Nucleus type\\n\\\"\\\"\\\"\\nNucleus(code) = Nucleus(code = code)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "30d3cd894b7ba5ab"), MIME type application/vnd.pluto.tree+object)), (4, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nb--> a notebook having nuclei made up of code cells only.\\n> * Fields:\\n>   * nuclei--> Array of Nucleus type\\n>   * name--> name of notebook\\n\\\"\\\"\\\"\\nmutable struct Nb\\n\\tnuclei::Array{Nucleus,1}\\n\\tname::AbstractString\\nend\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an array of Nucleus.\\t\\n\\\"\\\"\\\"\\nnuclei(nuclei::Array) = nuclei\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an name of a notebook.\\n\\\"\\\"\\\"\\nname(name::AbstractString) = name\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "4a9e22027f104b91"), MIME type application/vnd.pluto.tree+object)), (5, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\nHeaders that would appear in a code file\\n\\\"\\\"\\\"\\nconst _header = \\\"### A Nbdev script file ###\\\"\\nconst _sub_header = \\\"### Autogenerated file. Don't modify. ###\\\"\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "16bbf13b174bcf5b"), MIME type application/vnd.pluto.tree+object)), (6, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nThis had to be done because having the cell iddelimeter as a constant gives an error during parsing the notebook\\n\\\"\\\"\\\"\\ncell_id_delimiter=string(\\\"#\\\",\\\" ╔═╡ \\\")\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c7f527202d292b1"), MIME type application/vnd.pluto.tree+object)), (7, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nmarks the end of a cell\\n\\\"\\\"\\\"\\nconst _cell_suffix = \\\"\\\\n\\\\n\\\"\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "a869a2ca3aa73257"), MIME type application/vnd.pluto.tree+object)), (8, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> struct ScrubbedNotebook--> Represents a notebook from which all but code to be exported are scrubbed off.\\n> * Fields-->\\n>   * cells--> Vector of strings.\\n\\\"\\\"\\\"\\nmutable struct ScrubbedNotebook\\n\\tcells::Array{String, 1}\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "fdb9e50ae547b3af"), MIME type application/vnd.pluto.tree+object)), (9, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> collect_nuclei(notebook::ScrubbedNotebook, marker)--> Reads a notebook, collects code from code cells and returns an array of Nucelus.\\n\\\"\\\"\\\"\\nfunction collect_nuclei(notebook::ScrubbedNotebook, marker)\\n\\tnotebook_cells=notebook.cells\\n\\tnuclei=[]\\n\\t\\t\\n    for i in 1:length(notebook_cells)\\n    \\traw_code=notebook_cells[i]\\n    \\tnucleus=Nucleus(raw_code)\\n    \\t\\n    \\tif startswith(raw_code, marker)\\n            push!(nuclei,nucleus)\\n        end\\n    \\t\\n    end\\n\\t nuclei\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "7c865c0f964b693"), MIME type application/vnd.pluto.tree+object)), (10, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n>load_scrubbed_nb(io, path)::ScrubbedNotebook--> These are modification of the Pluto.load_notebook methods. Scrubs the notebook of all stuff but the code to be exported.\\n\\\"\\\"\\\"\\nfunction load_scrubbed_nb(io, path)::ScrubbedNotebook\\n    collected_cells = []\\n\\t\\t\\n\\t# ignore first bits of file\\n    readuntil(io,cell_id_delimiter)\\n\\n    last_read = \\\"\\\"\\n    while !eof(io)\\n        cell_id_str = String(readline(io))\\n        if cell_id_str == \\\"Cell order:\\\"\\n            break\\n        else\\n            code_raw = String(readuntil(io, cell_id_delimiter))\\n            # change Windows line endings to Linux\\n            code_normalised = replace(code_raw, \\\"\\\\r\\\\n\\\" => \\\"\\\\n\\\")\\n            # remove the cell appendix\\n            code = code_normalised[1:prevind(code_normalised, end, length(_cell_suffix))]\\n\\n            read_cell = code\\n            push!(collected_cells, read_cell)\\n        end\\n    end\\n\\t\\t\\n\\tScrubbedNotebook(collected_cells)\\nend\\n\\t\\nfunction load_scrubbed_nb(path::String)::ScrubbedNotebook\\n    local loaded\\n    open(path, \\\"r\\\") do io\\n        loaded = load_scrubbed_nb(io, path)\\n    end\\n    loaded\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2d31ed14c437c5f2"), MIME type application/vnd.pluto.tree+object)), (11, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> load_nb(filename::String, marker::String)--> High level function which calls _load_nb\\n\\\"\\\"\\\"\\nload_nb(filename::String, marker::String) = _load_nb(filename, marker)\\n\\n\\\"\\\"\\\"\\n> _load_nb(filename::String, marker::String)--> creates a scrubbed notebook and returns a curated Nb type having code to be exported.\\n\\\"\\\"\\\"\\nfunction _load_nb(filename::String, marker::String)\\n\\t\\t#notebook=load_notebook_nobackup(filename)\\n\\t\\tscrubbedNotebook=load_scrubbed_nb(normpath(joinpath(@__FILE__,\\\"..\\\",\\\"..\\\", \\\"nbs\\\", filename)))\\n\\t\\tcollected_nuclei=nuclei(collect_nuclei(scrubbedNotebook, marker))\\n\\t\\t\\n\\t\\t#if marker==\\\"md\\\"\\n\\t\\t#\\tnotebook\\n\\t\\t#else\\n\\t\\tNb(collected_nuclei, filename)\\n\\t\\t#end\\nend\\n\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "6511de1e33f7a364"), MIME type application/vnd.pluto.tree+object)), (12, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> strip --> Helper fucntion to replace a substring y in a string x with blank.\\n\\\"\\\"\\\"\\nstrip=(x::String,y) -> replace(x, y=>\\\"\\\")\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "9fe841be29a46787"), MIME type application/vnd.pluto.tree+object)), (13, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> save_nb(io, notebook)--> Reads the supplied notebook and creates an io and writes stuffs like the module name and the content to the created io.\\n\\\"\\\"\\\"\\nfunction save_nb(io, notebook)\\n    println(io, _header)\\n    println(io, _sub_header)\\n    println(io, \\\"\\\")\\n    println(io, \\\"module \\\$(uppercasefirst(strip(strip(notebook.name, r\\\"[0-9_]\\\"), r\\\".jl\\\")))\\\")\\n\\tfor nucleus in notebook.nuclei\\n\\t\\t\\tprintln(io, nucleus.code*\\\"\\\\n\\\")\\n    end\\n\\t#notebook\\n\\tprint(io, \\\"end\\\")\\t\\nend\\n\\n\\\"\\\"\\\"\\n> save_nb(notebook::Nb, path::String)--> Creates a file in the supplied path with the name in the NB type.\\n\\\"\\\"\\\"\\nfunction save_nb(notebook::Nb, path::String)\\n\\tfile_name=uppercasefirst(strip(notebook.name, r\\\"[0-9_]\\\"))\\n\\topen(joinpath(path, file_name), \\\"w\\\") do io\\n        save_nb(io, notebook)\\n    end\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "c9ed9a347daf1a0b"), MIME type application/vnd.pluto.tree+object)), (14, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> readfilenames()--> Reads files in the directory and subdirectories in the current path. Reads only the files with \\\".jl\\\" extension\\n\\\"\\\"\\\"\\nfunction readfilenames()\\n\\tfiles=[]\\n\\tfor file in readdir(normpath(joinpath(@__FILE__,\\\"..\\\",\\\"..\\\", \\\"nbs\\\")))\\n\\t\\t\\tif endswith(file, \\\".jl\\\")\\n\\t\\t\\t\\tpush!(files,file)\\n\\t\\t\\tend\\n\\t\\t\\t#if getfile_extension(file)== \\\".jl\\\"\\n\\t\\t\\t#\\tpush!(files,file)\\n\\t\\t\\t#end\\n\\tend\\n\\tfiles\\nend\\n\\nfunction readfilenames(dir::String)\\n\\tfiles=[]\\n\\tfor file in readdir(dir)\\n\\t\\t\\tif endswith(file, \\\".jl\\\")\\n\\t\\t\\t\\tpush!(files,file)\\n\\t\\t\\tend\\n\\t\\t\\t#if getfile_extension(file)== \\\".jl\\\"\\n\\t\\t\\t#\\tpush!(files,file)\\n\\t\\t\\t#end\\n\\tend\\n\\tfiles\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "fdf7a671e5c34491"), MIME type application/vnd.pluto.tree+object)), (15, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> export_file(file::String, path::String, marker::String)--> Loads the file in the supplied path and reads the cells which are marked with \\\"#export\\\". Then saves the notebook in the given path\\n\\\"\\\"\\\"\\nfunction export_file(file::String, path::String, marker::String)\\n\\tnotebook=load_nb(file, \\\"#export\\\")\\n\\tsave_nb(notebook, path)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "64e4a47cb39d3cf5"), MIME type application/vnd.pluto.tree+object)), (16, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> export_content(files::AbstractVector, path::String, marker::String)--> maps the `export_file` function to each files\\n\\\"\\\"\\\"\\nfunction export_content(files::AbstractVector, path::String, marker::String)\\n\\tmap(file->export_file(file, path, marker), files)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "d89912151b061910"), MIME type application/vnd.pluto.tree+object)), (17, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> getfile_extension(filename)--> get the file extensions in the pwd\\n\\\"\\\"\\\"\\nfunction getfile_extension(filename)\\n    return filename[findlast(isequal('.'),filename):end]\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "4a13057f7df9fc7f"), MIME type application/vnd.pluto.tree+object)), (18, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> notebook2script()--> Export all the code to the ../src path of the project\\n\\\"\\\"\\\"\\nfunction notebook2script()\\n\\texport_content(readfilenames(), \\\"../src\\\", \\\"#export\\\")\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "92278d680e230cb3"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "77793349d6ff63ef"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"01_export.jl\"", MIME type text/plain))], :struct, "Nb", "7b12925ce165cbe5"]
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
<div class="markdown"><h4>strip</h4>
<blockquote>
<p>strip –&gt; Helper fucntion to replace a substring y in a string x with blank.</p>
</blockquote>
</div>
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

<div class="markdown"><p>We will read files in the current path which should be the /nbs folder in your project. This will host all your notebooks</p>
</div>
<div class="markdown"><h4>readfilenames</h4>
</div>
> readfilenames()–> Reads files in the directory and subdirectories in the current path. Reads only the files with \.jl\ extension




<div class="markdown"><h4>Example</h4>
</div>
```
readfilenames()
------
Output
------
Any["Any", Tuple{Int64, Any}[(1, ("\"01_export.jl\"", MIME type text/plain)), (2, ("\"02_documenter.jl\"", MIME type text/plain)), (3, ("\"03_codeRunner.jl\"", MIME type text/plain)), (4, ("\"05_makedocs.jl\"", MIME type text/plain)), (5, ("\"06_index.jl\"", MIME type text/plain))], :Array, "", "dff1b136b2da593b"]
```

<div class="markdown"><h4>export_file</h4>
</div>
> export_file(file::String, path::String, marker::String)–> Loads the file in the supplied path and reads the cells which are marked with \#export\. Then saves the notebook in the given path




<div class="markdown"><h4>export_content</h4>
</div>
> export*content(files::AbstractVector, path::String, marker::String)–> maps the `export*file` function to each files




<div class="markdown"><h4>getfile_extension</h4>
</div>
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

<div class="markdown"><h4>notebook2script</h4>
</div>
> notebook2script()–> Export all the code to the ../src path of the project




<div class="markdown"><p><code>notebook2script</code> can be called from anotebook which you intend to export. Usually in the last cell of that notebook</p>
</div>
```
notebook2script()
------
Output
------
Any["Nothing", Tuple{Int64, Any}[(1, ("nothing", MIME type text/plain)), (2, ("nothing", MIME type text/plain)), (3, ("nothing", MIME type text/plain)), (4, ("nothing", MIME type text/plain)), (5, ("nothing", MIME type text/plain))], :Array, "", "eace4e8e41d845ae"]
```

