---
title: 'What is a combinatorial species? II'
date: '2013-12-07'
tagline: 'Or, how to count with functors'
categories: [ 'research' ]
tags: [ 'combinatorics', 'eunmeration', 'whatisa', 'species' ]
permalink: /research/what-is-a-combinatorial-species-2
widgets :
  sagecell :
    enable : true
  springy :
    enable : true
---

[Last time](/research/what-is-a-combinatorial-species-1), we saw how the language of category theory could inform our understanding of combinatorial structures.
Specifically, we considered the "species of graphs" $\specname{G}$, which turns a set $A$ of labels into the set $\specname{G} [A]$ of graphs with vertex set $A$ and transforms a set bijection $\sigma: A \to B$ into the map $\specname{G} [\sigma]: \specname{G} [A] \to \specname{G} [B]$ which sends each graph to its relabeling under $\sigma$.
Conceptually, this shifts our attention from individual graphs to the *process* by which graphs are assembled out of their vertex sets.

This time, I hope to explain why we might do such a crazy thing.
The punchline is that, amazingly enough, this will actually help us count classes of graphs that would otherwise be totally inaccessible.
To get there, though, we have some work to do.

### Counting series
Enumerative combinatorics is generally concerned with sequences of numbers.
We have kind of a lot of them.
(Consider, for example, the astonishing diversity and number of sequences documented at the [OEIS].)

To keep track of things, we frequently attach these sequences to so-called <span class="term">generating functions</span>, which are formal power series whose coefficients are determined by the sequence we wish to study.
For example, given a sequence $a = \langle a\_{0}, a\_{1}, \dots, a\_{i}, \dots \rangle$, the associated <span class="term">exponential generating function</span> $a(x)$ is the formal power series
$$ a(x) = \sum\_{i = 0}^{\infty} a\_{i} \frac{x^{i}}{i!}. $$
(The factors of $i!$ in the denominator help out with some of the algebra; we don't need to worry about them here.
If we omit those denominators, we get the <span class="term">ordinary generating function</span>, which seems much more reasonable but is frequently less useful.)

The algebra of generating functions turns out to be a spectacularly useful tool for combinatorial enumeration—see Wilf's [generatingfunctionology] for many delightful examples.
However, it has important limitations; in particular, as discussed last time, it often runs aground when applied to problems involving unlabeled structures.

To overcome this, we'll take advantage of the species-theoretic approach.
We've already examined the way that a bijection of finite sets $\sigma: A \to B$ is transported to a bijection of sets of graphs $\specname{G} [\sigma] : \specname{G} [A] \to \specname{G} [B]$.
If we restrict our attention to a single finite set at a time (say $[n] = \{1, 2, \dots, n\}$), then a bijection $\sigma: [n] \to [n]$ is in fact a *permutation*, as is its transport $G [\sigma]$.

Indeed, the symmetric group $\symgp{n}$ is transported to a permutation group $\specname{G} [\symgp{n}]$, which can be understood as an <span class="term">action</span> of $\symgp{n}$ on the class $\specname{G} [[n]]$ of $n$-vertex graphs.
Our original problem of counting unlabeled graphs can now be re-formulated as one of counting orbits in $\specname{G} [[n]]$ under the action of $\symgp{n}$.

Lucky for us, orbit-counting is well-explored territory.
The fundamental result in the area is the Orbit-Counting Lemma (often known as Burnside's, although historically he seems to be the one person who we can definitively say *didn't* invent it):
<div class="lemma">
    Let $G$ be a group acting on a set $X$.
    The number of orbits under this action is equal to $$\frac{1}{\lvert G \rvert} \sum\_{g \in G} \lvert \operatorname{fix} g \rvert.$$
</div>

Thus, we can count orbits by counting fixed points; often, the latter is *much* easier to do than the former, which makes this an extremely powerful tool.
In fact, it's so powerful that, from here on out, we'll mostly worry about counting fixed points and let algebra and the Lemma take care of translating those results to count orbits.

In the context of a species $F$, we'll do this by defining a new kind of formal power series that keeps track of all the fixed-point information for the whole permutation group $F [\symgp{n}]$.
The ideal tool would be an algebraic widget that recorded the number of fixed points of the transport of each $\sigma \in \symgp{n}$.
Fortunately, we can construct just such a thing.

