---
title: 'Python: Starting Tornado Apps at Boot Using Upstart'
author: Charles Hooper
comments: true
layout: post
permalink: /blog/python-starting-tornado-apps-at-boot-using-upstart/
categories:
  - Python
  - Tornado
---
# 

Today, I’m going to show you how to start up your [Tornado][1] apps at
boot using [upstart][2]. For path names, I’m assuming some modern
version of Ubuntu, such as 9.10 or higher. I’m also assuming that you
have some project with an executable Python script that fires up the
Tornado app. I usually have one file in all of my projects called
`web.py`.

 [1]: http://www.tornadoweb.org/
 [2]: http://upstart.ubuntu.com/

The important part of this file looks like this (mind the application and port variables):

{% codeblock Snippet in web.py %}
if __name__ == "__main__":
	http_server = tornado.httpserver.HTTPServer(application)
	http_server.listen(port)
	tornado.ioloop.IOLoop.instance().start()
{% endcodeblock %}

Got that in place? Good. Next, create the file `/etc/init/web.conf`. It’s *very* important that this filename ends in **.conf**. The contents of this file should be as follows:

```
\# torando project
start on runlevel 2
stop on runlevel \[!2\]
respawn

exec /path/to/project/web.py
```

That’s it! You can start your Tornado app by entering the command:
`sudo start web`. If successful, you should see output similar to:
` ** web start/running, process 28058`. You can also stop your projects using
the command `sudo stop web`.

The obvious caveat here is that your project is now running as root. In a future blog post, I will discuss dropping privileges at project startup. :-)

UPDATE: I’m from the future and wrote that blog post on [how to drop privileges in Python for Tornado apps][3].

 [3]: http://www.charleshooper.net/blog/dropping-privileges-in-python-for-tornado-apps/
