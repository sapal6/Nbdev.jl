
using Test
include("../src/Documenter.jl")

import Pluto: Notebook, Cell, load_notebook_nobackup



#= @testset "Documenter" begin
    notebook=Documenter.run_and_update_nb("nbs\\test.jl")
    println(notebook.cells[1].output.body)
    println("")
    println("")
    println(notebook.cells[4].output.body)
    println("")
    println("")
    println(notebook.cells[7].output.body)
    println("")
    println("")
    println(notebook.cells[8].output.body)
    println("")

    #this can be implemented as an algorithm.
    #if notebook.cells.body is a dict
    #get the elements
    #if it's a tuple
    #get the elements
    #then recurse thru it
    nb = notebook.cells[8].output.body
    println("dict elements")
    println(nb[:elements])
    println("")
    for i in nb[:elements]
        println(i)
        println(typeof(i))
        println("")
    end

   #=  page=Documenter.createPage("02_documenter.jl", notebook)
    @show journal.sections[1] =#
end =#

@testset "Save page" begin
    documenter_notebook=Documenter.run_and_update_nb(joinpath(pwd(), "nbs", "02_documenter.jl"))
    #export_notebook=Documenter.run_and_update_nb("nbs\\01_export.jl")
    documenter_page=Documenter.createPage("02_documenter.jl", documenter_notebook)
    #export_page=Documenter.createPage("01_export.jl", export_notebook)
    
    #@test documenter_page.name=="02_documenter.jl"
    #@test export_page.name=="01_export.jl"
    Documenter.save_page(documenter_page, joinpath(pwd(), "docs"))
    #Documenter.save_page(export_page, "./docs/docs")
end

#= @testset "export2md" begin
    #Documenter.export2md(["02_documenter.jl"], joinpath(pwd(), "docs"))
    Documenter.export2md()
end =#