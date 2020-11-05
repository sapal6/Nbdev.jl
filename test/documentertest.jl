
using Test
include("../src/Documenter.jl")

@testset "Documenter" begin
    notebook=Documenter.run_and_update_nb("nbs\\02_documenter.jl")
    @show notebook.cells[1].output_repr
    @test notebook.cells[14].output_repr === "2"
end