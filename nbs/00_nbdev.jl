### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 6be32f5e-05ce-4be3-b7af-64821076fda1
#hide
import Pkg

# ╔═╡ 0a803a48-8ad1-4d3c-9272-c0d1270d8e92
#hide
Pkg.activate(Base.current_project())

# ╔═╡ 00758500-175a-11ec-173c-670141a85b02
#export
begin
include(normpath(joinpath(@__FILE__,"..","..", "src/Export.jl")))
include(normpath(joinpath(@__FILE__,"..","..", "src/Documenter.jl")))
include(normpath(joinpath(@__FILE__,"..","..", "src/CodeRunner.jl")))
include(normpath(joinpath(@__FILE__,"..","..", "src/Make.jl")))
end

# ╔═╡ 1ab8fabc-1b46-4cc3-9b58-03ac6b0fc9f9
#export
begin
notebook2script = Export.notebook2script
showdoc = Documenter.showdoc
build = Make.build
new = Make.new
export notebook2script, showdoc, build, new
end

# ╔═╡ 9724fdac-8ffd-483c-9d7e-a4cdc8d0dd72
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ Cell order:
# ╠═6be32f5e-05ce-4be3-b7af-64821076fda1
# ╠═0a803a48-8ad1-4d3c-9272-c0d1270d8e92
# ╠═00758500-175a-11ec-173c-670141a85b02
# ╠═1ab8fabc-1b46-4cc3-9b58-03ac6b0fc9f9
# ╠═9724fdac-8ffd-483c-9d7e-a4cdc8d0dd72
