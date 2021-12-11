<h1>Documenter</h1>
```
using PlutoTest
------
Output
------

```

## Lower Level Entities&#40;Structs, methods etc.&#41;
<p>These are the objects on which nbdev&#39;s Documenter module was built. You can use it to extend nbdev but these are automtically used by Nbdev&#39;s internal engine to generate code files for you.</p>

## Section type

> struct Section–> This is like the section of a page and is made up of one or multiple lines.
>
>   * Fields:
>
>       * line–> String which makes up a section



> Section(line)–> Helper function to call the constructor of the type Section




> line(section::Section)–> Getter for accessing the underlying field line.




## Example

```
section=Section("This is a test line")
------
Output
------
Any["Section", Any[(:line, ("\"This is a test line\"", MIME type text/plain))], :struct, "Section", "4ea02a8ac898d269"]
```

```
@test line(section) == "This is a test line"
------
Output
------

<div class='pluto-test call correct pass infix-operator'>
	<script>
	
	const div = currentScript.parentElement
	div.addEventListener("click", (e) => {
		if(!div.classList.contains("expanded") || e.target.closest("pt-dot:not(.floating)") != null){
			div.classList.toggle("expanded")
			e.stopPropagation()
		}
	})
	
	const throttled = (f, delay) => {
		const waiting = { current: false }
		return () => {
			if (!waiting.current) {
				f()
				waiting.current = true
				setTimeout(() => {
					f()
					waiting.current = false
				}, delay)
			}
		}
	}
	
	const dot = div.querySelector("pt-dot")
	const dot_top = div.querySelector("pt-dot.top")
	const dot_bot = div.querySelector("pt-dot.bottom")
	
	const is_chrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor)
	const is_firefox = /Firefox/.test(navigator.userAgent) && /Mozilla/.test(navigator.userAgent)
	
	// safari is too slow
	
	if(is_chrome || is_firefox){

	const intersect = (r) => {
		const topdistance = r.top
		const botdistance = window.innerHeight - r.bottom
	
		
		const t = (x) => `translate(${2*Math.sqrt(Math.max(0,-50-x))}px,0)`
		dot_top.style.transform = t(topdistance)
		dot_bot.style.transform = t(botdistance)

		div.classList.toggle("show-top-float", topdistance < 4)
		div.classList.toggle("show-bottom-float", botdistance < 4)
	}
	
	intersect(dot.getBoundingClientRect())
	
	const scroll_listener = throttled(() => {
		intersect(dot.getBoundingClientRect())
	}, 200)
	
	window.addEventListener("scroll", scroll_listener)

	let observer = new IntersectionObserver((es) => {
		const e = es[0]
		intersect(e.boundingClientRect)
	},  {
	  rootMargin: '-4px',
	  threshold: 1.0
	});

	observer.observe(dot)
	invalidation.then(() => {
		window.removeEventListener("scroll", scroll_listener)
		observer.unobserve(dot)
	})
	
	Array.from(div.querySelectorAll("pt-dot.floating")).forEach(e => {
		e.addEventListener("click", () => dot.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"}))
	})
	
	}
	
	</script>
	<pt-dot></pt-dot>
	<pt-dot class="floating top"></pt-dot>
	<pt-dot class="floating bottom"></pt-dot>

	<p-frame-viewer>
	<p-frames>
	<slotted-code>
<line-like><pre-ish>line(section) == &quot;This is a test line&quot;</pre-ish></line-like>
</slotted-code><slotted-code>
<line-like><pre-ish>line(</pre-ish>    <pluto-display></pluto-display>
    <script id=rekootzaffeotmje>

        // see https://plutocon2021-demos.netlify.app/fonsp%20%E2%80%94%20javascript%20inside%20pluto to learn about the techniques used in this script
        
        const body = /* See the documentation for PlutoRunner.publish_to_js */ getPublishedObject("c6085d80-5a60-11ec-2c25-b3dec1737c9b/610d9263-645a-46aa-8f16-12e90787b7bc/rekootzaffeotmje")
        const mime = "application/vnd.pluto.tree+object"
        
        const create_new = this == null || this._mime !== mime
        
        const display = create_new ? currentScript.previousElementSibling : this
        
        display.persist_js_state = true
        display.body = body
        if(create_new) {
            // only set the mime if necessary, it triggers a second preact update
            display.mime = mime
            // add it also as unwatched property to prevent interference from Preact
            display._mime = mime
        }
        return display

    </script>
	<pre-ish>) == &quot;This is a test line&quot;</pre-ish></line-like>
</slotted-code><slotted-code>
<line-like>    <pluto-display></pluto-display>
    <script id=verieirftcryqksk>

        // see https://plutocon2021-demos.netlify.app/fonsp%20%E2%80%94%20javascript%20inside%20pluto to learn about the techniques used in this script
        
        const body = /* See the documentation for PlutoRunner.publish_to_js */ getPublishedObject("c6085d80-5a60-11ec-2c25-b3dec1737c9b/610d9263-645a-46aa-8f16-12e90787b7bc/verieirftcryqksk")
        const mime = "text/plain"
        
        const create_new = this == null || this._mime !== mime
        
        const display = create_new ? currentScript.previousElementSibling : this
        
        display.persist_js_state = true
        display.body = body
        if(create_new) {
            // only set the mime if necessary, it triggers a second preact update
            display.mime = mime
            // add it also as unwatched property to prevent interference from Preact
            display._mime = mime
        }
        return display

    </script>
	<pre-ish> == &quot;This is a test line&quot;</pre-ish></line-like>
</slotted-code><slotted-code>
<line-like>    <pluto-display></pluto-display>
    <script id=donksimgqpbgxzhn>

        // see https://plutocon2021-demos.netlify.app/fonsp%20%E2%80%94%20javascript%20inside%20pluto to learn about the techniques used in this script
        
        const body = /* See the documentation for PlutoRunner.publish_to_js */ getPublishedObject("c6085d80-5a60-11ec-2c25-b3dec1737c9b/610d9263-645a-46aa-8f16-12e90787b7bc/donksimgqpbgxzhn")
        const mime = "text/plain"
        
        const create_new = this == null || this._mime !== mime
        
        const display = create_new ? currentScript.previousElementSibling : this
        
        display.persist_js_state = true
        display.body = body
        if(create_new) {
            // only set the mime if necessary, it triggers a second preact update
            display.mime = mime
            // add it also as unwatched property to prevent interference from Preact
            display._mime = mime
        }
        return display

    </script>
	<pre-ish></pre-ish></line-like>
</slotted-code>
	</p-frames>
	
	<p-frame-controls>
		<img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.5.1/src/svg/time-outline.svg" style="width: 1em; height: 1em; transform: scale(-1,1); opacity: .5; margin-left: 2em;">
		<input class="timescrub" style="filter: hue-rotate(149deg) grayscale(.9);" type=range min=1 max='4' value='3'>
	</p-frame-controls>
	
	
	<script>
	const div = currentScript.parentElement
	
	const input = div.querySelector(":scope > p-frame-controls > input.timescrub")
	const frames = div.querySelector(":scope > p-frames")
	
	const setviz = () => {
		Array.from(frames.children).forEach((f,i) => {
			f.style.display = i + 1 === input.valueAsNumber ? "inherit" : "none"
		})
	}
	
	setviz()
	
	input.addEventListener("input", setviz)
	</script>

	<style>
	PlutoTest.PlutoStylesheet("p-frame-viewer {\n\tdisplay: inline-flex;\n\tflex-direction: column;\n}\np-frames,\np-frame-controls {\n\tdisplay: inline-flex;\n}\n")
	</style>
</p-frame-viewer>
</div>
<style>
pt-dot {
	flex: 0 0 auto;
	background: grey;
	width: 1em;
	height: 1em;
	bottom: -.1em;
	border-radius: 100%;
	margin-right: .7em;
	display: block;
	position: relative;
	cursor: pointer;
}

pt-dot.floating {
	position: fixed;
	z-index: 60;
	visibility: hidden;
	transition: transform linear 240ms;
	opacity: .8;
}
.show-top-float > pt-dot.floating.top,
.show-bottom-float > pt-dot.floating.bottom {
	visibility: visible;
}

pt-dot.floating.top {
	top: 5px;
}
pt-dot.floating.bottom {
	bottom: 5px;
}


.fail > pt-dot {
	background: #f75d5d;

}
.pass > pt-dot {
	background: #56a038;
}

@keyframes fadeout {
    0% { opacity: 1;}
    100% { opacity: 0; pointer-events: none;}
}


.pass > pt-dot.floating {

    animation: fadeout 2s;

	animation-fill-mode: both;
	animation-delay: 2s;

	/*opacity: 0.4;*/
	
}


.pluto-test {
	font-family: "JuliaMono", monospace;
	font-size: 0.75rem;
	white-space: normal;
	padding: 4px;
	
	min-height: 25px;
}


.pluto-test.pass {
	color: rgba(0,0,0,.5);
}

.pluto-test.fail {
background: linear-gradient(90deg, #ff2e2e14, transparent);
border-radius: 7px;
}


.pluto-test>.arg_result {
	flex: 0 0 auto;
}

.pluto-test>.arg_result>div,
.pluto-test>.arg_result>div>pluto-display>div {
	display: inline-flex;
}


.pluto-test>.comma {
	margin-right: .5em;
}

.pluto-test.call>code {
	padding: 0px;
}

.pluto-test.call.infix-operator>div {
	overflow-x: auto;
}

.pluto-test {
	display: flex;
	align-items: baseline;
}

.pluto-test.call.infix-operator>.fname {
	margin: 0px .6em;
	/*color: darkred;*/
}


/* expanding */


.pluto-test:not(.expanded) {
	cursor: pointer;
}

.pluto-test:not(.expanded) > p-frame-viewer > p-frame-controls {
	display: none;
	
}

.pluto-test.expanded > p-frame-viewer {
    max-width: 100%;
}
.pluto-test.expanded > p-frame-viewer > p-frames > slotted-code > line-like {
	flex-wrap: wrap;
}
.pluto-test.expanded > p-frame-viewer > p-frames > slotted-code > line-like > pluto-display[mime="application/vnd.pluto.tree+object"] {
	/*flex-basis: 100%;*/
}

slotted-code {
	font-family: "JuliaMono", monospace;
	font-size: .75rem;
	display: flex;
	flex-direction: column;
}
pre-ish {
	white-space: pre;
}

line-like {
	display: flex;
	align-items: baseline;
}

</style>



```

