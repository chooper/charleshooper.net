---
title: Dropping Privileges in Python for Tornado Apps
author: Charles Hooper
comments: true
layout: post
permalink: /blog/dropping-privileges-in-python-for-tornado-apps/
categories:
  - Python
  - Tornado
---
# 

Today, I’m going to show you how to drop from the root user to an unprivileged user in Python for the purpose of running a [Tornado][1] app.

First **make a system user** for your project to run as. In my example,
I’ll be using `projectuser` as the username. Creating this user can be done like so: 

```
sudo useradd --system --user-group projectuser
```

Now, in your script that is responsible for starting your Tornado app, you likely have something that probably looks like the following: 

{% codeblock Snippet in web.py %}
if __name__ == "__main__": 
    http_server = tornado.httpserver.HTTPServer(application) 
    http_server.listen(port) 
    tornado.ioloop.IOLoop.instance().start()
{% endcodeblock %}

What we need to do now is define a user to run as and then drop
privileges using a call to `setuid`. We can do this by replacing the above with: 

{% codeblock Modification to web.py %}
if __name__ == "__main__":
    import os
    import pwd
    # define user to run as
    run_as_user = "projectuser"
    # drop privileges
    uid = pwd.getpwnam(run_as_user)[2]
    os.setuid(uid)
    # start tornado app
    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(port)
    tornado.ioloop.IOLoop.instance().start()
{% endcodeblock %}

And voila, your app should now run as the user you defined! Do note that
only the root user can call `setuid`. As a result, your script now needs
to be run using `sudo` or from an [upstart startup script][2], for example. 

One caveat is that you won’t be able to use port numbers below 1024
since you are dropping to an unprivileged user before binding to the
port. I think there’s a way to get around this by replacing
`http_server.listen()` with `http_server.bind()`, `http_server.start()`,
and dropping privileges between those calls, but this remains untested
for now. Alternatively, you could use the respective *proxy modules* for
[Lighttpd][3] or [nginx][4] to listen on privileged ports.

 [1]: http://www.tornadoweb.org/
 [2]: http://subversity.net/python-starting-tornado-apps-at-boot-using-up
 [3]: http://redmine.lighttpd.net/wiki/1/Docs:ModProxy
 [4]: http://www.tornadoweb.org/documentation#running-tornado-in-production
