---
title: 'Outbreak!'
tagline: 'A differential equations lab without derivatives'
date: '2014-10-03'
categories: [ 'teaching' ]
tags: [ 'calculus', 'lab', 'methodology' ]
widgets :
  sagecell :
    enable : false
  springy :
    enable : false
---

This term at HWS, my calculus sections have an assigned lab time, bringing us up to over four hours a week of meetings in a fourteen-week semester.
Many of my colleagues use this time for problem sessions; however, as detailed in my post on [inverting](/blog/teaching/invert), this is already the norm for my classes, and an extra eighty minutes a week seemed like overkill.
Instead, I've been designing short, open-ended projects for students to do in groups during this time.
Just before starting derivatives, I assigned one that went particularly well: an exploration of differential equation models and Euler's method by way of the standard SIR model for infectious disease propogation.
Here's the catch: *this was the week before we started derivatives*.

### Motivation

Calculus is an amazingly powerful discipline.
After all, it informs nearly everything we do in the natural sciences.
Too often, however, our students get a purely formalistic view of the subject; the most significant nod to applicability in a typical modern calculus textbook is a litany of contrived related-rates problems.

Don't get me wrong—I'm quite fond of mathematical rigor!
However, I also recognize that application is a powerful motivator.
Moreover, when we introduce them early, meaningful applications can provide important scaffolding for students to understand the high abstractions of our courses.

The differential equation is a fine example of this point.
To an experienced mathematician or scientist, a differential equation is an incredibly natural object; Newtonian mechanics, for example, emerges easily from first principles in the language of second-order differential equations.
To a student, however, they're usually totally opaque, at least in part because we don't introduce them until we want to go beyond integration.

However, if we shift the introduction of differential equations to a point very early in the course, they can be treated much more purely.
It's very easy to explain, for example, why temperature $T$ of a cup of coffee might satisfy $\frac{\mathrm{d} T}{\mathrm{d} t} = k (T - 20)$, even if the student doesn't know the formal definition of the derivative.
Of course, *solving* such a differential equation analytically is far beyond a student at the beginning of a Calculus I course, but they surely can manage the computational aspects of Euler's method!

### Implementation

Taking my lead from some of the introductory material in the fascinating [Calculus in Context][cic] text from the Five Colleges Calculus Project, I designed a lab to guide students through the development of the SIR model and computations using Euler's Method.
It really worked!
The students made it through the project comfortably, and they actually have picked up the vocabulary of differential equations, which I now sometimes use in my mini-lectures and explanations.

Have you tried anything like this in your classes?
Let me know in the comments!

The [PDF][lab-outbreak] is available to download here; I offer it here under the Creative Commons Attribution-ShareAlike 4.0 License, so you are welcome to use it however you want as long as you share your modifications.

[cic]: http://www.math.smith.edu/Local/cicintro/
[lab-outbreak]: {{urls.media}}/lab.outbreak.pdf
