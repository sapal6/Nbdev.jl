<h1>Makedocs</h1>
<div class="markdown"><p>This module takes care of the creation of the support system document generation such as directory creation, index.yml and mkdocs.yml creation.</p>
<p>Additionally it calls mkdocs commands to build the site</p>
</div>
## makepath

create the given path if not present



## mkdocsyml

> mkdocsyml()–> Creates a mkdocs.yml file at the document root and fills it with initial content.




```
#mkdocs_yml("../docs")
------
Output
------

```

## newsitegen

> newsitegen()–> Create required directory structure for hosting documents and the initial files(index.md and mkdocs.yml) if not already there.




