---
layout: post
title: "Briefly: Health Checks"
date: 2015-11-08 01:23
comments: true
categories: 
- DevOps
- Development
---
# 

Health checks are specially defined endpoints or routes in your application
that allow external monitors to determine the health of your web application.
They are so important to production health that I consider them the "13th
factor" in [12factor][1].

If an application is healthy it will return a HTTP 2xx or 3xx status code and
when it is not it will return an HTTP 5xx status code.

This type of output allows load balancers to remove unhealthy instances from
its rotation but can also be used to alert an operator or even automatically
replace the instance.

In order to implement proper health checks, your application’s health checks
should:

1. Return a HTTP 2xx or 3xx status code when healthy

1. Return a HTTP 5xx status code when not healthy

1. Include the reason why the check failed in the response body

1. [Log the requests and their results][2] along with Request IDs

1. Not have any side effects

1. Be lightweight and fast

If you implement health checks in your application following this advice,
you'll have a more resilient, monitorable, and manageable application.

How about you all? Is there anything you would add?

[1]: http://12factor.net/
[2]: http://www.charleshooper.net/blog/briefly-logs/