<div class="definition">
    Let $F$ be a combinatorial species.
    The <span class="term">cycle index series</span> of $F$ is the formal power series $Z_{F}$ given by
    $$ Z_{F} (p_{1}, p_{2}, \dots) = \sum_{n \geq 0} \frac{1}{n!} \sum_{\sigma \in \symgp{n}} \lvert \operatorname{fix} F [\sigma] \rvert p_{1}^{\sigma_{1}} p_{2}^{\sigma_{2}} \dots$$
    where $p_{i}$ are commuting formal variables and where $\sigma_{i}$ is the number of $i$-cycles in $\sigma$.
    We'll use the term $p\_{1}^{\sigma\_{1}} p\_{2}^{\sigma\_{2}} \dots$ pretty frequently, so we'll often abbreviate it as $p\_{\sigma}$.
</div>

The choice of $p$ for our formal variables is motivated by deep connections to representation theory and the theory of symmetric functions.
If you're familiar with that stuff, these $p$s really are the elements of the power-sum basis of the ring $\Lambda$ of formal symmetric functions.
If you aren't, don't worry about it; it's a neat connection, but it isn't necessary for the work at hand.

### Counting with the cycle index series
Suppose for the moment that you already know the cycle index series $Z\_{F}$ of some combinatorial species $F$.
What can you do with it?

Conveniently, you can use it to count $F$-structures.
In fact, you can count both labeled and unlabeled $F$-structures with the same tool!

Suppose we want to count the *labeled* $F$-structures using $Z\_{F}$.
They are all fixed by the action of the identity elements of the symmetric groups $\symgp{n}$, so we can recover them with a simple substitution:
<div class="theorem">
    The exponential generating function for labeled $F$-structures is given by
    $$ F(x) = Z_{F} (x, 0, 0, \dots). $$
</div>

Now suppose we want to count the *unlabeled* $F$-structures using $Z\_{F}$.
By the Lemma, we can do this by averaging the number of fixed points of the permutations $\sigma \in \symgp{n}$.
It turns out that this can *also* be done by a simple subsitituion!
<div class="theorem">
    The ordinary generating function for unlabeled $F$-structures is given by
    $$ \tilde{F}(x) = Z_{F} (x, x^{2}, x^{3}, \dots). $$
</div>

So that's pretty cool.

### Computing cycle index series
Of course, none of this does us any good unless we can actually *find* the cycle index series of some particular species $F$.
There are a few different ways we can approach this.

Perhaps the most natural thing to do is to just sit down and compute the numbers $\lvert \operatorname{fix} F [\sigma] \rvert$.
For some of the simple species we'll want to work with later, this is perfectly reasonable.

For example, let $\specname{E}$ denote the species for which $\specname{E} [A] = \{A\}$ for every finite set $A$.
This is the <span class="term">species of sets</span>, and its cycle index is quite straightforward, since there is just one $\specname{E}$-structure over $[n]$, which is fixed by every permutation $\sigma \in \symgp{n}$.
<div class="theorem">
    The cycle index of the species $\specname{E}$ of sets is given by
    $$ Z\_{\specname{E}} = \sum\_{n \geq 0} \frac{1}{n!} \sum\_{\sigma \in \symgp{n}} p\_{\sigma}. $$
</div>

In fact, some important species are so simple that we can write down their cycle index series in their entirety.
Consider these three examples:

- Let $\mathbf{0}$ denote the species for which $\mathbf{0} [A] = \varnothing$ for all $A$.
  Then $Z\_{\mathbf{0}} = 0$.
  We will term this the <span class="term">empty species</span>.
- Let $\mathbf{1}$ denote the species for which $\mathbf{1} [\varnothing] = \\{\varnothing\\}$ and $\mathbf{1} [A] = \varnothing$ otherwise.
  Then $Z\_{\mathbf{1}} = 1$.
  We will term this the <span class="term">unit species</span>.
- Let $\mathbf{X}$ denote the species for which $\mathbf{X} [A] = \\{A\\}$ if $\lvert A \rvert = 1$ and $\mathbf{X} [A] = \varnothing$ otherwise.
  Then $Z\_{\mathbf{X}} = p\_{1}$.
  We will term this the <span class="term">singleton species</span>.

Of course, these species are all quite boring; no one would ever go to all the trouble of talking about cycle indices just to count how many nothings there are!
Still, these are useful results, because these species can be *combined* to produce more interesting ones.

### Species algebra
Now we get to the good stuff.

