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
using Nbdev

# ╔═╡ 00f8bf47-47d2-4a99-86ba-d7cd0b7f268b
md""" ## First steps

Use this [template](https://github.com/sapal6/nbdev.jl-template.git) to create a new repository. This will create a repository with the directory structure required for nbdev."""

# ╔═╡ fbb6eadc-80a1-4cd9-ad27-bebcdd6e5981
md"""
!!! note

*Right now nbdev is highly opinionated about the folder structure like presence of "src" and "docs" directory.*"""

# ╔═╡ 170cd996-3652-4157-bcd5-cf782ce74896
md"
!!! tip

*Refer to this [link](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) to understand how to use a template repository.*"

# ╔═╡ b0c1fe8f-e796-4835-95f8-17990c7421a7
md"## First notebook"

# ╔═╡ e0694cd4-7d07-494d-a010-f705d1cbeb2c
md"""As a first steps clone your repository to your local machine. 

Once you have cloned the repository, start Pluto the usual way as you use to do and create a notebook inside the "nbs" directory.

Each Pluto notebook maintains it's own environment. You can directly import a package and Pluto will install it from the registry. However, in our case Nbdev.jl is not yet registered. So, you can install Nbdev in the following way"""

# ╔═╡ 15a5c4fd-301e-4f7c-9ad3-28ae2d214224
md"""In the first cell of your notebook type in the following code 👇"""

# ╔═╡ e89e5c16-845e-4d0a-a346-80586c100be0
md"This will install Nbdev in our notebook environment."

# ╔═╡ 2ac2c281-ad4a-4364-8f62-5c8202d4e9c1
md"!!! note

*If you don't want to install Nbdev as part of every notebook that you create in your project, then you can follow the other options to install packages for your notebook projects by following the instructions in the [Pluto wiki](https://github.com/fonsp/Pluto.jl/wiki/%F0%9F%8E%81-Package-management).*"

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

# ╔═╡ c9f87989-522c-4adc-9a50-af95e3fa9cfa
md"
```
#export
function some_func(x)
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
my_experiment = 1+1
```"

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

# ╔═╡ 8c9f1b35-8f88-44ba-8a37-57b92b42980b
md"`showDoc(some_func)` would show the function like this 👇"

# ╔═╡ 52e3492a-c27d-476f-9010-7d009fd0eeaf
showDoc(some_func)

# ╔═╡ 306239c9-7fd6-442e-8b97-db674398b307
md"## Exporting code"

# ╔═╡ a8955cbd-2530-405f-b876-18bb35e0b008
md"""Once you are done with your notebook and you can run `notebook2script()`. This reads the current notebook in the "nbs" folder, scrubs out all the cells which are do not start with `#export` and creates a module file in the src folder.

The module file in the src folder will have the same name as the current file with the first letter in uppercase.

The exported code file automatically has all the code inside the module with the same name as the file.

For example, the exported source code file would have the following structure 👇

```
module Example

function some_func(x)
    x+1
end

end
```"""

# ╔═╡ 84f7040c-0ca9-4d61-abfe-789fc446ebb2
md"""
Once you are happy with the code you can export the source code by calling 

`notebook2script(nbs_dir, src_dir)`

Here "nbs_dir" is the directory where your notebooks are stored and the "src_dir" is the directory where you want your source code files to be exported. This is usually the `src` directory."""

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
md"There are loads f other optional edits which you can make to the config file in order to customize your project website. Refer the documentation [here](https://squidfunk.github.io/mkdocs-material/getting-started/) to know about the other options."

# ╔═╡ 7429a0be-4f40-4d36-89cd-df56377c4502
md"## Publishing your project website"

# ╔═╡ 8fa0648a-599b-4ed5-870f-6b3d74e25fcd
md"""The first step is to checkin all your project contents to your repoitory. As soon as you push your changes to the remote branch, the github action (placed under "/.github/workflows" creates a new "gh-pages" branch under your project repository, builds the project webpages and pushes the created pages to the ""gh-pages" branch.

If you go to the "Actions" tab in your github repository then you can view the Action under the "All workflows" section. Here, a green tick mark before the action name suggests that all went fine.

Now, go to the Settings tab in your repository, click on Pages menu item from the left menu and in the "Source" drop-down select "gh-pages" as the source and root as the source folder, Click on save.

A detailed step by step description about configuring github pages can be read [here](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

You project website would be published at the following url --> "<username>.github.io/<project reporsitory name>"
"""

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
# ╠═c9f87989-522c-4adc-9a50-af95e3fa9cfa
# ╠═0d4fb029-bfc8-4208-a6f4-bd5ea981ff82
# ╠═ac65836e-6f4f-4212-b7f4-a648de9c761b
# ╠═789ebdb8-0017-4662-9120-a780584f8368
# ╠═809102dd-b91a-458f-b5c7-2a49c7536d3b
# ╠═f8391a08-edf6-499c-8e8d-8f731dad8fd4
# ╠═4d12cf7f-54d7-4a06-9749-a97246e7564e
# ╠═a7714f66-3eff-481a-af7f-ae26c2b8e8e2
# ╠═926b30a2-1a86-4952-a991-d75b5ce6e545
# ╠═5bd889ce-9522-462b-a843-508061926306
# ╠═8c9f1b35-8f88-44ba-8a37-57b92b42980b
# ╠═52e3492a-c27d-476f-9010-7d009fd0eeaf
# ╠═306239c9-7fd6-442e-8b97-db674398b307
# ╠═a8955cbd-2530-405f-b876-18bb35e0b008
# ╠═84f7040c-0ca9-4d61-abfe-789fc446ebb2
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
