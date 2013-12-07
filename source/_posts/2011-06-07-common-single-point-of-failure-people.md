---
title: 'Common Single Point of Failure: People'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/common-single-point-of-failure-people/
categories:
  - Development
  - Management
  - System Administration
---
# 

Yesterday, when I arrived at my other job on my school’s help desk, I found out that my supervisor was not coming into work at all. This is OK; I enjoy the autonomy of working unsupervised. However, at this particular university’s help desk, my supervisor is the *only* person who can reset security profile information on student accounts. She is also the only person who assigns work orders to the technicians that work here. I’ll spare you the details, but probably 80-90% of our workload on any given day gets passed through this one person.

This is a serious problem. By passing tasks through a single person with no backup we are guaranteeing the collapse of our support system. I’ve seen this at other gigs and I bet you have, too.

Maybe it’s the “one guy” who has access to the firewall or router. Or maybe there’s that only person who knows how to configure a particular piece of software or solve a specific problem. Truthfully, you’re probably that guy and don’t even realize it. Ever get work-related phone calls (or worse: called in) during your “time off?” Red flag.

All of these conditions are single points of failures (SPoF). Too often, we sysadmins, developers, and engineers only think of SPoFs in terms of hardware and software. But if we look at what actually makes up the entire information system (hardware, software, data, procedures, and *people)*, we see that we’re part of it too. This hoarding of knowledge often results in a failure of the system itself and very frequently makes existing failures worse.

# Example

A customer-facing database server stops responding. You’re not really familiar with what database(s) it serves but customers are complaining that it’s down or very slow. There’s another guy that normally handles this system but he’s out of town and completely unreachable. You want to diagnose but you don’t even know how to access the system. Do you blindly reboot (risking data loss and corruption)? Sit and wait it out? Learn how to summon your co-worker’s spirit?

One very real situation occurred when I worked at a small Internet Service Provider. A very big client of ours called and said that a very large portion of their network was down (we managed it, too). Did I have the credentials to the router in question? No. Did the client? No. Who did? *That guy *did, the one who is usually too busy running around to return calls (incidentally, the owner). He did finally return our cries for help... 3 hours later. Was the problem difficult to solve? No. In fact, it was fixed within minutes of receiving the proper credentials. (Funny story, one of their on-staff techs plugged a network camera into the network and accidentally assigned their router’s address as the camera’s IP :)) Sure, this mistake was dumb, but did this client need to suffer degraded availability for these 3 hours? Absolutely not.

## Solution

The obvious, and perhaps only, solution to this problem is to make as much of your knowledge available as possible. The more knowledge you offload from your brain, the better and more efficient the system becomes. I know to some this might seem a little counter-productive. After all, having this knowledge is job security…right?

No, absolutely not. Holding company knowledge hostage should never be how you ensure your job security (*that’s a myth anyways*).

With that being said, please don’t spend all your energy and effort on documentation only to abandon the effort a month later. I was speaking to a friend of mine earlier when he mentioned that very often he comes across company Wikis all the time that usually contain outdated information and haven’t even been logged into in 6 months.

Allow me to re-iterate, do* not* go on documentation sprees. Document everything *when* you do it and share that information *when *you do it. Regularly. Constantly. If you wait until you have alot of information to document, then you will probably become overwhelmed and just not do it. When I was in the Air Force, we had a saying:

## The job ain’t over till the paperwork is done.

Simply put, add documentation into your regular workflow. The investment is small and the returns are great.
