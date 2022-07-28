### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ a96058a5-e563-4fa1-b014-feec6c4380ee
#hide
begin
#for sharing environments between notebooks
import Pkg
Pkg.activate(Base.current_project())
end

# ╔═╡ 68ed9c30-c6dc-11ec-191c-832624c25a17
#export
using TOML

# ╔═╡ 2c72c7dc-4bdb-4809-b33c-a34ae555120e
#hide
using PlutoUI

# ╔═╡ c02ea829-0a9b-4185-9784-daa42b290da2
#hide
using PlutoTest

# ╔═╡ b795e345-d5d4-4966-a77c-168e21156f46
#hide
include("../src/Export.jl")

# ╔═╡ 3b89e5ec-d099-4fac-8fae-2b5f7695350c
#hide
include("../src/Documenter.jl")

# ╔═╡ cd7a8ece-670e-4db4-a689-bf1fe9a51c42
#hide
TableOfContents()

# ╔═╡ 7d2ff452-0cec-4307-950c-228adf3ad8d5
#hide
a = TOML.parsefile(joinpath("..", "Project.toml"))

# ╔═╡ 15629b65-7f23-47cd-967d-4b65a4cbc250
#hide
a["settings"]["github_url"]

# ╔═╡ 14591bed-affc-4fff-b37c-f8869028e803
md"## getsettings"

# ╔═╡ 1df8ad2c-612c-4c6e-a86f-ef03e9574c75
#export
begin
"""
> getsetting(f:: AbstractString, key:: AbstractString) --> get the items related to a key from the Project.toml file
"""
function getsetting(f:: AbstractString, key:: AbstractString)
	a = TOML.parsefile(f)
	return a[key]
end

"""
> getsettings(f:: AbstractString, keys:: AbstractString) --> get the items related to the keys from the Project.toml file
"""
function getsettings(f:: AbstractString, keys)
	res = TOML.parsefile(f)
	for key in keys
		#"$res"
		res = res[key]
	end
	return res
end
end

# ╔═╡ 8560ef75-c757-40d5-9f07-b12ae72aba98
Documenter.showdoc(getsettings)

# ╔═╡ 871faecd-7481-4398-8d1c-2db69466eb6d
#noop
begin
f = joinpath("..", "Project.toml")
path = "https://github.com/sapal6/Nbdev.jl"
res = Dict("github_url" => "https://github.com/sapal6/Nbdev.jl")
end

# ╔═╡ 6e0d170e-126e-4999-b6ce-8f063871ffe8
#noop
@test getsetting(f, "settings") == res

# ╔═╡ c6ad861d-c0d6-4edf-88e2-267be1184bce
#noop
@test getsettings(f, ["settings", "github_url"]) == res["github_url"]

# ╔═╡ 7386505d-240c-46cf-9655-8ac30f41f148
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ Cell order:
# ╠═a96058a5-e563-4fa1-b014-feec6c4380ee
# ╠═68ed9c30-c6dc-11ec-191c-832624c25a17
# ╠═2c72c7dc-4bdb-4809-b33c-a34ae555120e
# ╠═c02ea829-0a9b-4185-9784-daa42b290da2
# ╠═cd7a8ece-670e-4db4-a689-bf1fe9a51c42
# ╠═b795e345-d5d4-4966-a77c-168e21156f46
# ╠═3b89e5ec-d099-4fac-8fae-2b5f7695350c
# ╠═7d2ff452-0cec-4307-950c-228adf3ad8d5
# ╠═15629b65-7f23-47cd-967d-4b65a4cbc250
# ╠═14591bed-affc-4fff-b37c-f8869028e803
# ╠═1df8ad2c-612c-4c6e-a86f-ef03e9574c75
# ╠═8560ef75-c757-40d5-9f07-b12ae72aba98
# ╠═871faecd-7481-4398-8d1c-2db69466eb6d
# ╠═6e0d170e-126e-4999-b6ce-8f063871ffe8
# ╠═c6ad861d-c0d6-4edf-88e2-267be1184bce
# ╠═7386505d-240c-46cf-9655-8ac30f41f148
