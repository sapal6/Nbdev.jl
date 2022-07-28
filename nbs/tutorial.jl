### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 5a14baba-4b8a-4917-b354-246775bb8c1d
#hide
using PlutoUI

# ╔═╡ 00f8bf47-47d2-4a99-86ba-d7cd0b7f268b
md""" ## First steps

Install Nbdev by with the following command --> `add Nbdev`

$(LocalResource("../docs/images/addnbdev.png"))

This will install Nbdev in your global environment.

Create a directory in your local system where you would want to start your work. For example, in your local system 

$(LocalResource("../docs/images/testfolder.png"))

`cd` into this directory now. This will be the place where you are going to place your project. Now open a command prompt from inside this directory and type `julia`, this will launch a Julia shell. Here type `]` to launch the "pkg" prompt and then you can type `activate .` in order to create a restricted environment where you can restrict further installations or else you can skip typing `activate .` and type `import Nbdev followed by Nbdev.new()`. This will create the "docs", "Nbdev", "nbs" and "src" directories in your project root. In addition to these directories the "Manifest.toml", mkdocs.yml" and "Project.toml" will also be created at the project root.

"""

# ╔═╡ fbb6eadc-80a1-4cd9-ad27-bebcdd6e5981
md"""
!!! note

*Right now nbdev is highly opinionated about the folder structure like presence of "nbs", "src" and "docs" directory.*"""

# ╔═╡ b0c1fe8f-e796-4835-95f8-17990c7421a7
md"## First notebook"

# ╔═╡ e0694cd4-7d07-494d-a010-f705d1cbeb2c
md"""Inside the project directory, open a terminal and start Pluto the usual way and create a notebook inside the "nbs" directory.

At this point you might have installed Nbdev in your global environment. If this is not the case then follow any of the below methods."""

# ╔═╡ 9258500a-0a33-41cd-b32a-e09e820f84ee
md"## Start building your project"

# ╔═╡ dedef829-e43c-41c9-8238-b9d631dccb35
md"There are some anchors which tell Nbdev about the portion of your notebook that should be exported as code or should be part of documentation or should not be touched."

# ╔═╡ 99d43364-5ac6-43bb-a70c-20a79a463fdf
md"### #export"

# ╔═╡ fb11c61e-2b26-4b2a-9a34-835163ac7f87
md"when you put the comment #export at the begining of a cell, it tells nbdev to export that cell as a code into the source file."

# ╔═╡ c9f87989-522c-4adc-9a50-af95e3fa9cfa
md"
```
#export
function somefunc(x)
	x+1
end
```"

# ╔═╡ 0d4fb029-bfc8-4208-a6f4-bd5ea981ff82
md"Nbdev will now put the above cell as part of the source file (with the same name as the current notebook) inside the src directory."

# ╔═╡ ac65836e-6f4f-4212-b7f4-a648de9c761b
md"### #hide"

# ╔═╡ 789ebdb8-0017-4662-9120-a780584f8368
md"Suppose that you have included soem cells as par of experment while developing your package but you want that the cell should neither be exported as a code nor that should be exported as part of documentation.

In such a case use the `#hide` anchor at the begining of the cell."

# ╔═╡ 809102dd-b91a-458f-b5c7-2a49c7536d3b
md"
```
#hide
myexperiment = 1+1
```"

# ╔═╡ f8391a08-edf6-499c-8e8d-8f731dad8fd4
md"such a cell won't be exported."

# ╔═╡ 4d12cf7f-54d7-4a06-9749-a97246e7564e
md"Any other cell which neither has the `#hide` nor the `#export` anchor, is exported as an example block. For such a block the cell is executed and the output is captured.

The output and the code of an example cell appears in the final document."

# ╔═╡ c40eeb9c-dbda-4dc0-9fc3-e91be447ac25
md"### #noop"

