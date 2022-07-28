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

# ╔═╡ e3cd4e1f-c7ac-45fd-af9c-1327c0f7a426
#hide
using PlutoUI

# ╔═╡ 2c396254-932f-4431-8f94-08dd2766aa8e
#hide
include("../src/Export.jl")

# ╔═╡ 17a13720-29ba-11ec-0ba4-83c9ee9ac582
#export
include("../src/Documenter.jl")

# ╔═╡ 2ac37248-81d0-4c8b-99c7-4dd9f400a955
#hide
TableOfContents()

# ╔═╡ 1f7d1cb4-7fb9-4f40-9350-70ef40bca38f
md"## build"

# ╔═╡ 1c5d5f39-0349-454b-aa22-5feda1287b9d
#export
"""
> build(nbsdir)--> extracts markdown items and builds documentation from the notebooks in the given directory. Also, creates creates a readme file with content in the project root.
"""
function build(nbsdir)
    Documenter.export2md(nbsdir)
	Documenter.export2readme()
end

# ╔═╡ e2e5d93e-d721-4e71-8e3a-cee7c323ff50
Documenter.showdoc(build)

# ╔═╡ dabe1e64-f939-4867-9893-ab94fb5aea65
md"## userprompts"

# ╔═╡ c85c9b8f-42fb-40ef-9618-f40ae2210f8a
#export
#TODO: create readme file with pre-populated guidelines about what a good readmefile shud be.
#TODO: create a contibuting.md file with pre-populated guidelines about what a good contribt file shud be.
#TODO: create a license file with link to diff. licensing types.
function userprompts()
	print("What do you want to name the project ?")
	projname = readline()
	print("Do you want to create a Readme file or do you already have one ? type y for yes, n for No")
	isreadme = readline()
	print("Do you want to create a CONTRIBUTING.md file or do you already have one ? type y for yes, n for No")
	iscontribfile = readline()
	print("Do you want to create a LICENSE file or do you already have one ? type y for yes, n for No")
	islicensefile = readline()

	return Dict("projname" => projname, "isreadme" => isreadme,
	            "iscontribfile" => iscontribfile, "islicensefile" => islicensefile)
end

# ╔═╡ e3185d2a-1763-482e-9c5b-b6f9e1aafd84
md"## scaffold"

# ╔═╡ 68e3ea9b-a6a9-4ba6-ac0d-e5c8d4644eae
#export
function scaffold()
	usrprompts = userprompts()
end

# ╔═╡ c96a7fe1-ccba-4499-aa15-95ced972492b
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ Cell order:
# ╠═674905ed-75a1-457c-a866-279cdb76d243
# ╠═e3cd4e1f-c7ac-45fd-af9c-1327c0f7a426
# ╠═2ac37248-81d0-4c8b-99c7-4dd9f400a955
# ╠═2c396254-932f-4431-8f94-08dd2766aa8e
# ╠═17a13720-29ba-11ec-0ba4-83c9ee9ac582
# ╠═1f7d1cb4-7fb9-4f40-9350-70ef40bca38f
# ╠═1c5d5f39-0349-454b-aa22-5feda1287b9d
# ╠═e2e5d93e-d721-4e71-8e3a-cee7c323ff50
# ╠═dabe1e64-f939-4867-9893-ab94fb5aea65
# ╠═c85c9b8f-42fb-40ef-9618-f40ae2210f8a
# ╠═e3185d2a-1763-482e-9c5b-b6f9e1aafd84
# ╠═68e3ea9b-a6a9-4ba6-ac0d-e5c8d4644eae
# ╠═c96a7fe1-ccba-4499-aa15-95ced972492b