Many combinatorial insights involve "decompositions" of some sort.
For example, a graph is a set of connected graphs, and a rooted tree is either an empty structure or a root vertex and a set of rooted descendant trees.
When these decompositions are "structural" (in the sense that they don't require reference to labels), they can often be translated into species-theoretic statements, which will then have analogues at the cycle-index level.
This will allow us to develop a theory of "cycleindexology", which will allow us to overcome the difficulties that generating functions have with unlabeled structures.

#### Species sum
We'd like to develop some operations on species which correspond to nice operations on their cycle indices.
To get this started, I'll show an example of how cycle-index-based thinking can motivate the appropriate constructions.

Suppose we want to develop a "species sum" operation which turns two species $F$ and $G$ into a combined species $F + G$.
The crucial property of this operation would be that we would have $Z\_{F + G} = Z\_{F} + Z\_{G}$.
So what should an $(F + G)$-structure be?

Well, if we expand the sum equation and examine the coefficients of a particular term $p\_{\sigma}$, we find that we need $\lvert \operatorname{fix} (F + G) [\sigma] \rvert = \lvert \operatorname{fix} F [\sigma] \rvert + \lvert \operatorname{fix} G [\sigma] \rvert$.
That is, the number of $(F + G)$-structures fixed by $\sigma$ should be the total number of $F$-structures and $G$-structures fixed by $\sigma$ added together.
If we let $(F + G) [A]$ be the disjoint union of $F [A]$ and $G [A]$, this will follow automatically, so let's go with that.

<div class="definition">
    Let $F$ and $G$ be combinatorial species.
    Their <span class="term">species sum</span> $F + G$ is the species obtained by letting $(F + G) [A] = F [A] \sqcup G [A]$ and letting $(F + G) [\sigma]$ act as $F [\sigma]$ on the $F$-structures and $G [\sigma]$ on the $G$-structures.
</div>

The desired result on cycle indices follows immediately.

<div class="theorem">
    Let $F$ and $G$ be combinatorial species.
    Then $Z_{F + G} = Z_{F} + Z_{G}$.
</div>

#### Species product
We'd like to do something similar with multiplication.
Of course, there's a natural way to multiply sets—the Cartesian product—but that turns out *not* to correspond to multiplication of cycle indices.
(In fact, it corresponds to the Hadamard product of the cycle indices, but we'll leave that alone for now.)

Instead, the right way to combine the species turns out to be a sort of "partitional combination", where a $(F \cdot G)$-structure on $A$ is an $F$-structure on some subset of $A$ and a $G$-structure on the rest.

<div class="definition">
    Let $F$ and $G$ be combinatorial species.
    Their <span class="term">species product</span> $F \cdot G$ is the species obtained by letting $(F \cdot G) [A] = \sum_{X \sqcup Y = A} F[X] \times G[Y]$ and letting $(F \cdot G) [\sigma]$ act by restricting $\sigma$ to $X$ to apply it to $F[X]$ and to $Y$ to apply it to $G[Y]$.
</div>

<div class="theorem">
    Let $F$ and $G$ be combinatorial species.
    Then $Z_{F \cdot G} = Z_{F} \cdot Z_{G}$.
</div>

#### Species composition
We noted before that "a graph is a set of connected graphs".
What does this mean in terms of cycle index series?

Let $\specname{G}$ denote the species of (simple) graphs, $\specname{CG}$ the species of connected graphs, and $\specname{E}$ the species of sets as before.
Ideally, we'd like to define some natural operations $\circ$ for which $\specname{G} = \specname{E} \circ \specname{CG}$ and $Z\_{\specname{G}} = Z\_{\specname{E}} \circ Z\_{\specname{CG}}$.
What would these look like?

Well, what does it mean to build a graph out of its connected components?
If $G$ is a graph with vertex set $A$, each of its components is a connected graph $G\_{i}$ with vertex set $A\_{i}$, with the restriction that $\bigsqcup\_{i} A\_{i} = A$, and the collection of connected graphs $G\_{i}$ is then identified with the *labels* of the overarching $\specname{E}$-structure.
In other words,
$$\specname{G} [A] = \sum\_{A\_{1} \sqcup A\_{2} \sqcup \dots \sqcup A\_{i} = A} \specname{E} [[i]] \times \big( \specname{CG} [A\_{1}] \cdot \dots \cdot \specname{CG} [A\_{i}] \big). $$

Written out algebraically, this is a terrible mess, but conceptually it's actually pretty straightforward; it really does just mean that a $\specname{G}$-structure on $A$ is a collection of $\specname{CG}$-structures on the parts of a partition of $A$ and a $\specname{E}$-structure on the partition itself.

This leads to our general definition.

<div class="definition">
    Let $F$ and $G$ be combinatorial species with $G [\varnothing] = \varnothing$.
    Then the <span class="term">species composition</span> $F \circ G$ is the species obtained by letting
    $$(F \circ G) [A] = \sum_{A_{1} \sqcup A_{2} \sqcup \dots \sqcup A_{i} = A} F [[i]] \times \big( G [A_{1}] \cdot \dots \cdot G [A_{i}] \big). $$
</div>

Remarkably, we actually can write down a nice formula for the cycle index of $F \circ G$.
(I definitely won't try to prove this here.)

<div class="theorem">
    Let $F$ and $G$ be combinatorial species with $G [\varnothing] = \varnothing$.
    Then
    $$ Z_{F \circ G} = Z_{F} \big(
      Z_{G} (p_{1}, p_{2}, p_{3}, \dots),
      Z_{G} (p_{2}, p_{4}, p_{6}, \dots),
      Z_{G} (p_{3}, p_{6}, p_{9}, \dots),
      \dots
      \big).$$
</div>
The right-hand side of this equation is, of course, denoted $Z\_{F} \circ Z\_{G}$, and it in fact corresponds to the classical plethysm of symmetric functions (which may help to suggest why we called the variables $p\_{i}$!)

I know this is a lot to digest, but now we've finally reached the point where we're doing something new.
This operation of species composition is combinatorially very natural, but *it has no general generating-function analogue*.
You just can't do this without cycle indices.

***That's exciting news.***

### The part where he counts something
Let's get to work.

As a first example, consider the class of rooted trees.

<div class="row">
<figure>
  <canvas id="unlgraphex2" height="400" class="graph"></canvas>
  <script>
    // make a new graph
    var graph = new Springy.Graph();

    // make some nodes
    var a = graph.newNode({label: 'a'});
    var b = graph.newNode({label: 'b'});
    var c = graph.newNode({label: '(c)'});
    var d = graph.newNode({label: 'd'});
    var e = graph.newNode({label: 'e'});
    var f = graph.newNode({label: 'f'});
    var g = graph.newNode({label: 'g'});

    // connect them with an edge
    graph.newEdge(c, a);
    graph.newEdge(c, d);
    graph.newEdge(d, f);
    graph.newEdge(c, b);
    graph.newEdge(b, e);
    graph.newEdge(b, g);

    $('#unlgraphex2').springy({ graph: graph });
  </script>
  <figcaption><span class="figlabel">Fig. 2 | </span> An example of a rooted tree</figcaption>
</figure>
</div>

Let $\specname{A}$ denote the species of rooted trees and consider a specific rooted tree $T$ (such as the one in Figure 2).
If $T$ is nonempty, it has a root, which receives a single label which cannot be moved by any automorphism of $T$.
Removing that root would disconnect $T$ into a collection of trees; we can root each of these descendant trees at the vertex which was attached to the original root in order to record the structure.

Therefore, *a rooted tree consists of a singleton and a set of rooted trees*.

Of course, we could have an empty set of labels; for algebraic reasons, we'll say that there *is* an empty rooted tree, but that the descendants of the root must be nonempty.
Thus, the more complete characterization of the species $\specname{A}$ is as follows:
<div class="theorem">
  For $\specname{A}$ the species of rooted trees, $\mathbf{X}$ the species of singletons, $\specname{E}$ the species of sets, and $\mathbf{1}$ the unit species, we have
  $$ \specname{A} = \mathbf{1} + \mathbf{X} \cdot (\specname{E} \circ (\specname{A} - \mathbf{1})).$$
</div>

Since we know the cycle indices for $\mathbf{1}$, $\mathbf{X}$, and $\specname{E}$, this allows us to compute the cycle index for $\specname{A}$ recursively!

At this point, we should bring in computers.
We're going to let the [Sage] computer algebra system do all the heavy lifting for us.

Take a look at the following code.
When you're ready to go, hit the "evaluate" button at the bottom.

<div class="sage">
<script type="text/x-sage">
# Set E and X to be the cycle indices of the appropriate species,
# since Sage already knows how to compute them
E = species.SetSpecies().cycle_index_series()
X = species.SingletonSpecies().cycle_index_series()

# Get the ring of cycle index series so we can make a new one
CISR = sage.combinat.species.generating_series.CycleIndexSeriesRing

# Set up a new cycle index series for our species A, using
# coefficients from QQ (the rational field)
A = CISR(QQ)(0)

# Define A recursively
A.define(1+X*E(A-1))

# Compute the number of unlabeled A-structures on up to 7 vertices
A.isotype_generating_series().counts(8)
</script>
</div>

And hey, that sequence looks familiar—it's [A000081](http://oeis.org/A000081), "Number of rooted trees with n nodes".
Neat!
Feel free to play around with the code sample above.
You can increase the number of terms computed, switch to counting labeled structures (by replacing <code>isotype\_generating\_series</code> by <code>generating\_series</code>), and do all sorts of other things.

Next time, I'll look at some more advanced topics in species-theoretic enumeration.
We'll return to the subject of connected graphs and see what tools we need to manage their complexities.
(Hint: a ring completion is involved!)

[generatingfunctionology]: //www.math.upenn.edu/~wilf/DownldGF.html
[oeis]: //www.oeis.org
[sage]: //www.sagemath.org
