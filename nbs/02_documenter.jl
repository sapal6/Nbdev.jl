### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ 4cb4aa50-3e01-11eb-3460-5f109773492b
#export
using Base.Docs

# ╔═╡ 6c0aeda1-81d7-469d-8443-bbf347feede6
#export
using TOML

# ╔═╡ 151ec8b0-2b27-11eb-1ec2-a7c5e4c13db9
#export
using Markdown

# ╔═╡ 07b9d565-4690-4e48-bcc2-05428b665ca1
#export
using Distributed

# ╔═╡ 77a9e510-4ae2-44a2-9536-17a89a54d6f6
#export
using ProgressMeter

# ╔═╡ 295d813f-1e85-4b2e-a953-1bd0087a85e2
#hide
using PlutoTest

# ╔═╡ 9930ad11-84da-45e0-95dc-f46c4d48174a
#hide
using PlutoUI

# ╔═╡ b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
#export
include("../src/Export.jl")

# ╔═╡ 27ff1d70-1201-11eb-2003-27cb52571be6
#export
include("../src/CodeRunner.jl")

# ╔═╡ 2bc37e16-7ff5-430b-b29c-571db5e9b6b5
#export
include("../src/Common.jl")

# ╔═╡ 1d83078e-2024-11eb-0e5f-51310d134662
#export
import Pluto: Notebook, Cell, load_notebook_nobackup

# ╔═╡ fcfaccaf-cc88-44bb-8971-c1328d8599ee
#hide
TableOfContents()

# ╔═╡ 25ff264e-3ec5-11eb-362c-07b4e24c635a
md"## Lower Level Entities(Structs, methods etc.) 
These are the objects on which nbdev's Documenter module was built. You can use it to extend nbdev but these are automtically used by Nbdev's internal engine to generate code files for you."

# ╔═╡ 28951cc5-0f45-48fc-965a-4257de0332fa
#noop
begin
f = joinpath("..", "Project.toml")
path = "https://github.com/sapal6/Nbdev.jl"
res = Dict("github_url" => "https://github.com/sapal6/Nbdev.jl")
end

# ╔═╡ c371d5ec-8d89-4f33-8b6d-9add8e15938f
#noop
@test Common.getsetting(f, "settings") == res

# ╔═╡ c099d54a-38df-46ee-8fb1-37c2b90c1df2
#noop
@test Common.getsettings(f, ["settings", "github_url"]) == res["github_url"]

# ╔═╡ bf4e47f0-3ec5-11eb-1b65-5fe2e7a88ff1
md"## Section type"

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

# ╔═╡ f1318ca0-3f97-11eb-3727-3f71064c77bf
md"## Example"

# ╔═╡ cfb6d710-3f97-11eb-31ed-6daa12cf592e
section=Section("This is a test line")

# ╔═╡ 610d9263-645a-46aa-8f16-12e90787b7bc
#noop
@test line(section) == "This is a test line"

# ╔═╡ 309585e2-3f93-11eb-0873-d9b0d7a6200e
md"## Page Type"

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

# ╔═╡ 8d851420-08af-11eb-26b0-63501c72011a
#hide
#cd("../nbs")

# ╔═╡ 9478dd20-08af-11eb-1663-a7db573d2187
#hide
pwd()

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
md"## run_and_update "

# ╔═╡ 8691e572-1918-11eb-011c-639d3617e076
#export
"""
> runandupdatenb(fn::AbstractString)--> Run the notebook in the supplied path and update the notebook with the output of each cell.
"""
function runandupdatenb(fn::AbstractString)
	nb=load_notebook_nobackup(fn)
	return CodeRunner.executecode(nb)
end

# ╔═╡ 5001a5b0-11ff-11eb-054a-6921da78afa3
md"`runandupdatenb` uses the `load_notebook_nobackup` function in Pluto.jl. There are multiple ways to achieve what this function achieves without depending on Pluto internals but for now this was the quickiest way to achieve this.

**Note-**Depending on Pluto internal to run and update a notebook makes it difficult to run unit test for this function from within pluto itself because a Pluto cell is treated as worker 2, 3 and so on but when you do load_notebook() then it spins up another worker. Only worker 1 can spwan further processes and not a notebook cell."

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
md"## stitchcode"

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
md"## Functiondocs"

