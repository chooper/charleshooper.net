---
title: Approaching System Monitoring
author: Charles Hooper
comments: true
layout: post
permalink: /blog/approaching-system-monitoring/
posterous_24275adbefb0d287b103c9e6dc37e3b9_post_id:
  - 'O:16:"SimpleXMLElement":1:{i:0;s:7:"8387256";}'
posterous_24275adbefb0d287b103c9e6dc37e3b9_permalink:
  - http://blog.charleshooper.net/approaching-system-monitoring
categories:
  - System Administration
  - Uncategorized
---
# 

Previously, I raised the question: “[If you were IT and walked into a company with no monitoring or logging, what would your priorities be?][1]” If I were in this situation, I would ask myself three questions: “*What should I be monitoring*,” “*How should I prioritize the alerts of each monitored item*,” and “*What items should I consider critical*?” 
I’d first start by answering the question “What should I be monitoring.” In addition to security events (which are outside the scope of this discussion,) I would begin monitoring of the pertinent items in the following order:

 [1]: http://subversity.net/if-you-were-it-and-walked-into-a-company-with

1.  Host-level availability
2.  Service-level availability
3.  Service-level performance (response times/timeouts etc)
4.  Host-level health/performance/resources (CPU, memory, and disk usage)

Once I have a plan to begin monitoring all of the neccessary items, I would then tackle the question “How should I prioritize the alerts of each monitored item.” I would do so using the list below as a guide. This list is by no means law. In fact, **priority should be determined on a per-case basis depending on your or your organization’s needs** and not some cookie-cutter list.

1.  Network infrastructure (core routers, switches)
2.  Servers hosting critical services
3.  Critical services
4.  Maxed resources (low disk usage, heavy swap usage, etc)
5.  Everything else

The final question (which is arguably an extension of the previous question) that needs to be answered is “What items should I consider critical.” This too is based off of your or your organization’s needs, but I would use the following as starting point.

*   Connectivity
*   Infrastructure (DNS, LDAP, etc)
*   Communications (Exchange/Email, etc)
*   Forward-facing services
*   Line of Business applications and services
*   Anything else critical to the operation and sustainability of the organization

To sum it up, given the question “What would your priorities be if you walked into a company without any monitoring” I would approach the issue by asking myself and answering three questions. Those questions are “What should I be monitoring,” “How should I prioritize the alerts of each monitored item,” and “What items should I consider critical?” Once answered, it should be easy to develop a monitoring plan.