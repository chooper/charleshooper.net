---
title: Screen-Scraping Search Results for Information Retrieval
author: Charles Hooper
comments: true
layout: post
permalink: /blog/screen-scraping-search-results-for-information-retrieval/
has_been_twittered:
  - yes
categories:
  - Development
  - Projects
---
# 

Recently I found myself in a situation where I needed to gather a large amount of data from a website but there did not exist any API, index, or otherwise publicly-accessible map of the data. In fact, the only mechanism for uncovering data to be collected was a very limited search engine.

In particular, I was trying to collect a list of (living, non-banned) usernames from a web-based RPG I play so I could then download, parse, and store their profiles for further analysis. I needed all of the data simply because there also was not any way in which I could get a truly random statistical sample.

The game’s search engine has these limitations and features:

*   Search is performed on username only and implicitly places a wildcard after the search. For example, if you search for “bob” not only will “bob” be returned in the results, but also “bob123″ and “bobafett,”
*   If a given search returns more than 35 results than only the first 35 results are returned,
*   Results are sorted by username (alphabetically),
*   Usernames are case-insensitive and can only contain alphanumeric characters, i.e. {ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890},
*   Search queries cannot start with the character zero (“0″), but I happily overlook this,
*   The search engine does allow you to filter out players who have been killed or banned.

So, there I was, trying to crawl this game’s search feature using urllib and regular expressions. I first tried to search for “A”, then “B”, then ”C”, and so on, but there were some obvious flaws with this method. In particular, because of the limit on the number of results that can be returned, this method would only yield 1,260 usernames. This isn’t good enough because I knew from the game’s statistics page that I should be expecting a little more than 21,000 names!

The logical extension of that search method is to tack on an extra letter. For example, try “AA”, then, “AB”, then “AC”, all the way down to “ZZ” (or, erm, “99″ on this case). This seems alot better because, hypothetically, the keyspace is large enough to return more than twice as many usernames than what I need – I believe the math is (36^2)\*35 or 45,360 usernames.

Unfortunately, this  method falls apart very quickly because there isn’t an even distribution of usernames across the keyspace. I could try to go one level deeper on the searches (e.g., “AAA” to “AAB”, and so forth) but now we’re looking at 36^3 or 46,656 search pages I have to crawl, so this method is out of the question.

Making matters worse, I am completely naive as to what the distribution of usernames might actually look like.I know what it looks like *now*, but moving forward I had absolutely no idea what to expect. (Just in case you’re curious, you can see the actual distribution – sans accounts that start with “0″ – below.)

![Account Distribution by First Character][1]

 [1]: http://sub-public.s3.amazonaws.com/cch-i/blogimgs/letter_freq_dist.png "Account Distribution by First Character"

I decided, then, that I would start with “A” to “Z” to “1″ to “9″ and dynamically and recursively expand one level deeper if only 35 results were returned from the search. [You can see this dynamic, search unfolding code here on Bitbucket (Python, lines 46 through 65)][2].

 [2]: https://bitbucket.org/hoop/bootcrawl/src/9a3714a9e24e/crawl.py

The results were pretty positive. I crawled almost the entire set of alive, unbanned accounts in just over 2 hours (while I played video games and drank beer). I missed exactly 356 accounts, or about 1.6% of the population. While some of these may have been accounts that started with the character “0″ (remember, I couldn’t crawl those,) it seems more likely that many of these were aborted HTTP requests that failed and were handled by my ridiculous try/except:pass block.

Now that I have this data, it’s time for me to do something with it. You’ll hear more about that from me soon, I’m sure.
