### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 674905ed-75a1-457c-a866-279cdb76d243
#hide
begin
#for sharing environments between notebooks
import Pkg
Pkg.activate(Base.current_project())
end

# ╔═╡ 2c396254-932f-4431-8f94-08dd2766aa8e
#hide
include("../src/Export.jl")

# ╔═╡ 17a13720-29ba-11ec-0ba4-83c9ee9ac582
#export
include("../src/Documenter.jl")

# ╔═╡ 1c5d5f39-0349-454b-aa22-5feda1287b9d
#export
function build(nbsdir)
		Documenter.export2md(nbsdir)
		Documenter.export2readme()
end

# ╔═╡ c96a7fe1-ccba-4499-aa15-95ced972492b
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ Cell order:
# ╠═674905ed-75a1-457c-a866-279cdb76d243
# ╠═2c396254-932f-4431-8f94-08dd2766aa8e
# ╠═17a13720-29ba-11ec-0ba4-83c9ee9ac582
# ╠═1c5d5f39-0349-454b-aa22-5feda1287b9d
# ╠═c96a7fe1-ccba-4499-aa15-95ced972492b
