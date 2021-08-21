using Test
include("../src/MakeDocs.jl")

@testset "makedocs" begin
    dir = joinpath(pwd(), "docs")
    file = joinpath(dir, "mkdocs.yml")

    if isfile(file)
        rm(file)
    end

    Makedocs.mkdocs_yml(dir)
    @test isfile(file) === true

end