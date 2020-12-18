
using Test
include("../src/Documenter.jl")

#= @testset "Documenter" begin
    notebook=Documenter.run_and_update_nb("nbs\\02_documenter.jl")
    #@show notebook.cells[5].output_repr
    #@show notebook.cells[13].code
    #@show notebook.cells[9].output_repr
    #@test notebook.cells[14].output_repr === "2"

   #=  page=Documenter.createPage("02_documenter.jl", notebook)
    @show journal.sections[1] =#
end =#

@testset "Save page" begin
    notebook=Documenter.run_and_update_nb("nbs\\02_documenter.jl")
    page=Documenter.createPage("02_documenter.jl", notebook)
    
    @test page.name=="02_documenter.jl"
    Documenter.save_page(page, "./docs")
end
