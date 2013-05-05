---
title: Link Aggregation on a RedHat (CentOS) server and a Cisco Catalyst switch
author: Charles Hooper
comments: true
layout: post
permalink: /blog/link-aggregation-on-a-redhat-centos-server-and-a-cisco-catalyst-switch/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8251500";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/link-aggregation-on-a-redhat-centos-server-an
has_been_twittered:
  - failed
twitter_failure_code:
  - 400
twitter_failure_reason:
  - Settings do not permit the auto-tweeting of old posts
categories:
  - Networking
  - Uncategorized
---
# 

IEEE 802.3ad, more commonly known as **Link Aggregation**, allows you to configure multiple Ethernet ports to act as a single device. This is sometimes referred to as **channel bonding**, **Ethernet bonding**, or **trunking**. Link Aggregation provides several benefits: *Increased bandwidth*, *load balancing*, and allows you to create *redundant ethernet links*. If a link in your ethernet channel goes down, the switches, routers, or servers you have configured to use LACP will automatically fail over to the links that are still up and remain connected. On a RedHat-based Linux distribution, such as CentOS or Fedora, the configuration may look a little complex, but in fact, it is very straight-forward.

To enable EtherChannel bonding on your RedHat-based server, follow these four easy steps:

**1.** First, create/replace `/etc/sysconfig/network-scripts/ifcfg-bond0` with:

    DEVICE=bond0
    ONBOOT=yes
    USERCTL=no

This file is also where you will configure your interface options, such as your IP address or if you will be using DHCP to obtain that information automatically. You can find more information on this in the RedHat Linux manual section [Interface Configuration Files][1].

 [1]: http://www.redhat.com/docs/manuals/linux/RHL-8.0-Manual/ref-guide/s1-networkscripts-interfaces.html

**2.** Next, for each interface you want bonded, create the file (and backup any already-existing ones) `/etc/sysconfig/network-scripts/ifcfg-ethX`, where *X* is the number of the interface, for example: eth0 and eth1. Check the output of `dmesg` or `ifconfig` if you are confused.

In each of these files, put the following lines:

    DEVICE=ethX
    ONBOOT=yes
    MASTER=bond0
    SLAVE=yes
    USERCTL=no

Once again, instead of an *X* you will want to replace that with the number of the interface.

**3.** Add the following text to `/etc/modprobe.conf` on a line by itself: `alias bond bonding`. Now would also probably be a good time to review your firewall rules and configuration files, to change any interface-specific directives to refer to “bond0″ now instead of “eth0″, or whatever it may have been before.

**4.** Restart your networking scripts. As root, issue the following command: `service network restart`

At this point you may lose connectivity. Do not panic! This is because we have configured the server to use EtherChannel bonding, but we have not told the switch we were going to do so.

On a Cisco Catalyst switch running IOS, once logged in, you enable EtherChannel bonding by performing the following steps. These steps assume that both interfaces are configured in the same (and correct) VLAN, and have the same speed and duplex settings.

    cisco>enable
    Password: *enter password*
    cisco#config term
    cisco(config)#int Fa0/1
    cisco(config-if)#channel-group 1 mode on
    cisco(config-if)#int Fa0/2
    cisco(config-if)#channel-group 1 mode on
    cisco(config-if)#end
    cisco#write mem

It also helps to label your ports. It is important to understand that your bonded interfaces do *not* need to be consecutive ports on the switch, but consolidating them to one location on the switch is good for organizational purposes.

Now you are free to plug in your additional cables and enjoy your new redundant Ethernet links!