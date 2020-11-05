Literate does a good job in exporting files to script.

But it does not give you control out of box to select what you want to export

Literat edoes however gives you flexibility to add your own pre-processing steps.

Let's see if we can customize it.

For our purpose we don't want the following as of now.

1. Export whatever is marked with *#export

""The code cells for a markdown content is like `md"this is markdown"`.

When we wrap this inside the `html()` then it spits out the respective html content."

let's write the reult to a output file.

* Do notebook2script in any cell to take all the notebooks in the nbs folder and convert those to script.

* The output file should be same as the input file.
* The root directory should be same as the root of the input notebook.
* The directory should be root/src if it's a source code
* The directory should be root/test if it's a test code.
* The directory should be root/docs if it's mark down

we will read files in the curren tpath whihc should be the /nbs folder in your project. Thie will host all your notebook

To export the required code, the following scenarios must be considered.

👉 Check if the file is in the src directory. If it's there then overwrite it. 


👉 If it's not there then create and then write

Next we need something which can be use din the same notebook cell where you are developing your code and it willexpor the required code to the src folde

