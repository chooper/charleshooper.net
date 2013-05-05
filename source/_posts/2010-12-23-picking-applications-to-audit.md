---
title: Picking Applications to Audit
author: Charles Hooper
comments: true
layout: post
permalink: /blog/picking-applications-to-audit/
has_been_twittered:
  - yes
categories:
  - Security
---
# 

I’m sure almost any programmer will tell you that at some point they felt the need to work on a project but had no idea what to work on. This happens to me, too, even when it comes down to choosing what applications or services I want to audit. With practice, I’ve come up with a pretty good list of categories to choose software from and I would like to share them with you.

## 1. Applications or Service You Use

This is probably to most obvious way to choose what application or service to audit. However, to me, it’s also one of the hardest. The reason why it is so difficult is because it involves breaking out of your mental “user” mode where you’re just *using* the application or service. I know that when *I’m *in “user” mode, I probably am not even fully conscious of the amount of software or services I use every day and how much I rely on them.

The solution, then, is to break out of “user” mode. Once out of “user” mode (and in “audit” or “attack” mode) everything becomes clearer. For example, I recently submitted a vulnerability to a pretty large service provider (I can’t say who yet); was the vulnerability in some back page or a piece of functionality that nobody uses? No, surprisingly, this vulnerability was part of a key piece of functionality that I actually *use* frequently.

## 2. Applications or Services That You “Like” or “Believe In”

This is more of an extension than the item above, but it’s worth stressing. If there’s an application or service that you think has potential, go ahead and audit it. New applications and services are often full of low-hanging fruit. By auditing these and reporting the vulnerabilities, you are helping to make these applications and services better.

## 3. Applications and Services That Make It “Economically Beneficial” to Audit Them

This is a no-brainer. If you’re being offered money to audit an application or service (and the person offering the money has the authority to give you permission to do so,) then this is a pretty good place to start. Google, for example, has a [Vulnerability Rewards Program][1].

 [1]: http://googleonlinesecurity.blogspot.com/2010/11/rewarding-web-application-security.html

## Closing

These are just three of the categories to look for applications or services to audit. It’s certainly not complete as there is a plethora of software out there waiting to be audited, but I hope that this gives you a good head start.