# ╔═╡ 34ff4880-2b22-11eb-0eef-9bc7ab1aef8f
#export
begin
"""
> struct Functiondocs--> Stores the document of different objects.
> * funcdocs--> Array of strings.
"""
mutable struct Functiondocs
	funcdocs::Array{String, 1}
end

"""
> Functiondocs(funcdocs)--> Helper for accessing the FunctionDocs constructer.
"""
Functiondocs(funcdocs)=Functiondocs(funcdocs) 
end

# ╔═╡ d75486f0-2022-11eb-2d95-aded3418c079
#export
begin
        		

"""
> stitchcode(cell::Cell)--> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.
"""
function stitchcode(cell::AbstractArray)
	op=' '
	if length(cell) > 1
	    op=values(cell[2])
	end
	string("```","\n$(cell[1])\n","------\nOutput\n------\n","$(op)\n", "```\n")
end
	
"""
> stitchcode(cellop::AbstractString)--> Removes the quotes from a string and creates a code block with that string inside the newely formed code block
"""
function stitchcode(cellop::AbstractString)
	cleanedop=Export.strip(Export.strip(cellop,"\""), "\"")
	string("```","\n$cleanedop\n","```\n")
end
	
"""
> stitchcode(fdocs::Functiondocs)--> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object
"""
function stitchcode(fdocs::Functiondocs)
		funcdocs=""
		
		for fdoc in fdocs.funcdocs
		    funcdocs=string(funcdocs, "$(fdoc)\n\n")
	    end
		
		funcdocs
end
end

# ╔═╡ 931b9ab2-4060-11eb-219d-49b05ff3ca72
md"####  Example"

# ╔═╡ 4cd1f510-2b23-11eb-3051-072d6fb4e81c
begin
funcdocs=Functiondocs(["i", "j"])
funcdocs.funcdocs
end

# ╔═╡ 95219eb0-3e01-11eb-28d2-af58c55dfbd1
#hide
docs=@doc stitchcode

# ╔═╡ 83214680-3eb9-11eb-32bd-01e55390224e
#hide
"$(docs.meta[:results][1].object)"

# ╔═╡ 85446eb5-b22f-41f9-bb9c-be41a7479866
md"## collectfuncdocs"

# ╔═╡ e32bff29-cb7a-40b2-a512-e58f6143d506
#hide
search_url = "https://github-link.vercel.app/api?ghUrl=https://github.com/sapal6/Nbdev.jl/blob/master/src/Documenter.jl&q=Section"

# ╔═╡ d9a872f2-74d0-4f49-8505-b44f03dce3b9
#hide
pattern = r"\\(.+\\)*(.+)(\.jl)"

# ╔═╡ 3f171660-3ec1-11eb-0983-2789adeab1c3
#export
"""
> collectfuncdocs(obj)--> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from the docstrings). Creates aFunctionDocs type from these documents.
"""
function collectfuncdocs(obj)
	docs=doc(obj)
	searchurl = "https://github-link.vercel.app/api?ghUrl="
	giturl = Common.getsettings(joinpath("..", "Project.toml"), ["settings", "github_url"])

	pattern = r"\\(.+\\)*(.+)(\.jl)"
	fn = uppercasefirst(Export.strip(basename(join(match(pattern, string(first(methods(obj)))).captures)), r"[0-9_]"))
	
	searchurl = "$searchurl$giturl/blob/master/src/$fn&q=$(string(nameof(obj)))"
    fdocs=["$(docs.meta[:results][i].object) [source]($searchurl)" for i=1:length(docs.meta[:results])]
	Functiondocs(fdocs)
end

# ╔═╡ 0a4f347d-dd6b-493b-8473-249270209160
#hide
#TODO: use regex to extract filename from this
uppercasefirst(Export.strip(basename(join(match(pattern, string(first(methods(collectfuncdocs)))).captures)), r"[0-9_]"))

# ╔═╡ 94812075-ec9b-43da-97b6-80ca731fa0d5
#hide
string(first(methods(collectfuncdocs)))

