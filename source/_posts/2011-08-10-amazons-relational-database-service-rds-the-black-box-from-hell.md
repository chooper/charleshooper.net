---
title: "Amazon's Relational Database Service (RDS) -- The Black Box From Hell"
author: Charles Hooper
comments: true
layout: post
permalink: /blog/amazons-relational-database-service-rds-the-black-box-from-hell/
categories:
  - System Administration
---
# 

One morning I woke up early and checked my email. My plan was to check that my
inbox was empty for some peace of mind and then go back to bed for a few more
hours (I love Sundays). But that isn’t what happened. Instead, upon opening my
inbox I was alerted that one of a client’s database servers was offline. I
snapped out of my haze and immediately got to work.

This particular database server was a RDS instance. RDS, or [Relational
Database Service][1], is an Amazon-provided MySQL (or Oracle) server that runs
on top of the EC2 platform. The advantages to this service are that backups are
performed automatically (complete with point-in-time recovery,) snapshots are
supported, the instances can be resized with more or less RAM/CPU/storage
through the AWS console, and a whole bunch of other stuff (“maintenance”) is
supposed to be performed for you automatically.

 [1]: http://aws.amazon.com/rds/

The disadvantages don’t make themselves apparent until you need to debug or
troubleshoot a performance or availability issue. While CloudWatch metrics are
included as part of the RDS package, knowing how much CPU, RAM, or storage
space you’re using is only a very small part of knowing what your database
instance is actually doing.

Prior to attempting recovery, the first thing I did was to check the
[CloudWatch][2] metrics. CloudWatch seems to have trouble reporting its data
when the system is under durress because there were periods where there was
data and there were periods where there wasn’t. The next thing I did was check
the RDS event logs. Don’t get excited, the RDS event log is not a UI wrapped
around system logs, it’s just a couple of entries here and there on what Amazon
RDS decides to publish. The last entry in the event log was a backup job that
started several hours before and never finished. These typically only take one
to two minutes to finish on this instance so I knew something was wrong.

 [2]: http://aws.amazon.com/cloudwatch/

I didn’t want to waste time trying to troubleshoot while the database was down
so I instead moved immediately to recovery and rebooted the instance through
the AWS console. It’s like [Charles McPhail][3] says, “[Respond, Restore,
Resolve][3].” After about a whole 20 to 30 minutes the database server began
accepting connections again but the instance was never taken out of the
“REBOOTING” state when it should have transitioned to “STARTED”. With the
instance in the “REBOOTING” state, my only option now was to recover from a
previous backup as the rest of the functionality is disabled unless the
instance is in a “STARTED” state.

 [3]: http://onlinelibrary.wiley.com/doi/10.1002/bltj.20187/abstract

To make matters worse, the various components in our infrastructure were
connecting to this database server and were making it impossible to find out
what’s going on. The max connection limit was reached and I was no longer able
to login and view the process list or analyze the status variables.

At this point, I decided my only course of action was to spin up a new instance
from a previous backup. I made this request through the AWS console and, two to
three hours later, my new instance was finally up and running. About a half an
hour prior to this, the old instance was transitioned into a “FAILED” state and
shut down. When your instance is in the “FAILED” state, you cannot restart it.
Your only option is to restore from backup. In my case, it took several hours
for AWS to declare the instance as failed and it took several hours to restore
the backup. I did not know that the “FAILED” state was even a possible state
and had no idea that AWS could just kill an instance like that. To top it all
off, Amazon sent a very nice email to the owner of the account (my client the
CEO) explaining that we’ve been using an unsupported storage engine all this
time.

As it turns out, I missed the note in the [RDS User Guide][4] that says that
MyISAM is not supported, particularly when it comes to data recovery. While I
understand why RDS made this decision (MyISAM gets corrupted easily and is not
easy to repair sometimes,) I felt misled and uninformed about the support of
the storage engines. Yes, the note is in the RDS User Guide, however, it is not
mentioned anywhere in the main page about RDS nor is it in the [RDS FAQs][5]
(where the string “MyISAM” only appears once).

 [4]: http://docs.amazonwebservices.com/AmazonRDS/latest/UserGuide/
 [5]: http://aws.amazon.com/rds/faqs/

A few weeks have gone by and we have taken steps to avoid and reduce the damage
from these types of outages in the future. However, we still occasionally
receive an alert where an RDS instance stops accepting connections for one to
two minutes at a time and all the event log has to say is that the instance has
been “recovered.” Recovered from what exactly? What did you do to it? Why does
this keep happening? How do we make it stop?

In summary, I’ll probably never know because on RDS you do not have access to
the underlying OS. This means:

*   You do not have access to the OS process list
*   You do not have access to things like top, htop, iostat, or dstat
*   You do not have access to the process list if the MySQL process isn’t accepting connections
*   You do not have access to any system logs

If you just need a quick and dirty MySQL server and you almost never want to
worry about the status of your backups, go ahead and use RDS. However, if
you’re concerned about reliability (that you control,) being able to
effectively troubleshoot problems, and knowing the state of your underlying OS,
RDS is not right for you.