## Page Type

> Page–> The type that represents a page in a document.
>
>   * Fields:
>
>       * sections–> Array of Section type.
>       * name–> Name of the module being documented.



> Page–> Helper function to create constructer for Page type.




> sections–> Getter for accessing the underlying field sections of Page.




> name–> Getter for accessing the underlying field name of Page.




<div class="markdown"><p>A 📃 is made up of several sections. These sections can be example codes, text ,graphs&#40;to be implemented&#41; and function documentation and several pages. The Page type helps in implementing this concept into code.</p>
</div>
<div class="markdown"><h4>Example</h4>
</div>
```
begin
page=Page([Section("iny, meeny, miny mo"), Section("🙈 🙊 🙉")], "Monkey module")
sections(page)
end
------
Output
------
Any["Main.workspace#2.Section", Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "3382009968da2b6a"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "c161df7d0499e8c3"), MIME type application/vnd.pluto.tree+object))], :Array, "", "40d6347821c2ac00"]
```

```
page
------
Output
------
Any["Page", Any[(:sections, (Dict{Symbol, Any}(:prefix => "Main.workspace#2.Section", :elements => Tuple{Int64, Any}[(1, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"iny, meeny, miny mo\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "3382009968da2b6a"), MIME type application/vnd.pluto.tree+object)), (2, (Dict{Symbol, Any}(:prefix => "Section", :elements => Any[(:line, ("\"🙈 🙊 🙉\"", MIME type text/plain))], :type => :struct, :prefix_short => "Section", :objectid => "c161df7d0499e8c3"), MIME type application/vnd.pluto.tree+object))], :type => :Array, :prefix_short => "", :objectid => "40d6347821c2ac00"), MIME type application/vnd.pluto.tree+object)), (:name, ("\"Monkey module\"", MIME type text/plain))], :struct, "Page", "afb96b024399ec9b"]
```

