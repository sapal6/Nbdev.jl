### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 6be32f5e-05ce-4be3-b7af-64821076fda1
#hide
import Pkg

# ╔═╡ 0a803a48-8ad1-4d3c-9272-c0d1270d8e92
#hide
Pkg.activate(".")

# ╔═╡ 00758500-175a-11ec-173c-670141a85b02
#export
begin
include("../src/Export.jl")
include("../src/Documenter.jl")
include("../src/Makedocs.jl")
include("../src/CodeRunner.jl")
end

# ╔═╡ 9724fdac-8ffd-483c-9d7e-a4cdc8d0dd72
#hide
Export.notebook2script()

# ╔═╡ Cell order:
# ╠═6be32f5e-05ce-4be3-b7af-64821076fda1
# ╠═0a803a48-8ad1-4d3c-9272-c0d1270d8e92
# ╠═00758500-175a-11ec-173c-670141a85b02
# ╠═9724fdac-8ffd-483c-9d7e-a4cdc8d0dd72