# ╔═╡ 01a22122-4061-11eb-393e-17c15f09e58d
md"#### Example"

# ╔═╡ 89db4130-3ec1-11eb-23ee-eff6d23c1588
collectfuncdocs(stitchcode).funcdocs

# ╔═╡ db32b16e-4061-11eb-23f0-7fdeaab0d0c8
md"## Higher Level API"

# ╔═╡ 0661fdb0-4062-11eb-09d0-030a43180a2c
md"These higher level APIs can either be used directly or are already used internally by nbdev. One such functions which can be used directly is..."

# ╔═╡ df2e8540-4063-11eb-2266-7f423f03bd67
md"## showdoc"

# ╔═╡ a310902e-2b28-11eb-0455-add7ff7c8d6e
#export
begin
	
"""
> showdoc(o)--> Takes an object and builds markdown documentation.
"""
function showdoc(o)
	docs=collectfuncdocs(o)
	stitchcode(docs)
end
end

# ╔═╡ 0d10aed0-3f9b-11eb-1bcd-dbdb5e5068f4
showdoc(line)

# ╔═╡ 87c22750-3f94-11eb-201c-a3c6374881f4
showdoc(Page)

# ╔═╡ 41b87320-3f9b-11eb-1ed4-fdfefdc01627
showdoc(sections)

# ╔═╡ 48beb2b0-3f9b-11eb-2756-919a82c5c0de
showdoc(name)

# ╔═╡ a13c23a3-f9c1-41dd-850b-b1e99a80c26f
showdoc(runandupdatenb)

# ╔═╡ 59aca6d0-405f-11eb-2252-633f4d0ccdbc
showdoc(stitchcode)

# ╔═╡ bb865340-4061-11eb-065c-030bf004197f
showdoc(Functiondocs)

# ╔═╡ d038c980-4061-11eb-19a5-5bab5b196788
showdoc(collectfuncdocs)

# ╔═╡ f17bc160-2e46-11eb-0d65-cf6185b4f406
showdoc(showdoc)

# ╔═╡ 2b104160-4e83-11eb-1a78-a96f77e1aff4
#noop
begin
"""
> An example of a struct
"""
struct Mystruct
	name
end
end

# ╔═╡ 449bb6f2-4e83-11eb-27ae-298352285e98
mystruct=Mystruct("test")

# ╔═╡ df1998f0-4ea1-11eb-0626-dbead118373f
typeof(mystruct)

# ╔═╡ 26e54202-9cc7-4b8f-b5b4-d83f72547dbc
md"`showdoc(Mystruct)`"

# ╔═╡ e1d02746-3098-4832-af6c-81f99fab6ca5
showdoc(Mystruct)

# ╔═╡ 10866060-5980-11eb-0422-e7300713c6a4
md"Currently nbdev is unable to recognize the docstrings of inline expressions.👇"

# ╔═╡ 4fee8610-5980-11eb-137a-83f4aa64e933
#noop
"> inlinetest--> This is a inline test expression"
inlinetest=str->replace(str, "1"=> "one")

# ╔═╡ 83bb0590-5980-11eb-3159-b376954405ef
#hide
#showDoc(inlinetest)

# ╔═╡ 285cf4e0-4064-11eb-3162-1b399c464a1a
md"## createpage"

# ╔═╡ 36b846d0-2024-11eb-3784-89a02343cd0b
#export
begin
function maintainheading(str:: AbstractString)
	res= nothing
	if startswith(str, """<div class="markdown"><h2>""")
			res = Export.strip(Export.strip(Export.strip(str, """<div class="markdown"><h2>"""), """</h2>"""), """</div>""")
			res = string("## ", res)
	else
		res = str
	end
	res
end

