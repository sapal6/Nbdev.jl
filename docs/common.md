<h1>Common</h1>
## getsettings

> getsettings(f:: AbstractString, keys:: AbstractString) –> get the items related to the keys from the Project.toml file

 [source](https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Common.jl&q=getsettings)


```
#noop
begin
f = joinpath("..", "Project.toml")
path = "https://github.com/sapal6/Nbdev.jl"
res = Dict("github_url" => "https://github.com/sapal6/Nbdev.jl")
end
------
Output
------
 
```

```
#noop
@test getsetting(f, "settings") == res
------
Output
------
 
```

```
#noop
@test getsettings(f, ["settings", "github_url"]) == res["github_url"]
------
Output
------
 
```

