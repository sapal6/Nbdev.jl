# Nbdev
This project is an attempt to port fastai [Nbdev](https://github.com/fastai/nbdev) to Julia. Nbdev(both the oriignal version and the Julia version) are based on the idea of using Notebooks for literate programming. 

On a very high level the base idea is this 👇

![nbdev.png](/docs/docs/images/nbdev.png)

While both projects try to achieve the same base goal i.e. generating source code and documentation from Notebooks, the Julia version aims to start from Pluto notebook while the python version starts from a Jupyter notebook. 

On the documentation side, I am using Mkdocs as the document generator while the original version uses Jekyll as the static site generator of choice.

# How far this project has come📖
Well! at the current stage I would say that right now it's still an MVP in progress. There are lots of things which needs to be done to make it a minimum viable working example. Some of these include but not restricted to -->

* Plumbing work for code(cleanup etc.)
* Pre-defined customization of theme for documentation(I amusing the Material theme for Mkdocs.)
* Automatic creation of table of content for the generated document.
* Automatic deployment of documentation to github pages.
* A minimal CLI.

# What about contributing 🤝
There are lots of things to be done in Nbdev. Code, documentations, tests, writing a starter tutorial etc. However, before starting out I would recommend to go through the notebooks in the `/nbs` directory in the project root. Nbdev is being written in nbdev itself. So, the notebooks in the 'nbs' directory contains the source code as well as the code documentation.

Ultimately these notebooks will be used by nbdev to generate code files and documentation site but currently the dev documents are yet to be deployed to github pages. So, for the time being the notebooks are a starting point to know more about this project.

In case if you happen to have any ideas to implement or any improvement suggestion then the project's discussion page is the best place to start a new topic.

So far I don't have a concrete list of TODO for Nbdev but I will post something soon.


```python

```
