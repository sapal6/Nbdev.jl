<h1>Makedocs</h1>
<div class="markdown"><p>This module takes care of the creation of the support system document generation such as directory creation, index.yml and mkdocs.yml creation.</p>
<p>Additionally it calls mkdocs commands to build the site</p>
</div>
<div class="markdown"><h5>makepath</h5>
</div>
create the given path if not present



```
makepath("../docs/docs")
------
Output
------

```

<div class="markdown"><h5>createfiles</h5>
</div>
> mkdocs_yml()–> Creates a mkdocs.yml file


at the document root and fills it with initial content.



```
mkdocs_yml("../docs")
------
Output
------

```

<div class="markdown"><h5>newsitegen</h5>
</div>
```
readdir("../")
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\".git\"", MIME type text/plain)), (2, ("\".github\"", MIME type text/plain)), (3, ("\"Manifest.toml\"", MIME type text/plain)), (4, ("\"Project.toml\"", MIME type text/plain)), (5, ("\"README.md\"", MIME type text/plain)), (6, ("\"bkp\"", MIME type text/plain)), (7, ("\"docs\"", MIME type text/plain)), (8, ("\"nbs\"", MIME type text/plain)), (9, ("\"settings.ini\"", MIME type text/plain)), (10, ("\"src\"", MIME type text/plain)), (11, ("\"test\"", MIME type text/plain)), (12, ("\"testpath\"", MIME type text/plain))], :Array, "", "f7129424df65703b"]
```

> newsitegen()–> Create required directory structure for hosting documents and the initial files(index.md and mkdocs.yml) if not already there.




