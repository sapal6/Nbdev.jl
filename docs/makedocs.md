<h1>Makedocs</h1>
<div class="markdown"><p>This module takes care of the creation of the support system document generation such as directory creation, index.yml and mkdocs.yml creation.</p>
<p>Additionally it calls mkdocs commands to build the site</p>
</div>
<div class="markdown"><h2>makepath</h2>
</div>
create the given path if not present



```
makepath("../docs/docs")
------
Output
------

```

<div class="markdown"><h2>mkdocs_yml</h2>
</div>
> mkdocs_yml()–> Creates a mkdocs.yml file


at the document root and fills it with initial content.



```
#mkdocs_yml("../docs")
------
Output
------

```

<div class="markdown"><h2>newsitegen</h2>
</div>
> newsitegen()–> Create required directory structure for hosting documents and the initial files(index.md and mkdocs.yml) if not already there.




