### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ d4e575ae-28c8-11eb-236e-5f81e81ff094
#export
using Markdown

# ╔═╡ 085e8560-17af-11eb-37c6-2bfceac4cf79
#export
using ReusePatterns

# ╔═╡ 2a9f0c2e-07ba-11eb-2a22-cf9244b79ecd
#export
using Images, FileIO

# ╔═╡ dbc2c790-08aa-11eb-12bb-579de4923c76
#export
using Publish

# ╔═╡ b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
#export
begin
include("../src/Export.jl")
#const Nb = Export.Nb 
end

# ╔═╡ 23c57f60-0eb4-11eb-20c0-7dac22387fc1
#export
include("../src/ConfigReader.jl")

# ╔═╡ 27ff1d70-1201-11eb-2003-27cb52571be6
#export
include("../src/CodeRunner.jl")

# ╔═╡ b495a5c0-0701-11eb-22a0-2f1a44fb9a15
md"what we need?

👉 An automatic way to generate documents for code from docstrings.

👉 If docstrings are not there then document should be genrated by show_doc or  something similar. For example you may not want to put docstrings inside a struct. In this case you have to use this customised function to document the struct.

👉 Automatically create project readme from a common source."

# ╔═╡ 1d83078e-2024-11eb-0e5f-51310d134662
#export
import Pluto: Notebook, Cell

# ╔═╡ 4d29da30-1879-11eb-00ec-6de36df25d88
#export
load_nb=Export.load_nb

# ╔═╡ a1a09fd0-193d-11eb-0a91-11a6df8cb651
#hide
ConfigReader.read_conf("../settings.ini")["lib_path"]

# ╔═╡ 5a2e9790-201f-11eb-0df4-f90b3cc54f20
#export
begin
Base.@kwdef mutable struct Section
	line::String=""
end
	
Section(line)=Section(line=line)
end

# ╔═╡ 28a4e100-17ac-11eb-172c-2d0e73460caa
#export
begin
struct Page
	sections::Array{Section,1}
    name::AbstractString
end
	
Page(sections, path)=Page(sections=sections, path=path)
end

# ╔═╡ 2006e310-17af-11eb-2a88-27a4b31f1a00
md"now the save_nb can take the type Journal"

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
#hide
#cd("../nbs")

# ╔═╡ 9478dd20-08af-11eb-1663-a7db573d2187
#hide
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
#hide
#newsitegen()

# ╔═╡ 5a2371e0-0953-11eb-3144-e3d76a772ed3
md"let's collect the markdown cells.

This can be done with the `collect_codecells` function in core.jl"

# ╔═╡ 74879c7e-0eeb-11eb-31bf-251621d154a6

function test(x)
	x+1
end


# ╔═╡ e2952860-1ade-11eb-20ca-091a45fab2f2
test(1)

# ╔═╡ 2fc24ff0-11f7-11eb-18a8-1b2b989fa189
#hide
testNb=load_nb("02_documenter.jl", "md")

# ╔═╡ 743238d0-1918-11eb-3dfc-6f30db92923c
md"`run_and_update` runs all md and example code and updates the notebook type wit output"

# ╔═╡ 8691e572-1918-11eb-011c-639d3617e076
#export
function run_and_update_nb(file::AbstractString)
	notebook=load_nb(file, "md")
	return CodeRunner.execute_code(notebook)
end

# ╔═╡ 5001a5b0-11ff-11eb-054a-6921da78afa3
md"As seen above we have a collection of markdown cells and cells which are neither intended to be exported or hidden. Such code cells are ones which we intend to have as examples in the document.

