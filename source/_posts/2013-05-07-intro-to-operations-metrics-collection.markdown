---
layout: post
title: "Intro to Operations: Metrics Collection"
permalink: /blog/intro-to-ops-metrics-collection/
date: 2013-05-07 14:51
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

Collecting metrics is another area that many early stage startups seem
to overlook even though it is probably one of the most important things
they can do. By metrics collection, I am referring to the gathering and
storing of various metrics at several different levels. As John Allspaw
identifies them in [Web Operations: Keeping the Data on Time][2], they
are:

* **High-level business and application metrics** (e.g. user sign-ups)
* **Feature-specific application-level metrics** (e.g. widgets processed)
* **Systems and service-level metrics** (e.g. server load or database queries per second)

  [2]: http://www.amazon.com/Web-Operations-Keeping-Data-Time/dp/1449377440

You'll note that there are two levels of "application-level" metrics.
The higher-level application metrics are mostly those that can be tied
to business objectives, while the other category of application metrics
are generally more feature specific.

Benefits incurred by collecting these metrics are plentiful. For one,
having quick access to these metrics is helpful during troubleshooting
and incident response. For example, I was once hired under contract to
look into why a certain company's API was unreliable for the previous
few months. At least once per day, this company's API would time out and
not respond to client requests. After enabling basic metrics collection
for the servers and services used by the API, it very quickly became
obvious that the database servers were reaching their connection limits
which was preventing the API from retrieving records from the database.
Not only was this problem identified very quickly, but later on we were
able to look back at our metrics data to assess how close to our limits
we were getting.

Another benefit is that you can integrate the metrics into your
[Availability monitoring][3] system to be alerted when metrics surpass
some threshold or change significantly. Not only that, but analyzing
these metrics will allow you to manage your capacity intelligently and
build a business case to justify infrastructure expenditures. Finally,
analyzing these metrics will also give you insight into your
application, how it's used, and your business.

  [3]: /blog/intro-to-ops-availability-monitoring-alerting/

How you go about collecting and storing these metrics is up to you. Many
engineers might be tempted to build their own solution; however, there
are many open source and third party software packages that you may find
helpful. Key considerations when choosing which package or packages to
use are:

* The ability to add new, custom metrics
* Configurable resolution/storage trade-off
* Integration with availability monitoring and alerting systems
* Graphing/visualization

If your startup doesn't have any metrics then you should start
collecting them now. The visualization will help you in the short run
and the historical data will help you in the long run.