"""
> CreatePage--> Creates the Page type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.
"""
function createpage(fn::AbstractString, nb::Notebook)
	sections=Section[]
	res=nothing
	
	for cell in nb.cells
		
		if cell.errored
			error("Build stopped. Seems like the code $(cell.code) has an error")
			break
	    end
	    if startswith(cell.code, "md")
			cleanop = maintainheading(cell.output.body)
			push!(sections, Section(cleanop))
		elseif !startswith(cell.code, "#export") && !startswith(cell.code, "#hide") 
			if occursin( "showdoc", cell.code)
				cleanedop=Export.strip(cell.output.body, "\"")
				cleanedop=replace(cleanedop, "\\n"=>"\n")
				push!(sections, Section(cleanedop))
			elseif occursin( "#noop", cell.code)
				stitchedcode=stitchcode([cell.code])
			    push!(sections, Section(stitchedcode))
			else
				stitchedcode=stitchcode([cell.code, cell.output.body])
			    push!(sections, Section(stitchedcode))
			end
		end
	end
	if !isempty(sections)
	    res=Page(sections, basename(fn))
	end
	
	return res
	
end
end

# ╔═╡ 7216e720-411e-11eb-1103-19bf4993ef1e
showdoc(createpage)

# ╔═╡ 7f938250-411e-11eb-0d30-b53cf2c8bc97
md"While generating document you don't need to call this function. This is done automatically😃 for you when nbdev generates documents."

# ╔═╡ 8d7b5280-28a0-11eb-282d-2dbf124460da
#hide
begin
const _header = "<html>"
const _footer = "</html>"
end

# ╔═╡ 7b6fd3d0-411f-11eb-3786-ff38ee7d0291
md"## savepage"

# ╔═╡ 4c5c7c22-28a0-11eb-0069-cb78e0e7e0ee
#export
begin

"""
> savepage(io, page::Page)--> Take the contents from a Page type and write to the io
"""
function savepage(io, page::Page)
		
	pageheading=uppercasefirst(Export.strip(Export.strip(page.name, r"[0-9_]"), r".jl"))

    println(io, "<h1>$pageheading</h1>")
	
	for section in page.sections
			println(io, section.line)
    end
		
end


"""
> savepage(page::Page, path::String)--> Given a Page type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated
"""
function savepage(page::Page, path::String)
	fn=lowercase(Export.strip(Export.strip(page.name, r"[0-9_]"), r".jl"))
	open(joinpath(path, fn*".md"), "w") do io
        savepage(io, page)
    end
end
end

# ╔═╡ 870d3240-4120-11eb-0dca-89337e801493
showdoc(savepage)

# ╔═╡ 943f2fe2-4120-11eb-11a9-7785d11d3c36
md"Nbdev calls the required method of `save_page` automatically during document generation."

# ╔═╡ ed8b55f0-4121-11eb-1a2b-a77bea8bfe7f
md"## export2md"

# ╔═╡ f31331e0-28c2-11eb-1014-95ed88d77469
#export
begin			
"""
> export2md(fn::String, path::String)--> Generate document for a file in the given path
"""
function export2md(fn::String, path::String)
	nb=runandupdatenb(fn)
	page=createpage(fn, nb)
	if page != nothing
	    savepage(page, path)
	end
end

"""
> export2md(fns::AbstractVector, path::String)--> Map the `export2md(file, path)` to a given vector of file.
"""
function export2md(fns::AbstractVector, path::String)
	n = length(fns)
	p = Progress(n, 1)
	for fn in fns
	  next!(p)
      export2md(fn, path)
	end
end

"""
> export2md()--> Higher level API to generate documents for all the valid notebooks
"""
export2md(nbsdir)=export2md(Export.readfilenames(joinpath(pwd(), nbsdir)), "docs")
end

# ╔═╡ 7081aafd-d6ef-4672-99b0-6080497e2498
#export
export showdoc, export2md

# ╔═╡ 807db3e2-4121-11eb-136d-ad470b83a46f
showdoc(export2md)

# ╔═╡ 0bf8a871-822a-4281-9186-2355751451d4
Export.readfilenames(joinpath(pwd()))

# ╔═╡ 8c376960-4121-11eb-1627-cf0d01bcf47b
md"The `export2md()` is what gets summoned when document generation is invoked. Like most things in nbdev (and unlike most things in life) this too gets invoked automatically. 🥳"

# ╔═╡ f69f6cba-4fa3-447c-9f8e-f9c5d1f8f7d5
#### export2readme

