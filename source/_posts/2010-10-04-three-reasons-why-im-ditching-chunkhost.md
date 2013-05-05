---
title: 'Three Reasons Why I&#8217;m Ditching ChunkHost'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/three-reasons-why-im-ditching-chunkhost/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:8:"29615581";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/three-reasons-why-im-ditching-chunkhost
has_been_twittered:
  - failed
twitter_failure_code:
  - 400
twitter_failure_reason:
  - Settings do not permit the auto-tweeting of old posts
categories:
  - Uncategorized
---
# 

I’ve been using [ChunkHost][1] for the past **eight months** to host my website and some minor web applications. After my short, free “beta” period I was given a 30% discount (forever) and billed like a normal customer. I’ve only had to pay **$13.30** a month for a Xen VPS with **512MB RAM**. This used to be pretty competitive [until Linode increased the RAM for all of their VPS packages][2]. Unfortunately for ChunkHost, this Linode RAM increase and some recent events have persuaded me to [**pay the extra 7 bucks to Linode**][3]. Here are the three main reasons why I’m ditching ChunkHost:

 [1]: http://chunkhost.com/r/chdotnet
 [2]: http://blog.linode.com/2010/06/16/linode-turns-7-big-ram-increase/
 [3]: http://www.linode.com/?r=2fce38a23c4154c3a1abb4f99aafd6371ee78ecc

1.  **No way to give feedback on the service.** First, let me qualify this and say that there *is* a “Feedback” button on the site. However, more than a quick cursory glance reveals that their feedback system is **inactive **and **neglected**. For example, I have an eight month old feature request that has gone ignored; not rejected, not WONTFIX’d, but ignored. Other customers have older feature requests that have been promised “shortly” and never delivered.![An example of ChunkHost's inactive GetSatisfaction feedback page][4] 
      
    *   **There is no SLA (service-level agreement) or uptime guarantee.** Recently, I noticed that my VM was down and the main page for ChunkHost was down as well. I emailed support about the outage and was happy to receive a quick reply.  
        > Yeah, we’re looking at it now; it looks like networking oddness on one of the host machines. We’ll update Twitter with info as we have it!
        
        The “fix” consisted of ChunkHost **rebooting the physical host** my VM was on. This same problem occurred *again ***5 hours later**. I don’t sense any empathy from ChunkHost for bearing with them through their downtime and I certainly haven’t received any type of apology. Am I entitled to one? With the lack of an SLA, maybe not, but I’d be alot less bitter and I might have remained a customer had I received one.
    
    *   **Not enough notice given for “scheduled” maintenance.** Four days before the two outages I had experienced, ChunkHost performed some scheduled maintenance. I am thankful that the maintenance occurred in off-peak hours, but **I received the notice at the end of the previous day**. This is not adequate notice. Had there been anything critical running on my VM, I would expect adequate notice so I could make proper arrangements ahead of time. 
    It saddens me to think that my last eight months at ChunkHost were a waste. Fortunately, [I’ve been using Linode for my “real services” for just as long][3] and I know that I won’t be disappointed there. If you’re looking for a VM for testing and development purposes only, ChunkHost might be an option – just don’t let your development server evolve into a production server.

 [4]: http://cdn.subversity.net/blog_imgs/chunkhost-inactive.png "chunkhost-inactive.png"