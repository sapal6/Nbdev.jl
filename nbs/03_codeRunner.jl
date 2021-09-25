### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# ╔═╡ 086bff3e-6324-11eb-31cc-995e82c7b175
#hide
#hide
#for sharing environments between notebooks
begin
import Pkg
# activate the shared project environment
Pkg.activate(Base.current_project())
include("../src/Documenter.jl")
end

# ╔═╡ cc24b4ce-0eb1-11eb-38fb-55530877867a
#hide
include("../src/Export.jl")

# ╔═╡ 70e301b0-0c7e-11eb-119a-f3a0a39ff933
md"You need to have something to capture the output. This is useful when you want to have examples or capture test output in the docs.

I think the simplest way to do this is to do the following👇

* Take a notebook. 
* Create a fake server, fake client etc.
* Run the notebook cell by cell and update the notebook with the output.

This is taken straight from Pluto's webserver code"

# ╔═╡ 195b8ac0-1cff-11eb-1989-07908c56d612
#export
import Pluto: Notebook, Cell, Configuration, Notebook, ServerSession, ClientSession, update_run!, Cell, WorkspaceManager

# ╔═╡ fbe459e0-1cef-11eb-0c03-ffcf886af3f3
#export
import Pluto.PlutoRunner

# ╔═╡ fb233ac0-6322-11eb-0a09-b9ad1391f893
md"## execute_code "

# ╔═╡ bcb831c0-0e07-11eb-3958-4b88811cfae8
#export
#TODO:how to clean the child processes spawned by this process.
#also, executing the notebook this way prevents the tests to be
#executed in the notebook

"""
> execute_code(notebook::Notebook)--> This function does the following
> * Take a notebook. 
> * Create a fake server, fake client etc.
> * Run the notebook cell by cell and update the notebook with the output.
"""
function execute_code(notebook::Notebook)
	fakeserver=ServerSession()
	fakeclient = ClientSession(:fake, nothing)
	fakeserver.connected_clients[fakeclient.id] = fakeclient
	
	fakeclient.connected_notebook = notebook
	
	update_run!(fakeserver, notebook, notebook.cells)
	notebook
end

# ╔═╡ 2b204642-6324-11eb-05ac-8d9484a0c19e
Documenter.showDoc(execute_code)

# ╔═╡ 63f13d10-0e0d-11eb-1442-f93b1f9beed9
#hide
Export.notebook2script()

# ╔═╡ Cell order:
# ╠═70e301b0-0c7e-11eb-119a-f3a0a39ff933
# ╠═195b8ac0-1cff-11eb-1989-07908c56d612
# ╠═fbe459e0-1cef-11eb-0c03-ffcf886af3f3
# ╠═cc24b4ce-0eb1-11eb-38fb-55530877867a
# ╠═086bff3e-6324-11eb-31cc-995e82c7b175
# ╠═fb233ac0-6322-11eb-0a09-b9ad1391f893
# ╠═bcb831c0-0e07-11eb-3958-4b88811cfae8
# ╠═2b204642-6324-11eb-05ac-8d9484a0c19e
# ╠═63f13d10-0e0d-11eb-1442-f93b1f9beed9
