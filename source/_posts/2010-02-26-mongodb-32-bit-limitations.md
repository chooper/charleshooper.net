---
title: 'MongoDB &#8211; 32-bit limitations'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/mongodb-32-bit-limitations/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:8:"12321221";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/mongodb-32-bit-limitations
categories:
  - MongoDB
  - Uncategorized
---
# 

> ### [32-bit limitations][1]
> 
> 32-bit MongoDB processes are limited to about 2.5 gb of data.  This has come as a surprise to a lot of people who are used to not having to worry about that.  The reason for this is that the MongoDB storage engine uses memory-mapped files for performance.
> 
> By not supporting more than 2gb on 32-bit, we%u2019ve been able to keep our code much simpler and cleaner.  This greatly reduces the number of bugs, and reduces the time that we need to release a 1.0 product. The world is moving toward all 64-bit very quickly.  Right now there aren%u2019t too many people for whom 64-bit is a problem, and in the long term, we think this will be a non-issue.
> 
> [7 months ago][1]   via [blog.mongodb.org][1]
> 
> This is more recommended reading for those that are considering using MongoDB. For some, this is a deal-breaker. I don’t necessarily agree with this decision, but I do hope that 64bit support by hypervisors and VPS providers is more mature by the time Mongo matures.

 [1]: http://blog.mongodb.org/post/137788967/32-bit-limitations