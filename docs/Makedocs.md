<h1>Makedocs</h1>
<div class="markdown"><p>This module takes care of the creation of the support system document generation such as directory creation,index.yml and mkdocs.yml creation.</p>
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

<div class="markdown"><h5>mkdocs_yml</h5>
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
> newsitegen()–> Create required directory structure for hosting documents and the initial files(index.md and mkdocs.yml) if not already there.




