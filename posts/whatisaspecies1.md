---
title: 'What is a combinatorial species? I'
date: '2013-12-05'
tagline: 'Or, why graph theory needs functors'
categories: [ 'research' ]
tags: [ 'combinatorics', 'eunmeration', 'whatisa', 'species' ]
permalink: /blog/research/what-is-a-combinatorial-species-1
widgets :
  springy :
    enable : true
---

In enumerative combinatorics, and especially in enumerative graph theory, a rich array of high-tech tools have been developed to use algebra to count combinatorial structures.
(If you aren't already familiar with the astounding feats that can be accomplished with generating functions, I highly recommend Wilf's excellent (and excellently named!) treatise [generatingfunctionology].
You will be amazed.)

Curiously, though, we find over and over again that, for a given class of combinatorial structures, the labeled and unlabeled counting problems—seemingly so similar in structure—in fact require wildly different techniques.
(Indeed, in many cases, the unlabeled problems remained open for decades after the labeled problems were solved!)
Perhaps even more unsettlingly, sometimes the same techniques *do* work on both sides of this divide.

In keeping with the spirit of twentieth-century mathematics, the way out of this mess turned out to be a unifying framework couched in the language of category theory—the theory of "combinatorial species", introduced by André Joyal in 1981.
This theory significantly simplifies the conceptual underpinnings of structural enumerative combinatorics, but it also adds a lot of power—several open problems in graph enumeration have been resolved using these tools, and many challenging classical results can be rendered much more simply and elegantly with its help.

(Don't let the phrase "category theory" scare you off. It'll be gentle—I promise!)

### Introduction (Graphs and isomprhisms)
To do this right, we need to go back to basics.
What is an unlabeled graph, anyway?

Classically, we'd probably say something like "a graph is a collection of indistinguishable vertices, some of which are connected by edges", and then say that a labeled graph is what you get when you let those vertices take unique labels.
Here's the trouble: if the vertices aren't distinguishable, what exactly is that "collection of indistinguishable vertices"?
Set theory isn't built to handle this sort of thing.

To fix this up, we'll approach it from the other direction, starting from *labeled* graphs.
<div class="definition">
  A <span class="term">(labeled) graph</span> $G$ is a tuple $(V, E)$ with $E \subseteq \binom{V}{2}$.
  The elements of $V$ are the <span class="term">vertices</span> of $G$ and the elements of $E$ are the <span class="term">edges</span> of $G$.
</div>
In other words, a graph is made by taking an arbitrary set of vertices and then picking some of the possible pairs of vertices to be edges.

Now, how do we handle *unlabeled* graphs?
We need to somehow capture the idea of the underlying "shape" of a graph, independent of any particular choice of labeling.
One way to do this, which should seem natural to any student of modern mathematics, is to consider the <span class="term">equivalence class</span> of <em>all</em> graphs that have that shape.
Thus, for example, we don't try to find some underlying general structure that the graphs in Figures 1a and 1b share; we just put them both in the same bucket and call *that* the "unlabeled graph".

<div class="row">
  <div class="col-sm-6">
    <figure>
    <canvas id="unlgraphex1" class="graph"></canvas>
    <script>
        // make a new graph
        var graph = new Springy.Graph();

        // make some nodes
        var a = graph.newNode({label: 'a'});
        var b = graph.newNode({label: 'b'});
        var c = graph.newNode({label: 'c'});
        var d = graph.newNode({label: 'd'});

        // connect them with an edge
        graph.newEdge(a, b);
        graph.newEdge(b, c);
        graph.newEdge(c, d);

        $('#unlgraphex1').springy({ graph: graph });
      </script>
      <figcaption><span class="figlabel">Fig. 1a | </span> Example of a graph of isomorphism type $P_{4}$</figcaption>
    </figure>
  </div>
  <div class="col-sm-6">
    <figure>
      <canvas id="unlgraphex2" class="graph"></canvas>
      <script>
        // make a new graph
        var graph = new Springy.Graph();

        // make some nodes
        var a = graph.newNode({label: 'b'});
        var b = graph.newNode({label: 'a'});
        var c = graph.newNode({label: 'd'});
        var d = graph.newNode({label: 'c'});

        // connect them with an edge
        graph.newEdge(a, b);
        graph.newEdge(b, c);
        graph.newEdge(c, d);

        $('#unlgraphex2').springy({ graph: graph });
      </script>
      <figcaption><span class="figlabel">Fig. 1b | </span> Another example of a graph of isomorphism type $P_{4}$</figcaption>
    </figure>
  </div>
