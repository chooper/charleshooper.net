---
layout: post
title: "Briefly: Operator Requirements"
date: 2015-11-07 10:49
comments: true
categories: 
- DevOps
- Development
published: false
---
# 

On any given day, there are a number of people discussing user requirements and
prioritizing the work ahead of them based on them. There’s an
oft-underrepresented group of users however and those are your operators.
Typically, the set of things needed by your operators are buried in your
project's list of "non-functional requirements", if at all.

In this brief, I would like to provide you with a de facto set of "operator
requirements" for your project. This list is likely incomplete and I'm
discovering more every day. I may update this post from time to time to add
things or clarify them as I journey towards understanding.

An application that satisfies these requirements will be more scalable, easier
to operate, and likely have a lower Mean Time To Recovery than an application
that does not.

1. In general you should strive to adhere to [12factor][1] if you’re building a web
  application. 12factor creates a clean contract between your application and
  the operating system, enables simpler deployments, and results in applications
  that are mostly horizontally scalable by default. If you cannot adhere to
  12factor, then I would challenge you to borrow as much of it as you can before
  discounting the whole 12factor methodology.

1. Your application should have plenty of [logging and follow best
  practices][2].

1. Your application should also emit metrics that create some sense of
  understanding of what the system is doing.

1. Your application’s services should have [health checks][3]. The health checks
  should return HTTP 2xx or 3xx when the service is healthy and HTTP 5xx when
  it is not. The response body should contain an explanation or identifier that
  will allow the operator to determine why the health check failed to aid in
  incident recovery.

1. Your application should use [unique request IDs][4] and add them to their
  logging contexts (see logging).

1. Your application should support credential rotation. Any given secret,
  whether it's a password, API key, SSL private key, or otherwise, should be
  changeable with minimal disruption to the service. This should be exercised
  often to ensure it works as designed.

1. Your application should provide operators with [toggles or feature flags][5] —
  parameters that allow the operators or the system itself to turn off bits of
  functionality when the system is degraded.

1. Your application should put external resources behind [circuit breakers][6].
  Circuit breakers allow your app to continue operating (albeit in a degraded
  state) when an external resource is unavailable instead of taking your
  application offline.

1. Your application should be [disposable and restartable][7]; this means that
  it's restartable on the same instance or a new instance) after a crash and
  should crash in an automatically recoverable state. If your crash is not
  automatically recoverable, it should scream! In addition, your application
  should gracefully complete existing work such as HTTP requests or jobs it
  picked up from a task queue. In the case of long running jobs, your application
  should be able to abandon the work to have it picked up by another worker or
  node.

These are just a start but these requirements should be imported into your project's
requirements and prioritized with maintainability in mind. By doing so, your
application will be more scalable, easier to operator, and have a lower Mean
Time To Recovery than application that don't satisfy these requirements.

Do you feel like I missed anything? What else would you recommend?

  [1]: http://12factor.net/
  [2]: http://www.charleshooper.net/blog/briefly-logs/
  [3]: http://www.charleshooper.net/blog/briefly-health-checks/
  [4]: https://brandur.org/request-ids
  [5]: http://blog.travis-ci.com/2014-03-04-use-feature-flags-to-ship-changes-with-confidence/
  [6]: https://engineering.heroku.com/blogs/2015-06-30-improved-production-stability-with-circuit-breakers/
  [7]: http://12factor.net/disposability
