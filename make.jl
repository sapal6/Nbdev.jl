using Fire

include("src/Documenter.jl")
include("src/Export.jl")

"""
Build documents for your project\n
usage - In your project root type\n
        julia make.jl docs
"""
@main function build(arg="docs")
	error_msg = "Wrong option.\nPlease type ```julia make.jl --help```for usage details"
	if arg == "docs"
		Documenter.export2md()
		Documenter.export2readme()
	else
		print(error_msg)
	end
end