---
title: 'Twitter vs Erotica: Your Corpora&#8217;s Source Matters'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/twitter-vs-erotica-your-corporas-source-matters/
has_been_twittered:
  - yes
categories:
  - Development
  - Projects
  - Twitter
---
# 

![Dictionary][1]
© uair01; some rights reserved.

As a result of my now [defunct project, BookSuggest][2], I’ve built a fairly large corpus that has been seeded entirely from Twitter. This corpus weighs in at:

 [1]: http://www.charleshooper.net/wp-content/uploads/3998147057_f5dd7ce442-150x150.jpg "Dictionary"
 [2]: http://www.charleshooper.net/blog/rip-booksuggest/

*   16,680,000 documents (tweets)
*   1,970,165 unique (stemmed) words  
    *(Red flag: [Oxford Dictionary][3] suggests there’s an estimated 250,000 words in the English language. This discrepancy is the result of my failure to filter Tweets based on language, the fact that usernames were included in the count, and the fact that people “make words up.” Also, “haha” becomes one word while “hahahaha” becomes another.)*
*   83,758,872 words total.

 [3]: http://www.oxforddictionaries.com/page/93

When I look at these numbers, I often think about how the source documents a corpus/histogram is derived from affects the distribution of its term frequencies. The most obvious example is language. A French corpus will never come close to an English corpus. A less obvious example is subject matter. For example, a corpus derived from English literature will have a different term distribution than a corpus derived from an English medical journal. Common terms will have similar frequencies, but there will be biases towards terms that are domain-specific.

To demonstrate, I scraped the “Erotica” section of [textfiles.com][4] and built a corpus based on the data there. The resulting corpus is composed of:

 [4]: http://www.textfiles.com/

*   4,337 documents
*   50,709 unique (stemmed) words
*   10,413,715 words total.

## Notes on Term Counting

*   Words that had a length of *less than 4 characters* were **discarded**
*   Words were then *stemmed* using the [Porter Stemming algorithm][5]
*   There may be some slight differences between how words were counted in both corpora, based on minor programming differences

 [5]: http://tartarus.org/~martin/PorterStemmer/

## The Data

Finally, here are the term frequencies with the obvious domain-specific terms in bold:

**Corpus Seeded from Twitter**

![Counts of Top 20 Terms from Twitter Corpus][6]  

1.  that (0.84%)
2.  just (0.70%)
3.  with (0.69%)
4.  thi (0.68%)
5.  have (0.65%)
6.  your (0.61%)
7.  like (0.56%)
8.  love (0.54%)
9.  **follow (0.45%)**
10. what (0.44%)
11. from (0.36%)
12. haha (0.35%)
13. good (0.34%)
14. para (0.34%)
15. will (0.32%)
16. when (0.30%)
17. know (0.30%)
18. want (0.30%)
19. about 0.30%)
20. make (0.30%)


**Corpus Seeded from Erotica**

![Counts of Top 20 Terms from Erotica Corpus][7]  

1.  that (1.83%)
2.  with (1.42%)
3.  into (0.76%)
4.  down (0.70%)
5.  then (0.66%)
6.  back (0.66%)
7.  from (0.65%)
8.  thi (0.65%)
9.  hand (0.64%)
10. were (0.59%)
11. look (0.58%)
12. have (0.58%)
13. **cock (0.57%)**
14. like (0.57%)
15. over (0.57%)
16. thei (0.56%)
17. your (0.56%)
18. what (0.55%)
19. said (0.55%)
20. could (0.54%)


You’ll note that the Twitter corpus had a heavy bias towards the term “*follow*” whereas the Erotica corpus shows an overwhelming use of the term “*cock*” (Writers: Use synonyms.)

 [6]: http://chart.apis.google.com/chart?chxl=0:|that|just|with|thi|have|your|like|love|follow|what|from|haha|good|para|will|when|know|want|about|make&chxr=0,0,703297&chxt=x&chbh=a,4,10&chs=600x200&cht=bvg&chco=4D89F9&chds=0,703297&chd=t:703297,582988,581346,573197,547218,513823,467673,455264,378187,367112,302254,296974,286671,283887,272176,254419,252303,251673,251325,248572&chtt=Counts of Top 20 Terms from Twitter Corpus
 [7]: http://chart.apis.google.com/chart?chxl=0:|that|with|into|down|then|back|from|thi|hand|were|look|have|cock|like|over|thei|your|what|said|could&chxr=0,0,190543&chxt=x&chbh=a,4,10&chs=600x200&cht=bvg&chco=F889F9&chds=0,190543&chd=t:190543,148204,78688,72452,69045,68642,68164,67998,66826,61787,60236,60179,59622,59357,58856,58760,57851,57670,57348,55739&chtt=Counts of Top 20 Terms from Erotica Corpus

## Practical Reasons Why This Is Important

This is important because if I were to build a domain-specific search-engine, I would be better off  seeding my corpus from domain-specific content. If I don’t, my relevance (tf-idf) scores will be inaccurate. For example, an Erotica-specific search engine should decrease the weight for the term “*cock*” strictly because it has a very high document frequency and is therefore less-significant. Meanwhile, a Twitter-specific search engine should discount the weight of “*follow*.”

## Conclusion

To conclude, the subject matter of a document set will create a bias towards domain-specific terms in the document set’s histogram of term frequencies. If you are calculating relevance for any particular document set, you should use a corpus derived from that document set. In other words, if you can, try not to re-use your corpora!

