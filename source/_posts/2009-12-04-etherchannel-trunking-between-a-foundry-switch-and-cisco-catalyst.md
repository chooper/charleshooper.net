---
title: EtherChannel trunking between a Foundry switch and Cisco Catalyst
author: Charles Hooper
comments: true
layout: post
permalink: /blog/etherchannel-trunking-between-a-foundry-switch-and-cisco-catalyst/
categories:
  - Networking
---
# 

In my other article, [LACP on Cisco Catalysts & Foundry switches][1], I describe how to configure aggregated links using LACP (802.3ad) on a Cisco Catalyst and Foundry switch. In this howto, I will be describing how to configure trunked ports using **EtherChannel** — LACP’s predecessor.

 [1]: http://charleshooper.posterous.com/link-aggregation-on-cisco-catalysts-and-found

Before starting, one thing that you should be aware of is that Foundry’s configure EtherChannel trunks as dot1q-encapsulated VLAN trunks by default. Cisco Catalysts (or IOS, rather) configure all ports as access ports by default.

On a Cisco Catalyst switch running IOS, once logged in, you will need to perform the steps below. It is important that you perform these steps without the other device connected.

    cisco>enable
    Password: *enter password*
    cisco#config term
    cisco(config)#int Gi0/1
    cisco(config-if)#channel-group 1 mode on
    cisco(config-if)#int Gi0/2
    cisco(config-if)#channel-group 1 mode on
    cisco(config-if)#end
    cisco#write mem

If your other device is another Cisco Catalyst, then just repeat the steps above, connect your newly bonded ports, and disconnect any non-bonded ports connecting the two devices.

If you are configuring a Foundry switch, there are several rules you must follow. Among these rules, is that you can only *start* your trunked ports on the first port of each group of 4.

    BR-telnet@foundry>enable
    Password: *enter password*
    BR-telnet@foundry#config term
    BR-telnet@foundry(config)#trunk ethe 1 to 2
    BR-telnet@foundry(config)#trunk deploy
    BR-telnet@foundry(config)#exit
    BR-telnet@foundry#write mem

Provided you correctly configured your VLANs prior to setting up EtherChannel, you may connect your cables starting with the *primary port*. The primary port is always the lowest-numbered port in the trunk, in our example, this is 1. Once connected, you can verify operation of your EtherChannel trunk with `show etherchannel summary` on the Cisco or `show trunk` on the Foundry in enable mode.
