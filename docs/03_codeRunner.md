need to have something tocapture output. This is useful when you wan tto have examples or capture test output in the docs.

We will use the macroprovided by the Suppresser package here

This is an exampl

Can also capture output of a functio

First we will create a sandbox to run our code.

We can use the `sandbox()` function in *Literate.jl* .

We also need something to execute our code. So, we will parse the code to be executed as a string and then pass the sanbox and the code-string to `include_string`. Then this code can be executed by `IOCapture` to capture the output and the error.

In case of an error, the build can be blocked later.

For code execution we will *re-use* the `Literate.execute_block` function by customizing the method. The resulting function would be different than the one provided by *Literate.jl* but is inspired by the sam

