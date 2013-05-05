---
title: Going into Business? Learn a Programming Language
author: Charles Hooper
comments: true
layout: post
permalink: /blog/going-into-business-learn-a-programming-language/
has_been_twittered:
  - yes
categories:
  - Finance
  - Management
  - Python
---
# 

When doing homework for my business-related classes, I often find that knowing a programming language is very advantageous. Certainly there are times when it makes sense to use a calculator, but repeatedly entering the same equation over and over is tedious and inefficient. There are also times when it’s a good idea to make a spreadsheet, but even this can be overkill.

In cases where I’m repeating the same tasks or expressions frequently and a spreadsheet seems like overkill, I’ll open a Python shell and define the expression I need as a function. More often than not, these functions are one liners that I probably won’t use again. At least, not until I get a “Real Job (TM)” where I’ll need to use said expressions more frequently.

As an example, I recently found myself calculating the gains and/or losses between two given foreign exchange rates. The example below calculates the gain or loss between two period’s exchange rates for a given currency.

    def xchg_diff(qty,old_rate,new_rate):
        """
        qty = Amount of 'domestic currency'
        old_rate = Exchange rate of foreign currency in previous period
        new_rate = Exchange rate of foreign currency in current period
        """
        return round(qty * (new_rate - old_rate))
    

In this example, the hypothetical company had 850,000 pesos that it held over multiple accounting periods. I was given a table of dates that corresponded with these accounting periods and the exchange rate of pesos to U.S. Dollars (USD $) that looked similar to the one below.

Date

Exchange Rate

Mar 31, 2009

0.0698

Jun 30, 2009

0.0756

Sep 30, 2009

0.0737

Dec 31, 2009

0.0777

The equation is simple enough to type into a calculator, but I find most calculators to have a clumsy interface when it comes to editing the numbers in previous expressions. In this case, I simply opened up a Python shell and, after defining the above function, I typed:

    >>> xchg_diff(850000,0.0698,0.0756)
    4930.0
    >>> xchg_diff(850000,0.0756,0.0737)
    -1615.0
    >>> xchg_diff(850000,0.0737,0.0777)
    3400.0
    

As we can see from the transcript, I was quickly able to find the following results:

Date

Gain / (loss)

Jun 30, 2009

$4930

Sep 30, 2009

$(1615)

Dec 31, 2009

$3400

Many people have asked me if I thought that my experience in computers and programming would go to waste once I entered the world of business and, in particular, finance. My response has been, and will continue to be, “No.” Knowing how to automate routine tasks, being able to write data models, and having a firm grasp on algorithms will only help me to be more effective in my future career.