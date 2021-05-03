### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ 4cb4aa50-3e01-11eb-3460-5f109773492b
#export
using Base.Docs

# ╔═╡ 151ec8b0-2b27-11eb-1ec2-a7c5e4c13db9
#export
using Markdown

# ╔═╡ 085e8560-17af-11eb-37c6-2bfceac4cf79
#export
using ReusePatterns

# ╔═╡ dbc2c790-08aa-11eb-12bb-579de4923c76
#export
using Publish

# ╔═╡ b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
#export
include("../src/Export.jl")

# ╔═╡ 23c57f60-0eb4-11eb-20c0-7dac22387fc1
#export
include("../src/ConfigReader.jl")

# ╔═╡ 27ff1d70-1201-11eb-2003-27cb52571be6
#export
include("../src/CodeRunner.jl")

# ╔═╡ b495a5c0-0701-11eb-22a0-2f1a44fb9a15
md"The Documenter module is based on the following question:

**What failities would we want to have if we need a way to generate documents from a 📓 ?**🤔

These might be some answers to the above questions👇

💡 An automatic way to generate documents from the markdown matter.

💡 Automatic way to document functions, methods etc.

💡 Automatically create project readme.

🤫 *The third capability is yet to come.*"

# ╔═╡ 2a9f0c2e-07ba-11eb-2a22-cf9244b79ecd
#export
#TODO: not working in local due to system block.
#have to test in an unrestricted environment
#using Images, FileIO

# ╔═╡ 1d83078e-2024-11eb-0e5f-51310d134662
#export
import Pluto: Notebook, Cell, load_notebook_nobackup

# ╔═╡ a1a09fd0-193d-11eb-0a91-11a6df8cb651
#hide
ConfigReader.read_conf("../settings.ini")["lib_path"]

# ╔═╡ 25ff264e-3ec5-11eb-362c-07b4e24c635a
md"## Lower Level Entities(Structs, methods etc.) 
These are the objects on which nbdev's Documenter module was built. You can use it extend nbdev but these are automtically used by Nbdev's internal engine to generate code files for you."

# ╔═╡ bf4e47f0-3ec5-11eb-1b65-5fe2e7a88ff1
md"#### Section type"

# ╔═╡ 5a2e9790-201f-11eb-0df4-f90b3cc54f20
#export
begin
"""
> struct Section--> This is like the section of a page and is made up of one or multiple lines.
> * Fields:
>   * line--> String which makes up a section
"""
Base.@kwdef mutable struct Section
	line::String=""
end

"""
> Section(line)--> Helper function to call the constructor of the type Section
"""
Section(line)=Section(line=line)
"""
> line(section::Section)--> Getter for accessing the underlying field line.
"""
line(section::Section)=section.line
end

# ╔═╡ 0bc30190-3ec9-11eb-0ac6-7d8f1eacc210
md"A Section can be thought of as a paragraph on a page📃. This would be composed of several lines. The Section type represents a paragraph and the field line is a string which ultimatley goes on to form a section inthe generated document."

# ╔═╡ 730d99d0-3ec6-11eb-185c-fb571b36bf67
#hide
@doc Section

# ╔═╡ f1318ca0-3f97-11eb-3727-3f71064c77bf
md"#### Example"

# ╔═╡ cfb6d710-3f97-11eb-31ed-6daa12cf592e
begin
section=Section("This is a test line")
line(section)
end

# ╔═╡ 309585e2-3f93-11eb-0873-d9b0d7a6200e
md"#### Page Type"

# ╔═╡ 28a4e100-17ac-11eb-172c-2d0e73460caa
#export
begin
"""
> Page--> The type that represents a page in a document.
> * Fields:
>   * sections--> Array of Section type.
>   * name--> Name of the module being documented.
"""
struct Page
	sections::Array{Section,1}
    name::AbstractString
end

"""
> Page--> Helper function to create constructer for Page type.
"""
Page(sections, path)=Page(sections=sections, path=path)
	
"""
> sections--> Getter for accessing the underlying field sections of Page.
"""
sections(p::Page)=p.sections
	
"""
> name--> Getter for accessing the underlying field name of Page.
"""
name(p::Page)=p.name
end

