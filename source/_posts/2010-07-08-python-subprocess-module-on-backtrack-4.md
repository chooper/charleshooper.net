---
title: 'Python: subprocess module on BackTrack 4'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/python-subprocess-module-on-backtrack-4/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:8:"22397356";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/python-subprocess-module-on-backtrack-4
categories:
  - Python
  - Uncategorized
tags:
  - backtrack
---
# 

I had trouble getting the [subprocess][1] module onto [BackTrack 4][2]. *apt-get install python-subprocess* wouldn’t do it, nor would *easy_install subprocess*. As it turns out, the name of the backported subprocess module is *subprocess32*, so **easy_install subprocess32** fixed me up real good.

 [1]: http://docs.python.org/library/subprocess.html
 [2]: http://www.backtrack-linux.org/