# ╔═╡ 929d68db-fac5-4507-8316-a0dcf71df403
md"Nbdev captures the output for cells which are not marked with `#export` by default. but there might be times when you have an example for which you just want to show the code and not the output. Such cases can be handled by the `#noop` anchor. Just start such cells with `#noop` and nbdev will not capture output for such cells."

# ╔═╡ fac3e16d-76ff-476e-a2c4-ff34f7c3f1cc
md"""
```
begin
#noop
"
some experiment
"
function myexperiment
    1+1
end
myexperiment
end
```"""

# ╔═╡ 9fcf1320-0ddf-471c-a584-092586122347
md"In the above case even though Pluto displays the docstring as an output, that output won't be displayed in your document.

As another example let's consider something like the code below"

# ╔═╡ a3ea3f66-a66c-41d1-8c3c-c1cd3a879871
md"
```
#noop 
add = 1+1
add
````
"

# ╔═╡ 77b75b82-c684-4377-882a-ff0a4283c7f5
md"The output for such code cell won't be captured in the documentation. Only the code will be displayed once you build the document."

# ╔═╡ a7714f66-3eff-481a-af7f-ae26c2b8e8e2
md"## Docstrings"

# ╔═╡ 926b30a2-1a86-4952-a991-d75b5ce6e545
md"Define a docstring for functions, structs etc. and use the special function `showDoc` to document that function or struct"

# ╔═╡ 5bd889ce-9522-462b-a843-508061926306
"""
> This is a function docstring
""" 
function somefunc()
	1+1
end

# ╔═╡ 8c9f1b35-8f88-44ba-8a37-57b92b42980b
md"`showdoc(somefunc)` would show the function like this 👇"

# ╔═╡ 52e3492a-c27d-476f-9010-7d009fd0eeaf
md"`showdoc(somefunc)`"

# ╔═╡ 306239c9-7fd6-442e-8b97-db674398b307
md"## Exporting code"

# ╔═╡ a8955cbd-2530-405f-b876-18bb35e0b008
md"""Once you are done with your notebook and you can run `notebook2script()`. This reads the current notebook in the "nbs" folder, scrubs out all the cells which are do not start with `#export` and creates a module file in the src folder.

The module file in the src folder will have the same name as the current file with the first letter in uppercase.

The exported code file automatically has all the code inside the module with the same name as the file.

For example, the exported source code file would have the following structure 👇

```
module Example

function somefunc(x)
    x+1
end

end
```"""

# ╔═╡ 84f7040c-0ca9-4d61-abfe-789fc446ebb2
md"""
Once you are happy with the code you can export the source code by calling 

`notebook2script(nbsdir, srcdir)`

