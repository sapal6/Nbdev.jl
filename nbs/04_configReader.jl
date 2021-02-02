### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ 2cc2e960-0ba6-11eb-3a7c-7135305751a3
#export
using ConfParser

# ╔═╡ 55da5222-0ba6-11eb-0643-932f49be358f
#hide
include("../src/Export.jl")

# ╔═╡ 5a40fb80-6325-11eb-0e68-ed95f1b25a3b
#hide
include("../src/Documenter.jl")

# ╔═╡ bb6686a0-0ba5-11eb-0b57-c393077a2c77
md"The config fileis where all the settings are to be stored. Nbdev will use this to setup different things in your project. The `read_conf` helps you to parse the settings.ini file"

# ╔═╡ e9b27010-6324-11eb-2986-713d2cfb9089
md"## read_conf"

# ╔═╡ 09f2b5f0-0ba6-11eb-2561-cb7d0adb6ced
#export
"""
> read_conf(confpath::String="../settings.ini")--> Takes in the config filepath and parses the different configurations(key/value pair. Returns a dictionary
"""
function read_conf(confpath::String="../settings.ini")
	conf = ConfParse(confpath)
	parse_conf!(conf)

    # get and store config parameters
    lib_name = retrieve(conf, "lib_name")
	lib_path = retrieve(conf, "lib_path")
    user = retrieve(conf, "user")
    description = retrieve(conf, "description")
    keywords = retrieve(conf, "keywords")
	author = retrieve(conf, "author")
	author_email = retrieve(conf, "author_email")
	copyright = retrieve(conf, "copyright")
	
	Dict("lib_name"=>lib_name,
		  "lib_path"=>lib_path,
		 "user" => user,
		 "description" => description,
		 "keywords" => keywords,
		 "author" => author,
		 "author_email" => author_email,
		 "copyright" => copyright)
end

# ╔═╡ 976c77a0-6325-11eb-1655-f9286c00c581
Documenter.showDoc(read_conf)

# ╔═╡ a508f6de-6325-11eb-0471-893079916ba2
md"## Example"

# ╔═╡ 17098a70-0ba6-11eb-0170-350e3de26ee0
exampl=read_conf("../settings.ini")

# ╔═╡ 1ffcccf0-0ba6-11eb-00ab-0dea79d8a2d7
exampl["author"]

# ╔═╡ 670946f2-0ba6-11eb-1547-6f00621880cd
Export.notebook2script()

# ╔═╡ Cell order:
# ╠═55da5222-0ba6-11eb-0643-932f49be358f
# ╠═5a40fb80-6325-11eb-0e68-ed95f1b25a3b
# ╠═bb6686a0-0ba5-11eb-0b57-c393077a2c77
# ╠═2cc2e960-0ba6-11eb-3a7c-7135305751a3
# ╠═e9b27010-6324-11eb-2986-713d2cfb9089
# ╠═09f2b5f0-0ba6-11eb-2561-cb7d0adb6ced
# ╠═976c77a0-6325-11eb-1655-f9286c00c581
# ╠═a508f6de-6325-11eb-0471-893079916ba2
# ╠═17098a70-0ba6-11eb-0170-350e3de26ee0
# ╠═1ffcccf0-0ba6-11eb-00ab-0dea79d8a2d7
# ╠═670946f2-0ba6-11eb-1547-6f00621880cd
