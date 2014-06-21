---
layout: post
title: "What I Do as an SRE"
author: Charles Hooper
date: 2014-06-21 06:02
comments: true
permalink: /blog/what-i-do-sre/
categories: 
  - Life
  - Projects
---
# 

Sometimes people ask me what I do and I'm not really sure how to answer
them. My answer tends to depend on social setting, what I've been
working on, and if I was on call that week. No matter the circumstances,
it usually comes out pretty boring and terribly short.

This really sucks though, because I actually really *like* my job and
think that it's interesting, if only I could articulate it.

So here's some attempt at explaining what I do:

* I'm an SRE, or *Service Reliability Engineer*,
at [Heroku](https://www.heroku.com/). Typically, SRE stands for *Site*
Reliability Engineer, however we've modernized it at Heroku because what
is even a site anymore?

* My week-to-week is wildly unpredictable. This week I'm conducting an
operational review of one of our key platform components, last week I
was investigating and addressing database bloat, and the week before I
was the on-call incident commander and quite busy due to several
incidents that occurred.

* Speaking of the incident commander role, part of my job includes
*defining* how we respond to incidents. At first glance it seems easy:
Get paged and show up. And then you respond to your first 24-hour
slow-burning incident and realize that you've got more work to do.

* Following incidents, I also schedule and faciliate retrospectives. We
practice [blameless
postmortems](http://codeascraft.com/2012/05/22/blameless-postmortems/)
and these tend to be incredibly constructive.

* I also analyze past incident data and look for patterns and trends.
Wondering if there's a day of week that has a higher probability of
experiencing an incident? Yeah, it's Friday.

* When all is quiet, I review dashboards and investigate anomolies.
Wondering what that weird spike or dip is that seems to happen every
once in a while? Ask me, I've probably pulled that thread before (and if
I haven't, I'll be terribly curious).

* And sometimes I build integration tests and tools. I wrote
[elbping](/blog/troubleshooting-elbs-with-elbping/), for instance,
because ELBs were terrible to troubleshoot during an incident.

* And, most importantly, I mentor other SREs and software engineers.
This is the single biggest thing I can do in terms of its impact, and
probably most rewarding, too.

So there you have it, that's what I do.

