---
title: "What would make a calculus book useful?"
date: '2014-04-27'
tagline: "Hint: it's not more pages."
categories: [ 'teaching' ]
tags: [ 'calculus', 'inverted', 'methodology', 'textbook' ]
widgets :
  sagecell :
    enable : false
  springy :
    enable : false
---
I've been teaching calculus in a textbook-based inverted classroom for three terms now.
So far, it's been a smashing success!
My students are more engaged than ever, their test scores are up, and they come back to take more courses from me and the department.
There's a weak link in the chain, though, that's been bothering me more and more: the textbooks!
I've got a shelf in my office with a dozen commercial college calculus textbooks, and they're uniformly terrible for this kind of class.

I'm tired of apologizing for the bizarre choices and unreadable technicality of these books, so I'm writing my own.
Here's some of my ideas.
(If you're interested in helping out, some preliminary information is at the end.)

## Why have students read?

For any of this to make sense, I need to say a bit about how my classes work.
The gory details are available in a [previous post][invert] and a more recent [follow-up][invert-followup], so I'll just summarize here.
For each class meeting (and section of material), my students go through the following process, which is designed to keep them moving through the material while maximizing useful contact time with me and their classmates.

### Before class

1. Before class, the student reads the assigned section of the text.
1. After doing the reading, the student completes some "pre-class exercises".
1. Additionally, the student fills out a short questionnaire on our course web page, giving me feedback about how the reading went and what questions or concerns each student may have.

### During class

1. I start class with a "mini-lecture", typically lasting twenty to thirty minutes (out of the seventy available in each class meeting).
   I explain any sticky bits of the material, answer questions from the questionnaires, and work through some examples.
1. The students then revise their pre-class exercises with small, self-selected groups for the rest of the time.
   I walk around the room, observing their work (we're in a room with whiteboard walls!) and answering questions.
1. I also take printed "bonus exercises" to the classroom for any groups that finish up the revisions.

Note: neither the pre-class nor bonus exercises are collected or graded, although I do include a soft "class participation" component in the final course grade.

### After class

1. Students complete a second, short set of "post-class exercises".
   These are collected and graded for content and style, with lots of feedback.

## What's wrong with standard books?

Most of the time, this model works quite well.
However, occasionally, we hit a stumbling block when reading the textbook doesn't give students a good foundation to understand the broad themes of a section and start working on exercises.
For example, when defining the definite integral for the first time (one section after defining the left and right sums $L\_{n}$ and $R\_{n}$), our book offers this gem:

<div class="definition">
    The <span class="term">definite integral</span> of $f(x)$ over $[a, b]$, denoted by the integral sign, is the limit of Riemann sums:
    $$ \int_{a}^{b} f(x) \, dx = \lim_{\lVert P \rVert \to 0} R(f, P, C) = \lim_{\lVert P \rVert \to 0} \sum_{i = 1}^{N} f(c_{i}) \Delta x_{i}. $$
</div>

You read that right: this author dives straight into the full-blown theory of Riemann sums, incorporating arbitrary partitions of an interval and arbitrary test points in the parts.
The notation in the definition is defined only briefly before dropping this on the students—and no effort is ever made to bring students up to speed on, for example, all the analytic machinery needed to make sense of the limits $\lim_{\lVert P \rVert \to 0}$.

**What on Earth is this doing in a freshman calculus text?**
It's ridiculously technical, of course, but the situation is worse than that: *it's technicality in the service of a goal our students don't understand*.
Riemann's definition of the integral was an important historical development—it allowed us to integrate certain pathological functions which previous definitions couldn't handle—but first-year students aren't yet equipped to understand what it even means for a function to be "not locally monotonic" or "totally discontinuous".
(David Bressoud of Macalaster College has written about this specific problem at some length, and his pieces on his blog [Launchings][launchings] are well worth a read.)
Most of the books on my shelf don't even ask students to internalize $\epsilon$-$\delta$ limits, so why would we dream of throwing full Riemann integration at them?

This specific hiccough is fairly distinctive, but no calculus text I've examined avoids this sort of flaw altogether.
**These books are not written to be read by novice calculus students.**
Instead, they seem to be written for two purposes:

1. to remind Ph.D. mathematicians of the content of a calculus course; and
1. to give students a reference when they work on problems.

These aren't unreasonable goals, but I can't help but think that they're less important than actually teaching calculus to novices.

## So what are you gonna do about it?

After swallowing my frustrations for a while, I've given up—I'm just going to write my own book.
If it goes well, it will be a valuable resource for me and my students (and maybe for others, if it goes *really* well).
If it goes poorly, at least I'll know why so many of the books are bad!

In no particular order, here are my design goals as they currently stand.

* **It should be readable.**
  This is the key to the whole thing.
  I want to create a book that is worth students' time to read.
  With the structure I'm currently using, I don't need the book to address every detail of every topic, but I definitely *do* need it to be self-contained, readable, and mathematically valid.

* **It should emphasize the power of proof.**
  Of course, freshman calculus students aren't yet prepared to learn by reading formal proofs, and I have no illusions about changing that just by bombarding them with corollaries and QEDs.
  That said, everything that's true in mathematics is true because of *reasons*, but most early students think of it more as a series of magic incantations.
  With very limited exceptions, I plan to give an *argument* for every theorem and result in the book.

* **It should emphasize theory.**
  That is, book should focus on *why* things are true rather than just *how* to do calculations.
  Calculations are important, of course, but the core *ideas* of calculus can be presented tightly and intelligibly if we stop bombarding students with dozens of boxed examples along the way.
  Students don't need any encouragement to think that calculations are important!

  To accommodate both needs, each section will feature a discussion of the relevant theory, followed by several carefully-worked "Guided Practice" examples which illustrate how the theory is used and any imporant pitfalls or caveats.

* **It should prioritize intuition over formalism.**
  The nitty-gritty details of formal Riemann sums and $\epsilon$-$\delta$ proofs don't help first-year students understand the beautiful conceptual structure of the calculus.
  I believe it is possible to be appropriately rigorous without being formalistic.

* **It should have good exercises.**
  I have no idea how to achieve this goal, but it's clearly important.
  Comments welcome.

* **It should be free.**
  I mean this in several senses.
  The book will be free of cost, at least in its electronic form.
  (Assuming the project comes to fruition, I expect that hard-bound copies from [Lulu][lulu] will cost less than $20.)

  Additionally, it should be free of burdensome license restrictions.
  I'm releasing all the material I produce under the [Creative Commons Attribution-ShareAlike 4.0 International license][cc-by-sa-4].
  This means that anyone can view, modify, and redistribute the source, so long as they give appropriate credit to the original project and release any modifications under these same terms.
  This sort of "copyleft" license has been incredibly successful in the free software world, and I believe it is the right approach for creative works like a textbook as well.

  Furthermore, it should require only free software.
  Anyone, anywhere in the world, should be able to obtain the software needed to compile the book from source.
  I'm currently using LaTeX for the text and the [Asymptote][asymptote] vector graphics language for figures; both are available under the GPL.

I expect that several of these will evolve as the project matures, especially as others get involved (either as contributors or reviewers).
(The first and last are, of course, non-negotiable.)

## Progress so far

I started "Calculus: a reader" just over a month ago (on 23 Febrary).
During that time, I've made 150 commits to the project's Git repository, and the PDF builds to 91 pages.
(Of course, a lot of those are blank or boring things like part separators and tables of contents.)
I'd estimate that I've drafted a third of the material needed for a standard two-semester calculus sequence, including a more-or-less complete Chapter 1 (the theory of derivatives).
Some of this still needs substantial revision, but I think it's at least presentable.

It turns out that writing about calculus is a lot of fun!
Working on this project has given me a chance to reflect on a subject that I've been teaching for several years.
What is the best way to motivate the product rule?
How can I convince students that the Fundamental Theorem of Calculus is non-trivial?
What are the really important applications of the definite integral?
Although I haven't yet had students read any of this material, thinking about these questions has informed my classroom teaching.

## Sounds like fun! How can I help?

I'd love to have help on this—or even to build it into a community project.
Here's a few ways you could get involved.

### Review a section

I'd love to have some of my fellow mathematicians and teachers read through what I've been writing.
If you're interested, get in touch and I'll send you a draft PDF.
You can also download the source from my [github repository][calcnotes-github], but you'll need a working copy of [Asymptote][asymptote] and a bit of time to sort out the build environment.

### Write exercises

This book is going to need a lot of exercises.
(I expect this actually represents the majority of the writing work for a standard book.)
I don't think it needs hundreds of exercises per section, but there should be enough problems in each section to give a student several hours of practice.
Unfortunately, I haven't found any existing sources of exercises which are compatible with the CC-BY-SA license.
(There are several free books already available under the CC-BY-NC-SA license, but I'm hoping to avoid the non-commercial restriction.)

I'd be particularly interested to talk with anyone who has experience with planning exercises for a textbook or writing great worksheet problems.
How do you design exercises that guide students through interesting stuff?

### Improve the illustrations

I've produced some preliminary figures to illustrate the text, but they're not especially good.
I'm not a graphic designer, and in any case I haven't invested much time in these yet.
If you have an eye for design (or just know a good way to illustrate a sticky calculus concept), the figures could use some love.

### Write a section (or several!)

There's a lot of this book left to write!
If you know a great way to explain a topic, feel free to dive in.
If you're going to be a full-on collaborator, we probably should get you up to speed on working with Git.
As a start, check out my [recent post][git-post] on using Git for academic writing.

### Write a part on multivariable calculus

Obviously, this one represents a ton of work.
I haven't taught multivariable calculus, so I'm not equipped to start writing about it.
If anyone wants to take this on, I'd be thrilled to have you.

[invert]: /blog/teaching/inverting-the-classroom
[invert-followup]: /blog/teaching/invertedfollowup
[launchings]: //launchings.blogspot.com
[lulu]: //lulu.com
[cc-by-sa-4]: //creativecommons.org/licenses/by-sa/4.0/
[asymptote]: //asymptote.sourceforge.net/
[calcnotes-github]: //github.com/againerdewar/calculus-reader
[git-post]: /blog/latex/git-for-academic-writing
