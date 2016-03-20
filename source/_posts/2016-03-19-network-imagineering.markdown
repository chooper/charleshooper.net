---
layout: post
title: "Network imagineering"
date: 2016-03-19 20:53
comments: true
categories:
- Networking
---
# 

If I made a thousand dollars each time I dreamed of starting an ISP, I
would have a couple thousand dollars and be a hundred thousand dollars
in debt.

I go through this exercise, planning and designing an ISP, every few
years and each time I find that it’s untenable for one reason or
another. It turns out that starting an ISP is a CapEx-heavy venture,
usually with shitty margins and are slow-starting to boot. For the
jargon-shy, CapEx is short for “capital expenditure” and denotes
spending a lot of money up front as opposed to paying some money e.g.
each month as part of operations.

On top of the heavy up-front investment, your local “wholesale” provider
of Internet access tends to hold a monopoly and are also in the retail
business so, if you do decide to start your own regional ISP, you’re
literally buying service from your competition.

After the military, I started my systems engineering career at a small
local ISP as a network engineer. I did a lot of “sysadmin”-type work but
I also spent half my time logged into Cisco equipment and even became a
Cisco-certified network associate (CCNA).

It was so much fun! I actually really liked it and, for a few years at
least, I thought I would pursue a career as a network engineer. I
considered getting my CCNP (the next level past CCNA) and onward but
eventually lost focus when my career took a turn down the Linux systems
engineering path.

In any event, the company I worked for was headquartered across from
AT&T which is who we bought all of our connectivity solutions from. You
know, our provider as well as our competition. At the time, our alleged
value-add was that our connectivity was “managed” which to this day I’m
still not really sure what that means.

But today I found myself having this dream again. You see, yesterday
morning I woke up at 3AM and my Internet connectivity was totally
shitty. I was experiencing over 40% packet loss and I was furious! I
managed to find my ISPs number but learned that their tech support, who
consists of a single person, didn’t open until 8AM. I patiently waited
until 8AM to call, setting up a Raspberry Pi with Smokeping as a
monitoring solution and, right at 7:55AM, my Internet connectivity
recovered. It was as if someone rolled into the office and rebooted a
router.

Having been in the shoes as the early-morning office arriver, this was a
totally plausible scenario. But I was mad! I recently made the decision
to move to nearly the middle of nowhere, so shitty Internet was always
in the cards, but as an engineer who works remotely crappy Internet is
totally unacceptable! So I found myself, again, wondering which
obstacles stood in my way of starting my own ISP.

I found this amazing blog series called [Tales from the tower][1] and,
while the author is a little ranty at times, it’s generally informative
and engaging. My general impression from reading so far is that it might
be somewhat straightforward (which is not the same as “easy”) to start
up a small WISP but radio (RF) engineering has a lot more influence on
technical success than network engineering. Additionally, equipment has
come way down in price making the “heavy CapEx problem” much more
manageable.

While I have no idea what’s next, I hope to continue exploring this
idea, even if I never take it further. I hope that it will be
interesting for you to read (and for me to document!) how I approach the
problem of providing respectable Internet connectivity in the middle of
nowhere.

[1]: http://muniwireless.com/2010/04/06/wireless-isp-experience-building-large-wifi-networks/
