### A Pluto.jl notebook ###
# v0.14.4

using Markdown
using InteractiveUtils

# ╔═╡ 5ad12200-aede-11eb-1877-311d8ab18b53
function test()
	1+1
end

# ╔═╡ c05a85ee-2b1a-4366-abf7-06126b3310d3
test()

# ╔═╡ b24a6240-385f-4be7-8537-06931c1b8156
function fakearray()
	return ["a","b"]
end

# ╔═╡ dadbe247-36a1-4333-9316-806c941a14d2
fakearr=fakearray()

# ╔═╡ dd3e63e4-ae0e-4cc8-b9fd-c2371dab5fa6
eval(fakearr)

# ╔═╡ 801a404f-39b1-439c-90da-9ac3a3dab0a6
begin
struct fake
	fakelines:: Array
end
	
fake(lines) = fake(fakelines = lines)
end

# ╔═╡ 79e5e60f-b062-44b4-ae2f-7197ce833363
fake(fakearr)

# ╔═╡ 0b709d83-d43f-435f-9c00-599f1560d5cd
[[1,2], ["a","b"]]

# ╔═╡ af4518c3-2da5-4dae-97dc-6a4cd5063914
import Pluto: Notebook, Cell, load_notebook_nobackup

# ╔═╡ 06d23b04-c2b9-4642-a14f-e30404bfe87e
nb = load_notebook_nobackup("./test.jl")

# ╔═╡ Cell order:
# ╠═c05a85ee-2b1a-4366-abf7-06126b3310d3
# ╠═5ad12200-aede-11eb-1877-311d8ab18b53
# ╠═b24a6240-385f-4be7-8537-06931c1b8156
# ╠═dadbe247-36a1-4333-9316-806c941a14d2
# ╠═dd3e63e4-ae0e-4cc8-b9fd-c2371dab5fa6
# ╠═801a404f-39b1-439c-90da-9ac3a3dab0a6
# ╠═79e5e60f-b062-44b4-ae2f-7197ce833363
# ╠═0b709d83-d43f-435f-9c00-599f1560d5cd
# ╠═af4518c3-2da5-4dae-97dc-6a4cd5063914
# ╠═06d23b04-c2b9-4642-a14f-e30404bfe87e
