---
title: Cost Behavior Analysis Calculator
author: Charles Hooper
comments: true
layout: post
permalink: /blog/cost-behavior-analysis-calculator/
has_been_twittered:
  - yes
categories:
  - Management
  - Projects
---
# 

One of the projects I’ve been working on lately is my [Cost Behavior Analysis Calculator][1].

 [1]: http://apps.charleshooper.net/cost-behavior-analysis/

**Cost behavior analysis** is the process of dividing a mixed cost into its *variable and fixed components*. Doing this can be a long and tedious process. This process, when done manually, involves:

1.  **Determining which metric or activity *drives costs*.** A common example in manufacturing is “machine hours.” Using this technique, you could determine how much each “machine hour” affects your power bill.
2.  **Making a scatter graph of your data.** When you’re plotting your data, what you’re looking for is that a *linear relationship* exists between your *cost driver* and your *costs*. If a linear relationship doesn’t exist, then it isn’t a cost driver – pick a new metric and try again.
3.  **Fitting a line to the scatter graph.** When working on paper, it’s easier to use the [high-low method][2]. However, this method is considered inaccurate as it only uses two points from your entire data set. Not to mention, the highest and lowest points of these data sets are usually considered “atypical.” The [Cost Behavior Analyzer][1] uses [least-squares regression][3] to fit a more accurate line.
4.  **Measure your slope and y-intercept.** The **slope** of the line is your *variable cost* and the **y-intercept** is your *fixed cost*.

 [2]: http://www.suite101.com/content/job-costing-using-the-high-low-method-a207711
 [3]: http://www.finance-lib.com/financial-term-least-squares-regression-analysis.html

I developed the [Cost Behavior Analyzer][1] because I found that doing this work manually was tedious and repetitive. I’m making it available here so others can benefit from its use. Managerial accountants, financiers, business owners, and entrepreneurs alike should all know what’s driving their costs and how to accurately predict them.

[Try the Cost Behavior Analyzer out now!][1]