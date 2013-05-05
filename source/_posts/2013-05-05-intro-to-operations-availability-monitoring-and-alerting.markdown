---
layout: post
title: "Intro to Operations: Availability Monitoring and Alerting"
permalink: /blog/intro-to-ops-availability-monitoring-alerting/
date: 2013-05-05 21:57
comments: true
categories: 
  - DevOps
  - Management
---
# 

*I'm writing a series of blog posts for managers and other people
without an operations background in order to introduce certain best
practices regarding Operations. For the rest of the blog posts, please
visit the [introductory Intro to Operations][1] blog post!*

  [1]: /blog/intro-to-ops-for-startups/

Another area I've seen alot of early stage startups lacking in is
**availability monitoring and alerting**. The essence of availability
monitoring and alerting is being notified when your service is not
working as expected, including when it's simply down, isn't meeting
formal or informal SLAs (e.g., it's too slow), or certain functionality
is broken.

What I typically see is that some effort was made to set up this type of
monitoring before and never maintained. Symptoms include *poor
monitoring coverage* (*servers missing from the config, services
monitoring nearly non-existent*), *large amounts of false positives and
negatives*, *inactionable alerts*, and *alerts that go unignored*
because of the previous issues.

Symptoms on the business include not knowing when your service is down
and finding out that your service is broken *from your customers*.
Finding out that your service is down from your customers is not only
embarrassing but it also shakes their confidence in you, affects your
reputation, and may even lead to lost revenue.

The good news is that it doesn't have to be this way. When availability
monitoring is set up properly, maintained, and you and your employees
agree to approach alerts a specific way, you will be able to reap a
variety of benefits. Here's what I recommend:

1. First, collaborate with your employees to define who is in the pager
  rotation and the escalation policies. Ask yourself: What happens when
  the on call engineer is overwhelmed and needs backup? What happens when
  the engineer goes on vacation?

2. Next, take inventory of what services you rely on and define an
  internal SLA for them. This does not have to be a super formal process,
  but this inventory and SLA will be helpful for deciding what thresholds
  to set in your monitoring to avoid false positives. Try to see the big
  picture and think about everything such as:

    * Servers,
    * Self-managed supporting services like web servers, databases, email services,
    * Application functionality and features - one strategy I like is exposing a "health check" service that can be checked by the monitoring agent,
    * Third party services like remote APIs.

  Your inventory and SLA definition is a living document; remember to
  keep it up to date!

3. Then set up whatever monitoring package you or your engineers decided
  to use (self-hosted or third party) such as [nagios][2], [Zenoss][3],
  [Pingdom][4], or [CopperEgg][5] and have your monitoring configured for
  those services. If you're really good, you'll *check your configuration
  into its own source control repository*. If you go the self-hosted
  route, it may also be worth having your monitoring server monitored
  externally.  Who's watching the watcher indeed. 

  [2]: http://www.nagios.org/
  [3]: http://www.zenoss.com/
  [4]: http://www.pingdom.com/
  [5]: http://www.copperegg.com/

4. Think about integrating your monitoring with a pager service such as
  [PagerDuty][6]. Services like PagerDuty allow you to input your pager
  rotation and then define good rules for how to contact the on call
  engineer and when to escalate should the engineer be unavailable.

  [6]: http://www.pagerduty.com/

5. With improved monitoring and alerting in place, you may want to think
  about giving certain customers "911" access. At a previous company I
  worked at, we had a secret email address our big customers could hit
  which would *open a support ticket* and then *page the on call engineer*
  with the ticket number. If you decide to go this route; however, you'll
  want to *train your customers* when it's appropriate to use this power
  and how to use it most effectively.

6. Adjust alerts and fix problems as you get paged for them. Don't care
  that a particular API goes down during a known maintenance window?
  Schedule the notification policy accordingly.

7. Finally, continue maintaining your inventory and monitoring
  service's configuration. For extra benefit, consider tracking your
  organization's **Mean Time To Respond** (how long it took for engineer to
  acknowledge that something is wrong) and your **Mean Time To Recover**
  (how long it took the engineer to resolve the issue *including* the Mean
  Time To Respond), your **Mean Time Between Failures** (self-explanatory,
  I hope), and **Percent Availability** (what percent of time your service
  is functional in a given period of time). 

This concludes the management and non-ops introduction to operations; I
hope you find this helpful.

