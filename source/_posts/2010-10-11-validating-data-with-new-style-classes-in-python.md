---
title: Validating Data with New-Style Classes in Python
author: Charles Hooper
comments: true
layout: post
permalink: /blog/validating-data-with-new-style-classes-in-python/
categories:
  - Python
---
# 

Every once in awhile in my reading I come across a minor reference to what pythonistas refer to as **new-style classes**. One of the nice things about new-style classes is the \`property\` decorators. These property decorators allow you to build getter and setter methods to access object attributes. This is pretty awesome because now you can perform validation at the model/class level whenever you assign a value to a property of an object.

e.g., In one of my projects, I have an attribute named *timestamp* that takes a \`datetime\` object. I was concerned about receiving incorrect types from my input because there are alot of ways a programmer can represent the concept of time. Some realistic possibilities of invalid types in my case are:

*   \`time\` objects from the time module
*   \`string\` objects that contain the date and time (and various possible formats)
*   \`float\` or \`int\` objects that contain a unix timestamp

With a setter method, you can test that the new value being assigned to an attribute is the correct type before assigning it. You can also throw an **exception** if it’s not. In other words, you can do something like this:

    from datetime import datetime
    
    class SomeObject(object):    # new-style classes must be subclassed from object
        _timestamp = None
    
        @property
        def timestamp(self):
            return self._timestamp
    
        @timestamp.setter    # the prefix must match the read-only getter func name
        def timestamp(self,value):    # the func name must match the read-only getter func name
            if not isinstance(value, datetime):
                raise ValueError(“Timestamp can only be an instance of Datetime”)
            self._timestamp = value

Go ahead and try it!
