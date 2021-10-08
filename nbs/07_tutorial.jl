### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 5c86332a-db85-4326-9f17-215a8a0188c8
begin
import Pkg
Pkg.add(url="https://github.com/sapal6/nbdev.jl.git")
end

# ╔═╡ 615ff1a1-31d9-4219-a942-efc8f53bf538
using Nbdev: Documenter

# ╔═╡ 00f8bf47-47d2-4a99-86ba-d7cd0b7f268b
md""" ## First steps

Use this [template](https://github.com/sapal6/nbdev.jl-template.git) to create a new repository. This will create a repository with the directory structure required for nbdev."""

# ╔═╡ fbb6eadc-80a1-4cd9-ad27-bebcdd6e5981
md"""
!!! note

Right now nbdev is highly opinionated about the folder structure like presence of "src" and "docs" directory."""

# ╔═╡ 170cd996-3652-4157-bcd5-cf782ce74896
md"
!!! tip

Refer to this [link](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) to understand how to use a template repository."

# ╔═╡ b0c1fe8f-e796-4835-95f8-17990c7421a7
md"## First notebook"

# ╔═╡ e0694cd4-7d07-494d-a010-f705d1cbeb2c
md"""As a first steps clone your repository to your local machine. 

Once you have cloned the repository, start Pluto he usual way as you use to do and create a notebook inside the "nbs" directory.

Each Pluto notebook maintains it's own environment. You can directly import a package and Pluto will install it from the registry. However, in our case Nbdev.jl is not yet registered. So, you can install Nbdev in the following way"""

# ╔═╡ 15a5c4fd-301e-4f7c-9ad3-28ae2d214224
md"""In the first cell of your notebook type in the following code 👇"""

# ╔═╡ e89e5c16-845e-4d0a-a346-80586c100be0
md"This will install Nbdev in our notebook environment."

# ╔═╡ 2ac2c281-ad4a-4364-8f62-5c8202d4e9c1
md"!!! note

If you don't want to install Nbdev as part of every notebook that you create in your project, then you can follow the other options to install packages for your notebook projects by following the instructions in the [Pluto wiki](https://github.com/fonsp/Pluto.jl/wiki/%F0%9F%8E%81-Package-management)."

# ╔═╡ 3f5c7fbe-f1f1-4e55-9eff-cba4c9bcd7c7
md"Once Nbdev is installed, import the package in the usual way."

# ╔═╡ 9258500a-0a33-41cd-b32a-e09e820f84ee
md"## Start building your project"

# ╔═╡ dedef829-e43c-41c9-8238-b9d631dccb35
md"There are some anchors which tell Nbdev about which portion of your notebook should be exported as code, which portion should be part of documentation and which portion should not be touched."

# ╔═╡ 99d43364-5ac6-43bb-a70c-20a79a463fdf
md"### #export"

# ╔═╡ fb11c61e-2b26-4b2a-9a34-835163ac7f87
md"when you put the comment #export at the begining of a cell, it tells nbdev to export that cell as a code into the source file."

# ╔═╡ ebff4192-c8c8-4546-b979-897bc870a16a
##export
function some_func(x)
	x+1
end

# ╔═╡ 0d4fb029-bfc8-4208-a6f4-bd5ea981ff82
md"Nbdev will now put the above cell as part of the source file (with the same name as the current notebook) inside the src directory."

# ╔═╡ ac65836e-6f4f-4212-b7f4-a648de9c761b
md"### #hide"

# ╔═╡ 789ebdb8-0017-4662-9120-a780584f8368
md"Suppose that you have included soem cells as par of experment while developing your package but you want that the cell should neither be exported as a code nor that should be exported as part of documentation.

In such a case use the `#hide` anchor at the begining of the cell."

# ╔═╡ 809102dd-b91a-458f-b5c7-2a49c7536d3b
# #hide
my_experiment = 1+1

# ╔═╡ f8391a08-edf6-499c-8e8d-8f731dad8fd4
md"such a cell won't be exported."

# ╔═╡ 4d12cf7f-54d7-4a06-9749-a97246e7564e
md"Any other cell which neither has the `#hide` nor the `#export` anchor, is exported as an example block. For such a block the cell is executed and the output is captured.

The output and the code of an example cell appears in the final document."

# ╔═╡ a7714f66-3eff-481a-af7f-ae26c2b8e8e2
md"## Docstrings"

# ╔═╡ 926b30a2-1a86-4952-a991-d75b5ce6e545
md"Define a docstring for functions, structs etc. and use the special function `showDoc` to document that function or struct"

# ╔═╡ 5bd889ce-9522-462b-a843-508061926306
"""
> This is a function docstring
""" 
function some_func()
	1+1
end

# ╔═╡ 52e3492a-c27d-476f-9010-7d009fd0eeaf
showDoc(some_func)

# ╔═╡ Cell order:
# ╠═00f8bf47-47d2-4a99-86ba-d7cd0b7f268b
# ╠═fbb6eadc-80a1-4cd9-ad27-bebcdd6e5981
# ╠═170cd996-3652-4157-bcd5-cf782ce74896
# ╠═b0c1fe8f-e796-4835-95f8-17990c7421a7
# ╠═e0694cd4-7d07-494d-a010-f705d1cbeb2c
# ╠═15a5c4fd-301e-4f7c-9ad3-28ae2d214224
# ╠═5c86332a-db85-4326-9f17-215a8a0188c8
# ╠═e89e5c16-845e-4d0a-a346-80586c100be0
# ╠═2ac2c281-ad4a-4364-8f62-5c8202d4e9c1
# ╠═3f5c7fbe-f1f1-4e55-9eff-cba4c9bcd7c7
# ╠═615ff1a1-31d9-4219-a942-efc8f53bf538
# ╠═9258500a-0a33-41cd-b32a-e09e820f84ee
# ╠═dedef829-e43c-41c9-8238-b9d631dccb35
# ╠═99d43364-5ac6-43bb-a70c-20a79a463fdf
# ╠═fb11c61e-2b26-4b2a-9a34-835163ac7f87
# ╠═ebff4192-c8c8-4546-b979-897bc870a16a
# ╠═0d4fb029-bfc8-4208-a6f4-bd5ea981ff82
# ╠═ac65836e-6f4f-4212-b7f4-a648de9c761b
# ╠═789ebdb8-0017-4662-9120-a780584f8368
# ╠═809102dd-b91a-458f-b5c7-2a49c7536d3b
# ╠═f8391a08-edf6-499c-8e8d-8f731dad8fd4
# ╠═4d12cf7f-54d7-4a06-9749-a97246e7564e
# ╠═a7714f66-3eff-481a-af7f-ae26c2b8e8e2
# ╠═926b30a2-1a86-4952-a991-d75b5ce6e545
# ╠═5bd889ce-9522-462b-a843-508061926306
# ╠═52e3492a-c27d-476f-9010-7d009fd0eeaf
