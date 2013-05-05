---
title: Drinking from the Gardenhose, cont.
author: Charles Hooper
comments: true
layout: post
permalink: /blog/drinking-from-the-gardenhose-cont/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8730155";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/drinking-from-the-gardenhose-cont
categories:
  - Projects
  - Python
  - Twitter
  - Uncategorized
---
# 

Previously I blogged about a [storage/database bottleneck causing dropped connections while utilizing Twitter’s streaming API][1]. 
I’m happy to report that the switch from *sqlite to MySQL* resulted in an immediate increase in **throughput**. I went from processing **~5 updates/second** to processing just over **11 updates/second**, almost doubling my capacity.

 [1]: http://subversity.net/drinking-from-the-gardenhose

I also saw great improvement in terms of **CPU usage** as well. Previously, I was pegging my CPU at **100% usage**. Since the switch to MySQL, which runs on another (similarly spec’d) host, I now use less than **5% CPU** on the stream listening/processing host and less than **10% CPU** on the MySQL host with the same dataset as before. I believe that parallelizing my code even further would allow me to take greater advantage of my resources and achieve higher throughput.

Resolving this issue has allowed me to turn my focus back on what I originally started this project for: Building a large enough corpus to do accurate [Tf-idf scoring][2].

 [2]: http://en.wikipedia.org/wiki/Tf–idf