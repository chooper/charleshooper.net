---
title: Multiple Vulnerabilities in Mingle Forum (WordPress Plugin)
author: Charles Hooper
comments: true
layout: post
permalink: /blog/multiple-vulnerabilities-in-mingle-forum-wordpress-plugin/
has_been_twittered:
  - yes
categories:
  - Advisories
---
# 

Title: Multiple Vulnerabilities in Mingle Forum (WordPress Plugin)  
Advisory URL: http://www.charleshooper.net/blog/multiple-vulnerabilities-in-mingle-forum-wordpress-plugin/  
Date Published: January 8th, 2011  
Vendors Contacted: Paul Carter – Maintainer of plugin.

2. Summary

Mingle Forum is a plugin for the popular blog tool and publishing  
platform, WordPress. According to the author of Mingle Forum, “Mingle  
Forum has been modified to be lightweight, solid, secure, quick to  
setup, and easy to use.”

There exist multiple vulnerabilities in Mingle Forum, SQL injection  
being among them.

3. Vulnerability Information

Packages/Versions Affected: Confirmed on 1.0.24 and 1.0.26

3a. Type: SQL Injection \[CWE-89\]  
3a. Impact: Read application data.  
3a. Discussion: There is a SQL injection vulnerability present in the  
RSS feed generator. By crafting specific URLs an attacker can retrieve  
information from the MySQL database.

3b. Type: SQL Injection \[CWE-89\]  
3b. Impact: Read application data.  
3b. Discussion: There is a SQL injection vulnerability present in the  
\`edit post\` functionality. By crafting specific URLs an attacker can  
retrieve information from the MySQL database.

3c. Type: Auth Bypass via Direct Request \[CWE-425\]  
3c. Impact: AuthZ is not performed for \`edit post\` functionality.  
3c. Discussion: By browsing directly to the \`edit post\` page a user can  
view and edit any page.

4. PoC & Technical Description

4a.  
[http://path.to/wordpress/wp-content/plugins/mingle-forum/feed.php?topic=0 UNION SELECT 1,user\_email,3,4,5,user\_login,7 FROM wp_users #][1]

 [1]: http://path.to/wordpress/wp-content/plugins/mingle-forum/feed.php?topic=0 UNION SELECT 1,user_email,3,4,5,user_login,7 FROM wp_users #

4b.  


4c. 

5. Report Timeline

12/17/2010 Initial email sent to plugin maintainer.  
12/22/2010 Confirmation of first email requested.  
12/31/2010 Correct email address obtained. Maintainer contacted again on  
this date.  
01/01/2011 Received response from plugin maintainer.  
01/07/2011 Plugin maintainer releases update that addresses these  
vulnerabilities.

6. References

6a. The WordPress Plugin page for Mingle Forum:  


7. Legalese

This vulnerability report by Charles Hooper <  > is  
licensed under a Creative Commons Attribution-NonCommercial-ShareAlike  
3.0 Unported License.

8. Signature

Public Key: Obtainable via pool.sks-keyservers.net
