---
title: We Have the Tools but What About the Techniques?
author: Charles Hooper
comments: true
layout: post
permalink: /blog/we-have-the-tools-but-what-about-the-techniques/
has_been_twittered:
  - yes
categories:
  - Development
  - DevOps
  - Management
  - System Administration
tags:
  - devops
---
# 

In my previously-written article “[Concurrent Engineering: The Foundation of DevOps][1]” I wrote “*just because you use puppet does not necessarily mean your organization is practicing DevOps.*” I didn’t spend much time on it then, but I think it bears repeating and further explanation. The **DevOps “movement” has seen**, and will likely continue to see, **a huge influx of new tools** as organizations attempt to find ways to adopt DevOps within their organizations. These tools have included (and certainly have not been limited to) tools that aid in monitoring (statsd), configuration management (puppet), and continuous delivery (hubot).

 [1]: http://www.charleshooper.net/blog/concurrent-engineering-the-foundation-of-devops/ "Concurrent Engineering: The Foundation of DevOps"

Operations engineers, software developers, and managers are in a mad dash to develop, utilize, and integrate these tools within their organizations. And that’s where we’re going wrong; we are focused on a single component of the Software/Systems Engineering Process. This process model contains three main components that are central to its existence: *methodologies*, *techniques*, and *tools* (Valacich 2009). While I don’t need to go into each one specifically, it’s clear that the tools are just a single factor in the overall process. Following the model further, it becomes clear that the makeup of each of these components influences the other components in the process.

Put simply, **DevOps is a methodology** and, as such, it’s natural that we’re seeing a huge response in tools. What I feel we’re missing, however, is more information about the different techniques used throughout organizations in *their* software and operations engineering processes. An excellent example of this is [Scott Chacon’s explanation of how Github uses Git (and Github!) to deliver continuous improvement][2] to their service. With that said, I would like to see more organizations refine their techniques and talk about *these* as much as they talk about their tools.

 [2]: http://scottchacon.com/2011/08/31/github-flow.html