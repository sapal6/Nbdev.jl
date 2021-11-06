<h1>Developerguide</h1>
<div class="markdown"><p>First of all, thank you for having a look into Nbdev. If you are reading this then it&#39;s safe to say that you have taken Nbdev for a spin and you want to contribute to the project. May be you found somethign that can add value to Nbdev or may be something is missing which you want ot add. Whatever the reason maybe, here are some of the ways in which you can contribute 👇 </p>
<ul>
<li><p>You can write a tutorial.</p>
</li>
<li><p>You can contribute to documentations.</p>
</li>
<li><p>You can provide feedback.</p>
</li>
<li><p>You can contribute code.</p>
</li>
</ul>
<p>Before moving into the details about how you can do the above mentioned contributions, let&#39;s see how to setup Nbdev for the first time.</p>
</div>
## Setting things up
<p>Working on Nbdev or any other open source project starts with a &quot;fork&quot;. If you are new to open source or this is your first time contribution to an open source project then read the following <a href="https://docs.github.com/en/get-started/quickstart/fork-a-repo">tutorial</a> to get a quick understanding of what a &quot;fork&quot; is and how you can get started with forking a project.</p>
<p>After you fork the project, clone the repo somewhere in your local machine.</p>
<p>Nbdev is built on itself i.e. the starting point of all the code and documentation in Nbdev is a Pluto notebook.</p>
<p>To get started, create a project directory and move into the directory. Here, you need to start a new environment like this 👇 </p>
<pre><code>mkdir ~/nbdev_dev
cd ~/nbdev_dev
julia</code></pre>
<p>This would create a directory namedb &quot;nbdev_dev&quot; and take you inside that directory. After which the Julia terminal would fire up. Once inside Julia terminal type <code>&#93;</code> to enter the package manager then type the following 👇</p>
<pre><code>&#40;v1.0&#41; pkg&gt; activate .
&#40;nbdev_dev&#41; pkg&gt; dev &lt;path/to/cloned/repo</code></pre>
<p>After this move back to the Julia terminal and type 👇 </p>
<pre><code>julia&gt; import Pluto
julia&gt; Pluto.run&#40;&#41;</code></pre>
<p>This gives you a fresh Pluto environment to work in. From this point onwards, you can either start a new notebook or work on an existing notebook if it&#39;s a bug fix or documentation change.</p>

## How to get started 🏃‍♀️
<p>Here are some of the way to get started with contributing 👇 </p>
<ul>
<li><p>Pick a piece of code in nbdev and checkout the test for it. If there is a missing test then add it. If an existing test doesn&#39;t provide sufficient coverage then add it.</p>
</li>
<li><p>You noticed somethign missing in the documentation? go ahead and add it.</p>
</li>
<li><p>Feel like the tutorial needs imrpovement or a few more tutorials could be useful? go ahead and write a tutorial.</p>
</li>
</ul>

## Oh&#33; you found a bug 🖊🐛
<ul>
<li><p>First ensure that such bug was not reported earlier in <a href="https://github.com/sapal6/nbdev.jl/issues">issues</a> </p>
</li>
<li><p>If you&#39;re unable to find an open issue addressing the problem, open a <a href="https://github.com/sapal6/nbdev.jl/issues/new">new one</a>. Be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring. </p>
</li>
<li><p>Be sure to add the complete error messages.</p>
</li>
</ul>

## Intending to add a new feature or enhancing an old one? 👩‍🔧
<ul>
<li><p>You can start a discussion on the <a href="https://github.com/sapal6/nbdev.jl/discussions">discussion tab</a>. this will help you to find if others are instrested in same thing as you and maybe you can find collaborators. </p>
</li>
<li><p>While working on a new feature first create a detailed notebook about the feature that you would like to add. The notebook should contain a detailed description about the feature, why you think this feature is needed and a step-by-step description about what your code is doing. Once you think that you are ready with your example notebook, post a gist in the discussion forum.</p>
</li>
<li><p>Once your feature request is dicussed and finalized then you can open a PR. Make sure to include a complete description of the feature and an example of it&#39;s usage. Make sure that your code has a good documentation and follows the style guide. </p>
</li>
<li><p>Ensure that your PR includes tests that exercise not only your feature, but also any other code that might be impacted.</p>
</li>
</ul>

<div class="markdown"><p>Submitting a PR 🎈 </p>
<ul>
<li><p>All Nbdev code starts with a Pluto notebook. The exported code from the notebook then appears as the final code under the src directory and the related documentation under the docs directory. If you are submitting your PR –&gt;</p>
<ul>
<li><p>Always start your developement with a Pluto notebook because if you modify code, add code or create a new code file under the src directory directly then the source notebooks won&#39;t have your modifications. </p>
</li>
<li><p>Once you add a new code in an existing notebook, update an existing code in a cell that is supposed to be exported or added a new code in a new notebook with cells marked with <code>#export</code> then make sure to run <code>notebook2script</code> in the same notebook so as to export the code to the respective files under the src directory.</p>
</li>
<li><p>After everything is finalized, make sure to run <code>make.jl docs</code> at the terminal in order to export the documentation.</p>
</li>
</ul>
</li>
<li><p>Make sure that your PR is accompanied by sufficient test coverage. Either in the notebook itself or under the test dicrectory. Currently Nbdev has poor test coverage so you may need to include test for the impacted code as well.</p>
</li>
<li><p>Do not combine several unrelated fixes together. Create separate branches for separate fixes, separate features etc.</p>
</li>
<li><p>Preserve the original code styling of an existing file.</p>
</li>
</ul>
</div>
## Want to contribute to the docs? 📓
<ul>
<li><p>The docs are generated from the notebooks in the<code>nbs</code> directory. </p>
</li>
<li><p>If you are planning to edit an already existing notebook then make sure not to add the <code>#export</code> flag to the existing documentation cells or any new documentation cell that you might add. </p>
</li>
<li><p>If you are planning to add a new notebook for documentation then make sure not to add <code>#export</code> to any of the cell in this new notebook.</p>
</li>
</ul>

