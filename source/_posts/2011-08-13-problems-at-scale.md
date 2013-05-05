---
title: Problems at Scale
author: Charles Hooper
comments: true
layout: post
permalink: /blog/problems-at-scale/
has_been_twittered:
  - yes
categories:
  - Development
  - System Administration
---
# 

Over on [HackerNews][1], saturn wrote that:

 [1]: http://news.ycombinator.com/item?id=2881122

> Cloud computing scales the efficiencies, yes. It also scales the problems.

This is exactly right. Problems in simple architectures are relatively easy to solve. In fact, I’d go as far as to say that we’ve probably solved them in all of the traditional archetypes, both in theory and in practice.

On the other hand, complex architectures lead to exponentially more difficult problems. There are probably lots of problems in these various complex architectures that we don’t even know exist yet. And then there are those problems that we *do* know about that we think will only occur in very rare (or even “impossible”) circumstances so they get considerably less attention devoted to them.

Those of us who have careers, jobs, and hobbies in an engineering discipline need to remember this when we make decisions about the design of a new or existing system. Just because we can’t *see* the underlying platform, because it’s been abstracted away from us, doesn’t mean that it doesn’t exist. For example, much of the recent AWS downtime was contributed to by design flaws in the Elastic Block Store system. If you think you should be hosted on the cloud, use it, but take the time to understand the systems under the hood.