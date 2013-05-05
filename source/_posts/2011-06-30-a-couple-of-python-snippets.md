---
title: A Couple of Python Snippets
author: Charles Hooper
comments: true
layout: post
permalink: /blog/a-couple-of-python-snippets/
has_been_twittered:
  - yes
categories:
  - Python
---
# 

I haven’t updated in awhile but I decided to drop a couple of gists in here and call it a post. These snippets are incredibly simple and I don’t expect to “wow” anybody here, but I was asked for them recently and am posting them here.

# Group words by their first letter in Python

{% codeblock group_by_letter.py https://gist.github.com/chooper/1050517#file-group_by_letter-py %}
#!/usr/bin/env python

"""Group words by their first letter"""

from collections import defaultdict

def group_by_letter(words):
    buckets = defaultdict(lambda:[])
    for word in words:
        buckets[word[0].lower()].append(word)
    return buckets

if __name__ == '__main__':
    print group_by_letter(['narragansett','brooklyn lager','magic
hat','dog fish head','shock top','ten penny','bass'])
    # Output: defaultdict(<function <lambda> at 0x7fc83416b2a8>, {'b':
    # ['bass', 'brooklyn lager'], 'd': ['dog fish head'], 'm': ['magic
    # hat'], 'n':['narragansett'], 's': ['shock top'], 't': ['ten
    # penny']})
{% endcodeblock %}


# Merging list of lists in Python using reduce

{% codeblock merge_lists.py https://gist.github.com/chooper/1054819#file-merge_lists-py %}

#!/usr/bin/env python

"""Merging list of lists in Python using reduce()"""

def merge_lists(list_of_lists):
    return reduce(lambda x,y: x+y, list_of_lists)

if __name__ == '__main__':
    my_big_list = [ [1,2,3], [3,4,5], [6,7,8], ]
    print merge_lists(my_big_list)
    # output: [1, 2, 3, 3, 4, 5, 6, 7, 8]

{% endcodeblock %}



