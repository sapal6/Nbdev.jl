<h1>Makedocs</h1>
```
using PlutoTest
------
Output
------

```

<div class="markdown"><p>This module takes care of the creation of the support system document generation such as directory creation, index.yml and mkdocs.yml creation.</p>
<p>Additionally it calls mkdocs commands to build the site</p>
</div>
## makepath

create the given path if not present



```
begin
	path = joinpath("..", "test", "dir")
	makepath(joinpath("..", "test", path))
end
------
Output
------
"..\\test\\..\\test\\dir"
```

```
#noop
@test isdir(path) == true
------
Output
------
 
```

```
#cleanup
rm(path)
------
Output
------

```

## mkdocsyml

> mkdocsyml()–> Creates a mkdocs.yml file at the document root and fills it with initial content.




```
#mkdocs_yml("../docs")
------
Output
------

```

```
begin
makepath(path)
mkdocsyml(path)
end
------
Output
------
"..\\test\\dir\\mkdocs.yml"
```

```
#noop
@test isfile(joinpath(path, "mkdocs.yml")) == true
------
Output
------
 
```

```
#cleanup
rm(joinpath(path,"mkdocs.yml"))
------
Output
------

```

```
#cleanup
rm(path)
------
Output
------

```

## newsitegen

> newsitegen()–> Create required directory structure for hosting documents and the initial files(index.md and mkdocs.yml) if not already there.




