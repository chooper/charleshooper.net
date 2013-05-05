---
title: Drinking from the Gardenhose
author: Charles Hooper
comments: true
layout: post
permalink: /blog/drinking-from-the-gardenhose/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8698497";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/drinking-from-the-gardenhose
categories:
  - Projects
  - Python
  - Twitter
  - Uncategorized
---
# 

Lately I’ve been working on some code to process tweets coming out of the *Gardenhose*. The **Gardenhose** is the name given to the lowest level of access to [Twitter’s streaming API][1]. Oddly enough however, my connections to the Twitter API were dropping, causing my program to hang and my CPU to remain maxed out at 100% usage. 
After much debugging and banging my head on my desk, [joshthecoder (creator of tweepy)][2] and uuid (#twitterapi / freenode) pointed out that I may be filling some type of buffer or queue, causing this condition. They suggested that my current workflow of *“receive tweet, process, store to DB”* all in the same thread might be too slow. After removing key parts of my processing code, what once took 100% now only took 1-3% CPU, I was receiving a much higher volume of tweets, and my connections were no longer dropping. This meant that the culprit of my general slowness was the **sqlite database**. 
Basically, all I was doing with these tweets was tokenizing them, tallying up their contents, and then updating a corpus (stored in a sqlite database) that would track how many tweets each word appeared in. Having this data would allow me to perform accurate [Tf-idf][3] scoring later on. [You can see the original (and admittedly not-very-well documented) version of this program here (Python)][4]. 
Fixing this problem is a two-step solution:

 [1]: http://apiwiki.twitter.com/Streaming-API-Documentation
 [2]: http://github.com/joshthecoder/tweepy
 [3]: http://nlp.stanford.edu/IR-book/html/htmledition/tf-idf-weighting-1.html
 [4]: http://codepad.org/8OkD5AGM

1.  Break off the processing code into another thread
2.  Replace the sqlite database with something faster

The first step, moving the process code into its own thread, is a pretty easy feat. In fact, I’m testing my proof-of-concept as I write. The second step, however, is going to require alot more research and thought. In my proof-of-concept, I place Status (Tweet) objects into a queue which another thread then processes. Using sqlite, my queue never gets any smaller, as you can see below.

`$ ./bootstrap-stream.py
Streaming timelines...
Tue Dec 15 10:56:01 2009 | Queue: 93 items
Tue Dec 15 10:56:08 2009 | Queue: 183 items
Tue Dec 15 10:56:13 2009 | Queue: 278 items
...
Tue Dec 15 10:58:02 2009 | Queue: 1859 items`

My next step will probably be to test storing these items in a MySQL (InnoDB) database, simply because it’s easy enough to swap out the sqlite module with the MySQLdb module in Python, although I  have a feeling that what I really need is a key-value store. Speaking of which, does any one have any recommendations as far as databases, hash tables, or key-value stores go? Bonus points if I can replicate the data.