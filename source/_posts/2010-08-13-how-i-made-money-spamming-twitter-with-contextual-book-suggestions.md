---
title: How I Made Money Spamming Twitter with Contextual Book Suggestions
author: Charles Hooper
comments: true
layout: post
permalink: /blog/how-i-made-money-spamming-twitter-with-contextual-book-suggestions/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:8:"25608734";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/how-i-made-money-spamming-twitter-with-contex
categories:
  - Twitter
  - Uncategorized
tags:
  - ai
  - book suggest
  - spam
---
# 

Two winters ago I left a position as a system administrator that was paying pretty well and moved cross-country to a region with less jobs than where I moved from. Three months later, I was still unemployed, broke, and bored. I was talking to my good friend [Japhy][1] on IRC one day and he was explaining to me how the [tf-idf algorithm][2] works. For reasons involving boredom more than any other reason, I dreamed up an idea: **I would write software that would take a given document and generate book suggestions based on its content.** 

I think that most programmers would agree with me that we put in longer hours on code when we’re not working for anybody. We don’t stop learning, either. To us, *unemployment is a brief sprint of academia* spent in our home office, the local coffee shop, or our parent’s house. 
My imagination dreamed up this fairly straightforward process:

 [1]: http://japherwocky.posterous.com/
 [2]: http://en.wikipedia.org/wiki/Tf–idf

1.  Take a given document and calculate tf-idf scores on all terms
2.  Select X number of the highest scoring terms
3.  Pass these high-scoring terms to an Amazon ItemSearch query
4.  Receive a list of recommended books (with URLs) from Amazon

I had already written multiple Twitter bots by this time so I decided to just use some of my existing code to poll Twitter’s search API. Essentially, the “documents” I mentioned above were actually tweets containing the terms “book” or “books.” Two and a half days later I had a working prototype that could generate a book recommendation from a given tweet. It was at this time that I added steps 5 and 6:

Tag URLs returned from Amazon’s ItemSearch with an affiliate ID; and  
Reply to the tweeting user with their new book suggestion

Four months later and **I had generated over $7,000 in sales for Amazon with over $400 commission for myself**. Obviously, the commission I was making wasn’t livable but it was a nice addition to my then-depleting savings. Had I decided to scale out my operation, I could have made much more. My benchmark is at four months because that’s how long I went before being *suspended*. My conversion rate? **0.13%**! While seemingly low, this number is very high when compared to email spam. However, it’s important to note that email spam is subject to various filtering technologies. 
![twitter-spam-earnings.png][3] 
A fair amount of the time I share this story, people are more impressed with the fact that I went 4 months before getting suspended. The truth is, I had a lot of throttling built into my spam bot. The factors I think are important to point out are:

 [3]: http://cdn.subversity.net/blog_imgs/twitter-spam-earnings.png "twitter-spam-earnings.png"

1.  Twitter’s Terms of Service at that time basically only outlawed “unsolicited replies,” nothing that really attacked targeted spam.
2.  Twitter’s anti-spam stance did exist in writing (only in the help site,) but I do not think they were actively enforcing their policies.
3.  My recommendations were contextual and, unless you looked at my bot’s timeline and tweet count, looked legitimate (most of the time.) In other words, I was tweeting *book suggestions* to people who were already talking about *books*.
4.  I recorded the usernames of everyone I sent recommendations to and would only @mention them once.
5.  I built in a “chattiness” rate limiting function. This was to distribute my spam throughout a whole hour (due to Twitter’s rate limiting) more than anything.

![twitter-suspended.png][4] 

While it only lasted a short while, I had alot of fun and made a little bit of money spamming Twitter. 

The second re-incarnation of this project turned into [BookSuggest, a website for recommending books based on a person’s Twitter feed][5]. I haven’t put alot of effort into promoting it, but my conversion rate is much lower now that I’m not pushing the links in anyone’s face. 

Try it out and comment here – what did BookSuggest tell YOU to read?

 [4]: http://cdn.subversity.net/blog_imgs/twitter-suspended.png "twitter-suspended.png"
 [5]: http://www.charleshooper.net/twitter/

