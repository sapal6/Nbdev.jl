<h1>ConfigReader</h1>
<div class="markdown"><p>The config file is where all the settings are to be stored. Nbdev will use this to setup different things in your project. The <code>read_conf</code> helps you to parse the settings.ini file</p>
</div>
<div class="markdown"><h2>read_conf</h2>
</div>
> read_conf(confpath::String=\../settings.ini\)–> Takes in the config filepath and parses the different configurations(key/value pair. Returns a dictionary




<div class="markdown"><h2>Example</h2>
</div>
```
exampl=read_conf("../settings.ini")
------
Output
------
Any["Dict{String, String}", Any[(("\"author_email\"", MIME type text/plain), ("\"Satyabrata.pal1@gmail.com\"", MIME type text/plain)), (("\"author\"", MIME type text/plain), ("\"Satyabrata\"", MIME type text/plain)), (("\"lib_name\"", MIME type text/plain), ("\"nbdev.jl\"", MIME type text/plain)), (("\"lib_path\"", MIME type text/plain), ("\"./../Projects/open-projects/nbdev.jl\"", MIME type text/plain)), (("\"keywords\"", MIME type text/plain), ("\"nothing\"", MIME type text/plain)), (("\"copyright\"", MIME type text/plain), ("\"nothing\"", MIME type text/plain)), (("\"description\"", MIME type text/plain), ("\"A\"", MIME type text/plain)), (("\"user\"", MIME type text/plain), ("\"sapal6\"", MIME type text/plain))], :Dict, "Dict", "2a1be9d0b799c1e2"]
```

```
exampl["author"]
------
Output
------
"Satyabrata"
```

```
Export.notebook2script()
------
Output
------
Any["Nothing", Tuple{Int64, Any}[(1, ("nothing", MIME type text/plain)), (2, ("nothing", MIME type text/plain)), (3, ("nothing", MIME type text/plain)), (4, ("nothing", MIME type text/plain)), (5, ("nothing", MIME type text/plain)), (6, ("nothing", MIME type text/plain))], :Array, "", "dbe9101c2ccda90e"]
```