# ╔═╡ 15c1479b-8202-4d3c-8bdd-903c3c43775d
#hide
#joinpath(pwd(), "nbs/*index.jl")

# ╔═╡ 9c07bd79-f47e-4897-830b-63748f674335
#export
begin
"""
> export2readme()--> create readme from the contents of Index notebook
"""
function export2readme()
    cp(normpath(joinpath(".", "docs/index.md")), normpath(joinpath(".", "README.md")), force=true)
end 
end

# ╔═╡ 1d1e1c1f-75dc-4a72-ae01-9bc337afe14b
showdoc(export2readme)

# ╔═╡ 58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
#hide
Export.notebook2script(joinpath("..", "nbs"), joinpath("..", "src"))

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Distributed = "8ba89e20-285c-5b6f-9357-94700520ee1b"
Markdown = "d6f4376e-aef5-505a-96c1-9c027394607a"
Pluto = "c3e4b0f8-55cb-11ea-2926-15256bba5781"
PlutoTest = "cb4044da-4d16-4ffa-a6a3-8cad7f73ebdc"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
ProgressMeter = "92933f4c-e287-5a05-a399-4b506db050ca"
TOML = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[compat]
Pluto = "~0.16.1"
PlutoTest = "~0.2.0"
PlutoUI = "~0.7.10"
ProgressMeter = "~1.7.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Configurations]]
deps = ["ExproniconLite", "OrderedCollections", "TOML"]
git-tree-sha1 = "41d153a50b001a7c534f19e263540cca1a4e7cf3"
uuid = "5218b696-f38b-4ac9-8b61-a12ec717816d"
version = "0.16.4"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[ExproniconLite]]
git-tree-sha1 = "45b421f664eba4cd4bed8e5e706f69f2ccd8fcb3"
uuid = "55351af7-c7e9-48d6-89ff-24e801d99491"
version = "0.6.10"

[[FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[FuzzyCompletions]]
deps = ["REPL"]
git-tree-sha1 = "2cc2791b324e8ed387a91d7226d17be754e9de61"
uuid = "fb4132e2-a121-4a70-b8a1-d5b831dcdcc2"
version = "0.4.3"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "60ed5f1643927479f845b0135bb369b031b541fa"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.14"

[[HypertextLiteral]]
git-tree-sha1 = "72053798e1be56026b81d4e2682dbe58922e5ec9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.0"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[MsgPack]]
deps = ["Serialization"]
git-tree-sha1 = "a8cbf066b54d793b9a48c5daa5d586cf2b5bd43d"
uuid = "99f44e22-a591-53d1-9472-aa23ef4bd671"
version = "1.1.0"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "9d8c00ef7a8d110787ff6f170579846f776133a9"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.4"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[Pluto]]
deps = ["Base64", "Configurations", "Dates", "Distributed", "FileWatching", "FuzzyCompletions", "HTTP", "InteractiveUtils", "Logging", "Markdown", "MsgPack", "Pkg", "REPL", "Sockets", "TableIOInterface", "Tables", "UUIDs"]
git-tree-sha1 = "d4955d6b5267ed826d03e3f05cc23426492b23c9"
uuid = "c3e4b0f8-55cb-11ea-2926-15256bba5781"
version = "0.16.1"

[[PlutoTest]]
deps = ["HypertextLiteral", "InteractiveUtils", "Markdown", "Test"]
git-tree-sha1 = "92b8ae1eee37c1b8f70d3a8fb6c3f2d81809a1c5"
uuid = "cb4044da-4d16-4ffa-a6a3-8cad7f73ebdc"
version = "0.2.0"

