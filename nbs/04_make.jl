### A Pluto.jl notebook ###
# v0.18.4

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

# ╔═╡ 7a0b47e0-0231-4d3f-b7b8-f6dda83f120d
#export
using OrderedCollections

# ╔═╡ 7831e355-bd3b-4333-8200-b8938277af3e
using PlutoTest

# ╔═╡ 2c396254-932f-4431-8f94-08dd2766aa8e
#hide
include("../src/Export.jl")

# ╔═╡ 17a13720-29ba-11ec-0ba4-83c9ee9ac582
#export
include("../src/Documenter.jl")

# ╔═╡ 50c0f688-28c2-4064-abe3-718c029fa601
#export
include("../src/Common.jl")

# ╔═╡ 3e8524c9-1b00-4e30-bb47-524991f3d0f7
#export
import YAML

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

# ╔═╡ 7cdb54d2-bb7b-4bf7-821b-b4272781806d
#export
export build

# ╔═╡ e2e5d93e-d721-4e71-8e3a-cee7c323ff50
Documenter.showdoc(build)

# ╔═╡ d30b0dc5-8f18-4661-8ecf-147d21480a4d
#hide
data = YAML.load_file("../mkdocs.yml")

# ╔═╡ 9320c981-7d6d-4d26-a1ed-782ec23bda90
#export
mkdocs = OrderedDict("site-name" => "your site name", "nav" => [OrderedDict("Home" => "index.md")],
"theme" => OrderedDict("name" => "material", "palette" => OrderedDict("primary" => "white"), "font" => OrderedDict("text" => "Roboto"), "logo" => "assets/asset image filename", "favicon" => "asset/ asset name", "features" => "navigation.tabs", "markdown_extensions" => ["meta", "toc"], "plugins" => ["search", "tags"]), "extra" => OrderedDict("social" => [OrderedDict("icon" => "fontawsome/brans/twitter", "link" => "twitter link"), OrderedDict("icon" => "fotawsome/brands/linkedin", "link" => "linkedin link")]), "repo_url" => "url to your git repo", "repo_name" => "name of your git repo")

# ╔═╡ e3185d2a-1763-482e-9c5b-b6f9e1aafd84
md"## new"

# ╔═╡ 68e3ea9b-a6a9-4ba6-ac0d-e5c8d4644eae
#export
begin
"""
> new(projname)-> Scaffolds a new project sub-directories and configuration files.
"""
function new(path = ".")
	dirs = ["$path/docs", "$path/nbs", "$path/src", "$path/docs/images", "$path/docs/assets"]
	files = ["$path/Manifest.toml", "$path/Project.toml", "$path/mkdocs.yml", "$path/nbs/index.jl"]
	map(mkpath, dirs)
	map(touch, files)
	YAML.write_file(files[3], mkdocs)
end
end

# ╔═╡ 1bc03c17-198c-489e-9e85-9f5d7d503e6e
#export
export new

# ╔═╡ 579f18e2-1ada-4f4d-a726-f405763def7a
Documenter.showdoc(new)

# ╔═╡ 02c9cc7c-fd6b-4346-bd36-710d6bc6806d
md"The `new()` function can be used when you want to create a project in a cloned repo. All the files and subdirectories would be blank."

# ╔═╡ 3059e68a-87a3-420f-934c-e2f9bc7499a9
#hide
#new("test1")

# ╔═╡ ae286e66-f1cc-45e7-b271-2a9adf838a0d
testdir = "../test"

# ╔═╡ f481a9f0-d91b-49b6-9bce-48896d6af938
new(testdir)

# ╔═╡ 785a962e-dfb0-49c0-9679-a6ff0702b001
#noop
@test isdir(joinpath(testdir, "nbs")) == true

# ╔═╡ 1de9bc3d-0984-47f3-ad74-adb2290d3889
#noop
@test isdir(joinpath(testdir, "docs")) == true

# ╔═╡ 62705a1e-bbca-4bd1-815c-6f00ece58b73
#noop
@test isdir(joinpath(testdir, "src")) == true

# ╔═╡ fc17a65b-6223-4f7d-9f75-795781fa81d4
#noop
@test isdir(joinpath(testdir, "docs", "images")) == true

