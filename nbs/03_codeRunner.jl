### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ cc24b4ce-0eb1-11eb-38fb-55530877867a
#hide
include("../src/Export.jl")

# ╔═╡ 70e301b0-0c7e-11eb-119a-f3a0a39ff933
md"need to have something tocapture output. This is useful when you wan tto have examples or capture test output in the docs.

* take a notebook.
* create a fake server, fake client etc.
* update_and_run the notebook with pluto builtin.
* spit out the notebook."

# ╔═╡ 195b8ac0-1cff-11eb-1989-07908c56d612
#export
import Pluto: Notebook, Cell, Configuration, Notebook, ServerSession, ClientSession, update_run!, Cell, WorkspaceManager

# ╔═╡ fbe459e0-1cef-11eb-0c03-ffcf886af3f3
#export
import Pluto.PlutoRunner

# ╔═╡ bcb831c0-0e07-11eb-3958-4b88811cfae8
#export
function execute_code(notebook::Notebook)
	fakeserver=ServerSession()
	fakeclient = ClientSession(:fake, nothing)
	fakeserver.connected_clients[fakeclient.id] = fakeclient
	
	fakeclient.connected_notebook = notebook
	
	update_run!(fakeserver, notebook, notebook.cells)
	notebook
end

# ╔═╡ 63f13d10-0e0d-11eb-1442-f93b1f9beed9
#hide
Export.notebook2script()

# ╔═╡ Cell order:
# ╟─70e301b0-0c7e-11eb-119a-f3a0a39ff933
# ╠═195b8ac0-1cff-11eb-1989-07908c56d612
# ╠═fbe459e0-1cef-11eb-0c03-ffcf886af3f3
# ╠═cc24b4ce-0eb1-11eb-38fb-55530877867a
# ╠═bcb831c0-0e07-11eb-3958-4b88811cfae8
# ╠═63f13d10-0e0d-11eb-1442-f93b1f9beed9
