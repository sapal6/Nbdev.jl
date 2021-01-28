
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
    documenter_notebook=Documenter.run_and_update_nb("nbs\\02_documenter.jl")
    export_notebook=Documenter.run_and_update_nb("nbs\\01_export.jl")
    documenter_page=Documenter.createPage("02_documenter.jl", documenter_notebook)
    export_page=Documenter.createPage("01_export.jl", export_notebook)
    
    @test documenter_page.name=="02_documenter.jl"
    @test export_page.name=="01_export.jl"
    Documenter.save_page(documenter_page, "./docs")
    Documenter.save_page(export_page, "./docs")
end
