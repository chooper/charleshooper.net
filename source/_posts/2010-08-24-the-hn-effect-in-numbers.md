---
title: The HN Effect in Numbers
author: Charles Hooper
comments: true
layout: post
permalink: /blog/the-hn-effect-in-numbers/
categories:
  - Site Updates
---
# 

For the unfamiliar, I wrote an article about a week and a half ago titled [How I Made Money Spamming Twitter with Contextual Book Suggestions][1] and promised that I would follow up with a post on the type of traffic I received. Not only did the article get to be pretty popular with the [Hacker News][2] crowd, republished in [Silicon Alley Insider][3], and make me the recipient of a handful of wonderful emails but I even got to visit [tracked.com’s engineering team][4] and get schooled on machine learning techniques and A.I. (hi folks!) 
Something relevant I should mention is that, just a day before, I had migrated my [Posterous][5] blog from one domain to its current place, [blog.charleshooper.net][6]. To anyone who’s curious, this was a totally painless process. Set up DNS first, update your Posterous settings, and set up 302 redirects so your links don’t break. 
**Social Link-Sharing**  
Despite finishing my article at 1:00 AM, I thought it was pretty well-written and I wanted my story to be heard, so I decided to get a full night’s sleep, proof-read it in the morning, and submit the link to Reddit, Digg, and Hacker News. Besides the obvious benefits of proof-reading the article while fully-rested, I also recognized that most link-sharing sites weight votes based on time (or rather, some product of votes/time maybe) so submitting my article in the morning meant that it would first show up at the beginning of what I believe to be peak usage. So how’d I do? 
Reddit hated it.  
![][7]

 [1]: http://blog.charleshooper.net/how-i-made-money-spamming-twitter-with-contex
 [2]: http://news.ycombinator.com/
 [3]: http://www.businessinsider.com/sai
 [4]: http://www.tracked.com/
 [5]: http://posterous.com
 [6]: http://blog.charleshooper.net
 [7]: http://www.charleshooper.net/wp-content/uploads/Picture_1.png

Digg didn’t care.  
![][8] 
And Hacker News loved it!  
![][9] 
I also make use of Posterous’ “autopost” features and have all my new submissions get posted to Twitter and Facebook. According to Posterous, there were over 77 retweets of my article (most likely from the tweet storm that the Silicon Alley Insider bot and HN bots started) and 7 “likes” on Facebook. 
**Traffic**  
According to Google Analytics, I’m not very popular. Before publishing my article, I received an average of about 30 visits a day. On the day I published my article, I observed a surge of over 4,600 visitors. From there, the numbers declined daily at a rate that looks very much like exponential decay. It took 10 days for my traffic to return to normal, but that day was a Sunday and the following Monday was almost twice as high (62 visits). For the number geeks, the set of numbers beginning with the peak is (4652, 2688, 1065, 452, 206, 138, 105). I got close with the expression [*f(x) = 4652e^(-0.6x)*][10] but that isn’t quite right (maybe I should treat my average visits as a constant.) 
Update: I’ve gotten much closer with [f(x) = 2658e^(-0.94x) 30][11]

 [8]: http://www.charleshooper.net/wp-content/uploads/Picture_2.png
 [9]: http://www.charleshooper.net/wp-content/uploads/Picture_4.png
 [10]: http://www.wolframalpha.com/input/?i=graph f(x) = 4652e^(-0.6x); x from 0 to 6
 [11]: http://www.wolframalpha.com/input/?i=table[ 2658e^(-0.94x) %2B 30, {x,0,5} ]

![][12] 

Over the time period, my article received over 9,000 unique page views with a bounce rate of over 90% (~93% exit rate.) I remember reading an article a little while ago that stated, on single-page use cases, the bounce rate will always be close to the exit rate unless the analytics software “phones in” after some period of time to register the visit as something other than a bounce. I use Google Analytics and, unless I find out otherwise, I don’t think it does this (although, it does measure “time on page” so maybe it does and Google’s idea of a bounce is different than mine.) 


 [12]: http://www.charleshooper.net/wp-content/uploads/Picture_6-300x168.png

![][13]  
 **Sources**  
My largest source of traffic was referring websites making up over 70% of it. Less than 2% was from search engines and I don’t even think that any of it was destined for my article. 
![][14]  
 As for the referring websites, I received traffic from all over. However, most of it was from [Hacker News][2], [TechMeme.com][15], and [Google.com][16]. I looked into “[google.com][17] / referral” versus “[google.com][17] / organic” and the referrals mostly consisted of visitors using Google Reader. What isn’t shown below is the 113 *other* referring sites. The “[daemonology.net][18]” referral is a result of [HN Daily][19]. As you can see, my top sources are primarily seeded by social media and social link-sharing websites. 
![][20]  
 **Conclusion**  
To conclude, don’t under-value the social sites. If you want some organic link juice then utilize the “chatty” sites like Facebook and Twitter as well as the link-sharing sites such as Hacker News, Reddit, and Digg. There is a hidden benefit to putting yourself out there and asking for alot of attention: You will ensure that your articles, blog posts, and research are high-quality resources of *useful* information. Essentially, you end up treating each blog post as you would any startup. Experiment first. Create value second. The rest (profit, respect, esteem) comes easy.

 [13]: http://www.charleshooper.net/wp-content/uploads/Picture_7.png
 [14]: http://www.charleshooper.net/wp-content/uploads/Picture_9.png
 [15]: http://TechMeme.com
 [16]: http://Google.com
 [17]: http://google.com
 [18]: http://daemonology.net
 [19]: http://www.daemonology.net/hn-daily/
 [20]: http://www.charleshooper.net/wp-content/uploads/Picture_8-300x198.png
