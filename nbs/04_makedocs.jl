### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 2d0d4838-eb58-4f2a-9864-40f4336f43f1
#hide
import Pkg

# ╔═╡ e7a181c5-e00e-44cb-8c42-c27983deae25
#hide
Pkg.activate(Base.current_project())

# ╔═╡ 1d0f6811-67cc-4ef1-b2dd-2f2a1e809061
using PlutoTest

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
Documenter.showdoc(makepath)

# ╔═╡ 23f638ee-4f7d-4480-8c3e-dbd29f5dd39b
#hide
#makepath("../test/docs")

# ╔═╡ 6c17a385-11ba-4989-bedb-d9cb1b94b123
begin
	path = joinpath("..", "test", "dir")
	makepath(joinpath("..", "test", path))
end

# ╔═╡ f7950f63-f57b-427a-a3d7-8d280a21b22a
#noop
@test isdir(path) == true

# ╔═╡ bc3d912d-1d56-4e86-83d7-5578feb21e92
#cleanup
rm(path)

# ╔═╡ fe6028bc-58b8-45d1-bf7b-8f5e31e8d452
md"## mkdocsyml"

# ╔═╡ ad99a75a-2918-4e27-b679-3ab3611cc3fc
#export
"""
> mkdocsyml()--> Creates a mkdocs.yml file
> at the document root and fills it with initial
> content.
"""
function mkdocsyml(path:: AbstractString)
	mkdocyml = joinpath(path, "mkdocs.yml")
	if !isfile(mkdocyml)
	    touch(mkdocyml)
	else
		@warn "File not created because it was already present"
    end
	
end

# ╔═╡ 18af50bd-bc5f-4e38-ab97-2a8cef56805a
Documenter.showdoc(mkdocsyml)

# ╔═╡ 4b3477a9-cf4a-4ea6-8eac-359cb34d97be
#mkdocs_yml("../docs")

# ╔═╡ df25274d-b3b5-41d4-ae31-8cecc1d8fdea
begin
makepath(path)
mkdocsyml(path)
end

# ╔═╡ 79c67ee4-e136-47ab-ba61-a0fefd402640
#noop
@test isfile(joinpath(path, "mkdocs.yml")) == true

# ╔═╡ 0688f354-b3a4-4c45-a709-17a73861ee44
#cleanup
rm(joinpath(path,"mkdocs.yml"))

# ╔═╡ e13bfb2b-7630-495c-a049-9c7283cbd191
#cleanup
rm(path)

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
Documenter.showdoc(newsitegen)

# ╔═╡ 1ed0902f-34ce-4b62-b484-fdf70124394a
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ Cell order:
# ╠═2d0d4838-eb58-4f2a-9864-40f4336f43f1
# ╠═e7a181c5-e00e-44cb-8c42-c27983deae25
# ╠═64f0c27d-9276-4e9f-b09c-414dd93ffe83
# ╠═6f1cd19f-b529-41d7-a9d6-aca3cb2888be
# ╠═1d0f6811-67cc-4ef1-b2dd-2f2a1e809061
# ╠═3d2e0115-5643-488a-8932-006912864c5b
# ╠═0c7570c3-8871-494f-91a0-fc04376344c3
# ╠═ab5e0c09-223c-46c3-992c-928d42b0cb3b
# ╠═0fc70e35-557d-4bc1-a0bf-b03b68987d81
# ╠═23f638ee-4f7d-4480-8c3e-dbd29f5dd39b
# ╠═6c17a385-11ba-4989-bedb-d9cb1b94b123
# ╠═f7950f63-f57b-427a-a3d7-8d280a21b22a
# ╠═bc3d912d-1d56-4e86-83d7-5578feb21e92
# ╠═fe6028bc-58b8-45d1-bf7b-8f5e31e8d452
# ╠═ad99a75a-2918-4e27-b679-3ab3611cc3fc
# ╠═18af50bd-bc5f-4e38-ab97-2a8cef56805a
# ╠═4b3477a9-cf4a-4ea6-8eac-359cb34d97be
# ╠═df25274d-b3b5-41d4-ae31-8cecc1d8fdea
# ╠═79c67ee4-e136-47ab-ba61-a0fefd402640
# ╠═0688f354-b3a4-4c45-a709-17a73861ee44
# ╠═e13bfb2b-7630-495c-a049-9c7283cbd191
# ╠═eeb046c0-bdcc-11eb-31a1-838f33f977e3
# ╠═cc200174-9530-438f-8004-3883c372f674
# ╠═4e27289a-5e5c-4a04-820d-e3fb7cc78afb
# ╠═7f1e88c8-6802-4a1c-be12-115eba510fac
# ╠═c5160350-960f-4f42-a6bd-a0c2d9b03b7f
# ╠═1ed0902f-34ce-4b62-b484-fdf70124394a
