---
title: 'WordPress Auto Upgrade and &#8220;Dumb&#8221; Permissions'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/wordpress-auto-upgrade-and-dumb-permissions/
has_been_twittered:
  - yes
categories:
  - Wordpress
---
# 

One of the nice features about WordPress is its ability to upgrade and
install plugins on the fly. This is nice because now you don’t need to
be bothered with the hassle of downloading plugins, unzipping their
contents, and transferring them to your web server.

Unfortunately, the way in which WordPress determines if it has the
appropriate permissions to upgrade plugins is implemented poorly. When
WordPress doesn’t think it has permission, the admin panel will instead
**prompt you for FTP login information**. This is a problem because
sometimes WordPress will do this falsely even if it *does* have proper
permissions.

## The Problem

The way WordPress tries to guess if it has proper permissions is very
primitive. Instead of using PHP’s [is_writable][1], WordPress instead
compares the web server’s User ID with the User ID of the wp-content
directory’s owner\*. While this might work for a large number of cases,
it doesn’t work in all of them (including mine).

 [1]: http://us.php.net/manual/en/function.is-writable.php

\* It’s actually slightly more complicated than this, but the effect is the same.

## The Environment

I run WordPress 3.x on Ubuntu 10.04 LTS under Lighttpd and PHP5-cgi.
Lighttpd runs as user `www-data` and group `www-data`. If I wanted to
let WordPress’ auto-detection of permissions work, I would have to
change the owner of my website directories to www-data. This doesn’t fly
with me, because I also want my user to have easy access to my document
root and don’t like the idea of my data being user-owned by my webserver
user.

## The Solution

Instead of bending over to WordPress’ permission issues, I was able to
perform the following simple steps to have auto-installing/updating
plugins and themes *without *changing user ownership of my web files.

1. `sudo chgrp -R www-data /path/to/wp/wp-content`
    
	This changes group ownership of wp-content and all sub-directories
to be group-owned by your webserver user. wp-content is where WordPress
stores plugins, themes, cache files, and (AFAIK) file uploads. 

2. `sudo chmod -R g+w /path/to/wp/wp-content`
        
	This makes wp-content and all of its sub-directories group-writable. 

3. `sudo chmod g+s /path/to/wp/wp-content`
            
	This, `g+s,` is known as **setgid**. This causes newly-created files
to be group-owned by `wp-content`'s owning group, in this case `www-data`. 

4. Finally, add the following to the bottom of `wp-config.php`. This is
an override built into the WordPress code. For more information, take a
look at `wp-admin/includes/file.php`'s function
`get_filesystem_method`. 

{% codeblock Enable direct file updating in wp-config.php %}

/* Force direct file updating
- http://www.charleshooper.net/blog/wordpress-auto-upgrade-and-dumb-permissions/
*/
define('FS_METHOD', 'direct');
{% endcodeblock %}

So there you have it. WordPress does a poor job of properly detecting file permissions and, in some cases, needs to be overridden. If you’re still having problems after this, **let me know** and I will do my best to help you.

