<h1>Tutorial</h1>
## First steps
<p>Use this <a href="https://github.com/sapal6/nbdev.jl-template.git">template</a> to create a new repository. This will create a repository with the directory structure required for nbdev.</p>

<div class="markdown"><div class="admonition note"><p class="admonition-title">Note</p></div>
<p><em>Right now nbdev is highly opinionated about the folder structure like presence of &quot;src&quot; and &quot;docs&quot; directory.</em></p>
</div>
<div class="markdown"><div class="admonition tip"><p class="admonition-title">Tip</p></div>
<p><em>Refer to this <a href="https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template">link</a> to understand how to use a template repository.</em></p>
</div>
## First notebook

<div class="markdown"><p>As a first steps clone your repository to your local machine. </p>
<p>Once you have cloned the repository, start Pluto the usual way as you use to do and create a notebook inside the &quot;nbs&quot; directory.</p>
<p>Each Pluto notebook maintains it&#39;s own environment. You can directly import a package and Pluto will install it from the registry. However, in our case Nbdev.jl is not yet registered. So, you can install Nbdev in the following way</p>
</div>
<div class="markdown"><p>In the first cell of your notebook type in the following code 👇</p>
</div>
```
begin
import Pkg
Pkg.add(url="https://github.com/sapal6/nbdev.jl.git")
end
------
Output
------

```

<div class="markdown"><p>This will install Nbdev in our notebook environment.</p>
</div>
<div class="markdown"><div class="admonition note"><p class="admonition-title">Note</p></div>
<p><em>If you don&#39;t want to install Nbdev as part of every notebook that you create in your project, then you can follow the other options to install packages for your notebook projects by following the instructions in the <a href="https://github.com/fonsp/Pluto.jl/wiki/&#37;F0&#37;9F&#37;8E&#37;81-Package-management">Pluto wiki</a>.</em></p>
</div>
<div class="markdown"><p>Once Nbdev is installed, import the package in the usual way.</p>
</div>
```
using Nbdev
------
Output
------

```

## Start building your project

<div class="markdown"><p>There are some anchors which tell Nbdev about which portion of your notebook should be exported as code, which portion should be part of documentation and which portion should not be touched.</p>
</div>
<div class="markdown"><h3>#export</h3>
</div>
<div class="markdown"><p>when you put the comment #export at the begining of a cell, it tells nbdev to export that cell as a code into the source file.</p>
</div>
<div class="markdown"><pre><code>#export
function some_func&#40;x&#41;
	x&#43;1
end</code></pre>
</div>
<div class="markdown"><p>Nbdev will now put the above cell as part of the source file &#40;with the same name as the current notebook&#41; inside the src directory.</p>
</div>
<div class="markdown"><h3>#hide</h3>
</div>
<div class="markdown"><p>Suppose that you have included soem cells as par of experment while developing your package but you want that the cell should neither be exported as a code nor that should be exported as part of documentation.</p>
<p>In such a case use the <code>#hide</code> anchor at the begining of the cell.</p>
</div>
<div class="markdown"><pre><code>#hide
my_experiment &#61; 1&#43;1</code></pre>
</div>
<div class="markdown"><p>such a cell won&#39;t be exported.</p>
</div>
<div class="markdown"><p>Any other cell which neither has the <code>#hide</code> nor the <code>#export</code> anchor, is exported as an example block. For such a block the cell is executed and the output is captured.</p>
<p>The output and the code of an example cell appears in the final document.</p>
</div>
## Docstrings

<div class="markdown"><p>Define a docstring for functions, structs etc. and use the special function <code>showDoc</code> to document that function or struct</p>
</div>
```
"""
> This is a function docstring
""" 
function some_func()
	1+1
end
------
Output
------
Main.workspace2.some_func
```

<div class="markdown"><p><code>showDoc&#40;some_func&#41;</code> would show the function like this 👇</p>
</div>
> This is a function docstring




## Exporting code

<div class="markdown"><p>Once you are done with your notebook and you can run <code>notebook2script&#40;&#41;</code>. This reads the current notebook in the &quot;nbs&quot; folder, scrubs out all the cells which are do not start with <code>#export</code> and creates a module file in the src folder.</p>
<p>The module file in the src folder will have the same name as the current file with the first letter in uppercase.</p>
<p>The exported code file automatically has all the code inside the module with the same name as the file.</p>
<p>For example, the exported source code file would have the following structure 👇</p>
<pre><code>module Example

