### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ 378749c0-0e14-11eb-2933-033ed2bcb972
#hide
include("../src/05_export.jl")

# ╔═╡ 4dfda390-0241-11eb-268d-071ba60ab483
#using Literate

# ╔═╡ 9f652d70-0241-11eb-26d9-5decf3ac97de
function test()
	println("test")
end

# ╔═╡ 32f830d0-0244-11eb-28d6-f120e72a70f0
md"Literate does a good job in exporting files to script.

But it does not give you control out of box to select what you want to export."

# ╔═╡ b742cbf0-0241-11eb-1d84-9f1205be7d76
#Literate.script("01.jl","C:\\Projects\\open-projects\\nbdev.jl\\nbdev\\src")

# ╔═╡ 53294f60-0244-11eb-3c05-d51cc305ff9f
md"Literat edoes however gives you flexibility to add your own pre-processing steps.

Let's see if we can customize it.

For our purpose we don't want the following as of now.

1. Export whatever is marked with *#export*"

# ╔═╡ 14eed010-024b-11eb-1c85-15b227c002f6
#export
import Pluto: load_notebook_nobackup

# ╔═╡ 7f47d970-024b-11eb-151f-cbdc663d03df
d=load_notebook_nobackup("01_core.jl").cells

# ╔═╡ 51ce3290-024c-11eb-06b0-df01c0cf9896
if occursin("#export", d.code)
	d.code
end

# ╔═╡ fa581a20-024c-11eb-1e93-87a67c862197
#export
function read_nb(filename::String)
	load_notebook_nobackup(filename)
end

# ╔═╡ b79673c0-024d-11eb-0b5e-fd8d7bbdce07
c=read_nb("01.jl").cells

# ╔═╡ 7107dc40-0311-11eb-1cd2-5fde8a92bab4
c[1].code

# ╔═╡ b7396a20-0312-11eb-2d8b-7be18d0dd3bf
begin
	w=[1,5,6]
	q=[]
	for i in 1:length(w)
		push!(q,w[i])
	end
end

# ╔═╡ ece509e0-0312-11eb-29a3-6bf399f95539
size(w)

# ╔═╡ 1cb72a40-0313-11eb-0467-cb20c293a358
q

# ╔═╡ a572bea0-0311-11eb-35f2-894a8eaee2e9
begin
	x=[]
	for i in 1:length(c)
		code_chunk=c[i].code
		push!(x,code_chunk)
	end
end

# ╔═╡ bd734e70-0311-11eb-1013-652949668fa5
x

# ╔═╡ eedcc870-0ba8-11eb-2995-5f30260330f5
#export
function chopMdMarker(str::String)
	chop(str, head = 3, tail = 2)
end

# ╔═╡ 3bc4c830-0baa-11eb-0fa0-07ee31591d81
#export
function processMdChunk(mdChunk::String)
	chopMdMarker(mdChunk)
end

# ╔═╡ 3234cab0-024d-11eb-3054-9f951277d59a
#export
function collect_codecells(filename::String, marker="#export")
	notebook_cells=read_nb(filename).cells
	code_cells=[]
	for i in 1:length(notebook_cells)
		code_chunk=notebook_cells[i].code
		if startswith(code_chunk, marker)
	        push!(code_cells,code_chunk)
        end
	end
	code_cells
end

# ╔═╡ db61b390-024e-11eb-36b3-576f0c5bfa30
collect_codecells("01_core.jl", "#export")

# ╔═╡ fbcf1dbe-0a23-11eb-0251-cdcabced16c7
md"""The code cells for a markdown content is like `md"this is markdown"`.

When we wrap this inside the `html()` then it spits out the respective html content."""

# ╔═╡ fb7fcfce-0a24-11eb-09a8-9770421a5252
z=collect_codecells("01_core.jl", "md")

# ╔═╡ b9aa3740-062c-11eb-3832-f30969d0597f
readdir(joinpath("../","src"))

# ╔═╡ 1b255ae0-062d-11eb-2335-0917a5533ac2
joinpath("../src","01.jl")

# ╔═╡ 643812e0-0632-11eb-1a0e-79c5118ff913
function show_output(file_path::String, file::String)
	if isfile(file_path)
		@show "$file exported"
	end
end

# ╔═╡ f5527eb0-08b1-11eb-07f7-5d2867f739b4
files=[file for file in readfilenames() if getfile_extension(file)== ".jl"]

# ╔═╡ 79f4991e-0e14-11eb-361a-df0b145e6d2b
exportNbs()

# ╔═╡ Cell order:
# ╠═4dfda390-0241-11eb-268d-071ba60ab483
# ╠═9f652d70-0241-11eb-26d9-5decf3ac97de
# ╟─32f830d0-0244-11eb-28d6-f120e72a70f0
# ╠═b742cbf0-0241-11eb-1d84-9f1205be7d76
# ╟─53294f60-0244-11eb-3c05-d51cc305ff9f
# ╠═378749c0-0e14-11eb-2933-033ed2bcb972
# ╠═14eed010-024b-11eb-1c85-15b227c002f6
# ╠═7f47d970-024b-11eb-151f-cbdc663d03df
# ╠═51ce3290-024c-11eb-06b0-df01c0cf9896
# ╠═fa581a20-024c-11eb-1e93-87a67c862197
# ╠═b79673c0-024d-11eb-0b5e-fd8d7bbdce07
# ╠═7107dc40-0311-11eb-1cd2-5fde8a92bab4
# ╠═ece509e0-0312-11eb-29a3-6bf399f95539
# ╠═b7396a20-0312-11eb-2d8b-7be18d0dd3bf
# ╠═1cb72a40-0313-11eb-0467-cb20c293a358
# ╠═a572bea0-0311-11eb-35f2-894a8eaee2e9
# ╠═bd734e70-0311-11eb-1013-652949668fa5
# ╠═eedcc870-0ba8-11eb-2995-5f30260330f5
# ╠═3bc4c830-0baa-11eb-0fa0-07ee31591d81
# ╠═3234cab0-024d-11eb-3054-9f951277d59a
# ╠═db61b390-024e-11eb-36b3-576f0c5bfa30
# ╟─fbcf1dbe-0a23-11eb-0251-cdcabced16c7
# ╠═fb7fcfce-0a24-11eb-09a8-9770421a5252
# ╠═b9aa3740-062c-11eb-3832-f30969d0597f
# ╠═1b255ae0-062d-11eb-2335-0917a5533ac2
# ╠═643812e0-0632-11eb-1a0e-79c5118ff913
# ╠═f5527eb0-08b1-11eb-07f7-5d2867f739b4
# ╠═79f4991e-0e14-11eb-361a-df0b145e6d2b
