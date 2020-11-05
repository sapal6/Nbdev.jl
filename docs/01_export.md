let's write the reult to a output file.

* Do notebook2script in any cell to take all the notebooks in the nbs folder and convert those to script.

* The output file should be same as the input file.
* The root directory should be same as the root of the input notebook.
* The directory should be root/src if it's a source code
* The directory should be root/test if it's a test code.
* The directory should be root/docs if it's mark down

`collect_codecells` will dispatch on two things
1. If it's *#export* then parse the code as string adn give it back.
2. If it's *md* or nothing then parse the code as string and then pass it onto a different function.
   1. This new function shall execute the markdown and push it to string then it keeps on appending the same till it encounters a cell with no marker.
    2. At this point things start to get interesting. 
    3. Any cell which doesn't start with *#export*, *#hide*, *md* should be considered as examples.
    4. Such cells should be contaenated together into a single string and then executed and the output concatenated into the same string as earlier markdown.
    5. The actual code of such cells should be wrapped in backticks.

> One thing to note is that whenever there is an error, the doc build stop

we will read files in the curren tpath whihc should be the /nbs folder in your project. Thie will host all your notebook

To export the required code, the following scenarios must be considered.

👉 Check if the file is in the src directory. If it's there then overwrite it. 


👉 If it's not there then create and then write

Next we need something which can be use din the same notebook cell where you are developing your code and it willexpor the required code to the src folde

