### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ d307b722-47fa-4288-8291-a2d17fe276f9
#hide
using PlutoUI

# ╔═╡ c1c575f0-f8b3-11eb-3679-27a9b018100f
md"""## Nbdev
This project is an attempt to port fastai [Nbdev](https://github.com/fastai/nbdev) to Julia. Nbdev(both the oriignal version and the Julia version) are based on the idea of using Notebooks for literate programming. 

On a very high level the base idea is this 👇

$(LocalResource("../docs/images/nbdev.png"))

While both projects try to achieve the same base goal i.e. generating source code and documentation from Notebooks, the Julia version aims to start from Pluto notebook while the python version starts from a Jupyter notebook. 

On the documentation side, I am using Mkdocs as the document generator while the original version uses Jekyll as the static site generator of choice."""

# ╔═╡ Cell order:
# ╠═d307b722-47fa-4288-8291-a2d17fe276f9
# ╠═c1c575f0-f8b3-11eb-3679-27a9b018100f