In such cases the normal code cells(cells without *#export*, *#hide* or *md* are supposed to be wrapped in triple backticks, that code getting executed, the output again wrapped in triple backticks and then inserted into the document.

The code to be executed(wrapped in backticks) and the ouput of such code(wrapped in backticks)."

# ╔═╡ 592f96d0-1f5e-11eb-30b2-b9ca738d8c2a
md"how can we wrapthe code string to this ?"

# ╔═╡ f1d7ed22-1f8a-11eb-035d-6de2cb48bb8b
Markdown.html(md"```func test end```")

# ╔═╡ 6b9cb0f0-1f5e-11eb-1e15-9f0c8295b59f
code=testNb.cells[13].code

# ╔═╡ c3d2cf20-1f8b-11eb-0381-01270b1494b3
cleanedCode=Export.strip(Export.strip(code,"\n"), "\n")

# ╔═╡ a6012ef0-1f8c-11eb-3b2e-9d5c3ecdbc29
md"we can builda blocked code this way"

# ╔═╡ 1d71bb00-1f8b-11eb-31de-69aebd625201
string("<p><code>",cleanedCode,"</code></p>\n")

# ╔═╡ bda9c5a0-1f8a-11eb-396b-97f97add91db
md"How to stich only the code and the code output into a code block?

One way would be to read the executed notebook and look for cells wihtout code as **md** and then stich them together along with their output(at the end of each code block) into an html code block. This would be one line in section type.

In case the code.erroed is tru cancel the build and display a message."

# ╔═╡ d75486f0-2022-11eb-2d95-aded3418c079
#export
begin
function stitchCode(cell::Cell)
	#cleanedCode=Export.strip(Export.strip(cell.code,"\n"), "\n")
	#string("<p><code>",cleanedCode,cell.output_repr,"</code></p>\n")
	string("```","\n$(cell.code)\n","\n$(cell.output_repr)\n","```\n")
end

function stitchCode(cellop::AbstractString)
	#cleanedop=Export.strip(Export.strip(cellop,"\n"), "\n")
	#string("<p><code>",cleanedop,"</code></p>\n")
	string("```","\n$cellop\n","```\n")
end
end

# ╔═╡ 2cb1c480-2593-11eb-3936-75a74fa39fc1
#hide
d=methods(stitchCode, [Cell])

# ╔═╡ 6c5b7850-2599-11eb-0cc9-39065ff9d40c
#hide
dstr=string(d.ms[1])

# ╔═╡ 5728c070-2597-11eb-00cc-77de9dd2688b
#hide
m=match(r"[a-zA-Z]+\([^\)]*\)(\.[^\)]*\))?", dstr)

# ╔═╡ f8d36f40-25d5-11eb-3332-fdb7cf134a0b
#hide
m.match

# ╔═╡ 00989200-25d6-11eb-3139-8dd2ca0346f8
#export
grabFuncSig=(pat, fdesc) -> match(pat, fdesc).match

# ╔═╡ 363dc920-25d6-11eb-37d7-b5ade368658f
#export
begin
pat4func=r"[a-zA-Z]+\([^\)]*\)(\.[^\)]*\))?"
pat4anonymfunc = r"\([^\)]*\)(\.[^\)]*\))?"
end

# ╔═╡ 57f44f30-25d6-11eb-33dc-874e5a713bc5
grabFuncSig(pat4func,dstr)

# ╔═╡ 9bf47390-25d6-11eb-1c3a-1d305aeb1c06
fstr = string(methods(grabFuncSig).ms[1])

# ╔═╡ 81205160-25d6-11eb-1b59-dba990a416a7
grabFuncSig(pat4anonymfunc,fstr)

# ╔═╡ 79109ba2-25d7-11eb-3a02-9de895379cae
#export
function showdDoc(fname, args...)
	fdesc=string(methods(fname).ms[1])
	fsig=grabFuncSig(pat4func, fdesc)
	if fsig==nothing
		return grabFuncSig(pat4anonymfunc, fdesc)
	else
		return fsig
	end
end

# ╔═╡ 36b846d0-2024-11eb-3784-89a02343cd0b
#export
function createPage(filename::AbstractString, notebook::Notebook)
	sections=Section[]
	
	for cell in notebook.cells
		
		if cell.errored
			error("Build stopped. Seems like the code $cell.code has an error")
			break
	    end
		
	    if startswith(cell.code, "md")
			push!(sections, Section(cell.output_repr))
		elseif !startswith(cell.code, "#export") && !startswith(cell.code, "#hide")
			if occursin(cell.code, "showDoc")
				stitched_code=stitchCode(cell.output_repr)
				push!(sections, Section(stitched_code))
			else
				stitched_code=stitchCode(cell)
			    push!(sections, Section(stitched_code))
			end
		end
	end
	
	Page(sections, filename)
end

# ╔═╡ 8d7b5280-28a0-11eb-282d-2dbf124460da
#export
begin
const _header = "<html>"
const _footer = "</html>"
end

# ╔═╡ 60f5f6b0-28a1-11eb-1b18-27bdfed23c8c
#export
md2html(md)=Markdown.html(md)

# ╔═╡ cec980d0-28a1-11eb-3089-ff1cbc3ee2db
#hide
str=uppercasefirst(Export.strip(Export.strip("02_documenter.jl", r"[0-9_]"), r".jl"))

# ╔═╡ 311fd750-28a4-11eb-0d43-d3316d43e977
#hide
md=md"# $str"

# ╔═╡ 41705300-28a4-11eb-1117-3b1c0d7b7ac9
#hide
md2html(md)

# ╔═╡ 4c5c7c22-28a0-11eb-0069-cb78e0e7e0ee
#export
begin
	
function save_page(io, page)
    #println(io, _header)
    println(io, "")
		
	pageHeading=uppercasefirst(Export.strip(Export.strip(page.name, r"[0-9_]"), r".jl"))
	heading2md=md"# $pageHeading"
		
    println(io, md2html(heading2md))
		
	for section in page.sections
			println(io, section.line*"\n")
    end
		
	#print(io, _footer)	
end

function save_page(page::Page, path::String)
	file_name=uppercasefirst(Export.strip(Export.strip(page.name, r"[0-9_]"), r".jl"))
	open(joinpath(path, file_name*".md"), "w") do io
        save_page(io, page)
    end
end
end

# ╔═╡ f31331e0-28c2-11eb-1014-95ed88d77469
#export
begin
function export2html(file::String, path::String)
	notebook=run_and_update_nb(joinpath("../nbs",file))
	page=createPage(file, notebook)
	save_page(page, path)
end
	
export2html(files::AbstractVector, path::String)=map(file->export2html(file, path), files)
	
export2html()=export2html(Export.readfilenames(), "../docs")
end

# ╔═╡ 58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
#hide
Export.notebook2script()

# ╔═╡ Cell order:
# ╟─b495a5c0-0701-11eb-22a0-2f1a44fb9a15
# ╠═d4e575ae-28c8-11eb-236e-5f81e81ff094
# ╠═085e8560-17af-11eb-37c6-2bfceac4cf79
# ╠═2a9f0c2e-07ba-11eb-2a22-cf9244b79ecd
# ╠═b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
# ╠═1d83078e-2024-11eb-0e5f-51310d134662
# ╠═4d29da30-1879-11eb-00ec-6de36df25d88
# ╠═23c57f60-0eb4-11eb-20c0-7dac22387fc1
# ╠═a1a09fd0-193d-11eb-0a91-11a6df8cb651
# ╠═27ff1d70-1201-11eb-2003-27cb52571be6
# ╠═5a2e9790-201f-11eb-0df4-f90b3cc54f20
# ╠═28a4e100-17ac-11eb-172c-2d0e73460caa
# ╟─2006e310-17af-11eb-2a88-27a4b31f1a00
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
# ╠═74879c7e-0eeb-11eb-31bf-251621d154a6
# ╠═e2952860-1ade-11eb-20ca-091a45fab2f2
# ╠═2fc24ff0-11f7-11eb-18a8-1b2b989fa189
# ╟─743238d0-1918-11eb-3dfc-6f30db92923c
# ╠═8691e572-1918-11eb-011c-639d3617e076
# ╟─5001a5b0-11ff-11eb-054a-6921da78afa3
# ╟─592f96d0-1f5e-11eb-30b2-b9ca738d8c2a
# ╠═f1d7ed22-1f8a-11eb-035d-6de2cb48bb8b
# ╠═6b9cb0f0-1f5e-11eb-1e15-9f0c8295b59f
# ╠═c3d2cf20-1f8b-11eb-0381-01270b1494b3
# ╠═a6012ef0-1f8c-11eb-3b2e-9d5c3ecdbc29
# ╠═1d71bb00-1f8b-11eb-31de-69aebd625201
# ╟─bda9c5a0-1f8a-11eb-396b-97f97add91db
# ╠═d75486f0-2022-11eb-2d95-aded3418c079
# ╠═2cb1c480-2593-11eb-3936-75a74fa39fc1
# ╠═6c5b7850-2599-11eb-0cc9-39065ff9d40c
# ╠═5728c070-2597-11eb-00cc-77de9dd2688b
# ╠═f8d36f40-25d5-11eb-3332-fdb7cf134a0b
# ╠═00989200-25d6-11eb-3139-8dd2ca0346f8
# ╠═363dc920-25d6-11eb-37d7-b5ade368658f
# ╠═57f44f30-25d6-11eb-33dc-874e5a713bc5
# ╠═9bf47390-25d6-11eb-1c3a-1d305aeb1c06
# ╠═81205160-25d6-11eb-1b59-dba990a416a7
# ╠═79109ba2-25d7-11eb-3a02-9de895379cae
# ╠═36b846d0-2024-11eb-3784-89a02343cd0b
# ╠═8d7b5280-28a0-11eb-282d-2dbf124460da
# ╠═60f5f6b0-28a1-11eb-1b18-27bdfed23c8c
# ╠═cec980d0-28a1-11eb-3089-ff1cbc3ee2db
# ╠═311fd750-28a4-11eb-0d43-d3316d43e977
# ╠═41705300-28a4-11eb-1117-3b1c0d7b7ac9
# ╠═4c5c7c22-28a0-11eb-0069-cb78e0e7e0ee
# ╠═f31331e0-28c2-11eb-1014-95ed88d77469
# ╠═58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
