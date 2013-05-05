---
title: Estimating time for tasks with PERT
author: Charles Hooper
comments: true
layout: post
permalink: /blog/estimating-time-for-tasks-with-pert/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:8:"16963408";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/estimating-time-for-tasks-with-pert
categories:
  - Management
  - Uncategorized
---
# 

We often find it beneficial to *estimate how long a given task will
take*. This comes in handy when trying to quote billable time, set
deadlines, or map out a project timeline on a Gantt chart. In
*scientific management*, we often use the **Program Evaluation and
Review Technique**, or **PERT**. Under PERT, we let `O` become the
best-case, or optimistic, time; `P` becomes the pessimistic time, and
`M` is the mean or average time. We then use the following formula:

```
T = (O * 4M * P) / 6 
```

As you can see, it's pretty simple as it's really just a weighted
average. For example, for a task with an optimistic time of 4 hours, a
pessimistic time of 7 hours, and an average time of 5 hours, you could
reasonably plan on this task taking about 5.17 hours.  So the next time
you need estimate how long a task will take, whether it's delivering a
pizza or [building parts for a submarine][1], think about using this
PERT formula.

 [1]: http://en.wikipedia.org/wiki/Program_Evaluation_and_Review_Technique#Overview