# ╔═╡ 5cb8289c-5ae3-4bba-8ac4-0765ee2464a3
#noop
@test isdir(joinpath(testdir, "docs", "assets")) == true

# ╔═╡ ccfbfefc-5bc3-45ba-a83d-e9ab2a807311
#noop
@test isfile(joinpath(testdir, "Project.toml")) == true

# ╔═╡ d503f5a9-54c9-488b-8ce2-4a81bc0a3cee
#noop
@test isfile(joinpath(testdir, "Manifest.toml")) == true

# ╔═╡ 7477e2a6-d2a2-4552-9b03-63daef9c1189
#noop
@test isfile(joinpath(testdir, "mkdocs.yml")) == true

# ╔═╡ f29215d9-b898-4540-bf71-6e0c4f192979
#noop
@test isfile(joinpath(testdir, "nbs", "index.jl")) == true

# ╔═╡ 89317c3d-5889-4887-893c-aed3bf37b55e
#noop
begin
	dirs = ["$testdir/docs", "$testdir/nbs", "$testdir/src"]
	files = ["$testdir/Manifest.toml", "$testdir/Project.toml", "$testdir/mkdocs.yml"]
	map(dir -> rm(dir, recursive = true), dirs)
	map(rm, files)
end

# ╔═╡ c96a7fe1-ccba-4499-aa15-95ced972492b
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ Cell order:
# ╠═674905ed-75a1-457c-a866-279cdb76d243
# ╠═e3cd4e1f-c7ac-45fd-af9c-1327c0f7a426
# ╠═3e8524c9-1b00-4e30-bb47-524991f3d0f7
# ╠═7a0b47e0-0231-4d3f-b7b8-f6dda83f120d
# ╠═7831e355-bd3b-4333-8200-b8938277af3e
# ╠═2ac37248-81d0-4c8b-99c7-4dd9f400a955
# ╠═2c396254-932f-4431-8f94-08dd2766aa8e
# ╠═17a13720-29ba-11ec-0ba4-83c9ee9ac582
# ╠═50c0f688-28c2-4064-abe3-718c029fa601
# ╠═1f7d1cb4-7fb9-4f40-9350-70ef40bca38f
# ╠═1c5d5f39-0349-454b-aa22-5feda1287b9d
# ╠═7cdb54d2-bb7b-4bf7-821b-b4272781806d
# ╠═e2e5d93e-d721-4e71-8e3a-cee7c323ff50
# ╠═d30b0dc5-8f18-4661-8ecf-147d21480a4d
# ╠═9320c981-7d6d-4d26-a1ed-782ec23bda90
# ╠═e3185d2a-1763-482e-9c5b-b6f9e1aafd84
# ╠═68e3ea9b-a6a9-4ba6-ac0d-e5c8d4644eae
# ╠═1bc03c17-198c-489e-9e85-9f5d7d503e6e
# ╠═579f18e2-1ada-4f4d-a726-f405763def7a
# ╠═02c9cc7c-fd6b-4346-bd36-710d6bc6806d
# ╠═3059e68a-87a3-420f-934c-e2f9bc7499a9
# ╠═ae286e66-f1cc-45e7-b271-2a9adf838a0d
# ╠═f481a9f0-d91b-49b6-9bce-48896d6af938
# ╠═785a962e-dfb0-49c0-9679-a6ff0702b001
# ╠═1de9bc3d-0984-47f3-ad74-adb2290d3889
# ╠═62705a1e-bbca-4bd1-815c-6f00ece58b73
# ╠═fc17a65b-6223-4f7d-9f75-795781fa81d4
# ╠═5cb8289c-5ae3-4bba-8ac4-0765ee2464a3
# ╠═ccfbfefc-5bc3-45ba-a83d-e9ab2a807311
# ╠═d503f5a9-54c9-488b-8ce2-4a81bc0a3cee
# ╠═7477e2a6-d2a2-4552-9b03-63daef9c1189
# ╠═f29215d9-b898-4540-bf71-6e0c4f192979
# ╠═89317c3d-5889-4887-893c-aed3bf37b55e
# ╠═c96a7fe1-ccba-4499-aa15-95ced972492b
