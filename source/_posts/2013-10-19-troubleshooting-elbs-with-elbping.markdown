---
layout: post
title: "Troubleshooting ELBs with elbping"
date: 2013-10-19 10:49
comments: true
categories: 
  - Projects
  - DevOps
---
# 

Troubleshooting ELBs can be pretty painful at times because they are
largely a black box. There aren't many metrics available, and the ones
that do exist are aggregated across all of the nodes of an ELB. This can
be troublesome at times, for example when only a subset of an ELB's
nodes are degraded.

# ELB Properties

ELBs have some interesting properties. For instance:

* ELBs are made up of 1 or more nodes
* These nodes are published as A records for the ELB name
* These nodes can fail, or be shut down, and connections will *not* be closed gracefully
* It often requires a good relationship with Amazon support ($$$) to get someone to dig into ELB problems

*NOTE: Another interesting property but slightly less pertinent is that
ELBs were not designed to handle sudden spikes of traffic. They
typically require 15 minutes of heavy traffic before they will scale up
or they can be pre-warmed on request via a support ticket*

# Troubleshooting ELBs (manually)

**Update:** *Since writing this blog post, AWS has since migrated all
ELBs to use Route 53 for DNS. In addition, all ELBs now have a
`all.$elb_name` record that will return the full list of nodes for the
ELB. For example, if your ELB name is
`elb-123456789.us-east-1.elb.amazonaws.com`, then you would get the full
list of nodes by doing something like `dig
all.elb-123456789.us-east-1.elb.amazonaws.com`. In addition, Route 53 is
able to return up to 4KB of data still using UDP, so using the `+tcp`
flag may not be necessary.*

Knowing this, you can do a little bit of troubleshooting on your own.
First, resolve the ELB name to a list of nodes (as A records):

    $ dig @ns-942.amazon.com +tcp elb-123456789.us-east-1.elb.amazonaws.com ANY

The `tcp` flag is suggested as your ELB could have too many records to fit
inside of a single UDP packet. You also need to perform an `ANY` query because
Amazon's nameservers will only return a subset of the nodes otherwise.  Running
this command will give you output that looks something like this (trimmed for
brevity):

    ;; ANSWER SECTION:
    elb-123456789.us-east-1.elb.amazonaws.com. 60 IN SOA ns-942.amazon.com. root.amazon.com. 1376719867 3600 900 7776000 60
    elb-123456789.us-east-1.elb.amazonaws.com. 600 IN NS ns-942.amazon.com.
    elb-123456789.us-east-1.elb.amazonaws.com. 60 IN A 54.243.63.96
    elb-123456789.us-east-1.elb.amazonaws.com. 60 IN A 23.21.73.53


Now, for each of the `A` records use e.g. `curl` to test a connection to
the ELB. Of course, you also want to isolate your test to just the ELB
without connecting to your backends. One final property and little known
fact about ELBs:

* The maximum size of the request method (verb) that can be sent through an ELB is **127 characters**. Any larger and the ELB will reply with an *HTTP 405 - Method not allowed*.

This means that we can take advantage of this behavior to test only that
the ELB is responding:

    $ curl -X $(python -c 'print "A" * 128') -i http://ip.of.individual.node
    HTTP/1.1 405 METHOD_NOT_ALLOWED
    Content-Length: 0
    Connection: Close

If you see `HTTP/1.1 405 METHOD_NOT_ALLOWED` then the ELB is responding
successfully. You might also want to adjust curl's timeouts to values
that are acceptable to you.

# Troubleshooting ELBs using elbping

Of course, doing this can get pretty tedious so I've built a tool to
automate this called [elbping](https://github.com/heroku/elbping). It's
available as a ruby gem, so if you have rubygems then you can install it
by simply doing:

    $ gem install elbping

Now you can run:

    $ elbping -c 4 http://elb-123456789.us-east-1.elb.amazonaws.com
    Response from 54.243.63.96: code=405 time=210 ms
    Response from 23.21.73.53: code=405 time=189 ms
    Response from 54.243.63.96: code=405 time=191 ms
    Response from 23.21.73.53: code=405 time=188 ms
    Response from 54.243.63.96: code=405 time=190 ms
    Response from 23.21.73.53: code=405 time=192 ms
    Response from 54.243.63.96: code=405 time=187 ms
    Response from 23.21.73.53: code=405 time=189 ms
    --- 54.243.63.96 statistics ---
    4 requests, 4 responses, 0% loss
    min/avg/max = 187/163/210 ms
    --- 23.21.73.53 statistics ---
    4 requests, 4 responses, 0% loss
    min/avg/max = 188/189/192 ms
    --- total statistics ---
    8 requests, 8 responses, 0% loss
    min/avg/max = 188/189/192 ms

Remember, if you see `code=405` then that means that the ELB is responding.

# Next Steps

Whichever method you choose, you will at least know if your ELB's nodes
are responding or not. Armed with this knowledge, you can either turn
your focus to troubleshooting other parts of your stack or be able to
make a pretty reasonable case to AWS that something is wrong.

Hope this helps!

