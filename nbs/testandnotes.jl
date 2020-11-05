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

# ╔═╡ 585bfee0-1a97-11eb-363b-43537681dced
a=try 
	eval(:($(Expr(:toplevel, :(#= testandnotes.jl#==#d3c44042-1369-11eb-186a-af3e6c6ec540:1 =#), :(test(1))))))
catch
	"error"
end

# ╔═╡ 4b066eb0-1ace-11eb-3639-73cba9cdb568
struct testnb
	testcell
end

# ╔═╡ 9bb68f70-1ace-11eb-1e00-8d4d1223997f
testnb(a)

# ╔═╡ 84c90600-1abd-11eb-0059-83a145b7c94e
#include_string(mod,"include(\"testandnotes.jl\")\ntest(1)")

# ╔═╡ a4c32980-1ad2-11eb-2e26-91bd79be2400
import Pluto.PlutoRunner

# ╔═╡ 17f9f190-1ad3-11eb-0684-e9ea1ee89d37
testop=PlutoRunner.format_output(eval(:($(Expr(:toplevel, :(#= testandnotes.jl#==#d3c44042-1369-11eb-186a-af3e6c6ec540:1 =#), :(test(1)))))))

# ╔═╡ b8ea1d80-1cd3-11eb-0986-b137f832276d
print(testop)

# ╔═╡ 2809dda2-1ada-11eb-00f7-9b9142026806
d.cells[1].cell_id

# ╔═╡ b13c70d0-1cc7-11eb-3a56-a7ba1947c650
#testserver.options.evaluation.workspace_use_distributed = false

# ╔═╡ b7bf2882-1cc7-11eb-1565-31134df34913
begin
fakeclient = ClientSession(:fake, nothing)
testserver.connected_clients[fakeclient.id] = fakeclient
end

# ╔═╡ 2ec26510-1ccc-11eb-04c6-d7cbb7e30262
      notebook = Notebook([
            Cell("x = 1"),
            Cell("y = x"),
            Cell("f(x) = x + y"),
            Cell("f(4)"),

            Cell("""begin
                g(a) = x
                g(a,b) = y
            end"""),
            Cell("g(6) + g(6,6)"),

            Cell("import Distributed"),
            Cell("Distributed.myid()"),
        ])

# ╔═╡ 49500860-1ccc-11eb-2916-afbe3871450a
fakeclient.connected_notebook = notebook

# ╔═╡ 8c162620-1ccc-11eb-0585-852ddcb59b95
update_run!(testserver, notebook, notebook.cells[1])

# ╔═╡ 4b7f9290-1ccc-11eb-1f63-2fae40ea29b5
notebook.cells[1].output_repr

# ╔═╡ Cell order:
# ╟─b54d06b0-1369-11eb-32b4-ab93e613b598
# ╠═d4b0c320-1369-11eb-3f10-d3f9fad87ea0
# ╠═d3c44042-1369-11eb-186a-af3e6c6ec540
# ╠═f01369b0-1369-11eb-3645-a56195e645b3
# ╠═f9bb5630-1369-11eb-2e71-ddf7bc8a1092
# ╟─71f404e2-13c3-11eb-225a-4360c6cd9f0a
# ╠═585bfee0-1a97-11eb-363b-43537681dced
# ╠═4b066eb0-1ace-11eb-3639-73cba9cdb568
# ╠═9bb68f70-1ace-11eb-1e00-8d4d1223997f
# ╠═84c90600-1abd-11eb-0059-83a145b7c94e
# ╠═a4c32980-1ad2-11eb-2e26-91bd79be2400
# ╠═17f9f190-1ad3-11eb-0684-e9ea1ee89d37
# ╠═b8ea1d80-1cd3-11eb-0986-b137f832276d
# ╠═2809dda2-1ada-11eb-00f7-9b9142026806
# ╠═b13c70d0-1cc7-11eb-3a56-a7ba1947c650
# ╠═b7bf2882-1cc7-11eb-1565-31134df34913
# ╠═2ec26510-1ccc-11eb-04c6-d7cbb7e30262
# ╠═49500860-1ccc-11eb-2916-afbe3871450a
# ╠═8c162620-1ccc-11eb-0585-852ddcb59b95
# ╠═4b7f9290-1ccc-11eb-1f63-2fae40ea29b5
