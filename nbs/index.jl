### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ d307b722-47fa-4288-8291-a2d17fe276f9
#hide
using PlutoUI

# ╔═╡ c1c575f0-f8b3-11eb-3679-27a9b018100f
md"""

**Alpha Release**

## Nbdev
This project is an attempt to port fastai [Nbdev](https://github.com/fastai/nbdev) to Julia. Nbdev(both the oriignal version and the Julia version) are based on the idea of using Notebooks for literate programming. 

On a very high level the base idea is this 👇

$(LocalResource("../docs/images/nbdev.png"))

While both projects try to achieve the same base goal i.e. generating source code and documentation from Notebooks, the Julia version aims to start from Pluto notebook while the python version starts from a Jupyter notebook. 

On the documentation side, I am using Mkdocs as the document generator while the original version uses Jekyll as the static site generator of choice."""

# ╔═╡ e9a9f361-eaf1-4546-a83e-516eb189e3e5
md"## Getting-started"

# ╔═╡ c36b7a25-4b76-4c91-a77e-a677513158d0
md"Follow the [tutorial](https://sapal6.github.io/Nbdev.jl/tutorial/) to start experimenting with Nbdev."

# ╔═╡ bb78bb31-8a72-4e9e-a1c5-31457fd4326c
md"## First among the version

This is an alpha release of Nbdev so expect some breaks in plumbing here and there. Some features are still under development and are not included in this version.

* Feel free to log any issues, bugs (which I expect to come) [here](https://github.com/sapal6/Nbdev.jl/issues)

* Anything that you feel like is missing and want to discuss the same or havean idea then start a new discussion [here](https://github.com/sapal6/Nbdev.jl/discussions)"


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.11"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[HypertextLiteral]]
git-tree-sha1 = "72053798e1be56026b81d4e2682dbe58922e5ec9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.0"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "9d8c00ef7a8d110787ff6f170579846f776133a9"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.4"

[[PlutoUI]]
deps = ["Base64", "Dates", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "0c3e067931708fa5641247affc1a1aceb53fff06"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.11"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═d307b722-47fa-4288-8291-a2d17fe276f9
# ╠═c1c575f0-f8b3-11eb-3679-27a9b018100f
# ╠═e9a9f361-eaf1-4546-a83e-516eb189e3e5
# ╠═c36b7a25-4b76-4c91-a77e-a677513158d0
# ╠═bb78bb31-8a72-4e9e-a1c5-31457fd4326c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
