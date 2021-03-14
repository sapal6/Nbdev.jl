### A Nbdev script file ###
### Autogenerated file. Don't modify. ###

module Documenter
#export
using Base.Docs

#export
using Markdown

#export
using ReusePatterns

#export
using Images, FileIO

#export
using PyCall

#export
using Publish

#export
include("../src/Export.jl")

#export
include("../src/ConfigReader.jl")

#export
include("../src/CodeRunner.jl")

#export
import Pluto: Notebook, Cell, load_notebook_nobackup

#export
begin
"""
> struct Section--> This is like the section of a page and is made up of one or multiple "lines".
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
> line(section::Section)--> Getter for accessing the underlying field "line".
"""
line(section::Section)=section.line
end

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
> sections--> Getter for accessing teh underlying field "sections" of Page.
"""
sections(p::Page)=p.sections
	
"""
> name--> Getter for accessing teh underlying field "name" of Page.
"""
name(p::Page)=p.name
end

#export
#TODO:This should be moved to a utility module
"""
> img(img_path::String)--> Helper function to load images within a notebook. This can be helpful to have images appear in the final document.
"""
function img(img_path::String)
	load(img_path)
end

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

#export
"""
> run_and_update_nb(file::AbstractString)--> Run the notebook in the supplied path and update the notebook with the output of each cell.
"""
function run_and_update_nb(file::AbstractString)
	notebook=load_notebook_nobackup(file)
	return CodeRunner.execute_code(notebook)
end

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
> stitchCode(cellop::AbstractString)--> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object
"""
function stitchCode(fdocs::FunctionDocs)
		funcdocs=""
		
		for fdoc in fdocs.funcDocs
		    funcdocs=string(funcdocs, "$(fdoc)\n\n")
	    end
		
		funcdocs
end
end

#export
"""
> collectFuncDocs(obj)--> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from teh docstrings). Creates aFunctionDocs type from these documents.
"""
function collectFuncDocs(obj)
	docs=doc(obj)
    fdocs=["$(docs.meta[:results][i].object)" for i=1:length(docs.meta[:results])]
	FunctionDocs(fdocs)
end

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

#export
"""
> CreatePage--> Creates the "Page" type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.
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

#export
begin
const _header = "<html>"
const _footer = "</html>"
end

#export
"""
> md2html(md)--> Tiny helper to format a markdown into html.
"""
md2html(md)=Markdown.html(md)

#export
begin
"""
> save_page(io, page::Page)--> Take the contents from a "Page" type and write to the io
"""
function save_page(io, page::Page)
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
> save_page(page::Page, path::String)--> Given a "Page" type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated
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

#export
begin
"""
> export2html(file::String, path::String)--> Generate document for a file in the given path
"""
function export2html(file::String, path::String)
	notebook=run_and_update_nb(joinpath("../nbs",file))
	page=createPage(file, notebook)
	save_page(page, path)
end

"""
> export2html(files::AbstractVector, path::String)--> Map the `export2html(file, path)` to a given vector of file.
"""
export2html(files::AbstractVector, path::String)=map(file->export2html(file, path), files)

"""
> export2html()--> Higher level API to generate documents for all the valid notebooks
"""
export2html()=export2html(Export.readfilenames(), "../docs")
end

#export
"""
> createtoc()--> Create the tableof contents and save that in toc.md inside docs directory
"""
function createtoc()
	docnames=[Export.strip(name, ".md") for name in readdir("../docs")]
	save_page(docnames)
end

end