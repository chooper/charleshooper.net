---
title: Auto Type Juggling and Unsanitized Input
author: Charles Hooper
comments: true
layout: post
permalink: /blog/auto-type-juggling-and-unsanitized-input/
categories:
  - Projects
---
# 

I would like to think that one day we will all be past the point where
we are constantly finding silly bugs and vulnerabilities caused by
unvalidated or unsanitized user input. Unfortunately for us all, we’re
not. In this article, I will attempt to describe a rather overlooked
result of [PHP’s type juggling][1].

 [1]: http://www.php.net/manual/en/language.types.type-juggling.php

If you aren’t already familiar, type juggling is PHP’s way of
automatically switching or converting variables to different types based
on the context it’s being used in. For example, if you have the strings
“2″ and “3″ and you add them, PHP will convert them to integers and
return the integer 5. This is useful in PHP web-applications since any
variable that PHP retrieves from either GPC (*Get*, *Post*, *Cookie*)
variables or the database is considered a string. This is regardless of
its actual value or column type in the database and the string will need
to be converted to a numeric type before any type of math operations or
numeric comparisons can be performed on them.

On the lower-level, PHP is actually using libc’s strtod() function. If
we look at the man page, we learn If no conversion is performed, zero is
returned. Without looking at PHP’s source, it would seem to me that PHP
is blindly handing off string pointers to strtod() and if the type
conversion fails it will retain the type of whatever the variable was
last. This isn’t PHP’s fault, it’s the *developer’s responsibility* to
make sure that the data they are using is properly sanitized!

The best real-world example I can give about this bug was a series of
exploits in the web-based RPG [Bootleggers][2] last round. One of the
most well known exploits in this series was known to players as “The Arm
Wrestling bug.” This arm wrestling bug was the result of a flaw or
limitation in PHP’s magic type switching that allowed players to bypass
certain logic checks to send extremely large strings of numbers to the
database backend and essentially create money out of thin air, one MySQL
signed integer (2,147,483,647) at a time.

 [2]: http://www.bootleggers.us/

For an example on how we would go about exploiting this, we look at the
following code:

```
$var1 = '1';
$var2 = '21';
var_dump((bool) ($var1 < $var2));
# Output: bool(true)
```

All this code is doing is assigning strings to two variables and then
doing a numeric comparison of them — In our case, this script will
output “true” since, when evaluated as an integer, 1 is in fact
less-than 21. However, if there is any non-numeric data being passed to
the variable then `strtod()` will return 0 and PHP will evaluate these
variables as strings and use natural sorting to determine if one
variable is "less"-than another. Proof?

```
$var1 = '111 '; // there is a space before the closing quote
$var2 = '21';
var_dump((bool) ($var1 < $var2));
# Output: bool(true)
```

This block of code will *also* output true because the character `1`′ is
before the character `2`′ when using natural sorting. If a user is able
to bypass the logic checks with this exploit, then typically the string
will be sent straight to the database as-is (OK, maybe escaped for
apostrophes ;)). Depending on the DBMS there may be a variance in
behavior. Usually, exploiters will use this attack with a very large
string so that the column being updated with that value will actually
update to the maximum value for that column’s data type.

While exploits on web-based RPGs aren’t the end of the world, imagine if
your *bank* used a PHP-based web-application. Wouldn’t you feel better
if they all knew about his caveat and properly sanitized and validated
user input? :-)

