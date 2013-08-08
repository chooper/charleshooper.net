---
layout: post
title: "My DEF CON 21 Experience"
date: 2013-08-08 10:41
comments: true
categories: 
    - Security
---
# 

I've just returned from [DEF CON][99] this year and wanted to share my
experience. I've only been to DEF CON one other time which I believe was
DEF CON 16. During DEF CON 16, I mostly stuck to the hallway track and,
to be perfectly honest, didn't get alot out of it as I mostly hung out
with coworkers.

This time around I went with my good friend Japhy and no one else.

  [99]: https://www.defcon.org/

## Logistics

We flew in separately on Thursday and stayed in the Bellagio. We
initially chose the Bellagio because it was cheaper and we didn't think
a 15 minute walk every day was going to be a big deal. As it turns out,
the walk itself was fine (even with the 98F weather) but it meant we
were effectively separated from the conference for most of the day. I
think the next time I go I would like to stay in the same hotel as the
conference.

## Thursday

Thursday was my day of travel. The flight was late leaving SFO but this
isn't unusual as planes to/from SFO are pretty much ever on time it
seems. Blame the fog.

Anyways, I arrived mid-afternoon and just hung out around the Bellagio
since Japhy wasn't in yet. I ate some pho, drank some good bourbon, and
played some video poker. Eventually, Japhy arrived and we grabbed a beer
together before turning in.

## Friday

Friday morning we woke up and went and get our badges. They were pretty
sweet looking and I was curious about the crypto challenge. There was
apparently a talk where the badges were explained but I missed that and
so I mostly chatted with random people about them and compared notes and
hypothesis. My badge, the Ace of Phones, translated to "in the real
order the". There was also an XOR gate on it but I never got far enough
to know what it was for.

Badges aside, Friday is the day that I went to the most talks.

The first talk I went to was about [Offensive Forensics][1]. The speaker
asserted that an attacker could use many of the same techniques that
would be used by a forensics investigator during their attack. For
example, an attacker could easily recover and steal files that were
previously deleted. The talk was good but I felt that the speaker spent
too much time trying to convince the audience that it was a good idea.
My personal opinion, and that of the people I've talked to, all seemed
to agree up front that it was a great idea.

  [1]: https://www.defcon.org/html/defcon-21/dc-21-speakers.html#Caudill

After leaving this talk I ended up catching the tail end of
[Business Logic Flaws In Mobile Operators Services][2]. I wish I saw
more of this, but the speaker more or less explained that many mobile
operator services have big flaws in their business logic (just like the
title, eh?) such as relying on Caller ID for authentication. He also
gave a live demo of an (unnamed) customer service line that, instead of
disconnecting you on the third entry of an invalid PIN, actually grants
you access.

  [2]: https://www.defcon.org/html/defcon-21/dc-21-speakers.html#Alecu

Next I caught the end of [Evil DoS Attacks and Strong Defenses][3] where
Matt Prince (CEO of CloudFlare) described some very large DDoS attacks
and what they looked like. Someone afterwards also showed a variety of
online banking websites where the "logout" button doesn't actually do
anything, leaving users vulnerable.

  [3]: https://www.defcon.org/html/defcon-21/dc-21-speakers.html#Bowne

Immediately following that session, two guys got up and gave their talk
on [Kill 'em All — DDoS Protection Total Annihilation!][4]. I enjoyed
the format of the talk, where the speakers would describe DDoS
protection techniques and then how to bypass them. The bottom line is:
a) look like a real client, b) perform whatever handshakes are necessary
(alot of DDoS mitigators rely on odd protocol behaviors), c) use the OS
TCP/IP stack when mossible (see (a) and (b)), do what it takes to bypass
any front-end caches, and d) try to keep your attack threshold just
below where anyone will notice you.

  [4]: https://www.defcon.org/html/defcon-21/dc-21-speakers.html#Miu

At night, there were a bunch of DEF CON parties. At some point the fire
alarm went off a few times. A voice came over the intercom shortly after
stating that they weren't sure *why* their alarm system entered test
mode but that "the cause was being investigated." Later, it happened
again and the hallway strobes for the fire alarm stayed on, adding kind
of a cool effect to the party. Hmm.

## Saturday

On Saturday I only saw two talks.

1. Wireless village - In the wireless village I listened to a Q&A
session by a pen tester whose expertise was in wireless assessments. My
favorite quote from this talk was:

    > Q: When you do these wireless assessments, is your goal just to
    > get onto the network or do you look at wireless devices, such as
    > printers, as well?
    > 
    > A: I pulled 700 bank accounts from a financial institution 6 weeks
    > ago [during a pen test]. We like printers.

2. Skytalks - One of the skytalks I saw the first half of was about "big
data", the techniques used in analyzing this data, their weaknesses, and
how you could use these techniques to stay below the radar so to speak.
It was interesting but rather abstract and I'm not totally certain how
to apply that in practice.

For the rest of the day, I brought my laptop and just kind of tinkered
with stuff.

## Sunday

I flew home early Sunday morning so I didn't do anything on this day.

