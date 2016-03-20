---
title: 'Link Aggregation on Cisco Catalysts &#038; Foundry switches'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/link-aggregation-on-cisco-catalysts-foundry-switches/
categories:
  - Networking
---
# 

LACP, or **Link Aggregation Control Protocol**, allows you to configure multiple ethernet ports to act as a single device. This is sometimes referred to as **channel bonding** or **trunking**. Link Aggregation provides several benefits: *Increased bandwidth*, *load balancing*, and allows you to create *redundant ethernet links*. If a link in your ethernet channel goes down, the switches, routers, or servers you have configured to use LACP will automatically fail over to the links that are still up and remain connected. With the right hardware and the right firmware, setting this up is very simple. 
On a Cisco Catalyst switch running IOS, once logged in, you will need to perform the following steps:

```
cisco>enable  
Password: *enter password*  
cisco#config term  
cisco(config)#int Gi0/1  
cisco(config-if)#channel-group 1 mode active  
cisco(config-if)#channel-protocol lacp  
cisco(config-if)#int Gi0/2  
cisco(config-if)#channel-group 1 mode active  
cisco(config-if)#channel-protocol lacp  
cisco(config-if)#end  
cisco#write mem
```

It also helps to label your ports and to be sure that your bonded ports
are configured in the right VLAN or set up for *VLAN trunking*.  If your
other device is another Cisco Catalyst, then just repeat the steps
above, connect your newly bonded ports, and disconnect any non-bonded
ports connecting the two devices.  However, if you are configuring a
Foundry switch, your configuration is just as easy, but slightly
different.

```
BR-telnet@foundry>enable  
Password: *enter password*  
BR-telnet@foundry#config term  
BR-telnet@foundry(config)#interface ethernet 1  
BR-telnet@foundry(config-if-e1000-1)#link-aggregate active  
BR-telnet@foundry(config-if-e1000-1)#interface ethernet 2  
BR-telnet@foundry(config-if-e1000-2)#link-aggregate active  
BR-telnet@foundry(config-if-e1000-2)#end  
BR-telnet@foundry#write mem
```

Provided you don’t have a complicated VLAN set up, you’re all set! One
thing you should note about the Foundry devices, is that you can only
*start* your trunked ports on the first port of each group of 4.
Explanation: On a 12-port switch, you would only be able to start port
groups on ports 1, 5, and 9. But this does *not* mean that you can’t
bond ports 1 & 2 — but it does mean that you can’t bond ports 3 & 4.

**Recommended reading:**
*   [Link aggregation article on Wikipedia][1]

 [1]: http://en.wikipedia.org/wiki/IEEE_802.3ad