# ╔═╡ 997a4950-3f94-11eb-2e66-d9a70cc175d1
md"A 📃 is made up of several sections. These sections can be example codes, text ,graphs(to be implemented) and function documentation and several pages. The Page type helps in implementing this concept into code."

# ╔═╡ ea16dab0-3f97-11eb-19b5-0f4998ba3e39
md"#### Example"

# ╔═╡ 11057000-3f98-11eb-27aa-ffb097ca25ed
begin
page=Page([Section("iny, meeny, miny mo"), Section("🙈 🙊 🙉")], "Monkey module")
sections(page)
end

# ╔═╡ 7e959872-421d-11eb-3784-2f110840a628
page

# ╔═╡ dd721172-4443-11eb-3833-3f74ff47dd42
typeof(page)

# ╔═╡ 452212b0-3f95-11eb-110c-ed193d10b1da
md"#### img"

# ╔═╡ 4c59d7fe-07ba-11eb-2817-3919d9fc485f
#export
#TODO:This should be moved to a utility module
#TODO: have to test in unrestricted environment
#as it's getting blocked in my current system
#"""
#> img(img_path::String)--> Helper function to load images within a notebook. This can be helpful to have images appear in the final document.
#"""
#function img(img_path::String)
#	load(img_path)
#end

# ╔═╡ 8d74a142-3f95-11eb-3331-5577669dd902
#showDoc(img)

# ╔═╡ b726f4f0-405a-11eb-3fe1-b5e95c56cf9b
md"`img()` accepts image path and loads an image onto the notebook where it is called."

# ╔═╡ 8d851420-08af-11eb-26b0-63501c72011a
#hide
#cd("../nbs")

# ╔═╡ 9478dd20-08af-11eb-1663-a7db573d2187
#hide
pwd()

# ╔═╡ 4393ada2-405d-11eb-2b44-4956a62bc6ae
md"##### newsitegen"

# ╔═╡ e49c1970-08aa-11eb-094a-655c0f0c22af
#export
begin
"""
> newsitegen(configpath::String="../settings.ini")--> Create required directory structure for hosting documents with optional path to a config file.
"""
#function newsitegen(configpath::String="../settings.ini")
#	
#	if !isfile("../settings.ini") 
#		error("You don't have the settings file available in project path")
#	end
#	
#	config=read_conf(configpath)
#	if isdir("../docs")
#		warn("$(config["lib_name"])_docs directory is already present")
#	else
#	    #setup("../$(config["lib_name"])_docs")
#		setup("../")
#		mkdir("../docs")
#	end
#end

function newsitegen(configpath::String="../settings.ini")
	
	if !isfile("../settings.ini") 
		error("You don't have the settings file available in project path")
	end
	
	config=read_conf(configpath)
	if isdir("../docs")
		warn("$(config["lib_name"])_docs directory is already present")
	else
	    #setup("../$(config["lib_name"])_docs")
		mkdir("../docs")
		run(`mkdocs new my-project`)
	end
end
end

# ╔═╡ e7a9d932-08ab-11eb-1f38-479b95b55ee6
#hide
#newsitegen()

# ╔═╡ 63b40350-405d-11eb-1b89-cf3fb7ded30d
md"Nbdev uses [Publish.jl](https://michaelhatherly.github.io/Publish.jl/0.1.0/docs/getting_started.html) to generate the document site. All the documents are in markdown format and must be present under the `docs` 📂 in the project root. The `newsitegen` function makes sure to create a docs 📂 if it's not available in project root."

# ╔═╡ 74879c7e-0eeb-11eb-31bf-251621d154a6
#hide
function test(x)
	x+1
end

# ╔═╡ e2952860-1ade-11eb-20ca-091a45fab2f2
#hide
test(1)

# ╔═╡ d9fffed0-2f3f-11eb-16b4-4b2778f792d9
#hide
import Pluto

# ╔═╡ 2fc24ff0-11f7-11eb-18a8-1b2b989fa189
#hide
#testNb=Pluto.load_notebook("02_documenter.jl")

# ╔═╡ 743238d0-1918-11eb-3dfc-6f30db92923c
md"##### run_and_update "

# ╔═╡ 8691e572-1918-11eb-011c-639d3617e076
#export
"""
> run_and_update_nb(file::AbstractString)--> Run the notebook in the supplied path and update the notebook with the output of each cell.
"""
function run_and_update_nb(file::AbstractString)
	notebook=load_notebook_nobackup(file)
	return CodeRunner.execute_code(notebook)
