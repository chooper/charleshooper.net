---
layout: post
title: "Briefly: Logs"
date: 2015-10-29 05:47
comments: true
categories:
  - DevOps
  - Development
---
# 

Recently I was asked by another engineer what information I expect to be able
to find in logs. For this, I mostly agree with [Splunk's best practices][1] but
I have some additional advice I want to provide. I'll end up regurgitating some
of Splunk's recommendations anyway.

1. Your logs should be human readable. This means logging in text (no binary
   logging) and in a format that can be read by angry humans. Splunk recommends
   key-value pairs (e.g. `at=response code=200 bytes=1024`) since it makes
   Splunking easy, but I don't have a strong enough opinion to evangelize that.
   Some folks advocate for logging in JSON but I don't actually find JSON to be
   very readable.
   
   Edit: Someone pointed out to me that this isn't ideal when you have a large
   amount of logs. They prefered sending JSON logs to a service like ElasticSearch
   but I think also sending key-value pairs to Splunk is also reasonable at some
   scale.

1. Every log line should include a timestamp. The timestamp should be human
   readable and in a standard format such as [RFC 3339][2]/[ISO 8601][3].
   Finally, even though the above specs include a timezone offset, timestamps
   should be stated in UTC time whenever possible.

1. Every log line should include a unique identifier for the work being
   performed. In web applications and APIs, for example, this would be a
   request ID. The combination of a unique ID and timestamp allows for developers
   and operators to trace the execution of a single work unit.

1. More is more. While I don't particularly enjoy reading logs, I have always
   been more happy when an application logs more information than I need versus
   when an application doesn't log enough information. Be verbose and log
   everything.

1. Make understanding the code path of a work unit easy. This means logging
   file names, class names, function or method names, and so on. When sensible,
   include the arguments to these things as well.

1. Use one line per event. Multi-line events are bad because they are difficult
   to grep or Splunk. Keep everything on one log line but feel free to log
   additional events. An exception to this rule might be tracebacks (see what I
   did there?)

1. Log to stdout if you're following [12factor][4] otherwise log to syslog. Do not
   write your own log files! By writing your own log files, you are either
   taking log rotation off the table or signing yourself up to support exciting
   requirements like re-opening logs on SIGHUP (let's not go there).

1. Last but not least: **Don't write your own logging library!** Chances are
   there already exists a well thought-out and standard library available in
   your application's language or framework. Please use it!

So those are my recommendations about logs. What else would you recommend?

  [1]: http://dev.splunk.com/view/logging-best-practices/SP-CAAADP6
  [2]: https://tools.ietf.org/html/rfc3339
  [3]: https://en.wikipedia.org/wiki/ISO_8601
  [4]: http://12factor.net/
