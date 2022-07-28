### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 0f225480-3b85-11ec-2de2-f9c51a8642aa
md"First of all, thank you for having a look into Nbdev. If you are reading this then it's safe to say that you have taken Nbdev for a spin and you want to contribute to the project. May be you found somethign that can add value to Nbdev or may be something is missing which you want ot add. Whatever the reason maybe, here are some of the ways in which you can contribute 👇 

* You can write a tutorial.
* You can contribute to documentations.
* You can provide feedback.
* You can contribute code.

Before moving into the details about how you can do the above mentioned contributions, let's see how to setup Nbdev for the first time."

# ╔═╡ 6fe29a04-31b0-4e32-ac20-80eac2693b2c
md"""## Setting things up 

Working on Nbdev or any other open source project starts with a "fork". If you are new to open source or this is your first time contribution to an open source project then read the following [tutorial](https://docs.github.com/en/get-started/quickstart/fork-a-repo) to get a quick understanding of what a "fork" is and how you can get started with forking a project.

After you fork the project, clone the repo somewhere in your local machine.

Nbdev is built on itself i.e. the starting point of all the code and documentation in Nbdev is a Pluto notebook.

To get started, create a project directory and move into the directory. Here, you need to start a new environment like this 👇 

```
mkdir ~/nbdev_dev
cd ~/nbdev_dev
julia
```

This would create a directory namedb "nbdev_dev" and take you inside that directory. After which the Julia terminal would fire up. Once inside Julia terminal type `]` to enter the package manager then type the following 👇

```
(v1.0) pkg> activate .
(nbdev_dev) pkg> dev <path/to/cloned/repo
```

After this move back to the Julia terminal and type 👇 

```
julia> import Pluto
julia> Pluto.run()
```
This gives you a fresh Pluto environment to work in. From this point onwards, you can either start a new notebook or work on an existing notebook if it's a bug fix or documentation change.
"""

# ╔═╡ 518a5202-b1fc-4baf-b0ba-6b6ecd672ea8
md"## How to get started 🏃‍♀️ 
Here are some of the way to get started with contributing 👇 

* Pick a piece of code in nbdev and checkout the test for it. If there is a missing test then add it. If an existing test doesn't provide sufficient coverage then add it.

* You noticed somethign missing in the documentation? go ahead and add it.

* Feel like the tutorial needs imrpovement or a few more tutorials could be useful? go ahead and write a tutorial.
"

# ╔═╡ 4ab7ac54-6f5a-400e-91ce-1469e73e936c
md"## Oh! you found a bug 🖊🐛
* First ensure that such bug was not reported earlier in [issues](https://github.com/sapal6/nbdev.jl/issues) 

* If you're unable to find an open issue addressing the problem, open a [new one](https://github.com/sapal6/nbdev.jl/issues/new). Be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring. 

* Be sure to add the complete error messages.
"

# ╔═╡ 95facb52-4681-4126-b128-8f769b3f2d61
md"## Intending to add a new feature or enhancing an old one? 👩‍🔧

* You can start a discussion on the [discussion tab](https://github.com/sapal6/nbdev.jl/discussions). this will help you to find if others are instrested in same thing as you and maybe you can find collaborators. 

* While working on a new feature first create a detailed notebook about the feature that you would like to add. The notebook should contain a detailed description about the feature, why you think this feature is needed and a step-by-step description about what your code is doing. Once you think that you are ready with your example notebook, post a gist in the discussion forum.

* Once your feature request is dicussed and finalized then you can open a PR. Make sure to include a complete description of the feature and an example of it's usage. Make sure that your code has a good documentation and follows the style guide. 

* Ensure that your PR includes tests that exercise not only your feature, but also any other code that might be impacted.
"

# ╔═╡ 7e6f9df9-1cc3-41c9-8cb7-24a8f86f75b9
md"Submitting a PR 🎈 

* All Nbdev code starts with a Pluto notebook. The exported code from the notebook then appears as the final code under the src directory and the related documentation under the docs directory. If you are submitting your PR -->
  * Always start your developement with a Pluto notebook because if you modify code, add code or create a new code file under the src directory directly then the source notebooks won't have your modifications. 

  * Once you add a new code in an existing notebook, update an existing code in a cell that is supposed to be exported or added a new code in a new notebook with cells marked with `#export` then make sure to run `notebook2script` in the same notebook so as to export the code to the respective files under the src directory.

  * After everything is finalized, make sure to run `make.jl docs` at the terminal in order to export the documentation.

* Make sure that your PR is accompanied by sufficient test coverage. Either in the notebook itself or under the test dicrectory. Currently Nbdev has poor test coverage so you may need to include test for the impacted code as well.

* Do not combine several unrelated fixes together. Create separate branches for separate fixes, separate features etc.

* Preserve the original code styling of an existing file.
"

# ╔═╡ 25981537-b077-44cb-8aed-078db3fa7fad
md"## Want to contribute to the docs? 📓
* The docs are generated from the notebooks in the`nbs` directory. 

* If you are planning to edit an already existing notebook then make sure not to add the `#export` flag to the existing documentation cells or any new documentation cell that you might add. 

* If you are planning to add a new notebook for documentation then make sure not to add `#export` to any of the cell in this new notebook.
"

# ╔═╡ Cell order:
# ╠═0f225480-3b85-11ec-2de2-f9c51a8642aa
# ╠═6fe29a04-31b0-4e32-ac20-80eac2693b2c
# ╠═518a5202-b1fc-4baf-b0ba-6b6ecd672ea8
# ╠═4ab7ac54-6f5a-400e-91ce-1469e73e936c
# ╠═95facb52-4681-4126-b128-8f769b3f2d61
# ╠═7e6f9df9-1cc3-41c9-8cb7-24a8f86f75b9
# ╠═25981537-b077-44cb-8aed-078db3fa7fad
