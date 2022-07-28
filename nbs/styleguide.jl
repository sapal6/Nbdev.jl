### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 679551a2-320f-11ec-14eb-db9ace5d282c
md"Many ideas for the style guide here are borrowed fom the great [FastAI library](https://docs.fast.ai/dev/style.html). So, some of the code style may seem similar.

There is good reason to borrow coding style ideas from the fastai library. Some of them are 👇

* Avoid too much scrolling while reading the code.
* Convey information as fast as possible.
* Keep things simple.
* Spend less time on thinking what a particular piece of code does i.e. the name of a code piece should make it clear about the intention of that code."

# ╔═╡ 9504a064-0376-4eb5-8600-9d7f36830ade
md"## Naming"

# ╔═╡ 524fb413-e364-43da-b56e-41b14a90c04e
md"""
* Module names are single words with the starting letter as uppercase.
* Functions and variables are lowercase single words.
  * For example,`makedocs`. This is to keep thing simple and easier for the user to remember the names. For example, the end user should not get confused about wether the name had an underscore or not.
* Struct names are single word and start with an upper case.

* Commonly used things should be shorter.
  * For example, 
    * "object" is named `o`.
    * "image" is named `img`.
    * input is denoted with x.
  * Look in the "Abbr" section for a list of abbrevations used.
    * Feel free to add any abbrevations which are missed."""

# ╔═╡ 95bb2db3-a85d-4ec1-9ae5-588aac0ff197
md"## Layout"

# ╔═╡ f6fffc14-20d2-482a-97a9-32c25ce91e96
md"""
* One line of code should implement one complete idea, where possible
Generally therefore an if part and its 1-line statement should be on one line
Using the ternary operator x = y if a else b can help with this guideline.

* If a 1-line function body comfortably fits on the same line as the function section, feel free to put them together.
  * In such cases, wherever possible, the functions can also be denoted in the "expression" format like `func(x) = x+1`.

* If you’ve got a bunch of 1-line functions doing similar things, they don’t need a blank line between them

  * These can be grouped together."""

# ╔═╡ fe9ef97b-48d5-472d-948b-3648ac9438fd
begin
f(x:: Int8) = x+1
function f(x:: Float16) x*2 end
end

# ╔═╡ 3fdec90a-4b42-400e-8e8c-93624716b015
md"""
* Aim to align statement parts that are conceptually similar. It allows the reader to quickly see how they’re different. 

  * For example
    ```
    if foo == 0 x = f(x)
       else     x = f(x) end
    ```"""

# ╔═╡ Cell order:
# ╠═679551a2-320f-11ec-14eb-db9ace5d282c
# ╠═9504a064-0376-4eb5-8600-9d7f36830ade
# ╠═524fb413-e364-43da-b56e-41b14a90c04e
# ╠═95bb2db3-a85d-4ec1-9ae5-588aac0ff197
# ╠═f6fffc14-20d2-482a-97a9-32c25ce91e96
# ╠═fe9ef97b-48d5-472d-948b-3648ac9438fd
# ╠═3fdec90a-4b42-400e-8e8c-93624716b015