end

# ╔═╡ 5001a5b0-11ff-11eb-054a-6921da78afa3
md"`run_and_update_nb` uses the `load_notebook_nobackup` function in Pluto.jl. There are multiple ways to achieve what this fucntions achieves without depending on Pluto internals but for now this was the quickiest way to achieve this.

**Note-**Depending on Pluto to run anad update a notebook this way makes it difficult to run unit test for this function from within pluto itself because a Pluto cell is treated as worker 2, 3 and so on but when you do load_notebook() then it spins up another worker. Only worker 1 can spwan further processes and not a notebook cell."

# ╔═╡ f1d7ed22-1f8a-11eb-035d-6de2cb48bb8b
#hide
Markdown.html(md"```func test end```")

# ╔═╡ 6b9cb0f0-1f5e-11eb-1e15-9f0c8295b59f
#hide
#code=testNb.cells[13].code

# ╔═╡ c3d2cf20-1f8b-11eb-0381-01270b1494b3
#hide
#cleanedCode=Export.strip(Export.strip(code,"\n"), "\n")

# ╔═╡ 1d71bb00-1f8b-11eb-31de-69aebd625201
#hide
#string("<p><code>",cleanedCode,"</code></p>\n")

# ╔═╡ bda9c5a0-1f8a-11eb-396b-97f97add91db
md"##### stitchCode"

# ╔═╡ 00989200-25d6-11eb-3139-8dd2ca0346f8
#hide
#TODO:not used as of now
grabFuncSig=(pat, fdesc) -> match(pat, fdesc).match

# ╔═╡ 363dc920-25d6-11eb-37d7-b5ade368658f
#hide
#TODO:not used as of now
begin
pat4func=r"[a-zA-Z]+\([^\)]*\)(\.[^\)]*\))?"
pat4anonymfunc = r"\([^\)]*\)(\.[^\)]*\))?"
pat4funcargs=r"\([^\)]*\)(\.[^\)]*\))?"
end

# ╔═╡ 9bf47390-25d6-11eb-1c3a-1d305aeb1c06
#hide
fstr = string(methods(grabFuncSig).ms[1])

# ╔═╡ 19ab31e0-4060-11eb-0417-131e3a1f5a5e
md"#### FunctionDocs"

# ╔═╡ 34ff4880-2b22-11eb-0eef-9bc7ab1aef8f
#export
begin
"""
> struct FunctionDocs--> Stores the document of different objects.
> * funcDocs--> Array of strings.
"""
mutable struct FunctionDocs
	funcDocs::Array{String, 1}
end

"""
> FunctionDocs(funcDocs)--> Helper for accessing the FunctionDocs constructer.
"""
FunctionDocs(funcDocs)=FunctionDocs(funcDocs) 
end

# ╔═╡ d75486f0-2022-11eb-2d95-aded3418c079
#export
begin

jltree_pat=Dict("<jltree class=collapsed onclick=onjltreeclick(this, event)>"=>"",
                    "<jlstruct>"=>"(",
                     "<r>"=>"",
                     "<k>" => "",
                     "</k>" => "-->",
                     "<v>" => "",
                     "</v>"=> "",
                     "</r>" => "",
                     "</jlstruct>"=>")",
                     "</jltree>" => "",
		             "<jlarray>" => "[",
                     "</jlarray>"=>"]",
	                 "<pre>"=>"",
	                 "</pre>"=>"",
	                 "&quot;"=>"",
	                 "&#61;"=>"=",
	                 "&#43;"=>"+",
	                 "&#40;"=>"(",
	                 "&#41;"=>")")
                    		

"""
> stitchCode(cell::Cell)--> Stitches the code in a Pluto notebook cell with the output of that code. The output is acode block.
"""
function stitchCode(cell::Cell)
	op=Export.strip(cell.output_repr, "\"")
	if startswith(cell.output_repr, "<jltree")
			for(key, val) in jltree_pat
				op=replace(op, key=>val)
			end
	end
		
	string("```","\n$(cell.code)\n","------\nOutput\n------\n","$(op)\n", "```\n")
end
	
