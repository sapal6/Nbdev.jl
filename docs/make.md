<h1>Make</h1>
```
using PlutoTest
------
Output
------

```

## build

> build(nbsdir)–> extracts markdown items and builds documentation from the notebooks in the given directory. Also, creates creates a readme file with content in the project root.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Make.jl&q=build)


## new

> new(projname)-> Scaffolds a new project sub-directories and configuration files.

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Make.jl&q=new)


<div class="markdown"><p>The <code>new&#40;&#41;</code> function can be used when you want to create a project in a cloned repo. All the files and subdirectories would be blank.</p>
</div>
```
testdir = "../test"
------
Output
------
"../test"
```

```
new(testdir)
------
Output
------

```

```
#noop
@test isdir(joinpath(testdir, "nbs")) == true
------
Output
------
 
```

```
#noop
@test isdir(joinpath(testdir, "docs")) == true
------
Output
------
 
```

```
#noop
@test isdir(joinpath(testdir, "src")) == true
------
Output
------
 
```

```
#noop
@test isdir(joinpath(testdir, "docs", "images")) == true
------
Output
------
 
```

```
#noop
@test isdir(joinpath(testdir, "docs", "assets")) == true
------
Output
------
 
```

```
#noop
@test isfile(joinpath(testdir, "Project.toml")) == true
------
Output
------
 
```

```
#noop
@test isfile(joinpath(testdir, "Manifest.toml")) == true
------
Output
------
 
```

```
#noop
@test isfile(joinpath(testdir, "mkdocs.yml")) == true
------
Output
------
 
```

```
#noop
@test isfile(joinpath(testdir, "nbs", "index.jl")) == true
------
Output
------
 
```

```
#noop
begin
	dirs = ["$testdir/docs", "$testdir/nbs", "$testdir/src"]
	files = ["$testdir/Manifest.toml", "$testdir/Project.toml", "$testdir/mkdocs.yml"]
	map(dir -> rm(dir, recursive = true), dirs)
	map(rm, files)
end
------
Output
------
 
```

