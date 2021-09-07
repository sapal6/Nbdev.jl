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
Any["Nucleus", Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :struct, "Nucleus", "a4d7a6beb96dcdd0"]
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
Any["Main.workspace2.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "a0924b802566674b"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "41ef0900681fe131"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2972f9fc3727c4e5"), MIME type application/vnd.pluto.tree+object))], :Array, "", "eeb2f185ce403bd3"]
```

```
nb=Nb(samplecodes, "testnb.jl")
------
Output
------
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace2.Nucleus", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "a0924b802566674b"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "41ef0900681fe131"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2972f9fc3727c4e5"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "eeb2f185ce403bd3"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"testnb.jl\"", MIME type text/plain))], :struct, "Nb", "c1997bfef02323cc"]
```

```
nb.nuclei
------
Output
------
Any["Main.workspace2.Nucleus", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"a=1+1\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "a0924b802566674b"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"function test(x)  x+1 end\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "41ef0900681fe131"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"test(2)\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2972f9fc3727c4e5"), MIME type application/vnd.pluto.tree+object))], :Array, "", "eeb2f185ce403bd3"]
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
Any["Nb", Any[(:nuclei, (Dict{Symbol, Any}(:prefix => "Main.workspace2.Nucleus", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nimport Pluto: Notebook, Cell, load_notebook_nobackup\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "15c199df19b02513"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nfunction processMdChunk(mdChunk::String)\\n\\tchopMdMarker(mdChunk)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "725b7dbcd2e3edd5"), MIME type application/vnd.pluto.tree+object)), (3, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nucleus--> This is the lowest entity of a code notebook. This type represents the code cell in a Pluto notebook.\\n> * Fields:\\n>   * code--> String which makes up a code cell\\n\\\"\\\"\\\"\\nBase.@kwdef mutable struct Nucleus\\n\\tcode::String=\\\"\\\"\\n\\tend\\n\\n\\\"\\\"\\\"\\n> Nucleus(code)-->Getter for accessing the constructer of the Nucleus type\\n\\\"\\\"\\\"\\nNucleus(code) = Nucleus(code = code)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2da94ae0497f85ad"), MIME type application/vnd.pluto.tree+object)), (4, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> struct Nb--> a notebook having nuclei made up of code cells only.\\n> * Fields:\\n>   * nuclei--> Array of Nucleus type\\n>   * name--> name of notebook\\n\\\"\\\"\\\"\\nmutable struct Nb\\n\\tnuclei::Array{Nucleus,1}\\n\\tname::AbstractString\\nend\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an array of Nucleus.\\t\\n\\\"\\\"\\\"\\nnuclei(nuclei::Array) = nuclei\\n\\n\\\"\\\"\\\"\\n> nuclei(nuclei::Array)--> Helper to collect an name of a notebook.\\n\\\"\\\"\\\"\\nname(name::AbstractString) = name\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "f223760c5273e3ca"), MIME type application/vnd.pluto.tree+object)), (5, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\nHeaders that would appear in a code file\\n\\\"\\\"\\\"\\nconst _header = \\\"### A Nbdev script file ###\\\"\\nconst _sub_header = \\\"### Autogenerated file. Don't modify. ###\\\"\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "9d99f1f92960d8a5"), MIME type application/vnd.pluto.tree+object)), (6, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nThis had to be done because having the cell iddelimeter as a constant gives an error during parsing the notebook\\n\\\"\\\"\\\"\\ncell_id_delimiter=string(\\\"#\\\",\\\" ╔═╡ \\\")\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "72aea35dd38a3aa3"), MIME type application/vnd.pluto.tree+object)), (7, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\nmarks the end of a cell\\n\\\"\\\"\\\"\\nconst _cell_suffix = \\\"\\\\n\\\\n\\\"\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "e4ab20a4b7833f5f"), MIME type application/vnd.pluto.tree+object)), (8, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> struct ScrubbedNotebook--> Represents a notebook from which all but code to be exported are scrubbed off.\\n> * Fields-->\\n>   * cells--> Vector of strings.\\n\\\"\\\"\\\"\\nmutable struct ScrubbedNotebook\\n\\tcells::Array{String, 1}\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "546f647b170bc416"), MIME type application/vnd.pluto.tree+object)), (9, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> collect_nuclei(notebook::ScrubbedNotebook, marker)--> Reads a notebook, collects code from code cells and returns an array of Nucelus.\\n\\\"\\\"\\\"\\nfunction collect_nuclei(notebook::ScrubbedNotebook, marker)\\n\\tnotebook_cells=notebook.cells\\n\\tnuclei=[]\\n\\t\\t\\n    for i in 1:length(notebook_cells)\\n    \\traw_code=notebook_cells[i]\\n    \\tnucleus=Nucleus(raw_code)\\n    \\t\\n    \\tif startswith(raw_code, marker)\\n            push!(nuclei,nucleus)\\n        end\\n    \\t\\n    end\\n\\t nuclei\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "671127dd3c4f4bbe"), MIME type application/vnd.pluto.tree+object)), (10, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n>load_scrubbed_nb(io, path)::ScrubbedNotebook--> These are modification of the Pluto.load_notebook methods. Scrubs the notebook of all stuff but the code to be exported.\\n\\\"\\\"\\\"\\nfunction load_scrubbed_nb(io, path)::ScrubbedNotebook\\n    collected_cells = []\\n\\t\\t\\n\\t# ignore first bits of file\\n    readuntil(io,cell_id_delimiter)\\n\\n    last_read = \\\"\\\"\\n    while !eof(io)\\n        cell_id_str = String(readline(io))\\n        if cell_id_str == \\\"Cell order:\\\"\\n            break\\n        else\\n            code_raw = String(readuntil(io, cell_id_delimiter))\\n            # change Windows line endings to Linux\\n            code_normalised = replace(code_raw, \\\"\\\\r\\\\n\\\" => \\\"\\\\n\\\")\\n            # remove the cell appendix\\n            code = code_normalised[1:prevind(code_normalised, end, length(_cell_suffix))]\\n\\n            read_cell = code\\n            push!(collected_cells, read_cell)\\n        end\\n    end\\n\\t\\t\\n\\tScrubbedNotebook(collected_cells)\\nend\\n\\t\\nfunction load_scrubbed_nb(path::String)::ScrubbedNotebook\\n    local loaded\\n    open(path, \\\"r\\\") do io\\n        loaded = load_scrubbed_nb(io, path)\\n    end\\n    loaded\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "bd9c398769656e7d"), MIME type application/vnd.pluto.tree+object)), (11, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> load_nb(filename::String, marker::String)--> High level function which calls _load_nb\\n\\\"\\\"\\\"\\nload_nb(filename::String, marker::String) = _load_nb(filename, marker)\\n\\n\\\"\\\"\\\"\\n> _load_nb(filename::String, marker::String)--> creates a scrubbed notebook and returns a curated Nb type having code to be exported.\\n\\\"\\\"\\\"\\nfunction _load_nb(filename::String, marker::String)\\n\\t\\t#notebook=load_notebook_nobackup(filename)\\n\\t\\tscrubbedNotebook=load_scrubbed_nb(normpath(joinpath(@__FILE__,\\\"..\\\",\\\"..\\\", \\\"nbs\\\", filename)))\\n\\t\\tcollected_nuclei=nuclei(collect_nuclei(scrubbedNotebook, marker))\\n\\t\\t\\n\\t\\t#if marker==\\\"md\\\"\\n\\t\\t#\\tnotebook\\n\\t\\t#else\\n\\t\\tNb(collected_nuclei, filename)\\n\\t\\t#end\\nend\\n\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "92758be91318129d"), MIME type application/vnd.pluto.tree+object)), (12, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> strip --> Helper fucntion to replace a substring y in a string x with blank.\\n\\\"\\\"\\\"\\nstrip=(x::String,y) -> replace(x, y=>\\\"\\\")\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "66ed7e0ebc07febd"), MIME type application/vnd.pluto.tree+object)), (13, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> save_nb(io, notebook)--> Reads the supplied notebook and creates an io and writes stuffs like the module name and the content to the created io.\\n\\\"\\\"\\\"\\nfunction save_nb(io, notebook)\\n    println(io, _header)\\n    println(io, _sub_header)\\n    println(io, \\\"\\\")\\n    println(io, \\\"module \\\$(uppercasefirst(strip(strip(notebook.name, r\\\"[0-9_]\\\"), r\\\".jl\\\")))\\\")\\n\\tfor nucleus in notebook.nuclei\\n\\t\\t\\tprintln(io, nucleus.code*\\\"\\\\n\\\")\\n    end\\n\\t#notebook\\n\\tprint(io, \\\"end\\\")\\t\\nend\\n\\n\\\"\\\"\\\"\\n> save_nb(notebook::Nb, path::String)--> Creates a file in the supplied path with the name in the NB type.\\n\\\"\\\"\\\"\\nfunction save_nb(notebook::Nb, path::String)\\n\\tfile_name=uppercasefirst(strip(notebook.name, r\\\"[0-9_]\\\"))\\n\\topen(joinpath(path, file_name), \\\"w\\\") do io\\n        save_nb(io, notebook)\\n    end\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "64761a3537193456"), MIME type application/vnd.pluto.tree+object)), (14, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\nbegin\\n\\\"\\\"\\\"\\n> readfilenames()--> Reads files in the directory and subdirectories in the current path. Reads only the files with \\\".jl\\\" extension\\n\\\"\\\"\\\"\\nfunction readfilenames()\\n\\tfiles=[]\\n\\tfor file in readdir(normpath(joinpath(@__FILE__,\\\"..\\\",\\\"..\\\", \\\"nbs\\\")))\\n\\t\\t\\tif endswith(file, \\\".jl\\\") && !contains(file, \\\"index\\\")\\n\\t\\t\\t\\tpush!(files,file)\\n\\t\\t\\tend\\n\\t\\t\\t#if getfile_extension(file)== \\\".jl\\\"\\n\\t\\t\\t#\\tpush!(files,file)\\n\\t\\t\\t#end\\n\\tend\\n\\tfiles\\nend\\n\\nfunction readfilenames(dir::String)\\n\\tfiles=[]\\n\\tfor file in readdir(dir)\\n\\t\\t\\tif endswith(file, \\\".jl\\\")\\n\\t\\t\\t\\tpush!(files,file)\\n\\t\\t\\tend\\n\\t\\t\\t#if getfile_extension(file)== \\\".jl\\\"\\n\\t\\t\\t#\\tpush!(files,file)\\n\\t\\t\\t#end\\n\\tend\\n\\tfiles\\nend\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "748448e257359a0c"), MIME type application/vnd.pluto.tree+object)), (15, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> export_file(file::String, path::String, marker::String)--> Loads the file in the supplied path and reads the cells which are marked with \\\"#export\\\". Then saves the notebook in the given path\\n\\\"\\\"\\\"\\nfunction export_file(file::String, path::String, marker::String)\\n\\tnotebook=load_nb(file, \\\"#export\\\")\\n\\tsave_nb(notebook, path)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "9279e98d1320d9f1"), MIME type application/vnd.pluto.tree+object)), (16, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> export_content(files::AbstractVector, path::String, marker::String)--> maps the `export_file` function to each files\\n\\\"\\\"\\\"\\nfunction export_content(files::AbstractVector, path::String, marker::String)\\n\\tmap(file->export_file(file, path, marker), files)\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "3928f1b0e07ee95e"), MIME type application/vnd.pluto.tree+object)), (17, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> getfile_extension(filename)--> get the file extensions in the pwd\\n\\\"\\\"\\\"\\nfunction getfile_extension(filename)\\n    return filename[findlast(isequal('.'),filename):end]\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2268977f32fe33fb"), MIME type application/vnd.pluto.tree+object)), (18, (Dict{Symbol, Any}(:prefix => "Nucleus", :elements => Any[(:code, ("\"#export\\n\\\"\\\"\\\"\\n> notebook2script()--> Export all the code to the ../src path of the project\\n\\\"\\\"\\\"\\nfunction notebook2script()\\n\\texport_content(readfilenames(), \\\"../src\\\", \\\"#export\\\")\\nend\"", MIME type text/plain))], :type => :struct, :prefix_short => "Nucleus", :objectid => "2e7e8091cb2a0ed8"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "518628c492f094d5"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"01_export.jl\"", MIME type text/plain))], :struct, "Nb", "80fd8ab471adc010"]
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
Any["Any", Tuple{Int64, Any}[(1, ("\"01_export.jl\"", MIME type text/plain)), (2, ("\"02_documenter.jl\"", MIME type text/plain)), (3, ("\"03_codeRunner.jl\"", MIME type text/plain)), (4, ("\"05_makedocs.jl\"", MIME type text/plain))], :Array, "", "48d7a360f2a94d22"]
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
Any["Nothing", Tuple{Int64, Any}[(1, ("nothing", MIME type text/plain)), (2, ("nothing", MIME type text/plain)), (3, ("nothing", MIME type text/plain)), (4, ("nothing", MIME type text/plain))], :Array, "", "8cd6727289759dc4"]
```

