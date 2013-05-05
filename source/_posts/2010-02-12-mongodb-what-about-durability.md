---
title: 'MongoDB &#8211; What about Durability?'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/mongodb-what-about-durability/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:8:"11571864";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/mongodb-what-about-durability
categories:
  - MongoDB
  - Uncategorized
---
# 

> ### [What about Durability?][1]
> 
> We get lots of questions about why MongoDB doesn’t have full single server durability, and there are many people that think this is a major problem.  We wanted to shed some light on why we haven’t done single server durability, what our suggestions are, and our future plans.
> 
> To start, there are some very practical reasons why we think single server durability is overvalued.  First, there are many scenarios in which that server loses all its data no matter what.  If there is water damage, fire, some hardware problems, etc… no matter how durable the software is, data can be lost.  Yes – there are ways to mitigate some of these, but those add another layer of complexity, that has to be tested, proofed, and adds more variables which can fail.
> 
> In the real world, traditional durability often isn’t even done correctly.  If you are using a DBMS that uses a transaction log for durability, you either have to turn off hardware buffering or have a battery backed RAID controller.  Without hardware buffering, transaction logs are very slow.  Battery backed raid controllers will work well, but you have to really have one.  With the move towards the cloud and outsourced hosting, custom hardware is not always an option.
> 
> Requirements for web applications are also changing.  99.99% uptime is no longer the goal, people want 100% uptime as much as possible.  If you have durability through a transaction log, then you have to replay it to come back up.  If you have a master and slave in the same data center and you lose power, both will have to recover which could take 5-30 minutes.[1]
> 
> Another feature of new non-relational databases is horizontal scalability.  While MongoDB’s auto-sharding is still in Alpha, we still feel this is a core component. With horizontal scalability comes many servers.  If you have a 100 node cluster, worrying about every machine is a liability.  If a machine goes down in the middle of the night, you want the system to recover as fast as possible, without human intervention.  Given that, and that a high percentage of failures are hardware, the best thing is to just mark that server as inactive, and ignore it until someone can look at it easily (could be hours or days).
> 
> Given all this, we’re not saying durability isn’t important, we just think that single server durability isn’t the best way to get true durability.  We think the right path to durability is replication (local and remote) and snapshotting.  That’s why we’ve spent so much time making replication fast and easy and work over wide area networks in MongoDB.
> 
> We are currently planning many more enhancements to replication to make it better.
> 
> *   psuedo real-time with optional blocking for writes until on multiple servers
> *   replica sets instead of replica pairs
> *   easier to create new slaves with large data sets
> 
> Now – there are definitely some cases where single server durability is the best option.  It is on our road map, its just not on the short list right now.  We know what we want to do and how we want to do it, it’s just a matter of code :)
> 
> [1] Some databases such as CouchDB use an append only model that allows for instantaneous restarts. However, this type of design usually requires compaction routines to be run periodically, so can be costly in high update scenarios.
> 
> [1 day ago][1]   via [blog.mongodb.org][1]
> 
> This is very important to consider for anyone who is thinking about (or already is) using MongoDB.

 [1]: http://blog.mongodb.org/post/381927266/what-about-durability