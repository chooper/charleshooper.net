---
title: Finding Web Vulnerabilities
author: Charles Hooper
comments: true
layout: post
permalink: /blog/finding-web-vulnerabilities/
has_been_twittered:
  - yes
categories:
  - Security
---
# 

At the [NESIT Hackathon][1] on Saturday, I was talking to a group of people about discovering web vulnerabilities and I was asked “Which scanner or tools do you use?” The absolute shortest answer I can provide is “I don’t use a scanner.” Despite the lack of a vuln scanner in my toolset, I am still able to consistently find vulnerabilities in web applications. Here’s how:

 [1]: http://www.nesit.net/

1.  I first begin by **finding or setting up an adequate test environment**. If the project is freely available (aka open source/free software,) I set up a test environment. If the project is not freely available, then I look for a site that uses the platform or application I’m trying to audit. I don’t normally recommend the latter case, but if I’m testing a 3rd party web service then I don’t have any other choice.
2.  I then **get familiar with the application**. What does it do? What problem does it try to solve? What does a normal use case look like?
3.  Then I **get really, *really* familiar with the application**. In this stage, I’m really interested in the lesser-used functionality (such as error handling) and making things break. How does the application handle errors? How verbose are the error messages? Are any pages particularly slower than the others? Where does the application get most of its data? Request variables? Cookies? A database? A third party API?I usually do this step with the [Firebug plugin for Firefox][2]. I want to know exactly what parameters are being passed to the application, how those variables are being handled, and if (and how) those variables are being spit back out to the user.
4.  My secret weapon is not being afraid to **look through the code**, if it’s available. If the code is lengthy and I just want to take a cursory glance at it, I grep for “red flags.” Because most vulnerabilities are the result of unescaped, unsanitized user-input, these red flags are usually connected to user-provided variables. For example, If I’m auditing PHP scripts for vulnerabilities, I look for code referencing the $\_GET, $\_POST, $\_REQUEST, and $\_COOKIE variables. This step does wonders for finding Cross-Site Scripting and SQL injection vulnerabilities.
5.  In very small projects, like WordPress plugins, I’ll **read through each** **file** and try to figure out what story the code is telling. This is very much like reading a short story. I want to know what the application is *trying* to do.
6.  I’ll then **read the code more in-depth**. This is akin to analyzing poetry in a Literature class. Things like the actual names of variables and the syntax become much more important here. Now I want to know what the application is *actually* doing. 
    I recently discovered Cross-Site Scripting SQL injection vulnerabilities in an URL field of an application that was *trying* to escape it’s input. The problem, however, was that the application was validating and sanitizing *$url_var* when the value of their user-input was *$var_url*. The combination of the lack of testing and the lack of error reporting allowed this bug to be introduced into production which created XSS and SQL injection vulnerabilities. Being able to read the code helps find other issues such as direct-request (authentication/authorization bypass) vulnerabilities.  
    I can’t stress bug/vulnerability hunting outside the normal execution paths of any given application. If a blog platform seems pretty solid, try exploiting its dynamically-generated RSS feed. If a 3rd party web-service looks perfect, try exploiting its support forums or its help site in a different language or character set. **Think outside of the box.** That phrase is cliche, but it’s cliche for a reason.

 [2]: http://getfirebug.com/