</div>

Of course, even for a simple graph like this one, this is a *huge* infinite family, but still—it's basically a concrete object, so that's progress.

We should note, though, that this infinite family isn't just an unstructured set.
There are *maps* that send these graphs to each other while "preserving structure".
<div class="definition">
  Given two graphs $G$ and $H$, a <span class="term">graph isomorphism</span> from $G$ to $H$ is a bijection $f: V(G) \to V(H)$ such that, for every pair of vertices $a, b \in V(G)$, $\{f(a), f(b)\}$ is an edge of $H$ if and only if $\{a, b\}$ is an edge of $G$.
</div>
For example, the graphs in Figures 1a and 1b are isomorphic, by the map that interchanges $a$ and $b$ and interchanges $c$ and $d$.

Graph isomorphism turns out to be the right way to capture the "same shape" property we were working with before.
Thus, we can also interpret an unlabeled graph as an *isomorphism class* of labeled graphs.
This is handy for a lot of reasons, but perhaps the most important for our purposes is that it gives the class an algebraic structure, and algebra is *awesome*.

### Species (You got functors in my combinatorics!)
The notion of graph isomorphism has a crucial feature that we haven't explored yet: *it's defined in terms of maps on the underlying vertex sets*.
Let's revisit the whole topic from a perspective that treat the vertex sets as the first-class citizens.

For any finite set $A$, let $\specname{G} [A]$ denote the set of graphs with vertex set $A$.
For any set bijection $\sigma: A \to B$, we then get a bijection $\specname{G} [\sigma]: \specname{G} [A] \to \specname{G} [B]$, which we term the <span class="term">transport</span> of $\sigma$.
(Specifically, $\specname{G} [\sigma]$ simply takes each graph labeled by $A$ and applied $\sigma$ to all its vertex labeled, yielding a graph labeled by $B$.)

This thing $\specname{G}$ has a couple of other algebraic properties that we should note here:

- The identity map $\operatorname{id}\_{A} : A \to A$ is transported to the identity map $\operatorname{id}\_{\specname{G} [A]}: \specname{G} [A] \to \specname{G} [A]$.
- Transport is "compatible" with composition of maps.
Formally, for bijections $\sigma: A \to B$ and $\tau: B \to C$, we have $\specname{G} [\tau \circ \sigma] = \specname{G} [\tau] \circ \specname{G} [\sigma]$.

Both of these properties are very, very natural.
(If they don't seem that way to you, start trying to prove them and you'll see what I mean.)

Taken all together, though, these properties tell us something important.
$\specname{G}$ is more than just a simple function from the world of label sets to the world of sets of graphs; it *respects bijections* in an algebraically-significant way.
In fact, the properties I've just identified are exactly the right ones to conclude the following:
<div class="observation">
  $\specname{G}$ is a <span class="term">functor</span>.
  In particular, for $\catname{FinBij}$ the category whose objects are finite sets and whose morphisms are set bijections, $\specname{G}$ is a functor from $\catname{FinBij}$ to itself.
</div>

This categorical language of functors captures a simple idea: the construction of the class of graphs $\specname{G} [A]$ from the label set $A$ respects the way set maps act on $A$.
Thus, this "functorality" is directly connected to the idea of isomorphism classes that we wanted to study before.

Before we move on, let's record a general definition that captures what we've just discovered:
<div class="definition">
  Let $\catname{FinBij}$ denote the category of finite sets with bijections.
  A <span class="term">combinatorial species</span> is a functor $F: \catname{FinBij} \to \catname{FinBij}$.
</div>

### But what's it all for?
Well, that's all very nice.
We've taken the theory of graphs, which seemed to be doing just fine on its own, and cruelly dressed it up in all this categorical silliness.
What do we *gain* by doing this?

Quite a lot, actually!
Before I can say why, though, we're going to need to build up some more tools.
In the next installment, we'll take a deep dive into the algebraic and categorical tools associated with species.
We might even count something!

[generatingfunctionology]: //www.math.upenn.edu/~wilf/DownldGF.html
