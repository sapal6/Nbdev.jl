### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# ╔═╡ dc62b0c0-0c7e-11eb-2d24-077cf0f1cc0e
#export
using IOCapture

# ╔═╡ cc24b4ce-0eb1-11eb-38fb-55530877867a
#hide
include("../src/01_export.jl")

# ╔═╡ 70e301b0-0c7e-11eb-119a-f3a0a39ff933
md"need to have something tocapture output. This is useful when you wan tto have examples or capture test output in the docs.

We will use the macroprovided by the Suppresser package here."

# ╔═╡ 40edd360-0e07-11eb-3fdc-d7fe19620e7b
#export
import Literate: sandbox, execute_code

# ╔═╡ f1facc10-0c7e-11eb-10a8-2b8514baa205
md"This is an example"

# ╔═╡ 1c1af240-0c7f-11eb-014a-0f2a81442102
md"Can also capture output of a function"

# ╔═╡ 8f65695e-0c7f-11eb-18a5-e93ce7b5e36d
peanutFunction(peanut)=md"$peanut"

# ╔═╡ 2a3fb452-0c7f-11eb-2ede-bf620eaccf55
cap = iocapture() do
           peanutFunction("🥜")
       end;

# ╔═╡ c05ea4a0-0c7f-11eb-2d5a-f578b4b1e770
cap.value, cap.output

# ╔═╡ eff7c122-0d23-11eb-171c-8d306c21d5bd
op=peanutFunction("🥜")

# ╔═╡ f8e6bde0-0d23-11eb-28b7-e599830de301
op

# ╔═╡ aec03a40-0c81-11eb-1c71-b76dddf71f15
md"First we will create a sandbox to run our code.

We can use the `sandbox()` function in *Literate.jl* .

We also need something to execute our code. So, we will parse the code to be executed as a string and then pass the sanbox and the code-string to `include_string`. Then this code can be executed by `IOCapture` to capture the output and the error.

In case of an error, the build can be blocked later.

For code execution we will *re-use* the `Literate.execute_block` function by customizing the method. The resulting function would be different than the one provided by *Literate.jl* but is inspired by the same"

# ╔═╡ bcb831c0-0e07-11eb-3958-4b88811cfae8
#export
function executeBlock(sb, block::String)
    capture = iocapture() do
                            include_string(sb, block)
                         end
    return capture.value, capture.output
end

# ╔═╡ 63f13d10-0e0d-11eb-1442-f93b1f9beed9
notebook2script()

# ╔═╡ Cell order:
# ╟─70e301b0-0c7e-11eb-119a-f3a0a39ff933
# ╠═cc24b4ce-0eb1-11eb-38fb-55530877867a
# ╠═dc62b0c0-0c7e-11eb-2d24-077cf0f1cc0e
# ╠═40edd360-0e07-11eb-3fdc-d7fe19620e7b
# ╟─f1facc10-0c7e-11eb-10a8-2b8514baa205
# ╟─1c1af240-0c7f-11eb-014a-0f2a81442102
# ╠═8f65695e-0c7f-11eb-18a5-e93ce7b5e36d
# ╠═2a3fb452-0c7f-11eb-2ede-bf620eaccf55
# ╠═c05ea4a0-0c7f-11eb-2d5a-f578b4b1e770
# ╠═eff7c122-0d23-11eb-171c-8d306c21d5bd
# ╠═f8e6bde0-0d23-11eb-28b7-e599830de301
# ╟─aec03a40-0c81-11eb-1c71-b76dddf71f15
# ╠═bcb831c0-0e07-11eb-3958-4b88811cfae8
# ╠═63f13d10-0e0d-11eb-1442-f93b1f9beed9
