---
title: On interacting with LaTeX
date: '2013-12-12'
categories: [ 'latex' ]
tags: [ 'latex', 'software', 'rant' ]
widgets :
  sagecell :
    enable : false
  springy :
    enable : false
---

***Warning: this post contains a rant.***

Next term, I'll be running a workshop to help Carleton students get started using LaTeX.
As part of this, I'm writing up guides for new users, designed to carry students from a state of zero knowledge to their first compiled document.
Of course, this requires a functioning LaTeX environment, so I spent some time with the various distributions and editor/environments installed on the lab computers in the department.

After less than half an hour, I gave up and moved the whole project over to [WriteLaTeX].
*The standard desktop LaTeX editing suites are an embarrassing, unusable mess.*

### Get off my lawn!
In the spirit of full disclosure: I'm a serious nerd.
I've been running Linux on the desktop since 1999 and using LaTeX for most or all of my documents since 2005.
I keep my documents in [Git]; I contribute to [Sage]; I write my code in [Emacs].

Clearly, this software isn't made for me.

### The problem
But seriously.
I spent about ten minutes each with three different widely-used LaTeX environments across two major operating systems.
Here but a few of the things I couldn't figure out how to do *in any of them*:

- Create a new .bib database
- Use the biber biblographic backend (which I could confirm was installed)
- Make an auto-indented carriage return


Superficially, these software packages resemble IDEs like [Eclipse].
There's a text editor at the core, of course, but wrapped around it are a variety of bolted-on tools, macros, and gadgets designed to simply complex interactions like the LaTeX compilation pipeline.

In practice, though, *they just don't work*.
The "compile" buttons perform some hidden combination of calls to `pdflatex` and `bibtex`, dump the output into a uselessly tiny pane, and leave the user high and dry if anything goes wrong—which, as I've mentioned, it did almost immediately.
On one of the distributions I was using, when I tried to use the `biblatex` package, some behind-the-scenes script evidently tried to download it on my behalf, but it crashed on me twice, each time leaving the front-end UI unresponsive and giving me no indication what was the matter.

There is no sense in which this is "user-friendly".

### Where it all went wrong
At their cores, these software suites are trying to protect the user from the arcana of using LaTeX on the command line.
I'm sure it comes as no surprise that I don't think this is the right goal—the learning curve for using LaTeX at the CLI is really fairly shallow, given a friendly text editor.

Even leaving that aside, though, there's a serious implementational deficiency.
These editors try to keep LaTeX-as-software behind a curtain, *but they're quite bad at it*.
Simply replacing the standard `pdflatex`→`pdflatex`→`bibtex`→`pdflatex` chain with a script and a button only protects the user from typing a few characters, and leaves them helpless as soon as something goes wrong.

### How to fix it

If you want to make a complex tool like LaTeX work without a manual, you have to take that responsibility seriously.
This is where services like [WriteLaTeX] shine; they take over total control of the compile chain, and in exchange they give the user highly-processed, meaningful feedback about errors and warnings.

This is a tool you can actually [tell someone how to use][clw].
*Why isn't the desktop software designed this way?*

[writelatex]: //www.writelatex.com
[sage]: //www.sagemath.com
[git]: //www.git-scm.com
[emacs]: //www.gnu.org/s/emacs
[eclipse]: //www.eclipse.org
[clw]: //math.carleton.edu/latex
