using Test
import Pluto: Notebook, Cell

include("../src/CodeRunner.jl")

@testset "CodeRunner" begin
    notebook = Notebook([
        Cell("x = 1"),
        Cell("y = x"),
        Cell("f(x) = x + y"),
        Cell("f(4)"),
    
        Cell("""begin
            g(a) = x
            g(a,b) = y
        end"""),
        Cell("g(6) + g(6,6)"),
    
        Cell("import Distributed"),
        Cell("Distributed.myid()"),
    ])

    nb=CodeRunner.execute_code(notebook)
    @test nb.cells[4].output_repr == "5"
end