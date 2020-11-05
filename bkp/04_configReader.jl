### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ 2cc2e960-0ba6-11eb-3a7c-7135305751a3
#export
using ConfParser

# ╔═╡ 55da5222-0ba6-11eb-0643-932f49be358f
#hide
include("../src/01_core.jl")

# ╔═╡ bb6686a0-0ba5-11eb-0b57-c393077a2c77
md"""Shamelessly 🤪 copying the code from ConfParser [Readme]("https://github.com/JuliaIO/ConfParser.jl")
"""

# ╔═╡ e70cd7a0-0ba5-11eb-2be1-f1d40393ff0f
md"`func read_conf(confpath::String)`

	>read config file

The config file is where all the project and author details are stored. This function reads those data"

# ╔═╡ 09f2b5f0-0ba6-11eb-2561-cb7d0adb6ced
#export
#TODO: This probably should go to a helper file
function read_conf(confpath::String="../settings.ini")
	conf = ConfParse(confpath)
	parse_conf!(conf)

    # get and store config parameters
    lib_name = retrieve(conf, "lib_name")
    user = retrieve(conf, "user")
    description = retrieve(conf, "description")
    keywords = retrieve(conf, "keywords")
	author = retrieve(conf, "author")
	author_email = retrieve(conf, "author_email")
	copyright = retrieve(conf, "copyright")
	
	Dict("lib_name"=>lib_name,
		 "user" => user,
		 "description" => description,
		 "keywords" => keywords,
		 "author" => author,
		 "author_email" => author_email,
		 "copyright" => copyright)
end

# ╔═╡ 17098a70-0ba6-11eb-0170-350e3de26ee0
exampl=read_conf("../settings.ini")

# ╔═╡ 1ffcccf0-0ba6-11eb-00ab-0dea79d8a2d7
exampl["author"]

# ╔═╡ 670946f2-0ba6-11eb-1547-6f00621880cd
exportNbs()

# ╔═╡ Cell order:
# ╠═55da5222-0ba6-11eb-0643-932f49be358f
# ╟─bb6686a0-0ba5-11eb-0b57-c393077a2c77
# ╟─e70cd7a0-0ba5-11eb-2be1-f1d40393ff0f
# ╠═2cc2e960-0ba6-11eb-3a7c-7135305751a3
# ╠═09f2b5f0-0ba6-11eb-2561-cb7d0adb6ced
# ╠═17098a70-0ba6-11eb-0170-350e3de26ee0
# ╠═1ffcccf0-0ba6-11eb-00ab-0dea79d8a2d7
# ╠═670946f2-0ba6-11eb-1547-6f00621880cd
