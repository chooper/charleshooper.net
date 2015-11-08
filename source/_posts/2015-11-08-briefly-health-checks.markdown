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

Health checks are special endpoints (or "routes") in your web application or
API that return successful HTTP status codes when the application instance is
healthy and failure codes when it is not.

Health checks are a great addition to any web application or API. In fact, I
consider them the "13th factor" in [12factor][1].

Good health checks enable better monitoring (I’ll take a HTTP health check over
a server ping or TCP connection check any day) and can even enable some form of
application healing.

Application healing usually takes the form of a load balancer preventing any
traffic from being routed to unhealthy instances but can also take the form of
automatically terminating and replacing unhealthy instances.

In order to implement proper health checks, your application’s health checks
should:

1. Return a HTTP 2xx or 3xx status code when healthy

1. Return a HTTP 5xx status code when not healthy

1. Include the reason why the check failed in the response body

1. [Log the requests and their results][2] along with Request IDs

1. Not have any side effects

1. Be lightweight and fast

If you do those six things and implement health checks in your application,
you’ll have a better monitoring endpoint than many and won’t be far off from
application auto healing.

Is there anything else you would add?

[1]: http://12factor.net/
[2]: http://www.charleshooper.net/blog/briefly-logs/
