---
layout: post
title: "Intro to Operations: Configuration Management"
date: 2013-05-05 20:12
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

  [1]: http://www.charleshooper.net/blog/into-to-ops-for-startups/

One of the areas I've witnessed early stage startups lacking in is
**configuration management**. *Configuration management is the process of
standardizing and enforcing configurations*. In other words,
configuration management is about deciding on a specific configuration
of services for various roles and then applying these configurations in
practice. Typically, these manifests are written in (domain-specific)
language and is specific to the *configuration management software*
being used, such as [puppet][2], [chef][3], [cfengine][4], or
[salt stack][5].

  [2]: https://puppetlabs.com/
  [3]: http://www.opscode.com/chef/
  [4]: http://cfengine.com/
  [5]: http://saltstack.com/community.html

There are many benefits to configuration management. For one,
configuration management allows developers to spend more time working on
the product and less time deploying new services. This is because
configuration is now automated and faster as a result. In addition,
environments are standardized and therefore less time is spent
troubleshooting or diagnosing edge cases in different environments.
Finally, when coupled with *source control management*, the proper use
of configuration management can be used to track and audit what has
changed over time and who changed it.

In many of these early stage startups, there is either very little
configuration management performed at all, or configuration management
exists as a series of shell scripts cobbled together to do some
post-hardware setup. If you're lucky, there exists a document somewhere
that describes when and how to run these scripts to deploy new services.

The way configuration management works is that engineers create a
collection of files that define how the system should be configured.
This collection of files is typically called a **manifest**. Then, once
physical or virtual hardware has been provisioned, one of these
manifests is *applied* to the new host. During application, the
configuration management software will interpret the new configuration,
install software packages, manage users and credentials, alter config
files, manage file permissions, run arbitrary commands, and so on. Once
the manifest is fully applied, the new host should be fully configured
and ready to be used!  In some environments; however, they may be a
post-host-provisioning step where additional work is performed
afterwards, such as checking out application code from a source control
repository.

If you're not using configuration management already then you should
start now because, frankly, it's never too early. Starting configuration
management now will not only help your first hired ops/systems engineer
from working backwards to write these manifests later, but will also
incur benefits (such as your developers spending less time away from
shipping value-added code) that will outweigh the initial learning
curve.

