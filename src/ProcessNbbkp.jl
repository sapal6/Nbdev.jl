### A Nbdev script file ###
### Autogenerated file. Don't modify. ###

module ProcessNbbkp
#export
import Pluto: load_notebook_nobackup

#export
function read_nb(filename::String)
	load_notebook_nobackup(filename)
end

#export
function chopMdMarker(str::String)
	chop(str, head = 3, tail = 2)
end

#export
function processMdChunk(mdChunk::String)
	chopMdMarker(mdChunk)
end

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

end