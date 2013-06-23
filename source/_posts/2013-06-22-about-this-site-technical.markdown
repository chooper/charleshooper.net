---
layout: post
title: "About this site (technical)"
permalink: /blog/about-this-site-technical/
date: 2013-06-22 11:58
comments: true
categories: 
  - Site Updates
---
# 

I was playing around with my site today and realized that I hadn't
disclosed much about how it works. Here's that nerd "look at my site
architecture you guys" post.

If you couldn't tell by the default theme, my blogging software of
choice is [Octopress][1], which generates my site's HTML from Markdown.
I use `vim` for most of my editing and do so on my Lenovo Thinkpad X220
running Ubuntu desktop. I use a tiling window manager called [Awesome
WM][6].

I also use [Fastly][2] for my caching layer. For the purposes of this
dicussion, let's just call Fastly "varnish as a service."

Prior to today, I just used a single [Linode][9] in the Newark, NJ datacenter
as my web server. The Linode runs Ubuntu server and serves static HTML
with [nginx][7].

As of today, though, I'm experimenting with [Heroku US][3] and have
configured my Heroku clone of the site as a second backend server for
Fastly.  . Octopress does some magic here by serving the HTML through
[Rack][8], a minimal webserver for ruby.

My site is also monitored by [Pingdom][4] and I use [Munin][5] for
metrics collection.

There are some really amazing takeaways from this. For one, my only
expense currently is the roughly $20/mo I pay for the [Linode][9]. I
would happily pay for any of these services for a real, money-making
website but, for this site, I'll continue to use the free plans.

Second is how much technology is available to us these days. I own
*zero* physical infrastructure and the only thing slightly resembling
traditional infrastructure is my Linode. Contrast this to several years
ago when I had a third generation HP Proliant DL380 colocated and was
starting to experiment with virtualization. I mean, holy shit, you can
literally host a website for nothing!

This second point is why I think I love working in the PaaS
(platform-as-a-service) space so much. PaaS is still young enough that
many skeptics don't believe it's a working model. I think we've proven
that it works, now we just need to prove we can grow with the needs of
our customers.