"""
> stitchCode(cellop::AbstractString)--> Removes the quotes from a string and creates a code block with that string inside the newely formed code block
"""
function stitchCode(cellop::AbstractString)

	cleanedop=Export.strip(Export.strip(cellop,"\""), "\"")
	string("```","\n$cleanedop\n","```\n")
	#string("",cellop,"\n")
end
	
"""
> stitchCode(fdocs::FunctionDocs)--> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object
"""
function stitchCode(fdocs::FunctionDocs)
		funcdocs=""
		
		for fdoc in fdocs.funcDocs
		    funcdocs=string(funcdocs, "$(fdoc)\n\n")
	    end
		
		funcdocs
end
end

# ╔═╡ 931b9ab2-4060-11eb-219d-49b05ff3ca72
md"####  Example"

# ╔═╡ 4cd1f510-2b23-11eb-3051-072d6fb4e81c
begin
funcdocs=FunctionDocs(["i", "j"])
funcdocs.funcDocs
end

# ╔═╡ 95219eb0-3e01-11eb-28d2-af58c55dfbd1
#hide
docs=@doc stitchCode

# ╔═╡ 83214680-3eb9-11eb-32bd-01e55390224e
#hide
"$(docs.meta[:results][1].object)"

# ╔═╡ 3f171660-3ec1-11eb-0983-2789adeab1c3
#export
"""
> collectFuncDocs(obj)--> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from teh docstrings). Creates aFunctionDocs type from these documents.
"""
function collectFuncDocs(obj)
	docs=doc(obj)
    fdocs=["$(docs.meta[:results][i].object)" for i=1:length(docs.meta[:results])]
	FunctionDocs(fdocs)
end

# ╔═╡ 01a22122-4061-11eb-393e-17c15f09e58d
md"#### Example"

# ╔═╡ 89db4130-3ec1-11eb-23ee-eff6d23c1588
collectFuncDocs(stitchCode).funcDocs

# ╔═╡ db32b16e-4061-11eb-23f0-7fdeaab0d0c8
md"## Higher Level API"

# ╔═╡ 0661fdb0-4062-11eb-09d0-030a43180a2c
md"These higher level APIs can either be used directly or are already used internally by nbdev. One such functions which can be used directly is..."

# ╔═╡ df2e8540-4063-11eb-2266-7f423f03bd67
md"##### showDoc"

# ╔═╡ a310902e-2b28-11eb-0455-add7ff7c8d6e
#export
begin
	
"""
> showDoc(o)--> Takes an object and builds markdown documentation.
"""
function showDoc(o)
	docs=collectFuncDocs(o)
	stitchCode(docs)
end
end

# ╔═╡ d8395ed0-3ec5-11eb-049c-0b38eb2e7d54
showDoc(Section)

# ╔═╡ 0d10aed0-3f9b-11eb-1bcd-dbdb5e5068f4
showDoc(line)

# ╔═╡ 87c22750-3f94-11eb-201c-a3c6374881f4
showDoc(Page)

# ╔═╡ 41b87320-3f9b-11eb-1ed4-fdfefdc01627
showDoc(sections)

# ╔═╡ 48beb2b0-3f9b-11eb-2756-919a82c5c0de
showDoc(name)

# ╔═╡ 59aca6d0-405f-11eb-2252-633f4d0ccdbc
showDoc(stitchCode)

# ╔═╡ bb865340-4061-11eb-065c-030bf004197f
showDoc(FunctionDocs)

# ╔═╡ d038c980-4061-11eb-19a5-5bab5b196788
showDoc(collectFuncDocs)

# ╔═╡ f17bc160-2e46-11eb-0d65-cf6185b4f406
showDoc(showDoc)

# ╔═╡ 2b104160-4e83-11eb-1a78-a96f77e1aff4
struct MyStruct
	name
end

# ╔═╡ 449bb6f2-4e83-11eb-27ae-298352285e98
mystruct=MyStruct("test")

# ╔═╡ df1998f0-4ea1-11eb-0626-dbead118373f
typeof(mystruct)

# ╔═╡ 10866060-5980-11eb-0422-e7300713c6a4
md"Currently nbdev is unable to recognize the docstrings of inline expressions.👇"

