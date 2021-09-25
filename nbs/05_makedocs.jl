### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 2d0d4838-eb58-4f2a-9864-40f4336f43f1
#hide
import Pkg

# ╔═╡ e7a181c5-e00e-44cb-8c42-c27983deae25
#hide
Pkg.activate(".")

# ╔═╡ 64f0c27d-9276-4e9f-b09c-414dd93ffe83
#hide
include("../src/Export.jl")

# ╔═╡ 6f1cd19f-b529-41d7-a9d6-aca3cb2888be
#hide
include("../src/Documenter.jl")

# ╔═╡ 3d2e0115-5643-488a-8932-006912864c5b
md"This module takes care of the creation of the support system document generation such as directory creation, index.yml and mkdocs.yml creation.

Additionally it calls mkdocs commands to build the site"

# ╔═╡ 0c7570c3-8871-494f-91a0-fc04376344c3
md"## makepath"

# ╔═╡ ab5e0c09-223c-46c3-992c-928d42b0cb3b
#export
"""create the given path if not present"""
function makepath(path:: AbstractString)
	if !isdir(path)
		mkdir(path)
	else
		@warn "Path not created becasue it was already present."
	end
end

# ╔═╡ 0fc70e35-557d-4bc1-a0bf-b03b68987d81
Documenter.showDoc(makepath)

# ╔═╡ 23f638ee-4f7d-4480-8c3e-dbd29f5dd39b
makepath("../docs/docs")

# ╔═╡ fe6028bc-58b8-45d1-bf7b-8f5e31e8d452
md"## mkdocs_yml"

# ╔═╡ ad99a75a-2918-4e27-b679-3ab3611cc3fc
#export
"""
> mkdocs_yml()--> Creates a mkdocs.yml file
> at the document root and fills it with initial
> content.
"""
function mkdocs_yml(path:: AbstractString)
	mkdoc_yml = joinpath(path, "mkdocs.yml")
	if !isfile(mkdoc_yml)
	    touch(mkdoc_yml)
	else
		@warn "File not created because it was already present"
    end
	
end

# ╔═╡ 18af50bd-bc5f-4e38-ab97-2a8cef56805a
Documenter.showDoc(mkdocs_yml)

# ╔═╡ 4b3477a9-cf4a-4ea6-8eac-359cb34d97be
#mkdocs_yml("../docs")

# ╔═╡ eeb046c0-bdcc-11eb-31a1-838f33f977e3
md"## newsitegen"

# ╔═╡ cc200174-9530-438f-8004-3883c372f674
#hide
readdir("../")

# ╔═╡ 4e27289a-5e5c-4a04-820d-e3fb7cc78afb
#export
begin
"""
> newsitegen()--> Create required directory structure for hosting documents and the initial files(index.md and mkdocs.yml) if not already there.
"""
function newsitegen()
	path = joinpath(".","docs")
    makepath(path)
end
end

# ╔═╡ 7f1e88c8-6802-4a1c-be12-115eba510fac
#hide
#newsitegen()

# ╔═╡ c5160350-960f-4f42-a6bd-a0c2d9b03b7f
Documenter.showDoc(newsitegen)

# ╔═╡ 1ed0902f-34ce-4b62-b484-fdf70124394a
#hide
Export.notebook2script()

# ╔═╡ Cell order:
# ╠═2d0d4838-eb58-4f2a-9864-40f4336f43f1
# ╠═e7a181c5-e00e-44cb-8c42-c27983deae25
# ╠═64f0c27d-9276-4e9f-b09c-414dd93ffe83
# ╠═6f1cd19f-b529-41d7-a9d6-aca3cb2888be
# ╠═3d2e0115-5643-488a-8932-006912864c5b
# ╠═0c7570c3-8871-494f-91a0-fc04376344c3
# ╠═ab5e0c09-223c-46c3-992c-928d42b0cb3b
# ╠═0fc70e35-557d-4bc1-a0bf-b03b68987d81
# ╠═23f638ee-4f7d-4480-8c3e-dbd29f5dd39b
# ╠═fe6028bc-58b8-45d1-bf7b-8f5e31e8d452
# ╠═ad99a75a-2918-4e27-b679-3ab3611cc3fc
# ╠═18af50bd-bc5f-4e38-ab97-2a8cef56805a
# ╠═4b3477a9-cf4a-4ea6-8eac-359cb34d97be
# ╠═eeb046c0-bdcc-11eb-31a1-838f33f977e3
# ╠═cc200174-9530-438f-8004-3883c372f674
# ╠═4e27289a-5e5c-4a04-820d-e3fb7cc78afb
# ╠═7f1e88c8-6802-4a1c-be12-115eba510fac
# ╠═c5160350-960f-4f42-a6bd-a0c2d9b03b7f
# ╠═1ed0902f-34ce-4b62-b484-fdf70124394a
