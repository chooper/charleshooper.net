---
title: 'First ruby app: Subnet Calculator'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/first-ruby-app-subnet-calculator/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8319037";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/first-ruby-app-subnet-calculator
categories:
  - Uncategorized
---
# 

Well, I just completed my first ruby app. It’s a fairly [simple subnet
calculator][1] that takes an IP address and subnet mask and calculates
the broadcast address, network address, and maximum number of hosts that
subnet can support.  Should you find any errors, let me know! 

**Example**  

```
$ ./ip.rb 10.0.0.0 255.0.0.0
Subnetting information for 10.0.0.0/8
Subnet mask: 255.0.0.0
Network Address: 10.0.0.0
Broadcast: 10.255.255.255
Max hosts: 16777213
```

 [1]: http://codepad.org/o9AHsly9