# ╔═╡ 4fee8610-5980-11eb-137a-83f4aa64e933
"> inlinetest--> This is a inline test expression"
inlinetest=str->replace(str, "1"=> "one")

# ╔═╡ 83bb0590-5980-11eb-3159-b376954405ef
#hide
#showDoc(inlinetest)

# ╔═╡ 285cf4e0-4064-11eb-3162-1b399c464a1a
md"##### createPage"

# ╔═╡ 36b846d0-2024-11eb-3784-89a02343cd0b
#export
"""
> CreatePage--> Creates the Page type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.
"""
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
			if occursin( "showDoc", cell.code)
				#stitched_code=stitchCode(cell.output_repr)
				cleanedop=Export.strip(cell.output_repr, "\"")
				cleanedop=replace(cleanedop, "\\n"=>"\n")
				push!(sections, Section(cleanedop))
			else
				stitched_code=stitchCode(cell)
			    push!(sections, Section(stitched_code))
			end
		end
	end
	
	Page(sections, filename)
end

# ╔═╡ 7216e720-411e-11eb-1103-19bf4993ef1e
showDoc(createPage)

# ╔═╡ 7f938250-411e-11eb-0d30-b53cf2c8bc97
md"While generating document this function you don't need to call this function. This is done automatically😃 for you when nbdev generates documents."

# ╔═╡ 8d7b5280-28a0-11eb-282d-2dbf124460da
#export
begin
const _header = "<html>"
const _footer = "</html>"
end

# ╔═╡ 15299390-411f-11eb-3b2b-257dc0eac258
md"##### md2html"

# ╔═╡ 60f5f6b0-28a1-11eb-1b18-27bdfed23c8c
"""
> md2html(md)--> Tiny helper to format a markdown into html.
"""
md2html(md)=Export.strip(Markdown.html(md), "\n")

# ╔═╡ 39ae06b0-411f-11eb-01eb-b30511aec8cc
md"Sometimes it better to have tiny helpers like this. The `md2html` converts the supplied markdown into a visible html.🎈🎈"

# ╔═╡ 827db480-411f-11eb-2eb3-b3239cc4a865
md"#### Example"

# ╔═╡ 8aab35fe-411f-11eb-27b2-6bc7d3dd5280
md2html(md"This is a test")

# ╔═╡ f5521070-8f6f-11eb-3466-539ce423eb19
md"""#### sw
Checks if a given string startwith a certain susbstring. Helpful when there are a list of strings to match.
"""

# ╔═╡ 642e89a0-8f71-11eb-0a01-07ade17b8c65
#export
""">sw--> Checks if a given string
    startwith a certain susbstring.
    Helpful when there are a list of strings to match.
"""
sw = o -> startswith("```html~~~", o)

# ╔═╡ 20728fa0-8f70-11eb-2807-9bdb80c4b2f9
md"""#### Example"""

# ╔═╡ 1b8e6cc0-8f70-11eb-0e91-1101742b14a4
#hide
begin
	v = ["<", "~~~", "```"]
	f = y -> startswith("```html~~~", y)
	a =f.(v)
	a,true in f.(v)
end

# ╔═╡ 7b6fd3d0-411f-11eb-3786-ff38ee7d0291
md"##### save_page"

# ╔═╡ 4c5c7c22-28a0-11eb-0069-cb78e0e7e0ee
#export
begin

#vector of possible non-html strings
nothtml = ["> ", "```"]
	
"""
> save_page(io, page::Page)--> Take the contents from a Page type and write to the io
"""
function save_page(io, page::Page)
    #println(io, _header)
    #println(io, "")
		
	pageHeading=uppercasefirst(Export.strip(Export.strip(page.name, r"[0-9_]"), r".jl"))
	#heading2md=md"# $pageHeading"
	
	#for Franklin. Without this Franklin gives error on page title
	println(io, "@def title ="*"\""*pageHeading*"\"")
	println(io, "~~~")
    println(io, "<h1>Documenter</h1>")
	println(io, "~~~")
	
    #TODO: the new line is rendering the web page renderable in franlin need to deal with it
	for section in page.sections
			if startswith(section.line, "<")
			    println(io, "~~~")
			    println(io, section.line)
			    println(io, "~~~")
			else
				println(io, section.line)
			end
    end
		
	#print(io, _footer)	
end

