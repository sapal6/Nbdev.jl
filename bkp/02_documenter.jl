### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ 2a9f0c2e-07ba-11eb-2a22-cf9244b79ecd
#export
using Images, FileIO

# ╔═╡ dbc2c790-08aa-11eb-12bb-579de4923c76
#export
using Publish

# ╔═╡ b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
#export
include("../src/01_export.jl")

# ╔═╡ 23c57f60-0eb4-11eb-20c0-7dac22387fc1
#export
include("../src/04_configReader.jl")

# ╔═╡ 27ff1d70-1201-11eb-2003-27cb52571be6
#export
include("../src/03_codeRunner.jl")

# ╔═╡ b495a5c0-0701-11eb-22a0-2f1a44fb9a15
md"what we need?

👉 An automatic way to generate documents for code from docstrings.

👉 If docstrings are not there then document should be genrated by show_doc or  something similar. For example you may not want to put docstrings inside a struct. In this case you have to use this customised function to document the struct.

👉 Automatically create project readme from a common source."

# ╔═╡ 8a544780-0968-11eb-3104-f329ae48af16
md"`func img(img_path::String)`

     >Helper function to load image inside markdown

The img function loads image from a path."

# ╔═╡ 4c59d7fe-07ba-11eb-2817-3919d9fc485f
#export
function img(img_path::String)
	load(img_path)
end

# ╔═╡ a79f4e70-08aa-11eb-062c-5df3f8fe7da9
md"We will use Publish.jl to build our documentation which will also double up as a website for the project.

For this we will make a call to the `newsite()` function which will generate the basic folder structure for us."

# ╔═╡ 8d851420-08af-11eb-26b0-63501c72011a
#cd("../nbs")

# ╔═╡ 9478dd20-08af-11eb-1663-a7db573d2187
pwd()

# ╔═╡ ecc6f510-0969-11eb-2f5e-0d2e1fd67981
md"""`func newsitegen(configpath::String="../settings.ini")`
	  > generate a new site directory. Takes the seetings.ini file from the project root by default"""

# ╔═╡ e49c1970-08aa-11eb-094a-655c0f0c22af
#export
function newsitegen(configpath::String="../settings.ini")
	config=read_conf(configpath)
	if isdir("../docs")
		error("$(config["lib_name"])_docs directory is already present")
	else
	    #setup("../$(config["lib_name"])_docs")
		setup("../")
		mkdir("../docs")
	end
end

# ╔═╡ e7a9d932-08ab-11eb-1f38-479b95b55ee6
#newsitegen()

# ╔═╡ 5a2371e0-0953-11eb-3144-e3d76a772ed3
md"let's collect the markdown cells.

This can be done with the `collect_codecells` function in core.jl"

# ╔═╡ 4300c73e-0eeb-11eb-3f9b-cbcd76f772c1
g=["md\ndd", "#export\nmmm", "#hide\nfff", "func hello  end"]

# ╔═╡ 74879c7e-0eeb-11eb-31bf-251621d154a6
begin
	k=[]
	for i in g
		if !startswith(i, "#hide") && !startswith(i, "#export")
			push!(k, i)
		end
	end
end

# ╔═╡ b7a67aa0-11f6-11eb-0223-c1b6393ecb4a
k

# ╔═╡ 6ed4f0f0-0ee9-11eb-049f-a9b45eceec8e
#export
begin
function collect_codecells(filename::String)
        notebook_cells=read_nb(filename).cells
	    md_cells=[]
	    for i in 1:length(notebook_cells)
	    	code_chunk=notebook_cells[i].code
	    	if !startswith(code_chunk, "#hide") && !startswith(code_chunk, "#export") 
	            push!(md_cells,code_chunk)
            end
	    end
	    md_cells
end
end

# ╔═╡ 2fc24ff0-11f7-11eb-18a8-1b2b989fa189
collect_codecells("02_documenter.jl")

# ╔═╡ 5001a5b0-11ff-11eb-054a-6921da78afa3
md"As seen above we have a collection of markdown cells and cells which are neither intended to be exported or hidden. Such code cells are ones which we intend to have as examples in the document.

