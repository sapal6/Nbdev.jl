### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ b54d06b0-1369-11eb-32b4-ab93e613b598
md"this is test"

# ╔═╡ d4b0c320-1369-11eb-3f10-d3f9fad87ea0
test(num)= md"$num is test"

# ╔═╡ d3c44042-1369-11eb-186a-af3e6c6ec540
test(1)

# ╔═╡ f01369b0-1369-11eb-3645-a56195e645b3
import Pluto: load_notebook

# ╔═╡ f9bb5630-1369-11eb-2e71-ddf7bc8a1092
d=load_notebook("testandnotes.jl")

# ╔═╡ 71f404e2-13c3-11eb-225a-4360c6cd9f0a
md"the following code does the following

Thisis from weave.jl

```mod = sandbox = Core.eval(Main, :(module $(gensym(:WeaveSandBox)) end))::Module```

the above code creates a module named WeaveSandBox and attaches it to the Main.

this is from literate.jl sandbox

```Core.eval(m, :(include(x) = Base.include($m, abspath(x))))```

The above code evaluates to override the base.include fucntion toinclude teh absolute path of the file u want toinclude.

The above two lines of code can then be used to override the literate.jl sanboxfunc and then this can be called inside another function like this

cd(path to the root of project) do
sandbox()
include(path tofile which is being read)
eval(the expression for the required code)#evauating an expression is faster than that of a string within include_string
end


"

# ╔═╡ Cell order:
# ╟─b54d06b0-1369-11eb-32b4-ab93e613b598
# ╠═d4b0c320-1369-11eb-3f10-d3f9fad87ea0
# ╠═d3c44042-1369-11eb-186a-af3e6c6ec540
# ╠═f01369b0-1369-11eb-3645-a56195e645b3
# ╠═f9bb5630-1369-11eb-2e71-ddf7bc8a1092
# ╟─71f404e2-13c3-11eb-225a-4360c6cd9f0a
