---
title: 'What is a generating function?'
date: '2013-11-25'
tagline: Or, how to count with power series
categories: [ 'research' ]
tags: [ 'combinatorics', 'enumeration', 'whatisa', 'graphs' ]
---

I'm an enumerative combinatorialist.
Basically, I really am what five-year-olds think all mathematicians are—I sit in my office and count things.
Of course, I don't just pile up a bunch of objects and count them one by one; generally, I'm counting infinite families of things, so this would take a really long time, and in any case it's just not very fun.
Instead, I count things using algebra.

### Graphs
Most of the time, the objects I count are graphs, so I should probably start there.
So what is a graph?

<figure>
    <div id="congraphex" class="graph"></div>
    <script type="text/javascript">
    // create an array with nodes
    var nodes = [
        {id: 1, label: '1'},
        {id: 2, label: '2'},
        {id: 3, label: '3'},
        {id: 4, label: '4'},
        {id: 5, label: '5'},
        {id: 6, label: '6'}
    ];

    // create an array with edges
    var edges = [
        {from: 1, to: 2},
        {from: 1, to: 3},
        {from: 2, to: 4},
        {from: 2, to: 5},
        {from: 5, to: 6},
        {from: 3, to: 4}
    ];

    // create a graph
    var container = document.getElementById('congraphex');
    var data = {
        nodes: nodes,
        edges: edges
    };
    var options = {};
    var graph = new vis.Graph(container, data, options);
    </script>
  <figcaption><span class="figlabel">Fig. 1 | </span> Example of a (connected) graph</figcaption>
</figure>

That's a graph.
A bunch of things (which we'll usually call <span class="term">vertices</span>), with some connected to each other by lines (which we'll usually call <span class="term">edges</span>).
It's important for my purposes that all the vertices (that is, the "things") are distinct; I'll usually just label them with integers to distinguish them.

Formally, we sometimes also think of a graph in set-theoretic terms; then a <span class="term">graph</span> $G$ is a pair of sets $V$ (of "vertices") and $E \subseteq \binom{V}{2}$ (of "edges").
This really is exactly the same idea; we pick some vertices, which we put in the set $V$, and then we pick some edges, which we now think of as <em>pairs</em> of vertices and put in the set $E$.

#### Graph properties
Not all graphs are the same.
For example, some graphs are <span class="term">connected</span> (meaning that you can get from any vertex to any other by walking along edges) while others are not.
For example, <a href="#congraphex">Fig. 1</a> shows a connected graph, while <a href="#discongraphex">Fig. 2</a> shows a disconnected graph.

<figure>
    <div id="discongraphex" class="graph"></div>
    <script type="text/javascript">
    // create an array with nodes
    var nodes = [
        {id: 1, label: '1'},
        {id: 2, label: '2'},
        {id: 3, label: '3'},
        {id: 4, label: '4'},
        {id: 5, label: '5'},
        {id: 6, label: '6'}
    ];

    // create an array with edges
    var edges = [
        {from: 1, to: 2},
        {from: 1, to: 3},
        {from: 2, to: 4},
        {from: 5, to: 6},
        {from: 3, to: 4}
    ];

    // create a graph
    var container = document.getElementById('discongraphex');
    var data = {
        nodes: nodes,
        edges: edges
    };
    var options = {};
    var graph = new vis.Graph(container, data, options);
    </script>
  <figcaption><span class="figlabel">Fig. 2 | </span> Example of a (disconnected) graph</figcaption>
</figure>

The crucial observation here (which we should record for posterity/our own use later in this post) is this:
<div class="theorem">
    Any graph decomposes uniquely as a (possibly empty) set of (nonempty) connected graphs, its <span class="term">connected components</span>.
</div>

### Enumeration
Now we come to the counting part.
How many graphs are there?
This actually turns out to be pretty straightforward, and it was first answered by Cayley in the nineteenth century:
<div class="theorem">
    There are $2^{\binom{n}{2}}$ graphs on $n$ vertices.
</div>
The reasoning is simple enough: we can construct a graph on $n$ vertices by choosing some subset of the $\binom{n}{2}$ possible edges to "turn on".

Now let's return to the idea of connectedness from before.
How many <em>connected</em> graphs are there with $n$ vertices?
This turns out to be pretty hard.
In fact, there's no known simple closed formula like the one above, and there are pretty good reasons to think that one can't be given.
So what can we do?
We turn to algebra.

#### Generating functions
It's perfectly natural to think of the sorts of enumerations we've been doing as yielding <em>sequences</em>.
For example, the enumeration of graphs is given by the sequence $[1, 1, 2, 8, 64, 1024, \dots]$, where the $n$th term (starting from 0) is the number of graphs on $n$ vertices.
Such sequences ubiquitous in many areas of mathematics, and they are amply catalogued at the fantastic [OEIS]; the graph counting sequence appears as [A006125](//oeis.org/A006125).

Just like in a Calculus II course, I'm now going to pull a crazy left hook.
Instead of just taking this list of numbers as a <em>sequence</em>, let's use them as the coefficients in a <em>power series</em>.
Define the <span class="term">exponential generating function</span> $G(x)$ of the class of graphs to be the formal power series
$$ G(x) = \sum\_{n = 0}^{\infty} g\_{n} \frac{x^{n}}{n!} $$
where $g_{n}$ is the number of graphs on $n$ vertices.
(The division by $n!$ is an algebra trick, but it should remind you of Taylor series!)

Now comes the magic.
Let $CG(x)$ be the analogous exponential generating function for (nonempty) <em>connected</em> graphs, and let $\exp(x)$ be the ordinary exponential function (whose power series coefficients are all 1, conveniently enough).
We noted before that "every graph decomposes uniquely as a (possibly empty) set of (nonempty) connected graphs"; it turns out that this translates into the generating function equation
$$ G(x) = (\exp \circ CG) (x) $$
where $\circ$ denotes power-series composition.
Since the exponential function has a compositional inverse (the natural log), we get a lovely theorem.
<div class="theorem">
    For $ G(x) $ the exponential generating function for graphs, $ CG(x) $ the generating function for connected graphs, and $ \ln (x) $ the logarithm function, we have the power-series identity
    $$ CG(x) = (\ln \circ G) (x). $$
</div>
We can then use algebra to compute coefficients of $CG(x)$, which lets us count connected graphs!

(If you want to see this computation worked out in detail, check out Wilf's excellent text [generatingfunctionology][] and especially the work leading up to eqn. 3.10.2.)

### What's next?
Of course, in that last bit, I deployed one of the sneakiest of math tricks: "it turns out" is right up there with "obvious" among words you should never let mathematicians get away with!
Why on Earth should it be the case that the functions $\exp$ and $\ln$ behave in this way?
Can this be used for more complicated structures?
(Why is this guy labeling all his vertices, anyway?)

Next time, I'll introduce the theory of combinatorial species, which provides an elegant framework for addressing all these questions.

[generatingfunctionology]: //www.math.upenn.edu/~wilf/DownldGF.html
[oeis]: //www.oeis.org