Here "nbs_dir" is the directory where your notebooks are stored and the "src_dir" is the directory where you want your source code files to be exported. This is usually the `src` directory."""

# ╔═╡ 7b1fdf81-870a-4977-8a9d-c867ee2861ff
md"## Tests"

# ╔═╡ 6ace0489-21ae-488f-8ea5-d3087651394c
md"""Nbdev comes with support for [PlutoTests(in alpha)](https://github.com/JuliaPluto/PlutoTest.jl) out of the box.

What this means is that you can write reactive tests within the same notebook where you are writing your code. when you run that particular notebook, the affected tests are executed. So, you can write tests as you write your code.

In addition to reactivity you can also take advantage of other goodies in PlutoTests like "time travel" to see the different stages of your code (follow the link to PlutoTests for further details)."""

# ╔═╡ 50ef31b0-b5f2-4a8e-b123-1681645a031f
md"!!! note
Currently PlutoTests is in **alpha** so use it with caution. However, you can even use the native test suite in Julia to write your tests but won't get features like time travel while using the native test suite.

Automatic execution of tests using github actions or Travis CI is planned for future versions of PlutoTest"

# ╔═╡ bc79b045-8969-4014-b7ac-01282d969c8c
md"## Building documentation"

# ╔═╡ eb26aca4-4b12-435d-941f-edb18bda0c3c
md"""
Do not forget to edit the "index" notebook available in the "nbs" folder. This notebook would be used as your homepage and the contents of this notebook are also used in the README file."""

# ╔═╡ 547f7e70-71bf-44a6-ba62-0e35edf688fc
md"!!! note

*You will get the index notebook in the nbs directory when you create a new project using the nbdev template.*
"

# ╔═╡ b1e0024c-aa32-46a3-baea-534b1187fb7a
md"""To build documentation, goto the project root and launch the Julia prompt and then import Nbdev with `import Nbdev` and then call the following function `Nbdev.build(<your notebook directory)`. Your code at the Julia prompt should look like this 

```
import Nbdev
Nbdev.build("nbs")
```

This will run all your notebooks in the notebook directory (/nbs usually) and pick up the cells which are not marked as `#export` or #hide and then create markdown files in the `/docs` directory."""

# ╔═╡ fa7161ef-219f-47b5-b4a0-b18e0d3b5b54
md"## Creating the Table of contents"

# ╔═╡ 54817dac-18b6-40cc-9ef6-b51370164839
md"""The default configuration in the "mkdocs.yml" file (available to you when you create your repository from the template) contains all the necessary default configuration required to create you project page.

In order to test how your website looks like, go to the project root and type `mkdocs serve` . This would serve the project documentation to view locally (localhost).

The table of contents in the default case would be created by mkdocs on the basis of the documents available under the "docs" directory.

If you want to give your own spin to the table of contents then add a config similar to the following in the mkdocs.yml file-->

```
nav:
    - Home: index.md
    - Docs:
      - Nav1: nav1.md
      - Nav2: nav2.md
```
"""

# ╔═╡ 2b4992b3-f1a4-4587-b0d6-cb30efb1dfa1
md"""
!!! note
*Make sure that the "Home" navigation should always be the index.md file*"""

# ╔═╡ 394597e3-42f8-4bd3-8f10-206b5ea5f225
md"For more details about setting up navigation refer [this](https://www.mkdocs.org/user-guide/writing-your-docs/) and [this](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown/?h=table+con+of#table-of-contents) "

# ╔═╡ 094e214e-6681-4de8-b9a4-e73c4b23ff1c
md"## Other required edits"

# ╔═╡ 23ac38d5-c44a-4b8b-86c4-0bc3833add14
md"""In the mkdocs.yml file, edit the "site_name" config to the name that you want to give to your site. The "repo_url" and "repo_name" should be your git repository url and the name of your git repository respectively."""

# ╔═╡ 33eaee48-fc83-4c71-949d-1c9b9a2b32aa
md"## Optional edits"

# ╔═╡ 952bc125-e3b6-474c-90c4-786fdf300dcc
md"There are loads of other optional edits which you can make to the config file in order to customize your project website. Refer the documentation [here](https://squidfunk.github.io/mkdocs-material/getting-started/) to know about the other options."

# ╔═╡ 7429a0be-4f40-4d36-89cd-df56377c4502
md"## Publishing your project website"

# ╔═╡ 8fa0648a-599b-4ed5-870f-6b3d74e25fcd
md"""The first step is to checkin all your project contents to your repoitory. As soon as you push your changes to the remote branch, the github action (placed under "/.github/workflows" creates a new "gh-pages" branch under your project repository, builds the project webpages and pushes the created pages to the ""gh-pages" branch.

If you go to the "Actions" tab in your github repository then you can view the Action under the "All workflows" section. Here, a green tick mark before the action name suggests that all went fine.

Now, go to the Settings tab in your repository, click on Pages menu item from the left menu and in the "Source" drop-down select "gh-pages" as the source and root as the source folder, Click on save.

A detailed step by step description about configuring github pages can be read [here](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

You project website would be published at the following url --> "<username>.github.io/<project reporsitory name>"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.38"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

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
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "85b5da0fa43588c75bb1ff986493443f821c70b7"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.3"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

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

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═5a14baba-4b8a-4917-b354-246775bb8c1d
# ╠═00f8bf47-47d2-4a99-86ba-d7cd0b7f268b
# ╠═fbb6eadc-80a1-4cd9-ad27-bebcdd6e5981
# ╠═b0c1fe8f-e796-4835-95f8-17990c7421a7
# ╠═e0694cd4-7d07-494d-a010-f705d1cbeb2c
# ╠═9258500a-0a33-41cd-b32a-e09e820f84ee
# ╠═dedef829-e43c-41c9-8238-b9d631dccb35
# ╠═99d43364-5ac6-43bb-a70c-20a79a463fdf
# ╠═fb11c61e-2b26-4b2a-9a34-835163ac7f87
# ╠═c9f87989-522c-4adc-9a50-af95e3fa9cfa
# ╠═0d4fb029-bfc8-4208-a6f4-bd5ea981ff82
# ╠═ac65836e-6f4f-4212-b7f4-a648de9c761b
# ╠═789ebdb8-0017-4662-9120-a780584f8368
# ╠═809102dd-b91a-458f-b5c7-2a49c7536d3b
# ╠═f8391a08-edf6-499c-8e8d-8f731dad8fd4
# ╠═4d12cf7f-54d7-4a06-9749-a97246e7564e
# ╠═c40eeb9c-dbda-4dc0-9fc3-e91be447ac25
# ╠═929d68db-fac5-4507-8316-a0dcf71df403
# ╠═fac3e16d-76ff-476e-a2c4-ff34f7c3f1cc
# ╠═9fcf1320-0ddf-471c-a584-092586122347
# ╠═a3ea3f66-a66c-41d1-8c3c-c1cd3a879871
# ╠═77b75b82-c684-4377-882a-ff0a4283c7f5
# ╠═a7714f66-3eff-481a-af7f-ae26c2b8e8e2
# ╠═926b30a2-1a86-4952-a991-d75b5ce6e545
# ╠═5bd889ce-9522-462b-a843-508061926306
# ╠═8c9f1b35-8f88-44ba-8a37-57b92b42980b
# ╠═52e3492a-c27d-476f-9010-7d009fd0eeaf
# ╠═306239c9-7fd6-442e-8b97-db674398b307
# ╠═a8955cbd-2530-405f-b876-18bb35e0b008
# ╠═84f7040c-0ca9-4d61-abfe-789fc446ebb2
# ╠═7b1fdf81-870a-4977-8a9d-c867ee2861ff
# ╠═6ace0489-21ae-488f-8ea5-d3087651394c
# ╠═50ef31b0-b5f2-4a8e-b123-1681645a031f
# ╠═bc79b045-8969-4014-b7ac-01282d969c8c
# ╠═eb26aca4-4b12-435d-941f-edb18bda0c3c
# ╠═547f7e70-71bf-44a6-ba62-0e35edf688fc
# ╠═b1e0024c-aa32-46a3-baea-534b1187fb7a
# ╠═fa7161ef-219f-47b5-b4a0-b18e0d3b5b54
# ╠═54817dac-18b6-40cc-9ef6-b51370164839
# ╠═2b4992b3-f1a4-4587-b0d6-cb30efb1dfa1
# ╠═394597e3-42f8-4bd3-8f10-206b5ea5f225
# ╠═094e214e-6681-4de8-b9a4-e73c4b23ff1c
# ╠═23ac38d5-c44a-4b8b-86c4-0bc3833add14
# ╠═33eaee48-fc83-4c71-949d-1c9b9a2b32aa
# ╠═952bc125-e3b6-474c-90c4-786fdf300dcc
# ╠═7429a0be-4f40-4d36-89cd-df56377c4502
# ╠═8fa0648a-599b-4ed5-870f-6b3d74e25fcd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