```
typeof(page)
------
Output
------
Page
```

## run<em>and</em>update

<div class="markdown"><p><code>runandupdatenb</code> uses the <code>load_notebook_nobackup</code> function in Pluto.jl. There are multiple ways to achieve what this function achieves without depending on Pluto internals but for now this was the quickiest way to achieve this.</p>
<p><strong>Note-</strong>Depending on Pluto internal to run and update a notebook makes it difficult to run unit test for this function from within pluto itself because a Pluto cell is treated as worker 2, 3 and so on but when you do load_notebook&#40;&#41; then it spins up another worker. Only worker 1 can spwan further processes and not a notebook cell.</p>
</div>
> runandupdatenb(fn::AbstractString)–> Run the notebook in the supplied path and update the notebook with the output of each cell.




## stitchcode

> stitchcode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.



> stitchcode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block



> stitchcode(fdocs::Functiondocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object




## Functiondocs

> struct Functiondocs–> Stores the document of different objects.
>
>   * funcdocs–> Array of strings.



> Functiondocs(funcdocs)–> Helper for accessing the FunctionDocs constructer.




<div class="markdown"><h4>Example</h4>
</div>
```
begin
funcdocs=Functiondocs(["i", "j"])
funcdocs.funcdocs
end
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"i\"", MIME type text/plain)), (2, ("\"j\"", MIME type text/plain))], :Array, "", "70203f0a01c7580b"]
```

## collectfuncdocs

> collectfuncdocs(obj)–> Collects objects (functions, methods, macro structs etc.) and creates an array of documents (generated from teh docstrings). Creates aFunctionDocs type from these documents.




<div class="markdown"><h4>Example</h4>
</div>
```
collectfuncdocs(stitchcode).funcdocs
------
Output
------
Any["String", Tuple{Int64, Any}[(1, ("\"> stitchcode(cell::Cell)–> Stitches the code in a Pluto notebook cell with the output of that code. The output is a code block.\\n\\n\"", MIME type text/plain)), (2, ("\"> stitchcode(cellop::AbstractString)–> Removes the quotes from a string and creates a code block with that string inside the newely formed code block\\n\\n\"", MIME type text/plain)), (3, ("\"> stitchcode(fdocs::Functiondocs)–> When supplied with a FunctionDocs type, stitchCode appends together the object docstrings and generates documentation for that particular object\\n\\n\"", MIME type text/plain))], :Array, "", "540c378fd36d7337"]
```

## Higher Level API

<div class="markdown"><p>These higher level APIs can either be used directly or are already used internally by nbdev. One such functions which can be used directly is...</p>
</div>
## showdoc

> showdoc(o)–> Takes an object and builds markdown documentation.




```
#noop
begin
"""
> An example of a struct
"""
struct Mystruct
	name
end
end
------
Output
------
 
```

```
mystruct=Mystruct("test")
------
Output
------
Any["Mystruct", Any[(:name, ("\"test\"", MIME type text/plain))], :struct, "Mystruct", "e8229af8a89c94ab"]
```

```
typeof(mystruct)
------
Output
------
Mystruct
```

<div class="markdown"><p><code>showdoc&#40;Mystruct&#41;</code></p>
</div>
> An example of a struct




<div class="markdown"><p>Currently nbdev is unable to recognize the docstrings of inline expressions.👇</p>
</div>
```
"> inlinetest--> This is a inline test expression"
inlinetest=str->replace(str, "1"=> "one")
------
Output
------
<div class="pluto-docs-binding" style="margin: .5em; padding: 1em; background: #8383830a; border-radius: 1em;">
<span style="
    display: inline-block;
    transform: translate(-19px, -16px);
    font-family: 'JuliaMono', monospace;
    font-size: .9rem;
    font-weight: 700;
    /* height: 1px; */
    margin-top: -1em;
    background: white;
    padding: 4px;
    border-radius: 7px;
    /* color: #646464; */
    /* border: 3px solid #f99b1536;
">inlinetest</span>
<div class="markdown"><blockquote>
<p>inlinetest–&gt; This is a inline test expression</p>
</blockquote>


</div>
</div>

```

## createpage

> CreatePage–> Creates the Page type from the markdown and example code cells of the supplied notebook. The filename is the name of the notebook which is parsed.




<div class="markdown"><p>While generating document you don&#39;t need to call this function. This is done automatically😃 for you when nbdev generates documents.</p>
</div>
## savepage

> savepage(io, page::Page)–> Take the contents from a Page type and write to the io



> savepage(page::Page, path::String)–> Given a Page type and the required path, creates the related markdwon file in the specified path. The name of the resulting markdown file is same as the nameof the notebook for which the document is generated




<div class="markdown"><p>Nbdev calls the required method of <code>save_page</code> automatically during document generation.</p>
</div>
## export2md

> export2md(fn::String, path::String)–> Generate document for a file in the given path



> export2md(fns::AbstractVector, path::String)–> Map the `export2md(file, path)` to a given vector of file.



> export2md()–> Higher level API to generate documents for all the valid notebooks




```
Export.readfilenames(joinpath(pwd()))
------
Output
------
Any["Any", Tuple{Int64, Any}[(1, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\00_nbdev.jl\"", MIME type text/plain)), (2, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\01_export.jl\"", MIME type text/plain)), (3, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\02_documenter.jl\"", MIME type text/plain)), (4, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\03_codeRunner.jl\"", MIME type text/plain)), (5, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\04_makedocs.jl\"", MIME type text/plain)), (6, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\05_make.jl\"", MIME type text/plain)), (7, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\developerguide.jl\"", MIME type text/plain)), (8, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\index.jl\"", MIME type text/plain)), (9, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\styleguide.jl\"", MIME type text/plain)), (10, ("\"C:\\\\satya\\\\julia\\\\nbdev.jl\\\\nbs\\\\tutorial.jl\"", MIME type text/plain))], :Array, "", "588a310753f60386"]
```

<div class="markdown"><p>The <code>export2md&#40;&#41;</code> is what gets summoned when document generation is invoked. Like most things in nbdev &#40;and unlike most things in life&#41; this too gets invoked automatically. 🥳</p>
</div>
```
#### export2readme
------
Output
------

```

> export2readme()–> create readme from the contents of Index notebook