[[PlutoUI]]
deps = ["Base64", "Dates", "HypertextLiteral", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "Suppressor"]
git-tree-sha1 = "26b4d16873562469a0a1e6ae41d90dec9e51286d"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.10"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "afadeba63d90ff223a6a48d2009434ecee2ec9e8"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.1"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[Suppressor]]
git-tree-sha1 = "a819d77f31f83e5792a76081eee1ea6342ab8787"
uuid = "fd094767-a336-5f1f-9728-57cf17d0bbfb"
version = "0.2.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableIOInterface]]
git-tree-sha1 = "9a0d3ab8afd14f33a35af7391491ff3104401a35"
uuid = "d1efa939-5518-4425-949f-ab857e148477"
version = "0.1.6"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "1162ce4a6c4b7e31e0e6b14486a6986951c73be9"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.2"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═4cb4aa50-3e01-11eb-3460-5f109773492b
# ╠═6c0aeda1-81d7-469d-8443-bbf347feede6
# ╠═151ec8b0-2b27-11eb-1ec2-a7c5e4c13db9
# ╠═07b9d565-4690-4e48-bcc2-05428b665ca1
# ╠═77a9e510-4ae2-44a2-9536-17a89a54d6f6
# ╠═b068dfd2-0eb3-11eb-109a-d1b6ef1eeca0
# ╠═1d83078e-2024-11eb-0e5f-51310d134662
# ╠═27ff1d70-1201-11eb-2003-27cb52571be6
# ╠═2bc37e16-7ff5-430b-b29c-571db5e9b6b5
# ╠═295d813f-1e85-4b2e-a953-1bd0087a85e2
# ╠═9930ad11-84da-45e0-95dc-f46c4d48174a
# ╠═fcfaccaf-cc88-44bb-8971-c1328d8599ee
# ╠═7081aafd-d6ef-4672-99b0-6080497e2498
# ╠═25ff264e-3ec5-11eb-362c-07b4e24c635a
# ╠═28951cc5-0f45-48fc-965a-4257de0332fa
# ╠═c371d5ec-8d89-4f33-8b6d-9add8e15938f
# ╠═c099d54a-38df-46ee-8fb1-37c2b90c1df2
# ╠═bf4e47f0-3ec5-11eb-1b65-5fe2e7a88ff1
# ╠═5a2e9790-201f-11eb-0df4-f90b3cc54f20
# ╠═0d10aed0-3f9b-11eb-1bcd-dbdb5e5068f4
# ╠═f1318ca0-3f97-11eb-3727-3f71064c77bf
# ╠═cfb6d710-3f97-11eb-31ed-6daa12cf592e
# ╠═610d9263-645a-46aa-8f16-12e90787b7bc
# ╠═309585e2-3f93-11eb-0873-d9b0d7a6200e
# ╠═28a4e100-17ac-11eb-172c-2d0e73460caa
# ╠═87c22750-3f94-11eb-201c-a3c6374881f4
# ╠═41b87320-3f9b-11eb-1ed4-fdfefdc01627
# ╠═48beb2b0-3f9b-11eb-2756-919a82c5c0de
# ╠═997a4950-3f94-11eb-2e66-d9a70cc175d1
# ╠═ea16dab0-3f97-11eb-19b5-0f4998ba3e39
# ╠═11057000-3f98-11eb-27aa-ffb097ca25ed
# ╠═7e959872-421d-11eb-3784-2f110840a628
# ╠═dd721172-4443-11eb-3833-3f74ff47dd42
# ╠═8d851420-08af-11eb-26b0-63501c72011a
# ╠═9478dd20-08af-11eb-1663-a7db573d2187
# ╠═74879c7e-0eeb-11eb-31bf-251621d154a6
# ╠═e2952860-1ade-11eb-20ca-091a45fab2f2
# ╠═d9fffed0-2f3f-11eb-16b4-4b2778f792d9
# ╠═2fc24ff0-11f7-11eb-18a8-1b2b989fa189
# ╠═743238d0-1918-11eb-3dfc-6f30db92923c
# ╠═8691e572-1918-11eb-011c-639d3617e076
# ╠═5001a5b0-11ff-11eb-054a-6921da78afa3
# ╠═a13c23a3-f9c1-41dd-850b-b1e99a80c26f
# ╠═f1d7ed22-1f8a-11eb-035d-6de2cb48bb8b
# ╠═6b9cb0f0-1f5e-11eb-1e15-9f0c8295b59f
# ╠═c3d2cf20-1f8b-11eb-0381-01270b1494b3
# ╠═1d71bb00-1f8b-11eb-31de-69aebd625201
# ╠═bda9c5a0-1f8a-11eb-396b-97f97add91db
# ╠═d75486f0-2022-11eb-2d95-aded3418c079
# ╠═59aca6d0-405f-11eb-2252-633f4d0ccdbc
# ╠═00989200-25d6-11eb-3139-8dd2ca0346f8
# ╠═363dc920-25d6-11eb-37d7-b5ade368658f
# ╠═9bf47390-25d6-11eb-1c3a-1d305aeb1c06
# ╠═19ab31e0-4060-11eb-0417-131e3a1f5a5e
# ╠═34ff4880-2b22-11eb-0eef-9bc7ab1aef8f
# ╠═bb865340-4061-11eb-065c-030bf004197f
# ╠═931b9ab2-4060-11eb-219d-49b05ff3ca72
# ╠═4cd1f510-2b23-11eb-3051-072d6fb4e81c
# ╠═95219eb0-3e01-11eb-28d2-af58c55dfbd1
# ╠═83214680-3eb9-11eb-32bd-01e55390224e
# ╠═85446eb5-b22f-41f9-bb9c-be41a7479866
# ╠═e32bff29-cb7a-40b2-a512-e58f6143d506
# ╠═d9a872f2-74d0-4f49-8505-b44f03dce3b9
# ╠═0a4f347d-dd6b-493b-8473-249270209160
# ╠═94812075-ec9b-43da-97b6-80ca731fa0d5
# ╠═3f171660-3ec1-11eb-0983-2789adeab1c3
# ╠═d038c980-4061-11eb-19a5-5bab5b196788
# ╠═01a22122-4061-11eb-393e-17c15f09e58d
# ╠═89db4130-3ec1-11eb-23ee-eff6d23c1588
# ╟─db32b16e-4061-11eb-23f0-7fdeaab0d0c8
# ╠═0661fdb0-4062-11eb-09d0-030a43180a2c
# ╠═df2e8540-4063-11eb-2266-7f423f03bd67
# ╠═a310902e-2b28-11eb-0455-add7ff7c8d6e
# ╠═f17bc160-2e46-11eb-0d65-cf6185b4f406
# ╠═2b104160-4e83-11eb-1a78-a96f77e1aff4
# ╠═449bb6f2-4e83-11eb-27ae-298352285e98
# ╠═df1998f0-4ea1-11eb-0626-dbead118373f
# ╠═26e54202-9cc7-4b8f-b5b4-d83f72547dbc
# ╠═e1d02746-3098-4832-af6c-81f99fab6ca5
# ╠═10866060-5980-11eb-0422-e7300713c6a4
# ╠═4fee8610-5980-11eb-137a-83f4aa64e933
# ╠═83bb0590-5980-11eb-3159-b376954405ef
# ╠═285cf4e0-4064-11eb-3162-1b399c464a1a
# ╠═36b846d0-2024-11eb-3784-89a02343cd0b
# ╠═7216e720-411e-11eb-1103-19bf4993ef1e
# ╠═7f938250-411e-11eb-0d30-b53cf2c8bc97
# ╠═8d7b5280-28a0-11eb-282d-2dbf124460da
# ╠═7b6fd3d0-411f-11eb-3786-ff38ee7d0291
# ╠═4c5c7c22-28a0-11eb-0069-cb78e0e7e0ee
# ╠═870d3240-4120-11eb-0dca-89337e801493
# ╠═943f2fe2-4120-11eb-11a9-7785d11d3c36
# ╠═ed8b55f0-4121-11eb-1a2b-a77bea8bfe7f
# ╠═f31331e0-28c2-11eb-1014-95ed88d77469
# ╠═807db3e2-4121-11eb-136d-ad470b83a46f
# ╠═0bf8a871-822a-4281-9186-2355751451d4
# ╠═8c376960-4121-11eb-1627-cf0d01bcf47b
# ╠═f69f6cba-4fa3-447c-9f8e-f9c5d1f8f7d5
# ╠═15c1479b-8202-4d3c-8bdd-903c3c43775d
# ╠═9c07bd79-f47e-4897-830b-63748f674335
# ╠═1d1e1c1f-75dc-4a72-ae01-9bc337afe14b
# ╠═58b6fa50-0ba8-11eb-1ccf-1328cbe524b4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
