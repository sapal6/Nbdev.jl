### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ 74a36b30-1478-11eb-2747-454b32cbbcfa
#export
using ReusePatterns

# ╔═╡ 0aecd4c0-0e14-11eb-1619-4f5e0ced1279
#export
import Pluto: Notebook, load_notebook

# ╔═╡ 5babb7fe-0e13-11eb-27e1-df7f70862c78
md"let's write the reult to a output file.

* Do notebook2script in any cell to take all the notebooks in the nbs folder and convert those to script.

* The output file should be same as the input file.
* The root directory should be same as the root of the input notebook.
* The directory should be root/src if it's a source code
* The directory should be root/test if it's a test code.
* The directory should be root/docs if it's mark down."

# ╔═╡ d2a442c0-0eb2-11eb-1ea8-d507d9145823
#export
function processMdChunk(mdChunk::String)
	chopMdMarker(mdChunk)
end

# ╔═╡ 414e7dd0-0eb3-11eb-2a46-f173cbe1b3f3
#export
function read_nb(filename::String)
	load_notebook(filename)
end

# ╔═╡ 6ff1ad80-1479-11eb-3868-0df000f47cc9
md"create a new struct which would extend the Notebook type. This would store the executed cell if any.

for example executed markdown and the executed code output(if any) else this new field will have nothing.

This new notebook type will give a blueprint which can then be used to write contents to a files."

# ╔═╡ d17ebf90-1486-11eb-0d41-b967a8ab82ba
#export
@quasiabstract struct Nb
	notebook::Notebook
	output::String
end

# ╔═╡ 25bfe460-1489-11eb-156c-694cd37203d9
#export
@forward((Nb, :notebook), Notebook)

# ╔═╡ 875b4f50-148b-11eb-11f8-d59330489f7e
md"now any method which was described for Notebook can acceptNb"

# ╔═╡ 9965e9f0-1542-11eb-18ee-9b75b6f08df2
Nb(load_notebook("01_export.jl"), "testfunc")

# ╔═╡ 984a07b0-0eb5-11eb-14e8-7be4b6d05010
md"`collect_codecells` will dispatch on two things
1. If it's *#export* then parse the code as string adn give it back.
2. If it's *md* or nothing then parse the code as string and then pass it onto a different function.
   1. This new function shall execute the markdown and push it to string then it keeps on appending the same till it encounters a cell with no marker.
    2. At this point things start to get interesting. 
    3. Any cell which doesn't start with *#export*, *#hide*, *md* should be considered as examples.
    4. Such cells should be contaenated together into a single string and then executed and the output concatenated into the same string as earlier markdown.
    5. The actual code of such cells should be wrapped in backticks.

> One thing to note is that whenever there is an error, the doc build stops"

# ╔═╡ d4daaac0-0eb2-11eb-1d4d-7763fcfc0ed2
#export
function collect_codecells(filename::String,marker::String)
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

# ╔═╡ b9a15e60-0e13-11eb-199d-f50a49f5bc44
md"we will read files in the curren tpath whihc should be the /nbs folder in your project. Thie will host all your notebooks"

# ╔═╡ cdada98e-0e13-11eb-30aa-1777efffb181
#export
begin
function readfilenames()
	files=readdir()
	files
end

function readfilenames(dir::String)
	files=cd(readdir, dir)
	files
end
end

# ╔═╡ e46146c0-0eb2-11eb-0c7f-df5be4faaf93
function show_output(file_path::String, file::String)
	if isfile(file_path)
		@show "$file exported"
	end
end

# ╔═╡ cb628870-0e10-11eb-07de-d9d02ab46356
md"To export the required code, the following scenarios must be considered.

👉 Check if the file is in the src directory. If it's there then overwrite it. 


👉 If it's not there then create and then write."

# ╔═╡ fd7522f0-0e10-11eb-0ccf-f54d9cb67b79
#export
function export_Code(file::String, code_cells)
	io=IO
    open(file, "w") do io
		for code in code_cells
            print(io, code*"\n\n")
        end
	end
end

# ╔═╡ 6d43b250-0ed8-11eb-20de-11e869516ccf
#export
begin
function export_file(file, path::String, marker::String)
	    code_cells=collect_codecells(file, marker)
		file_path=joinpath(path,file)
        export_Code(file_path, code_cells)
end
end

# ╔═╡ 41d65310-0e11-11eb-1a36-87dc9ac941fa
#export
function export_content(files::AbstractVector, path::String, marker::String)
	map(file->export_file(file, path, marker), files)
end

# ╔═╡ 01608690-0e14-11eb-3faa-9b960f57f3fe
#export
function getfile_extension(filename)
    return filename[findlast(isequal('.'),filename):end]
end

# ╔═╡ b34f9d82-0ede-11eb-0f08-afa0cc898e80
#export
#TODO: Too many loops. Need to clear this either 
#by broadcasting or something more efficient
#TODO: User should eb able to get messages about which
#files are updated
#TODO: currently output inside loop is not shown in pluto notebooks.
#so, the show_output displays all stuffs in the console.
#maybe a progress bar would be better
function notebook2script()
	files=[file for file in readfilenames() if getfile_extension(file)== ".jl"]
	export_content(files, "../src", "#export")
end

# ╔═╡ baf3f1d0-0ede-11eb-2c02-1f53ed1a6cd7
notebook2script()

# ╔═╡ Cell order:
# ╠═74a36b30-1478-11eb-2747-454b32cbbcfa
# ╠═0aecd4c0-0e14-11eb-1619-4f5e0ced1279
# ╟─5babb7fe-0e13-11eb-27e1-df7f70862c78
# ╠═d2a442c0-0eb2-11eb-1ea8-d507d9145823
# ╠═414e7dd0-0eb3-11eb-2a46-f173cbe1b3f3
# ╟─6ff1ad80-1479-11eb-3868-0df000f47cc9
# ╠═d17ebf90-1486-11eb-0d41-b967a8ab82ba
# ╠═25bfe460-1489-11eb-156c-694cd37203d9
# ╠═875b4f50-148b-11eb-11f8-d59330489f7e
# ╠═9965e9f0-1542-11eb-18ee-9b75b6f08df2
# ╟─984a07b0-0eb5-11eb-14e8-7be4b6d05010
# ╠═d4daaac0-0eb2-11eb-1d4d-7763fcfc0ed2
# ╟─b9a15e60-0e13-11eb-199d-f50a49f5bc44
# ╠═cdada98e-0e13-11eb-30aa-1777efffb181
# ╠═e46146c0-0eb2-11eb-0c7f-df5be4faaf93
# ╟─cb628870-0e10-11eb-07de-d9d02ab46356
# ╠═fd7522f0-0e10-11eb-0ccf-f54d9cb67b79
# ╠═6d43b250-0ed8-11eb-20de-11e869516ccf
# ╠═41d65310-0e11-11eb-1a36-87dc9ac941fa
# ╠═01608690-0e14-11eb-3faa-9b960f57f3fe
# ╠═b34f9d82-0ede-11eb-0f08-afa0cc898e80
# ╠═baf3f1d0-0ede-11eb-2c02-1f53ed1a6cd7