"""
> save_page(save_page(io, docnames::Array{String,1}))--> Given an array of document names, creates a table of content
"""
function save_page(io, docnames::Array{String,1})
    println(io, "**Documentation**\n")
	println(io, "  * [Introduction](README.md)")
	for docname in docnames
			println(io, "  * [$docname](docs/$docname.md)\n")
	end
end

"""
> save_page(page::Page, path::String)--> Given a Page type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated
"""
function save_page(page::Page, path::String)
	file_name=uppercasefirst(Export.strip(Export.strip(page.name, r"[0-9_]"), r".jl"))
	open(joinpath(path, file_name*".md"), "w") do io
        save_page(io, page)
    end
end

"""
> save_page(docnames::Array{String,1})--> Given an array of documents, creates the related table of contents in "toc.md"
"""
function save_page(docnames::Array{String,1})
	open("../toc.md", "w") do io
        save_page(io, docnames)
    end
end
end

# ╔═╡ 870d3240-4120-11eb-0dca-89337e801493
showDoc(save_page)

# ╔═╡ 943f2fe2-4120-11eb-11a9-7785d11d3c36
md"Nbdev calls the required method of `save_page` automatically during document generation."

# ╔═╡ 9fa322d0-32ff-11eb-2060-4b3e609d0d73
#hide
filenames=readdir("../docs")

# ╔═╡ caa56ba0-32ff-11eb-2008-91c24261ae53
#hide
docnames=[Export.strip(name, ".md") for name in filenames]

# ╔═╡ a8606bc0-3300-11eb-1487-6f229844f529
#hide
save_page(docnames)

# ╔═╡ ed8b55f0-4121-11eb-1a2b-a77bea8bfe7f
md"##### export2md"

# ╔═╡ f31331e0-28c2-11eb-1014-95ed88d77469
#export
begin
"""
> export2md(file::String, path::String)--> Generate document for a file in the given path
"""
function export2md(file::String, path::String)
	notebook=run_and_update_nb(joinpath(joinpath(pwd(), "nbs"),file))
	page=createPage(file, notebook)
	save_page(page, path)
end

"""
> export2md(files::AbstractVector, path::String)--> Map the `export2md(file, path)` to a given vector of file.
"""
function export2md(files::AbstractVector, path::String)
	for file in files
      export2md(file, path)
	end
end

"""
> export2md()--> Higher level API to generate documents for all the valid notebooks
"""
export2md()=export2md(Export.readfilenames(joinpath(pwd(), "nbs")), "docs")
end

# ╔═╡ 807db3e2-4121-11eb-136d-ad470b83a46f
showDoc(export2md)

# ╔═╡ 8c376960-4121-11eb-1627-cf0d01bcf47b
md"The `export2md()` is what gets summoned when document generation is invoked. Like most things in nbdev (and unlike most things in life) this too gets invoked automatically. 🥳"

# ╔═╡ e8e79770-4121-11eb-2d54-0b27713454c8
md"##### createtoc"

# ╔═╡ 477e3750-3301-11eb-0bf0-3397364c4f91
#hide
#perhaps dont need it now because franklin has the settings
#in the html _layout file itself.
#the directory from where the fields can be borrowed
#for toc.
"""
#> createtoc()--> Create the tableof contents and save that in toc.md inside docs directory
#"""
#function createtoc()
#	docnames=[Export.strip(name, ".md") for name in readdir("../docs/")]
#	save_page(docnames)
#end

# ╔═╡ 2a7498f0-4122-11eb-13d3-a5bff912453c
#showDoc(createtoc)

# ╔═╡ 0a8aeb00-411f-11eb-15cb-69ac5c16f683
md"Creating the toc.md and example--

* Create the file-
  + The first two lines should be-->  

    **Documentation**
    * [Introduction](README.md)
* Read the files in doc folder.
  + Append to the file as-->
    * [Module1]```(/docs/module1)```
    * [Module2]```(/docs/module2)```"

# ╔═╡ 79b7bac0-3301-11eb-12ee-d1870258f287
#hide
#createtoc()

# ╔═╡ 58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
#hide
Export.notebook2script()

