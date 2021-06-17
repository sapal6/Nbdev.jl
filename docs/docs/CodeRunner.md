<h1>CodeRunner</h1>
<div class="markdown"><p>You need to have something to capture the output. This is useful when you want to have examples or capture test output in the docs.</p>
<p>I think the simplest way to do this is to do the following👇</p>
<ul>
<li><p>Take a notebook. </p>
</li>
<li><p>Create a fake server, fake client etc.</p>
</li>
<li><p>Run the notebook cell by cell and update the notebook with the output.</p>
</li>
</ul>
<p>This is taken straight from Pluto&#39;s webserver code</p>
</div>
<div class="markdown"><h2>execute_code</h2>
</div>
> execute_code(notebook::Notebook)–> This function does the following
>
>   * Take a notebook.
>   * Create a fake server, fake client etc.
>   * Run the notebook cell by cell and update the notebook with the output.