function some_func&#40;x&#41;
    x&#43;1
end

end</code></pre>
</div>
<div class="markdown"><p>Once you are happy with the code you can export the source code by calling </p>
<p><code>notebook2script&#40;nbs_dir, src_dir&#41;</code></p>
<p>Here &quot;nbs<em>dir&quot; is the directory where your notebooks are stored and the &quot;src</em>dir&quot; is the directory where you want your source code files to be exported. This is usually the <code>src</code> directory.</p>
</div>
## Building documentation

<div class="markdown"><p>Do not forget to edit the &quot;index&quot; notebook available in the &quot;nbs&quot; folder. This notebook would be used as your homepage and the contents of this notebook are also used in the README file.</p>
</div>
<div class="markdown"><div class="admonition note"><p class="admonition-title">Note</p></div>
<p><em>You will get the index notebook in the nbs directory when you create a new project using the nbdev template.</em></p>
</div>
<div class="markdown"><p>To build documentation, goto the project root and launch the Julia prompt and then import Nbdev with <code>import Nbdev</code> and then call the following function <code>Nbdev.build&#40;&lt;your notebook directory&#41;</code>. Your code at the Julia prompt should look like this </p>
<pre><code>import Nbdev
Nbdev.build&#40;&quot;nbs&quot;&#41;</code></pre>
<p>This will run all your notebooks in the notebook directory &#40;/nbs usually&#41; and pick up the cells which are not marked as <code>#export</code> or #hide and then create markdown files in the <code>/docs</code> directory.</p>
</div>
## Creating the Table of contents

<div class="markdown"><p>The default configuration in the &quot;mkdocs.yml&quot; file &#40;available to you when you create your repository from the template&#41; contains all the necessary default configuration required to create you project page.</p>
<p>In order to test how your website looks like, go to the project root and type <code>mkdocs serve</code> . This would serve the project documentation to view locally &#40;localhost&#41;.</p>
<p>The table of contents in the default case would be created by mkdocs on the basis of the documents available under the &quot;docs&quot; directory.</p>
<p>If you want to give your own spin to the table of contents then add a config similar to the following in the mkdocs.yml file–&gt;</p>
<pre><code>nav:
    - Home: index.md
    - Docs:
      - Nav1: nav1.md
      - Nav2: nav2.md</code></pre>
</div>
<div class="markdown"><div class="admonition note"><p class="admonition-title">Note</p></div>
<p><em>Make sure that the &quot;Home&quot; navigation should always be the index.md file</em></p>
</div>
<div class="markdown"><p>For more details about setting up navigation refer <a href="https://www.mkdocs.org/user-guide/writing-your-docs/">this</a> and <a href="https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown/?h&#61;table&#43;con&#43;of#table-of-contents">this</a> </p>
</div>
## Other required edits

<div class="markdown"><p>In the mkdocs.yml file, edit the &quot;site<em>name&quot; config to the name that you want to give to your site. The &quot;repo</em>url&quot; and &quot;repo_name&quot; should be your git repository url and the name of your git repository respectively.</p>
</div>
## Optional edits

<div class="markdown"><p>There are loads f other optional edits which you can make to the config file in order to customize your project website. Refer the documentation <a href="https://squidfunk.github.io/mkdocs-material/getting-started/">here</a> to know about the other options.</p>
</div>
## Publishing your project website

<div class="markdown"><p>The first step is to checkin all your project contents to your repoitory. As soon as you push your changes to the remote branch, the github action &#40;placed under &quot;/.github/workflows&quot; creates a new &quot;gh-pages&quot; branch under your project repository, builds the project webpages and pushes the created pages to the &quot;&quot;gh-pages&quot; branch.</p>
<p>If you go to the &quot;Actions&quot; tab in your github repository then you can view the Action under the &quot;All workflows&quot; section. Here, a green tick mark before the action name suggests that all went fine.</p>
<p>Now, go to the Settings tab in your repository, click on Pages menu item from the left menu and in the &quot;Source&quot; drop-down select &quot;gh-pages&quot; as the source and root as the source folder, Click on save.</p>
<p>A detailed step by step description about configuring github pages can be read <a href="https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site">here</a>.</p>
<p>You project website would be published at the following url –&gt; &quot;&lt;username&gt;.github.io/&lt;project reporsitory name&gt;&quot;</p>
</div>
