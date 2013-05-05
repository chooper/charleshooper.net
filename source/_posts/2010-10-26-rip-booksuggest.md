---
title: RIP BookSuggest
author: Charles Hooper
comments: true
layout: post
permalink: /blog/rip-booksuggest/
has_been_twittered:
  - yes
categories:
  - Projects
---
# 

BookSuggest, the web-based book recommendation engine, is officially dead. I’ve been treating BookSuggest as the lowest of priorities for quite some time now and I’m more than happy to declare this project a failure. Here is a brief recap of BookSuggest’s history.

Before BookSuggest was a web application, I used to [spam unsuspecting Twitter users][1] with book recommendations. Eventually, Twitter stepped up their anti-spam stance and suspended my spam account. I retired the project for a while until one day I decided to build a web application around the recommendation technology I was using.

 [1]: http://www.charleshooper.net/blog/how-i-made-money-spamming-twitter-with-contextual-book-suggestions/

This technology was simply scoring words in a user’s timeline, taking the four highest-scoring words, and then passing them to an Amazon ItemSearch query. More specifically, the type of search in use was what Amazon calls a TextStream search. This search method is what allowed me to get book recommendations, even if the search terms provided weren’t all that great. Without it, it’s not unlikely that my ItemSearches wouldn’t return any results at all.

So imagine my surprise when I read the following in Amazon’s API documentation:

> Due to low usage, the Product Advertising API operations and response groups listed below will not be supported after October 15, 2010:
> 
> …  
> Additionally, due to low usage, we will be discontinuing Multiple Operation Requests and the **TextStream** search parameter.

Oh, shoot!

Financially, it makes sense for me to cut my losses here. Back when I was still spamming Twitter, I was pulling over $100/mo. Through the web-app, my referral fees are much smaller. As of this moment, I have a balance of just $9 with Amazon and haven’t cashed out since the start of the project.

Some numbers:

*   Unique Twitter users: 393
*   Recommendations made: 611
*   Documents in corpus: 17,458,549
*   Unique words in corpus: 1,970,165
*   Top 5 words in corpus: that, just, with, this, have

RIP BookSuggest!