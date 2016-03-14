---
layout: post
title: "hsleep: `sleep` with a countdown"
date: 2016-03-14 06:54
comments: true
categories: 
- DevOps
- Projects
---
# 

Today I'm open sourcing `hsleep`. `hsleep` is a utility which behaves just like
GNU `sleep(1)` in coreutils -- and its BSD counterpart -- with the addition of
a countdown timer which is emitted to standard error.

![hsleep counting down](https://cloud.githubusercontent.com/assets/164559/13746184/61807fbe-e9af-11e5-93e8-03a8ace44fcc.png)

I wrote `hsleep` because I sometimes find myself needing to delay
commands for a few minutes and I couldn't stand not knowing how much time
is left!

[`hsleep` is available on github][1] or -- if you have go installed -- can
be installed with:

```
go install github.com/chooper/hsleep
```

[1]: https://github.com/chooper/hsleep