# ╔═╡ Cell order:
# ╠═b495a5c0-0701-11eb-22a0-2f1a44fb9a15
# ╠═4cb4aa50-3e01-11eb-3460-5f109773492b
# ╠═151ec8b0-2b27-11eb-1ec2-a7c5e4c13db9
# ╠═085e8560-17af-11eb-37c6-2bfceac4cf79
# ╠═2a9f0c2e-07ba-11eb-2a22-cf9244b79ecd
# ╠═b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
# ╠═1d83078e-2024-11eb-0e5f-51310d134662
# ╠═23c57f60-0eb4-11eb-20c0-7dac22387fc1
# ╠═a1a09fd0-193d-11eb-0a91-11a6df8cb651
# ╠═27ff1d70-1201-11eb-2003-27cb52571be6
# ╠═25ff264e-3ec5-11eb-362c-07b4e24c635a
# ╠═bf4e47f0-3ec5-11eb-1b65-5fe2e7a88ff1
# ╠═5a2e9790-201f-11eb-0df4-f90b3cc54f20
# ╟─0bc30190-3ec9-11eb-0ac6-7d8f1eacc210
# ╠═730d99d0-3ec6-11eb-185c-fb571b36bf67
# ╠═d8395ed0-3ec5-11eb-049c-0b38eb2e7d54
# ╠═0d10aed0-3f9b-11eb-1bcd-dbdb5e5068f4
# ╠═f1318ca0-3f97-11eb-3727-3f71064c77bf
# ╠═cfb6d710-3f97-11eb-31ed-6daa12cf592e
# ╠═309585e2-3f93-11eb-0873-d9b0d7a6200e
# ╠═28a4e100-17ac-11eb-172c-2d0e73460caa
# ╠═87c22750-3f94-11eb-201c-a3c6374881f4
# ╠═41b87320-3f9b-11eb-1ed4-fdfefdc01627
# ╠═48beb2b0-3f9b-11eb-2756-919a82c5c0de
# ╟─997a4950-3f94-11eb-2e66-d9a70cc175d1
# ╠═ea16dab0-3f97-11eb-19b5-0f4998ba3e39
# ╠═11057000-3f98-11eb-27aa-ffb097ca25ed
# ╠═7e959872-421d-11eb-3784-2f110840a628
# ╠═dd721172-4443-11eb-3833-3f74ff47dd42
# ╟─452212b0-3f95-11eb-110c-ed193d10b1da
# ╠═4c59d7fe-07ba-11eb-2817-3919d9fc485f
# ╠═8d74a142-3f95-11eb-3331-5577669dd902
# ╟─b726f4f0-405a-11eb-3fe1-b5e95c56cf9b
# ╠═8d851420-08af-11eb-26b0-63501c72011a
# ╠═9478dd20-08af-11eb-1663-a7db573d2187
# ╠═dbc2c790-08aa-11eb-12bb-579de4923c76
# ╟─4393ada2-405d-11eb-2b44-4956a62bc6ae
# ╠═e49c1970-08aa-11eb-094a-655c0f0c22af
# ╠═e7a9d932-08ab-11eb-1f38-479b95b55ee6
# ╟─63b40350-405d-11eb-1b89-cf3fb7ded30d
# ╠═74879c7e-0eeb-11eb-31bf-251621d154a6
# ╠═e2952860-1ade-11eb-20ca-091a45fab2f2
# ╠═d9fffed0-2f3f-11eb-16b4-4b2778f792d9
# ╠═2fc24ff0-11f7-11eb-18a8-1b2b989fa189
# ╟─743238d0-1918-11eb-3dfc-6f30db92923c
# ╠═8691e572-1918-11eb-011c-639d3617e076
# ╠═5001a5b0-11ff-11eb-054a-6921da78afa3
# ╠═f1d7ed22-1f8a-11eb-035d-6de2cb48bb8b
# ╠═6b9cb0f0-1f5e-11eb-1e15-9f0c8295b59f
# ╠═c3d2cf20-1f8b-11eb-0381-01270b1494b3
# ╠═1d71bb00-1f8b-11eb-31de-69aebd625201
# ╟─bda9c5a0-1f8a-11eb-396b-97f97add91db
# ╠═d75486f0-2022-11eb-2d95-aded3418c079
# ╠═59aca6d0-405f-11eb-2252-633f4d0ccdbc
# ╠═00989200-25d6-11eb-3139-8dd2ca0346f8
# ╠═363dc920-25d6-11eb-37d7-b5ade368658f
# ╠═9bf47390-25d6-11eb-1c3a-1d305aeb1c06
# ╟─19ab31e0-4060-11eb-0417-131e3a1f5a5e
# ╠═34ff4880-2b22-11eb-0eef-9bc7ab1aef8f
# ╠═bb865340-4061-11eb-065c-030bf004197f
# ╠═931b9ab2-4060-11eb-219d-49b05ff3ca72
# ╠═4cd1f510-2b23-11eb-3051-072d6fb4e81c
# ╠═95219eb0-3e01-11eb-28d2-af58c55dfbd1
# ╠═83214680-3eb9-11eb-32bd-01e55390224e
# ╠═3f171660-3ec1-11eb-0983-2789adeab1c3
# ╠═d038c980-4061-11eb-19a5-5bab5b196788
# ╠═01a22122-4061-11eb-393e-17c15f09e58d
# ╠═89db4130-3ec1-11eb-23ee-eff6d23c1588
# ╟─db32b16e-4061-11eb-23f0-7fdeaab0d0c8
# ╟─0661fdb0-4062-11eb-09d0-030a43180a2c
# ╟─df2e8540-4063-11eb-2266-7f423f03bd67
# ╠═a310902e-2b28-11eb-0455-add7ff7c8d6e
# ╠═f17bc160-2e46-11eb-0d65-cf6185b4f406
# ╠═2b104160-4e83-11eb-1a78-a96f77e1aff4
# ╠═449bb6f2-4e83-11eb-27ae-298352285e98
# ╠═df1998f0-4ea1-11eb-0626-dbead118373f
# ╠═10866060-5980-11eb-0422-e7300713c6a4
# ╠═4fee8610-5980-11eb-137a-83f4aa64e933
# ╠═83bb0590-5980-11eb-3159-b376954405ef
# ╟─285cf4e0-4064-11eb-3162-1b399c464a1a
# ╠═36b846d0-2024-11eb-3784-89a02343cd0b
# ╠═7216e720-411e-11eb-1103-19bf4993ef1e
# ╟─7f938250-411e-11eb-0d30-b53cf2c8bc97
# ╠═8d7b5280-28a0-11eb-282d-2dbf124460da
# ╟─15299390-411f-11eb-3b2b-257dc0eac258
# ╠═60f5f6b0-28a1-11eb-1b18-27bdfed23c8c
# ╟─39ae06b0-411f-11eb-01eb-b30511aec8cc
# ╠═827db480-411f-11eb-2eb3-b3239cc4a865
# ╠═8aab35fe-411f-11eb-27b2-6bc7d3dd5280
# ╠═f5521070-8f6f-11eb-3466-539ce423eb19
# ╠═642e89a0-8f71-11eb-0a01-07ade17b8c65
# ╠═20728fa0-8f70-11eb-2807-9bdb80c4b2f9
# ╠═1b8e6cc0-8f70-11eb-0e91-1101742b14a4
# ╟─7b6fd3d0-411f-11eb-3786-ff38ee7d0291
# ╠═4c5c7c22-28a0-11eb-0069-cb78e0e7e0ee
# ╠═870d3240-4120-11eb-0dca-89337e801493
# ╟─943f2fe2-4120-11eb-11a9-7785d11d3c36
# ╠═9fa322d0-32ff-11eb-2060-4b3e609d0d73
# ╠═caa56ba0-32ff-11eb-2008-91c24261ae53
# ╠═a8606bc0-3300-11eb-1487-6f229844f529
# ╠═ed8b55f0-4121-11eb-1a2b-a77bea8bfe7f
# ╠═f31331e0-28c2-11eb-1014-95ed88d77469
# ╠═807db3e2-4121-11eb-136d-ad470b83a46f
# ╠═8c376960-4121-11eb-1627-cf0d01bcf47b
# ╟─e8e79770-4121-11eb-2d54-0b27713454c8
# ╠═477e3750-3301-11eb-0bf0-3397364c4f91
# ╠═2a7498f0-4122-11eb-13d3-a5bff912453c
# ╟─0a8aeb00-411f-11eb-15cb-69ac5c16f683
# ╠═79b7bac0-3301-11eb-12ee-d1870258f287
# ╠═58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
