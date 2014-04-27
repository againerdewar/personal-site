---
title: Git for academic writing
date: '2014-04-25'
tagline:
categories: [ 'latex' ]
tags: [ 'latex', 'software', 'git' ]
widgets :
  sagecell :
    enable : false
  springy :
    enable : false
---
If you're reading this blog, I'm sure I don't have to convince you that LaTeX is an awesome way to produce documents.
However, as brilliant as LaTeX is at turning words into documents, it alone can't solve all our writing problems.
After a few weeks or months of editing a large document like a dissertation, you've no doubt ended up with directories and emails littered with files like `agd-thesis.final.version2.withcomments.final.april4.committee.revised.tex`.
Collaborative editing only exacerbates the pain.

Fortunately, a solution exists to all these problems (and many more you don't even know you have!)—[Git][git].
It's surprisingly simple to use, and once you get the hang of it, **Git will change your life**.

I'm serious.

## What's a git?
[Git][git] is a *version-control system*.
It records snapshots of your files, called "versions" or "commits", and stores the history of those files as they evolve.
Every version of the files that you commit is tucked away safely, so you can recover any version at any moment.
For example, while writing my [dissertation][agd-thesis], I made a total of 361 [commits][agd-thesis-history], each of which changed the LaTeX source just a little.
Years later, I can easily go back and look at the document at any of those 361 stages of the process.

What do I gain from this, other than a cyber-archaeological dig site?

* No more crazy filenames!
* No more rooting around in my email to look for the version I sent last week!
* No obstacles to deleting text I don't need anymore!
  (After all, everything that has ever been committed is still safely stored in the repository.)

It's remarkably liberating.

But wait!
There's more!

[Git][git] is a *distributed* version-control system.
The whole "repository" (where Git stores all that history) is stored in the directory with my thesis.
It's also stored on my server.
It's also stored on [Github][agd-thesis], a free Git hosting site.
I can easily "push" and "pull" commits from one of these repositories to another.

Working solo, there are two main advantages of this:

* All my work is automatically backed up, just by pushing it to another machine.
* I have access to the whole history of my project even when I don't have an Internet connection.
  I can work in a coffee shop or on an airplane, then push any new history to the other machines when it's convenient.

If you're collaborating, though, it gets even better.
Git is designed from the ground up for large, complicated projects with many contributors.
It was originally created for the Linux kernel team, which has dozens of participants and complicated security and political needs; it's certainly capable of handling anything we can throw at it.
(The Univalent Foundations Project recently used Git to write a [textbook][hott-github] with two dozen authors and reports a very pleasant experience.)

But enough philosophy.
Let's talk nuts and bolts.

## Getting started
From here on out, I'm going to assume that you're running a Unix-like OS with a real command line (OSX or some flavor of Linux will do nicely).
I'm told that there are ways to use Git on Windows, but I haven't used them.
There are also plenty of graphical tools for interacting with Git on every operating system, but, again, I haven't used them.

If you're on OSX, you can download Git [here][git-mac]; on Linux, install it using your package manager.

### Introducing yourself to Git
Everything you store in your Git repository will be stamped with your name and email address.
This will be really useful if you work collaboratively!
To set this up, run the following commands, substituting your own information:

```
> git config --global user.name 'Andrew Gainer-Dewar`
> git config --global user.email andrew.gainer.dewar@gmail.com
```

### Using an existing repository
If you're getting involved in a project that already has a repository, your first step is to "clone" it to your own computer.
Fire up a terminal and navigate to the directory where you want the project to live.
(Git will create a subdirectory for you.)

You'll need the "clone URL" for the repository in question; on GitHub, you can find it on the right, below the settings buttons.
Once you have it, just run `git clone` as shown below, substituting in your URL.
(This particular command will clone my calculus textbook project.)

```
> git clone https://github.com/againerdewar/calculus-reader.git
Cloning into 'calculus-reader'...
remote: Reusing existing pack: 726, done.
remote: Total 726 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (726/726), 144.60 KiB | 0 bytes/s, done.
Resolving deltas: 100% (463/463), done.
Checking connectivity... done.
```

If you aren't used to reading these kinds of code snippets, the first line (starting with `>`) is the command, and the rest is the output on the terminal.
You should see something similar, with different numbers depending on the size of the project.

That's it!
Git has downloaded and unpacked the repository for you.
Now there should be a subdirectory named after your repository (in the example above, `calculus-reader`) with all the files from that project ready to go.

### Creating a new repository
If you're starting a new project, you'll need to create a repository yourself.
Navigate to the directory containing the project (or create a new one), then run `git init` as shown below.

```
> git init
Initialized empty Git repository in /home/andrew/documents/work/teaching/shared/test-project/.git/
```

Again, that's it!
Git is now ready to manage the history of your directory.

## Committing changes
Now that you've got your local repository set up, it's time to start making changes.
The fundamental unit of history in Git is the *commit*, which represents a state of the repository (although it's actually stored in terms of changes to save space).
To build a commit, you'll use `git add` to *stage* changes to files, then `git commit` to record the changes you've staged.
Changes might come from modifications, additions, or deletions of files.

Here's an example.
Suppose your project includes a file `document.tex`, which you've changed since the last commit.
(If your repository or the file is new, the "change" will be the addition of `document.tex`; otherwise, it might be a change in the contents of the file.)

First, we need to tell Git that we want to stage the changes.

```
> git add document.tex
```

If you have made changes to multiple files and want to commit them together, just repeat that step with each file.

Once all the changes are staged, we need to commit them to the history.
We'll record a short message to go along with this commit, indicating what happened in this change.
(If you omit the `-m "Commit message"` option, Git will prompt you for a message in a text editor.)

```
> git commit -m "Add proof of Riemann Hypothesis"
[master (root-commit) 904e5e7] Add proof of Riemann hypothesis
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 document.tex
```

The output tells us what happened.
In this case, I only changed one file (`document.tex`), and all I did was create it.
If the file already existed and I had changed its contents, the numbers of "insertions" and "deletions" would record how many lines had changed.

### Principles of good commits
The commits and commit messages are going to become the history of your project, so it's worth putting a little thought into them.
Here are my four principles of good commits.
After you use Git for a while, you'll probably develop your own philosophy, but I think these make a good place to start.

1. Commits should be **small**.
   Down the road, it will be more useful for you to have large numbers of small commits.
   One important reason for this is that Git makes it easy to "revert" specific commits if you decide you want to undo certain changes; smaller commits make it easier to isolate the ones that make a specific change.
1. Commits should be **self-contained**.
   In particular, LaTeX should always run properly on any committed version.
1. Commits should be **complete**.
   Each one should represent a distinct, conceptually meaningful change to the document.
   Don't just work for an hour and then throw all the changes into a single commit.
   Identify a task, complete that task, and then commit it all at once.
   (This will feel weird at first, but it will help make you a better writer.)
1. Commits should be **documented**.
   Those commit messages are really important:

   * They provide a log of your work.
     Going back and reading over your commit logs for a day or a week is a great way to get an overview of your accomplishments.
   * They help others understand what each commit does.
   * They help you think about what you're doing as you do it.
     We can all stand to be more thoughtful writers!

   The usual convention in Git is to write commit messages in the present imperative tense.
   In other words, the message should describe what the commit will do to the project.
   In the previous example, I used the commit message `Add proof of Riemann Hypothesis`, which has this structure.

## Viewing history
After you've build up some history in your project, you may want to get a look at how things are going.
The `git log` command lets us see all this information.
After making just one commit in my test repository, here's the output from `git log`:

```
> git log
commit b2f1a3c03a8ffdd24b5ec25592cbe81d23dfcaba
Author: Andrew Gainer-Dewar <andrew.gainer.dewar@gmail.com>
Date:   Sun Apr 27 11:25:54 2014 -0500

    Add proof of Riemann hypothesis
```

Every commit in your history will have an entry here.
The first line shows the "hash", a code that uniquely identifies each commit.
In practice, we usually refer to commits with a shortened version of their hashes; in this case, `b2f1a3c` would do just fine.

Of course, this can get pretty unwieldy if your project has a lot of commits!
I recommend the following command for more readable output.

```
> git log --graph --decorate --pretty=oneline --abbrev-commit
* 87cb0b6 (HEAD, github/master, master) Clean up display equations in derivs-as-functions
* e758408 Add material on antiderivatives
* c7ec1bc Add material about derivative signs
* 4623bc7 Fix a footnote in product-rule calculation
* f0b8467 Fix labels in trig derivs and add cos proof exercise
* a0b4d0b Remove spurious \centering commands in some figures
* dedaa88 Add material about trig derivatives
* cd8b1ac Add short README
```

I've shown the first few lines of output from this command in my calculus textbook project, so you can see how it works with longer histories.
Each commit gets just one line, showing its abbreviated hash and commit message.
The most recent commit (`87cb0b6`) also has several other identifiers: `HEAD`, `master`, and `github/master`.

* `HEAD` indicates that this is the commit which is currently checked out.
* `master` is the name of a "branch" in my project; this commit is the current state of this `master` branch.
  We'll talk more about branches later.
* `github/master` indicates that this branch is also uploaded to the `github` repository, and that it's synced up.

The command above is very useful, but it's also a pain to remember.
Run the following commands *once* and you'll have shortcuts forever.

```
> git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit"
> git config --global alias.lola "log --graph --decorate --pretty=oneline --abbrev-commit --all"
```

Now, instead of typing `git log --graph --decorate --pretty=oneline --abbrev-commit` every time, you just have to type `git lol`!
(This also defines the command `git lola`, which is similar but shows all branches.
We'll come back to that.)

## Checking out a version
After you've built up some history in your project, you may find that you want to go back and see a previous version.
All the versions are stored in Git's "index", but to get a look at things, we need to "check out" the version in question.
For instance, to get a look at the commit with comment `Add short README` in the log above, we'd run the following command.

```
> git checkout cd8b1ac
Note: checking out 'cd8b1ac'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at cd8b1ac... Add short README
```

The last line tells us that we got what we wanted: the repository is in the state corresponding to `cd8b1ac`.
To get back to the current `HEAD`, we can use either `git checkout 87cb0b6` or `git checkout HEAD`.
(I recommend the latter, since you don't have to look anything up to know that `HEAD` is the most recent commit.)

**Warning**: if your working directory has changes relative to `HEAD`, things can get weird during a checkout.
Don't do this.

At any given time, your repository has some commit checked out.
Knowing which one is important, because each commit you make will go "on top of" (or "be a child of") the current one.
In what follows, I'll use location as a metaphor for this information, describing things in terms of "where you are" or "what commit you're on".

You can use the `git status` command to see where you are in the history, along with information about what has changed since the current `HEAD` commit.
Here's the results of running `git status` in my calculus book repository:

```
> git status
On branch master
Your branch is up-to-date with 'github/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   ch.integral-applications/average-value.tex

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	ch.integral-theory/riemann-improved.tex
```

This shows that I'm currently on branch `master`, that I have changes in the `average-value.tex` file which I have not yet committed, and that the `riemann-improved.tex` file is not currently tracked by Git.

## Branches and tags
Git stores a variety of data with each commit in the index.

* The state of the repository as of that commit.
  (Actually, it stores the changes needed to *produce* that state, but this doesn't usually affect our work.)
* The commit message.
* The hash (or ID) of the commit.
* The "parent" (or parents) of the commit in the history of your project.
  (We're all mathematicians here, right?
  The commits form a directed acyclic graph, with edges pointing from parents to children.)

There are also a couple of things that it stores separately which turn out to be really important.

* A collection of names called "tags" which point to commits.
* A collection of names called "branches" which point to commits.

At a mathematical level, tags and branches are exactly the same!
However, they're used in very different ways.

### Tags
Tags are used to record information about commits.
In software projects, it's common practice to tag the commit corresponding to each release.
In my own writing, I like to add a tag to each version of a document that I send to someone else.
For example, when I submit a paper to a journal, I might put the tag `2014.04.15.journal.submitted` to keep track of that.

Adding a tag to a commit is easy.
To put the tag `tagname` on commit `1234567`, just run the following command.

```
> git tag tagname 1234567
```

If the commit you want to tag is currently checked out, you can even omit the hash:

```
> git tag tagname
```

These tags will show up in your commit logs.
You can also check out commits using their tag names; after running the above, the following command would do exactly what you'd expect.

```
> git checkout tagname
Note: checking out 'tagname'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b new_branch_name

HEAD is now at e758408... Add material on antiderivatives
```

The last line will change, naturally, depending on where you put the tag.

Once you put a tag on a commit, it stays there forever—unless you remove it.
Tags can only point to one commit, so if you want to re-use a tag name, you'll need to remove it first.
To delete the tag `tagname`, just run the following command.

```
> git tag -d tagname
```

This only deletes the tag; the commit isn't affected.

### Branches
Branches are used to record information about *lines of development*.
You can use branches to work on different versions of your project, to test out a new feature or organizational structure without disrupting other work, or for a variety of other reasons.
Git makes it easy to create new branches and to "merge" commits from one branch into another.

Here's some examples of how branches could be used in producing documents:
* In the repository for a dissertation, you might have separate `master` and `advisor` branches.
  `master` would, as always, represent the current state of the document, while the `advisor` branch could be used for incorporating feedback and edits from your advisor.
  Git's `cherry-pick` functionality would allow you to incorporate those revisions selectively into `master`.
* If you need different versions of a paper during the revisions process (say, using document classes for different journals), you could create a branch for each, then use `merge` to import changes from version to another.
* Each contributor to a collaborative project could have their own branch where they did their own work.
  The `master` branch would then be used to merge and reconcile the work done by all the collaborators.

So how do we use branches?

### Checking out a branch

If you want to work with an existing branch in your repository, just check it out.
For example, to check out the branch `branchname`, run the following command.

```
> git checkout branchname
Switched to branch 'branchname'
```

If you need to create a new branch, use the `-b` option to `git checkout`.
For example, to create and check out the branch `branchname`, run the following command.

```
> git checkout -b branchname
Switched to a new branch 'branchname'
```

The parent of this new branch will be the commit which was `HEAD` at the time you created the branch.

After either of these commands, you can work in your working directory as usual.
If you make any commits right now, they will go on the `branchname` branch.
Crucially, the pointer to `branchname` will move with you; this is the primary technical difference between branches and tags.

### Bringing branches together

Suppose you're working on a project with a collaborator, who has just committed some interesting changes into her `jane` branch.
You'd like to incorporate these into `master` and make them part of the official version.

First, if you haven't already, check out `master`:

```
> git checkout master
Switched to branch `master`.
```

Now tell Git to merge the `jane` branch in.

```
> git merge jane -m "Merge branch 'jane'"
Merge made by the 'recursive' strategy.
 test.tex | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 test
```

The output here indicates that my merge added a single file, called `test.tex`.
Your output may look very different, depending on what changes are being merged in.
Assuming things went according to plan, though, your `master` branch should now have a new "merge commit" which incorporates all of Jane's changes.

Of course, things don't always go according to plan.
There may be "conflicts" which prevent Git from merging Jane's changes cleanly into `master`; this usually happens when the same line of text has been changed in both branches.
In this case, you'll need to fix things up yourself.
You'll know that a conflict has occurred because Git will throw a warning at you.

```
> git merge jane
# Git will prompt you for a commit message, then:
Auto-merging test.tex
CONFLICT (content): Merge conflict in test.tex
Automatic merge failed; fix conflicts and then commit the result.
```

This indicates that the file `test.tex` has a conflict which Git could not resolve on its own.
To fix it, open up `test.tex` in your favorite text editor.
The section with the conflict will look like this:

```
<<<<<<< HEAD
The Riemann Hypothesis is true.
=======
The Riemann Hypothesis is false.
>>>>>>> jane
```

This indicates that the version `HEAD` (which was `master` in our case) had the line `The Riemann Hypothesis is true.`, while the version `jane` had the line `The Riemann Hypothesis is false.` in the same place.
Git cannot resolve this for you.
You need to decide what should be there, then replace *the entire thing* (from `<<<<<<< HEAD` to `>>>>>>> jane`) with the text you want to appear in the merged document.

A given merge may create many conflicts.
After you resolve them all, you need to finish up the merge commit.
Stage each file that had a conflict:

```
> git add test.tex
```

Then tell Git to proceed with the merge.

```
> git commit
# Git will prompt you for a commit message, which will be built from the one you supplied before. Then:
[master 2717dab] Merge branch 'jane'
```

Much better!

## Working with remote repositories

If you're collaborating on a project with other people, you're going to need a repository that everyone can access.
This is easy to set up using hosting sites like [GitHub][github] and [BitBucket][bitbucket]; if you prefer, you can also self-host on any server where you have shell access.
Setting up the repository and getting your computer to talk to it is beyond the scope of this article (but there's many great guides available online).

### Telling Git about a remote
If you're working with a repository "cloned" from another project, Git has already configured the remote repository for you.
Otherwise, you need to tell your local repository about the "remote".

For example, to add my calculus textbook as a remote named `github` to a repository, I'd run the following command.
(Note that this requires you to have SSH access to my repository!
There are other methods to get read-only access.)

```
> git remote add --track master github git@github.com:againerdewar/calculus-reader.git
```

Now Git knows that this repository exists and is related to yours.
In addition, it knows that your `master` branch and the `master` branch on the `github` repository are related.
However, it hasn't actually downloaded any information yet!

### Fetching commits from a remote

In order to take advantage of the commits in a remote repository, you need to download them.
To do this, use the `git fetch` command.

```
> git fetch github
From github.com:againerdewar/calculus-reader
 * [new branch]      master     -> github/master
```

If you have several remotes configured, you can fetch them all at once.

```
> git fetch --all
Fetching github
From github.com:againerdewar/calculus-reader
 * [new branch]      master     -> github/master
```

In this example, there's now a `github/master` branch available in your local repository which contains all the commits from upstream.
If you want to incorporate them into your own `master`, you can merge them.
Check out `master`, then run `git merge github/master`.

Alternately, you can combine the `fetch` and `merge` steps into a single command.
Running the following will fetch changes from upstream and merge any "remote-tracking" branches automatically.

```
> git pull
Updating e758408..87cb0b6
Fast-forward
 ch.derivative-theory/derivs-as-functions.tex | 72 +++++++++++++++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 45 insertions(+), 27 deletions(-)
```

The output indicates that this pull moved `master` from `e758408` to `87cb0b6`, causing changes in just one file (`derivs-as-functions.tex`).

### Sending commits to a remote

If you're collaborating on a project, you'll probably want to send your own work to your collaborators as well as downloading theirs.
Suppose you're working on the `andrew` branch and want to make your changes available to the rest of your team.
The primary command to do this is `git push`, which sends your changes to remotes.
In this case, we'd just need to run the following.

```
> git push
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 288 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To git@github.com:againerdewar/calculus-reader.git
   ace82c7..e91f989  andrew -> andrew
```

This indicates a successful push.

If you're working on a new branch which isn't already available on the upstream repository, you'll need to create it there.
This is done using the `--set-upstream` option of `git push`.
For example, to push `andrew` to `github` in this situation, I'd use the following.

```
> git push --set-upstream github andrew
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 280 bytes | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To git@github.com:againerdewar/calculus-reader.git
 * [new branch]      andrew -> andrew
Branch andrew set up to track remote branch andrew from github.
```

This tells Git that the `andrew` branch should use `github` as its "upstream" remote.
It will create the branch `andrew` on `github` if needed.

## Closing thoughts

That should be enough to get you started!
However, before you dive in, let me offer a few more philosophical suggestions.

* **Write each sentence on a separate line of text.**
  Git uses a line-by-line comparison to decide what has changed between two versions of a file.
  If you write a paragraph per line, Git won't be able to isolate the change efficiently, which will lead to a lot of merge conflicts.

* **Don't be afraid to delete.**
  After all, Git saves every version you've ever committed.
  You don't need to keep a bunch of files lying around holding old versions of your text; Git takes care of that for you.

* **Dive in.**
  Remember the first time you used LaTeX?
  I remember mine: it was scary as hell.
  The learning curve seemed insurmountable.
  As it turned out, within a couple of weeks, I was nearly competent, because I threw myself into it and wrote a lot of code.
  Git is the same way; you'll internalize it quickly if you're using it often.

* **Write good commit messages.**
  If nothing else, they're a great way to look back over a week's work to see that you really did accomplish things!

Good luck!

[git]: //git-scm.co
[agd-thesis]: //github.com/againerdewar/thesis
[agd-thesis-history]: //github.com/againerdewar/thesis/commits/master
[hott-github]: //github.com/HoTT/book
[git-mac]: //git-scm.com/download/mac
[calcnotes-github]: //github.com/againerdewar/calculus-reader
[github]: //github.com
[bitbucket]: //bitbucket.org