In such cases the normal code cells(cells without *#export*, *#hide* or *md* are supposed to be wrapped in triple backticks, that code getting executed, the output again wrapped in triple backticks and then inserted into the document.

In practice a new vector would be created which would have the executed markdown, the code to be executed(arapped in backticks) and the ouput of such code(wrapped in backticks)."

# ╔═╡ 380cf560-1202-11eb-3870-2932af854f10
examplestr = "func t ed"

# ╔═╡ d0da0e50-12c9-11eb-00e2-6b3d4ddae9f1
executeBlock("$examplestr", "02_documenter.jl")

# ╔═╡ 36286170-1203-11eb-1011-db01675aa8c5
md"```$examplestr```"

# ╔═╡ 41eba950-1202-11eb-136c-2f94e29d2c29
transformedstr="```$examplestr```"

# ╔═╡ 372d2ea0-1200-11eb-2838-8f7f9ffcd231
#export
function findExampleChunks(code_chunk)
	if .!startswith(code_chunk, "md")
		return "$code_chunk\n"
	else
		return ""
	end
end

# ╔═╡ 67066290-12be-11eb-328f-0d95d94a45e0
join(map(code_chunk->findExampleChunks(code_chunk), collect_codecells("02_documenter.jl")))

# ╔═╡ de4cdbf0-12bd-11eb-0f0a-cd74ff8c5356
#export
function collateExampleChunks(code_cells::Array)
	return join(map(code_chunk->findExampleChunks(code_chunk), code_cells))
end

# ╔═╡ 39c3d13e-12bf-11eb-2f2f-b53f9da00ba8
collateExampleChunks(collect_codecells("02_documenter.jl"))

# ╔═╡ 3365c650-12c4-11eb-3549-7752da32a1c6
#export
function collateMdChunks(code_cells::Array)
	return [md_chunk for md_chunk in code_cells if startswith(md_chunk, "md")]
end

# ╔═╡ 19f2ec5e-12c5-11eb-11be-33245c3d2349
collateMdChunks(collect_codecells("02_documenter.jl"))

# ╔═╡ 3489de80-12c5-11eb-3824-dd401e123636
#export
function collateChunksForDoc(file::String)
	code_cells = collect_codecells(file)
	vcat(collateMdChunks(code_cells::Array), collateExampleChunks(code_cells))
end

# ╔═╡ 36f57ff0-12c8-11eb-16d4-c9efdf576762
collateChunksForDoc("02_documenter.jl")

# ╔═╡ 628a44c0-12c8-11eb-06be-0da3b715163b
md"Now, we have got the collated the md cells and the would be example cells in the form we want. We can now execute these cells and collect the result whihc can later be used tocreate the document.

**Note: Here we are not distinguishing the order in which the examples are to appear. We will look into it later**"

# ╔═╡ 036ff1e0-096f-11eb-06c7-6ffa2667ad3a
#export
function export2MD()
	config=read_conf("../settings.ini")
	files=[file for file in readfilenames() if getfile_extension(file)== ".jl"]
	export_content(files, "../docs")
end

# ╔═╡ e86b1290-0edb-11eb-14fa-3d6d38aa2e6e
exportMDContent()

# ╔═╡ 58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
exportNbs()

# ╔═╡ Cell order:
# ╟─b495a5c0-0701-11eb-22a0-2f1a44fb9a15
# ╠═2a9f0c2e-07ba-11eb-2a22-cf9244b79ecd
# ╠═b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
# ╠═23c57f60-0eb4-11eb-20c0-7dac22387fc1
# ╠═27ff1d70-1201-11eb-2003-27cb52571be6
# ╟─8a544780-0968-11eb-3104-f329ae48af16
# ╠═4c59d7fe-07ba-11eb-2817-3919d9fc485f
# ╟─a79f4e70-08aa-11eb-062c-5df3f8fe7da9
# ╠═8d851420-08af-11eb-26b0-63501c72011a
# ╠═9478dd20-08af-11eb-1663-a7db573d2187
# ╠═dbc2c790-08aa-11eb-12bb-579de4923c76
# ╟─ecc6f510-0969-11eb-2f5e-0d2e1fd67981
# ╠═e49c1970-08aa-11eb-094a-655c0f0c22af
# ╠═e7a9d932-08ab-11eb-1f38-479b95b55ee6
# ╟─5a2371e0-0953-11eb-3144-e3d76a772ed3
# ╠═4300c73e-0eeb-11eb-3f9b-cbcd76f772c1
# ╠═74879c7e-0eeb-11eb-31bf-251621d154a6
# ╠═b7a67aa0-11f6-11eb-0223-c1b6393ecb4a
# ╠═6ed4f0f0-0ee9-11eb-049f-a9b45eceec8e
# ╠═2fc24ff0-11f7-11eb-18a8-1b2b989fa189
# ╠═d0da0e50-12c9-11eb-00e2-6b3d4ddae9f1
# ╟─5001a5b0-11ff-11eb-054a-6921da78afa3
# ╠═380cf560-1202-11eb-3870-2932af854f10
# ╠═36286170-1203-11eb-1011-db01675aa8c5
# ╠═41eba950-1202-11eb-136c-2f94e29d2c29
# ╠═372d2ea0-1200-11eb-2838-8f7f9ffcd231
# ╠═67066290-12be-11eb-328f-0d95d94a45e0
# ╠═de4cdbf0-12bd-11eb-0f0a-cd74ff8c5356
# ╠═39c3d13e-12bf-11eb-2f2f-b53f9da00ba8
# ╠═3365c650-12c4-11eb-3549-7752da32a1c6
# ╠═19f2ec5e-12c5-11eb-11be-33245c3d2349
# ╠═3489de80-12c5-11eb-3824-dd401e123636
# ╠═36f57ff0-12c8-11eb-16d4-c9efdf576762
# ╟─628a44c0-12c8-11eb-06be-0da3b715163b
# ╠═036ff1e0-096f-11eb-06c7-6ffa2667ad3a
# ╠═e86b1290-0edb-11eb-14fa-3d6d38aa2e6e
# ╠═58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
